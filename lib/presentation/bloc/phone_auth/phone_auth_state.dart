part of 'phone_auth_cubit.dart';

@freezed
abstract class PhoneAuthState with _$PhoneAuthState {
  const factory PhoneAuthState.inital() = _Initial;
  const factory PhoneAuthState.loading() = _Loading;
  const factory PhoneAuthState.smsCodeReceived() = _SmsCodeReceived;
  const factory PhoneAuthState.profileInfo() = _ProfileInfo;
  const factory PhoneAuthState.success() = _Success;
  const factory PhoneAuthState.failure() = _Failure;
}
