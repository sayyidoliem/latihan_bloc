import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //bloc provider don't use with same return the widget usage
      create: (context) => Counter(), //what you want to create
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
