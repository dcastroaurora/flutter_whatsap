// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserModelTearOff {
  const _$UserModelTearOff();

// ignore: unused_element
  _UserModel call(
      {String name,
      String email,
      String phoneNumber,
      bool isOnline,
      String uid,
      String status,
      String profileUrl}) {
    return _UserModel(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      isOnline: isOnline,
      uid: uid,
      status: status,
      profileUrl: profileUrl,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UserModel = _$UserModelTearOff();

/// @nodoc
mixin _$UserModel {
  String get name;
  String get email;
  String get phoneNumber;
  bool get isOnline;
  String get uid;
  String get status;
  String get profileUrl;

  $UserModelCopyWith<UserModel> get copyWith;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String email,
      String phoneNumber,
      bool isOnline,
      String uid,
      String status,
      String profileUrl});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object name = freezed,
    Object email = freezed,
    Object phoneNumber = freezed,
    Object isOnline = freezed,
    Object uid = freezed,
    Object status = freezed,
    Object profileUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      email: email == freezed ? _value.email : email as String,
      phoneNumber:
          phoneNumber == freezed ? _value.phoneNumber : phoneNumber as String,
      isOnline: isOnline == freezed ? _value.isOnline : isOnline as bool,
      uid: uid == freezed ? _value.uid : uid as String,
      status: status == freezed ? _value.status : status as String,
      profileUrl:
          profileUrl == freezed ? _value.profileUrl : profileUrl as String,
    ));
  }
}

/// @nodoc
abstract class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) then) =
      __$UserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String email,
      String phoneNumber,
      bool isOnline,
      String uid,
      String status,
      String profileUrl});
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(_UserModel _value, $Res Function(_UserModel) _then)
      : super(_value, (v) => _then(v as _UserModel));

  @override
  _UserModel get _value => super._value as _UserModel;

  @override
  $Res call({
    Object name = freezed,
    Object email = freezed,
    Object phoneNumber = freezed,
    Object isOnline = freezed,
    Object uid = freezed,
    Object status = freezed,
    Object profileUrl = freezed,
  }) {
    return _then(_UserModel(
      name: name == freezed ? _value.name : name as String,
      email: email == freezed ? _value.email : email as String,
      phoneNumber:
          phoneNumber == freezed ? _value.phoneNumber : phoneNumber as String,
      isOnline: isOnline == freezed ? _value.isOnline : isOnline as bool,
      uid: uid == freezed ? _value.uid : uid as String,
      status: status == freezed ? _value.status : status as String,
      profileUrl:
          profileUrl == freezed ? _value.profileUrl : profileUrl as String,
    ));
  }
}

/// @nodoc
class _$_UserModel extends _UserModel {
  const _$_UserModel(
      {this.name,
      this.email,
      this.phoneNumber,
      this.isOnline,
      this.uid,
      this.status,
      this.profileUrl})
      : super._();

  @override
  final String name;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final bool isOnline;
  @override
  final String uid;
  @override
  final String status;
  @override
  final String profileUrl;

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, phoneNumber: $phoneNumber, isOnline: $isOnline, uid: $uid, status: $status, profileUrl: $profileUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserModel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.isOnline, isOnline) ||
                const DeepCollectionEquality()
                    .equals(other.isOnline, isOnline)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.profileUrl, profileUrl) ||
                const DeepCollectionEquality()
                    .equals(other.profileUrl, profileUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(isOnline) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(profileUrl);

  @override
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);
}

abstract class _UserModel extends UserModel {
  const _UserModel._() : super._();
  const factory _UserModel(
      {String name,
      String email,
      String phoneNumber,
      bool isOnline,
      String uid,
      String status,
      String profileUrl}) = _$_UserModel;

  @override
  String get name;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  bool get isOnline;
  @override
  String get uid;
  @override
  String get status;
  @override
  String get profileUrl;
  @override
  _$UserModelCopyWith<_UserModel> get copyWith;
}
