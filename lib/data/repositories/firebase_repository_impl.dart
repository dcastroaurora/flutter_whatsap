import 'package:whatsap/data/datasource/i_firebase_remote_datasource.dart';
import 'package:whatsap/domain/entities/user_entity.dart';
import 'package:whatsap/domain/repositories/i_firebase_repository.dart';

class FirebaseRepositoryImpl implements IFirebaseRepository {
  final IFirebaseRemoteDataSource firebaseRemoteDataSource;

  FirebaseRepositoryImpl({this.firebaseRemoteDataSource});

  @override
  Future<void> getCreateCurrentUser(UserEntity user) =>
      firebaseRemoteDataSource.getCreateCurrentUser(user);

  @override
  Future<String> getCurrentUID() => firebaseRemoteDataSource.getCurrentUID();

  @override
  Future<bool> isSignIn() => firebaseRemoteDataSource.isSignIn();

  @override
  Future<void> signInWithPhoneNumber(String smsPinCode) =>
      firebaseRemoteDataSource.signInWithPhoneNumber(smsPinCode);

  @override
  Future<void> signOut() => firebaseRemoteDataSource.signOut();

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) =>
      firebaseRemoteDataSource.verifyPhoneNumber(phoneNumber);
}
