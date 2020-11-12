import '../entities/user_entity.dart';
import 'package:whatsap/domain/repositories/i_firebase_repository.dart';

class GetCreateCurrentUserUserCase {
  final IFirebaseRepository firebaseRepository;

  GetCreateCurrentUserUserCase({this.firebaseRepository});

  Future<void> call(UserEntity user) async {
    return await firebaseRepository.getCreateCurrentUser(user);
  }
}
