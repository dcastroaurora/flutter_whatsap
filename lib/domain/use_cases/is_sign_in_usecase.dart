import 'package:whatsap/domain/repositories/i_firebase_repository.dart';

class IsSignInUseCase {
  final IFirebaseRepository firebaseRepository;

  IsSignInUseCase({this.firebaseRepository});

  Future<bool> call() async {
    return await firebaseRepository.isSignIn();
  }
}
