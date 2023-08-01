import 'package:bloc/bloc.dart';
import 'package:devmate/src/services/firebase_auth_methods.dart';
import 'package:equatable/equatable.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository _authRepository;

  SignupCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SignupState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: SignupStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: SignupStatus.initial));
  }

  void signUpWithCredentials() async {
    if (!state.isValid || state.status == SignupStatus.submitting) return;
    emit(
      state.copyWith(status: SignupStatus.submitting),
    );
    try {
      await _authRepository.signUp(
          email: state.email, password: state.password);
      emit(
        state.copyWith(status: SignupStatus.success),
      );
    } catch (_) {}
  }
}
