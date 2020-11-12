// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UserEntityTearOff {
  const _$UserEntityTearOff();

// ignore: unused_element
  _UserEntity call(
      {String name,
      String email,
      String phoneNumber,
      bool isOnline,
      String uid,
      String status = 'Hello there Im using this App',
      String profileUrl}) {
    return _UserEntity(
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
const $UserEntity = _$UserEntityTearOff();

/// @nodoc
mixin _$UserEntity {
  String get name;
  String get email;
  String get phoneNumber;
  bool get isOnline;
  String get uid;
  String get status;
  String get profileUrl;

  $UserEntityCopyWith<UserEntity> get copyWith;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
          UserEntity value, $Res Function(UserEntity) then) =
      _$UserEntityCopyWithImpl<$Res>;
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
class _$UserEntityCopyWithImpl<$Res> implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  final UserEntity _value;
  // ignore: unused_field
  final $Res Function(UserEntity) _then;

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
abstract class _$UserEntityCopyWith<$Res> implements $UserEntityCopyWith<$Res> {
  factory _$UserEntityCopyWith(
          _UserEntity value, $Res Function(_UserEntity) then) =
      __$UserEntityCopyWithImpl<$Res>;
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
class __$UserEntityCopyWithImpl<$Res> extends _$UserEntityCopyWithImpl<$Res>
    implements _$UserEntityCopyWith<$Res> {
  __$UserEntityCopyWithImpl(
      _UserEntity _value, $Res Function(_UserEntity) _then)
      : super(_value, (v) => _then(v as _UserEntity));

  @override
  _UserEntity get _value => super._value as _UserEntity;

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
    return _then(_UserEntity(
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
class _$_UserEntity implements _UserEntity {
  const _$_UserEntity(
      {this.name,
      this.email,
      this.phoneNumber,
      this.isOnline,
      this.uid,
      this.status = 'Hello there Im using this App',
      this.profileUrl})
      : assert(status != null);

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
  @JsonKey(defaultValue: 'Hello there Im using this App')
  @override
  final String status;
  @override
  final String profileUrl;

  @override
  String toString() {
    return 'UserEntity(name: $name, email: $email, phoneNumber: $phoneNumber, isOnline: $isOnline, uid: $uid, status: $status, profileUrl: $profileUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserEntity &&
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
  _$UserEntityCopyWith<_UserEntity> get copyWith =>
      __$UserEntityCopyWithImpl<_UserEntity>(this, _$identity);
}

abstract class _UserEntity implements UserEntity {
  const factory _UserEntity(
      {String name,
      String email,
      String phoneNumber,
      bool isOnline,
      String uid,
      String status,
      String profileUrl}) = _$_UserEntity;

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
  _$UserEntityCopyWith<_UserEntity> get copyWith;
}
