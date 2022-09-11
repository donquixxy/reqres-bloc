import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/users_bloc.dart';
import 'package:flutter_application_1/body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersBloc()..add(LoadUser()),
      child: MaterialApp(
        home: MyBodyApp(),
      ),
    );
  }
}
