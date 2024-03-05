// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kicker/blocs/account_bloc/account_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'sso_button.dart';

class GoogleSsoButton extends StatelessWidget {
  const GoogleSsoButton({
    super.key,
    this.buttonText = 'Sign in with Google',
  });

  final String buttonText;
  final String authenticationFailed =
      'Google authentication failed.\nPlease try again.';

  @override
  Widget build(BuildContext context) {
    return SsoButton(
      imagePath: 'assets/images/google.svg',
      signInLabel: buttonText,
      onTap: () {
        //safely sign out cached user if exists
        _handleSignIn(context);
      },
    );
  }

  Future<void> _clearGoogleUser(GoogleSignIn googleSignIn) async {
    //safely sign out cached user if exists
    try {
      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.disconnect();
        await googleSignIn.signOut();
      }
    } catch (_) {
      // do nothing
    }
  }

  // ignore: unused_element
  Future<void> _handleSignIn(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = context.read<GoogleSignIn>();
      await _clearGoogleUser(googleSignIn);
      final GoogleSignInAccount? googleRes = await googleSignIn.signIn();

      if (googleRes == null) {
        context.read<AccountBloc>().add(
              GetAccountErrorEvent(errorMessage: 'Google result was null!'),
            );

        return;
      }

      final GoogleSignInAuthentication auth = await googleRes.authentication;

      if (auth.idToken != null) {
        context.go("/");
      }
    } catch (_, __) {
      print(_);
      context.read<AccountBloc>().add(
            GetAccountErrorEvent(errorMessage: 'Google result was null!'),
          );
    }
  }
}
