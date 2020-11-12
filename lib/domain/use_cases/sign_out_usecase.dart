import 'package:whatsap/domain/repositories/i_firebase_repository.dart';

class SignOutUseCase {
  final IFirebaseRepository firebaseRepository;

  SignOutUseCase({this.firebaseRepository});

  Future<void> call() async {
    return await firebaseRepository.signOut();
  }
}
