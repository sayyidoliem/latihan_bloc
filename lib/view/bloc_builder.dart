import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';

class BlocBuilderPage extends StatelessWidget {
  Counter myCounter = Counter();

  BlocBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BLOC Builder",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder(
            //can change streambuilder
            bloc: myCounter,
            buildWhen: (previoeus, current) {
              //can use when return = true
              if (current == 3) {
                return true;
              } else {
                return false;
              }
            },
            builder: (context, state) {
              return Text(
                "$state",
                style: const TextStyle(fontSize: 50),
              );
            },
          ), //dari package flutter bloc
          // StreamBuilder(
          //   initialData: myCounter.init,
          //   stream: myCounter.stream,
          //   builder: (context, snapshot) {
          //     return Text(
          //       "${snapshot.data}",
          //       style: const TextStyle(fontSize: 50),
          //     );
          //   },
          // ),
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
