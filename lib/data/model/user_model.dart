//Los modelos son entidades con algunas funciones adicionales agregadas en la parte superior.
//En nuestro caso, esa será la capacidad de ser (ToDocument, fromSnapShot)
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';

@freezed
abstract class UserModel implements _$UserModel {
  const UserModel._();
  const factory UserModel({
    String name,
    String email,
    String phoneNumber,
    bool isOnline,
    String uid,
    String status,
    String profileUrl,
  }) = _UserModel;

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      name: snapshot.data()['name'],
      email: snapshot.data()['email'],
      phoneNumber: snapshot.data()['phoneNumber'],
      uid: snapshot.data()['uid'],
      isOnline: snapshot.data()['isOnline'],
      profileUrl: snapshot.data()['profileUrl'],
      status: snapshot.data()['status'],
    );
  }

  Map<String, dynamic> toDocument() {
    return <String, dynamic>{
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "uid": uid,
      "isOnline": isOnline,
      "profileUrl": profileUrl,
      "status": status,
    };
  }
}
