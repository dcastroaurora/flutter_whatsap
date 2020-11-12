import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsap/data/datasource/i_firebase_remote_datasource.dart';
import 'package:whatsap/data/model/user_model.dart';
import 'package:whatsap/domain/entities/user_entity.dart';

class FirebaseRemoteDataSourceImpl implements IFirebaseRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  String _verificationId = '';

  FirebaseRemoteDataSourceImpl({this.firebaseAuth, this.firebaseFirestore});

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    final userCollection = firebaseFirestore.collection("users");
    final uid = await getCurrentUID();

    userCollection.doc(uid).get().then(
      (userDoc) {
        final newUser = UserModel(
          status: user.status,
          profileUrl: user.profileUrl,
          isOnline: user.isOnline,
          uid: uid,
          phoneNumber: user.phoneNumber,
          email: user.email,
          name: user.name,
        ).toDocument();

        if (!userDoc.exists) {
          //create new user
          userCollection.doc(uid).set(newUser);
        } else {
          //update user doc
          userCollection.doc(uid).update(newUser);
        }
      },
    );
  }

  @override
  Future<String> getCurrentUID() async => firebaseAuth.currentUser.uid;

  @override
  Future<bool> isSignIn() async => firebaseAuth.currentUser != null;

  @override
  Future<void> signInWithPhoneNumber(String smsPinCode) async {
    final AuthCredential authCredential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: smsPinCode,
    );

    await firebaseAuth.signInWithCredential(authCredential);
  }

  @override
  Future<void> signOut() => firebaseAuth.signOut();

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    final PhoneVerificationCompleted _phoneVerificationCompleted =
        (AuthCredential authCredential) {
      print("phone verified : Token ${authCredential.token}");
    };

    final PhoneVerificationFailed _phoneVerificationFailed =
        (FirebaseAuthException firebaseAuthException) {
      print(
          "phone failed: ${firebaseAuthException.message}, ${firebaseAuthException.code}");
    };

    final PhoneCodeAutoRetrievalTimeout _phoneCodeAutoRetrievalTimeout =
        (String verificationId) {
      this._verificationId = verificationId;
      print("Time out : $verificationId");
    };

    final PhoneCodeSent _phoneCodeSent =
        (String verificationId, [int forceResendingToken]) {};

    firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: _phoneVerificationCompleted,
      verificationFailed: _phoneVerificationFailed,
      timeout: const Duration(seconds: 10),
      codeSent: _phoneCodeSent,
      codeAutoRetrievalTimeout: _phoneCodeAutoRetrievalTimeout,
    );

    final ccc = 2;
  }
}
