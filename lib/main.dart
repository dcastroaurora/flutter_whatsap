import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsap/presentation/bloc/auth/auth_cubit.dart';
import 'package:whatsap/presentation/bloc/phone_auth/phone_auth_cubit.dart';
import 'package:whatsap/presentation/screens/home_screen.dart';
import 'package:whatsap/presentation/screens/splash_screen.dart';
import 'package:whatsap/presentation/screens/welcome_screen.dart';
import 'package:whatsap/presentation/widgets/theme/style.dart';
import 'counter_observer.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  Bloc.observer = CounterObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => di.sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider<PhoneAuthCubit>(
          create: (context) => di.sl<PhoneAuthCubit>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter WhatsApp Clone',
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return state.map(
                  inital: (_) => Container(),
                  authenticated: (state) => HomeScreen(uid: state.uid),
                  unauthenticated: (_) => WelcomeScreen(),
                );
              },
            );
          }
        },
      ),
    );
  }
}
