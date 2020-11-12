//Los casos de uso son clases que encapsulan toda la
//lógica empresarial de un caso de uso particular de la aplicación
//(por ejemplo, getCurrentUid, verifyPhoneNumber, etc.).

//¿Sabías que en Dart, un método llamado call se puede ejecutar tanto llamando
//a object.call () como también a object ()?
//Ese es el método perfecto para usar en el caso de uso.

import 'package:whatsap/domain/repositories/i_firebase_repository.dart';

class VerifyPhoneNumberUseCase {
  final IFirebaseRepository firebaseRepository;

  VerifyPhoneNumberUseCase({this.firebaseRepository});

  Future<void> call(String phoneNumber) {
    return firebaseRepository.verifyPhoneNumber(phoneNumber);
  }
}
