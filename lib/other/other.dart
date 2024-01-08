import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Counter counter = context.read<Counter>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Other Page"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: BlocBuilder<Counter, int>(
          bloc: counter,
          builder: (context, state) {
            return Text(
              "$state",
              style: const TextStyle(fontSize: 50),
            );
          },
        ),
      ),
    );
  }
}
