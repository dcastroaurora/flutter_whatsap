import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:whatsap/domain/entities/user_entity.dart';
import 'package:whatsap/domain/use_cases/get_create_current_user_usercase.dart';
import 'package:whatsap/domain/use_cases/sign_in_with_phone_number_usecase.dart';
import 'package:whatsap/domain/use_cases/verify_phone_number_usecase.dart';

part 'phone_auth_state.dart';
part 'phone_auth_cubit.freezed.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  final SignInWithPhoneNumberUseCase signInWithPhoneNumberUseCase;
  final VerifyPhoneNumberUseCase verifyPhoneNumberUseCase;
  final GetCreateCurrentUserUserCase getCreateCurrentUserUserCase;

  PhoneAuthCubit({
    this.signInWithPhoneNumberUseCase,
    this.verifyPhoneNumberUseCase,
    this.getCreateCurrentUserUserCase,
  }) : super(PhoneAuthState.inital());

  Future<void> submitVerifyPhoneNumber({String phoneNumber}) async {
    emit(PhoneAuthState.loading());
    try {
      await verifyPhoneNumberUseCase.call(phoneNumber);
      emit(PhoneAuthState.smsCodeReceived());
    } on SocketException catch (_) {
      emit(PhoneAuthState.failure());
    } catch (_) {
      emit(PhoneAuthState.failure());
    }
  }

  Future<void> submitSmsCode({String smsCode}) async {
    try {
      await signInWithPhoneNumberUseCase.call(smsCode);
      emit(PhoneAuthState.profileInfo());
    } on SocketException catch (_) {
      emit(PhoneAuthState.failure());
    } catch (_) {
      emit(PhoneAuthState.failure());
    }
  }

  Future<void> submitProfileInfo({
    String name,
    String profileUrl,
    String phoneNumber,
  }) async {
    try {
      await getCreateCurrentUserUserCase.call(UserEntity(
          uid: "",
          name: name,
          email: "",
          phoneNumber: phoneNumber,
          isOnline: true,
          profileUrl: profileUrl,
          status: ""));
      emit(PhoneAuthState.success());
    } on SocketException catch (_) {
      emit(PhoneAuthState.failure());
    } catch (_) {
      emit(PhoneAuthState.failure());
    }
  }
}
