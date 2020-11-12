import 'package:whatsap/domain/repositories/i_firebase_repository.dart';

class GetCurrentUidUseCase {
  final IFirebaseRepository firebaseRepository;

  GetCurrentUidUseCase({this.firebaseRepository});

  Future<String> call() async {
    return await firebaseRepository.getCurrentUID();
  }
}
