import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsap/domain/entities/user_entity.dart';

import 'i_firebase_remote_datasource.dart';

class FirebaseRemoteDataSourceImpl2 implements IFirebaseRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  String _verificationId = '';

  FirebaseRemoteDataSourceImpl2({this.firebaseAuth, this.firebaseFirestore});

  @override
  Future<void> getCreateCurrentUser(UserEntity user) {
    // TODO: implement getCreateCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<String> getCurrentUID() {
    // TODO: implement getCurrentUID
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignIn() async {
    print('sdsdsdsd');
    return true;
  }

  @override
  Future<void> signInWithPhoneNumber(String smsPinCode) {
    // TODO: implement signInWithPhoneNumber
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) {
    // TODO: implement verifyPhoneNumber
    throw UnimplementedError();
  }
}
