part of 'change_mpin_cubit.dart';

@immutable
abstract class ChangesMpinState {}

class ChangesMpinInitial extends ChangesMpinState {}

class MpinLoading extends ChangesMpinState {}

class MpinError extends ChangesMpinState {
  final String errorMsg;
  MpinError(this.errorMsg);
}

class ChangesMpinSuccessRestoreState extends ChangesMpinState {
  final MpinResponse chagesMpinResponse;
  ChangesMpinSuccessRestoreState(this.chagesMpinResponse);
}
