part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.inital() = _Initial;
  const factory AuthState.authenticated(String uid) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
}
