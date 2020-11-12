import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    String name,
    String email,
    String phoneNumber,
    bool isOnline,
    String uid,
    @Default("Hello there Im using this App") String status,
    String profileUrl,
  }) = _UserEntity;
}
