import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/404/404.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/other/other.dart';
import 'package:latihan_bloc/view/home.dart';

class MyRouter {
  //generate route access
  Counter myCounter = Counter();

  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: myCounter,
              child: HomePage(),
            );
          },
        );

      case "/detail":
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: myCounter,
              child: const OtherScreen(),
            );
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFound(),
        );
    }
  }
}
