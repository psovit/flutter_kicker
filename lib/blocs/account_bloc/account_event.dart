part of 'account_bloc.dart';

abstract class AccountEvent {}

class GetAccountEvent extends AccountEvent {}

class GetAccountErrorEvent extends AccountEvent {
  final String errorMessage;

  GetAccountErrorEvent({required this.errorMessage});
}
