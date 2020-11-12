import 'package:whatsap/domain/repositories/i_firebase_repository.dart';

class SignInWithPhoneNumberUseCase {
  final IFirebaseRepository firebaseRepository;

  SignInWithPhoneNumberUseCase({this.firebaseRepository});

  Future<void> call(String smsCode) {
    return firebaseRepository.signInWithPhoneNumber(smsCode);
  }
}
