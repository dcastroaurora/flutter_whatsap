import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whatsap/domain/use_cases/get_current_uid_usecase.dart';
import 'package:whatsap/domain/use_cases/is_sign_in_usecase.dart';
import 'package:whatsap/domain/use_cases/sign_out_usecase.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUidUseCase getCurrentUidUseCase;
  final SignOutUseCase signOutUseCase;

  AuthCubit({
    this.isSignInUseCase,
    this.getCurrentUidUseCase,
    this.signOutUseCase,
  }) : super(AuthState.inital());

  Future<void> appStarted() async {
    try {
      bool isSignIn = await isSignInUseCase.call();

      if (isSignIn) {
        final uid = await getCurrentUidUseCase.call();
        emit(AuthState.authenticated(uid));
      } else {
        emit(AuthState.unauthenticated());
      }
    } catch (_) {
      emit(AuthState.unauthenticated());
    }
  }

  Future<void> loggedIn() async {
    try {
      final uid = await getCurrentUidUseCase.call();
      emit(AuthState.authenticated(uid));
    } catch (_) {}
  }

  Future<void> loggedOut() async {
    try {
      await signOutUseCase.call();
      emit(AuthState.unauthenticated());
    } catch (_) {}
  }
}
