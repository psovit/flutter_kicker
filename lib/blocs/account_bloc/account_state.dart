part of 'account_bloc.dart';

enum AccountStatus { empty, loaded, error, loading }

abstract class AccountState {
  final Account? account;
  final AccountStatus status;
  final String errorMessage;

  AccountState({
    this.account,
    this.status = AccountStatus.empty,
    this.errorMessage = '',
  });
}

class AccountError extends AccountState {
  AccountError(String errorMessage)
      : super(
          errorMessage: errorMessage,
          status: AccountStatus.error,
        );
}

class AccountLoading extends AccountState {
  AccountLoading() : super(status: AccountStatus.loading);
}

class AccountInitial extends AccountState {
  AccountInitial() : super(status: AccountStatus.empty);
}

class AccountLoaded extends AccountState {
  AccountLoaded(Account account)
      : super(
          account: account,
          status: AccountStatus.loaded,
        );
}
