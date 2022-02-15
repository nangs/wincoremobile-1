import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wincoremobile/domain/model/changesPassword/changesPass_request.dart';
import 'package:wincoremobile/domain/model/changesPassword/changesPass_response.dart';
import 'package:wincoremobile/repository/chagesPass/changesPass_repository.dart';
import 'package:wincoremobile/repository/token_repository.dart';

part 'changes_pass_state.dart';

class ChangesPassCubit extends Cubit<ChangesPassState> {
  ChangesPassCubit() : super(ChangesPassInitial());

  final PassRepository _passRepository = PassRepository();
  final TokenRepository _tokenRepository = TokenRepository();

  void changesPass(PassRequest passRequest) async {
    try {
      final _token = await _tokenRepository.GetToken();

      final _data = await _passRepository.ChangesPassWithUsernameAndPassword(
          token: _token.toString(), passRequest: passRequest);
      // l = left, r = right. left untuk error, right untuk yang gak error
      _data.fold((l) => emit(PassError(l)),
          (r) => emit(ChangesPassSuccessRestoreState(r)));
    } catch (e) {
      emit(PassError(e.toString()));
    }
  }
}
