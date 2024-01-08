import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';

class BlocConsumerPage extends StatelessWidget {
  Counter myCounter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BLOC Consumer",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<Counter, int>(
            //merge between bloc listener and builder
            bloc: myCounter,
            builder: (context, state) {
              return Text(
                "$state",
                style: const TextStyle(fontSize: 50),
              );
            },
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Sudah Mencapai 3"),
                  action: SnackBarAction(label: "label", onPressed: () {}),
                ),
              );
            },
            listenWhen: (previous, current) {
              if (current == 3) {
                return true;
              } else {
                return false;
              }
            },
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    myCounter.decrement();
                  },
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    myCounter.increment();
                  },
                  icon: const Icon(Icons.add))
            ],
          )
        ],
      ),
    );
  }
}
