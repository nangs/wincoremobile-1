import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'account_balance_state.dart';

class AccountBalanceCubit extends Cubit<AccountBalanceState> {
  AccountBalanceCubit() : super(AccountBalanceInitial());
}
