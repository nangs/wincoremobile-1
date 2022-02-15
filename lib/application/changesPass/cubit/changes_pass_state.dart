part of 'changes_pass_cubit.dart';

@immutable
abstract class ChangesPassState {}

class ChangesPassInitial extends ChangesPassState {}

class PassLoading extends ChangesPassState {}

class PassError extends ChangesPassState {
  final String errorMsg;
  PassError(this.errorMsg);
}

class ChangesPassSuccessRestoreState extends ChangesPassState {
  final PassResponse chagesPassResponse;
  ChangesPassSuccessRestoreState(this.chagesPassResponse);
}
