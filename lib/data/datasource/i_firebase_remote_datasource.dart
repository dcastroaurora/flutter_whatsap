//Estamos en el límite entre el mundo exterior y nuestra aplicación, es un lugar donde
//la aplicación se encuentra con el duro mundo exterior de las API y las bibliotecas de terceros.
import 'package:whatsap/domain/entities/user_entity.dart';

abstract class IFirebaseRemoteDataSource {
  Future<void> verifyPhoneNumber(String phoneNumber);
  Future<void> signInWithPhoneNumber(String smsPinCode);
  Future<bool> isSignIn();
  Future<void> signOut();
  Future<String> getCurrentUID();
  Future<void> getCreateCurrentUser(UserEntity user);
}
