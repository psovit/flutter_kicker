import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../utils/exceptions.dart';

class HttpApi {
  final String _baseUrl;
  final bool useSsl;

  HttpApi(
    this.useSsl,
    this._baseUrl,
  );

  Uri _getFullUri(String uri) {
    if (useSsl) {
      return Uri.https(_baseUrl, uri);
    }
    return Uri.http(_baseUrl, uri);
  }

  Future<Map<String, String>> _getHeaders({
    String contentType = 'application/json',
  }) async {
    final Map<String, String> headers = <String, String>{
      'Content-Type': contentType,
    };

    return headers;
  }

  Future<dynamic> get(
    String uri, [
    Map<String, String> params = const <String, String>{},
  ]) async {
    http.Response response;
    response = await http.get(
      _getFullUri(uri),
      headers: await _getHeaders(),
    );

    _validateStatusCode(response);

    return response.body.isEmpty ? <dynamic>[] : json.decode(response.body);
  }

  Future<dynamic> delete(String uri) async {
    http.Response response;
    response = await http.delete(
      _getFullUri(uri),
      headers: await _getHeaders(),
    );

    _validateStatusCode(response);
    return response.body.isEmpty ? response.body : json.decode(response.body);
  }

  Future<dynamic> post(
    String uri, [
    dynamic body = const <String, dynamic>{},
  ]) async {
    http.Response response;

    response = await http.post(
      _getFullUri(uri),
      headers: await _getHeaders(),
      body: jsonEncode(body),
    );

    _validateStatusCode(response);

    return json.decode(response.body);
  }

  Future<void> uploadDatabase(String uri, File dbFile) async {
    // Send the file to the server
    final http.MultipartRequest request = http.MultipartRequest(
      'POST',
      _getFullUri(uri),
    );
    request.headers.addAll(await _getHeaders());

    // Attach the database file to the request
    request.files.add(
      await http.MultipartFile.fromPath('database', dbFile.path),
    );

    // Send the request
    var response = await request.send();

    // You can check the status of the response
    if (response.statusCode == 200) {
      print('Upload successful!');
    } else {
      print('Upload failed.');
    }
  }

  Future<Map<String, dynamic>> uploadImage(String uri, File imageFile) async {
    final http.MultipartRequest request = http.MultipartRequest(
      'PUT',
      _getFullUri(uri),
    );
    request.headers.addAll(await _getHeaders());

    request.files.add(
      await http.MultipartFile.fromPath('avatar_image', imageFile.path),
    );

    var response = await request.send();

    if (response.statusCode == 200) {
      String responseData = await response.stream.bytesToString();
      Map<String, dynamic> responseMap = json.decode(responseData);
      return responseMap;
    } else {
      throw Exception('Upload failed.');
    }
  }

  Future<dynamic> put(
    String uri, [
    dynamic body = const <String, dynamic>{},
  ]) async {
    http.Response response;

    response = await http.put(
      _getFullUri(uri),
      headers: await _getHeaders(),
      body: jsonEncode(body),
    );

    _validateStatusCode(response);

    return json.decode(response.body);
  }

  void _validateStatusCode(http.Response response) {
    if (response.statusCode >= 500) {
      throw ServerException(response.statusCode, response.body);
    }

    if (response.statusCode == 401 || response.statusCode == 403) {
      throw InvalidCredentialsException(response.statusCode, response.body);
    }

    if (response.statusCode >= 400) {
      throw ClientException(response.statusCode, response.body);
    }
  }
}
