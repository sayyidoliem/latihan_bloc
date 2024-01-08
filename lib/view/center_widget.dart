import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';

class center_widget extends StatelessWidget {
  const center_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Counter myCounter = BlocProvider.of<Counter>(context);
    return Center(
      child: BlocBuilder(
        bloc: myCounter, //show last value
        builder: (context, state) {
          return Text(
            "$state",
            style: const TextStyle(fontSize: 50, color: Colors.white),
          );
        },
      ),
    );
  }
}
