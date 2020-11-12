import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:whatsap/presentation/bloc/phone_auth/phone_auth_cubit.dart';

import 'data/datasource/firebase_remote_datasource_impl.dart';
import 'data/datasource/firebase_remote_datasource_impl_2.dart';
import 'data/datasource/i_firebase_remote_datasource.dart';
import 'data/repositories/firebase_repository_impl.dart';
import 'domain/repositories/i_firebase_repository.dart';
import 'domain/use_cases/get_create_current_user_usercase.dart';
import 'domain/use_cases/get_current_uid_usecase.dart';
import 'domain/use_cases/is_sign_in_usecase.dart';
import 'domain/use_cases/sign_in_with_phone_number_usecase.dart';
import 'domain/use_cases/sign_out_usecase.dart';
import 'domain/use_cases/verify_phone_number_usecase.dart';
import 'presentation/bloc/auth/auth_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //futures bloc
  sl.registerFactory<AuthCubit>(() => AuthCubit(
      isSignInUseCase: sl(), getCurrentUidUseCase: sl(), signOutUseCase: sl()));

  sl.registerFactory<PhoneAuthCubit>(() => PhoneAuthCubit(
      getCreateCurrentUserUserCase: sl(),
      signInWithPhoneNumberUseCase: sl(),
      verifyPhoneNumberUseCase: sl()));
  //useCase
  sl.registerLazySingleton<GetCreateCurrentUserUserCase>(
      () => GetCreateCurrentUserUserCase(firebaseRepository: sl()));

  sl.registerLazySingleton<GetCurrentUidUseCase>(
      () => GetCurrentUidUseCase(firebaseRepository: sl()));

  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(firebaseRepository: sl()));

  sl.registerLazySingleton<SignInWithPhoneNumberUseCase>(
      () => SignInWithPhoneNumberUseCase(firebaseRepository: sl()));

  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(firebaseRepository: sl()));

  sl.registerLazySingleton<VerifyPhoneNumberUseCase>(
      () => VerifyPhoneNumberUseCase(firebaseRepository: sl()));

  //repository
  sl.registerLazySingleton<IFirebaseRepository>(() => FirebaseRepositoryImpl(
      firebaseRemoteDataSource: sl(instanceName: "firebase1")));

  //remote data
  sl.registerLazySingleton<IFirebaseRemoteDataSource>(
      () => FirebaseRemoteDataSourceImpl(
          firebaseAuth: sl(), firebaseFirestore: sl()),
      instanceName: "firebase1");

  sl.registerLazySingleton<IFirebaseRemoteDataSource>(
      () => FirebaseRemoteDataSourceImpl2(
          firebaseAuth: sl(), firebaseFirestore: sl()),
      instanceName: "firebase2");

  //external
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  sl.registerLazySingleton<FirebaseAuth>(() => auth);
  sl.registerLazySingleton<FirebaseFirestore>(() => fireStore);
}
