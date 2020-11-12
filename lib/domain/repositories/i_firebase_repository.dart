//La clase abstracta FirebaseRepository que define un contrato de lo que debe hacer el
//Repositorio de Firebase.
//La implementación actual de FirebaseRepository en la capa de datos completará este contrato.

import 'package:whatsap/domain/entities/user_entity.dart';

abstract class IFirebaseRepository {
  Future<void> verifyPhoneNumber(String phoneNumber);
  Future<void> signInWithPhoneNumber(String smsPinCode);
  Future<bool> isSignIn();
  Future<void> signOut();
  Future<String> getCurrentUID();
  Future<void> getCreateCurrentUser(UserEntity user);
}
