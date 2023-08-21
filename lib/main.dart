// ignore_for_file: prefer_const_constructors, avoid_web_libraries_in_flutter, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listview/PAGES/LOGIN.dart';
import 'package:listview/WIDGET/homelayout.dart';
import 'package:listview/data/Bloc.dart';
import 'package:listview/data/NEW/cubit/new_app_cubit.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiBlocProvider(providers: [
    BlocProvider<NewAppCubit>(
      create: (context) => NewAppCubit()
     
        ..getDataFromFirebase(),

    ),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent
 ) ,
        
        fontFamily: 'Urbanist'),
      home: user == null ? LoginScreen() : const HomeLayout(),
    );
  }
}
