import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kicker/api/account/api_account_api.dart';
import 'package:flutter_kicker/models/account.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final BaseAccountApi accountApi;
  AccountBloc({required this.accountApi}) : super(AccountInitial()) {
    on<GetAccountErrorEvent>((event, emit) async {
      emit(AccountError(event.errorMessage));
    });

    on<GetAccountEvent>((event, emit) async {
      emit(AccountLoading());
      try {
        final Account? account = await accountApi.load();
        if (account != null) {
          emit(AccountLoaded(account));
          return;
        }
        emit(AccountInitial());
      } catch (e) {
        emit(AccountError('Unable to load account!'));
      }
    });
  }
}
