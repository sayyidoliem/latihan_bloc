import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/bloc/theme.dart';
import 'package:latihan_bloc/routes/routes.dart';
import 'package:latihan_bloc/view/app.dart';
import 'package:latihan_bloc/view/home.dart';

void main() {
  runApp(const MyAppMultiBloc());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Counter myCounter = Counter();

    final router = MyRouter();
    return
        // BlocProvider(
        //bloc provider don't use with same return the widget usage
        // create: (context) => Counter(), //what you want to create
        MaterialApp(
      //use for local or anonymous access
      // home: HomePage(),
      //use for name route access
      // initialRoute: "/",
      // routes: {
      //   //if blocprovider in top of routes
      //   // "/": (context) => HomePage(),
      //   // "/detail": (context) => OtherScreen(),
      //   "/": (context ) => BlocProvider.value(
      //         value: myCounter,
      //         child: HomePage(),
      //       ),
      //   "/detail": (context) => BlocProvider.value(
      //         value: myCounter,
      //         child: OtherScreen(),
      //       )
      // },
      //generate route access
      onGenerateRoute: router.onRoute,
    );
  }
}

class MyAppMultiBloc extends StatelessWidget {
  const MyAppMultiBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => Counter(),
        ),
      ],
      child: const App(),
    );
    // return BlocProvider(
    //   create: (context) => myTheme,
    //   child: BlocBuilder<ThemeBloc, bool>(
    //     bloc: myTheme,
    //     builder: (context, state) {
    //       return MaterialApp(
    //         theme: state == true ? ThemeData.light() : ThemeData.dark(),
    //         home: BlocProvider(
    //           create: (context) => Counter(),
    //           child: HomePage(),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
