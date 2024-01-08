import 'package:flutter/material.dart';
import 'package:latihan_bloc/cubit/observer.dart';

class BlocBasicPage extends StatelessWidget {
  BlocBasicPage({super.key});

  CounterCubit myCounter = CounterCubit(initialData: 0); //init is optional

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CUBIT Apps"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            initialData:
                myCounter.initialData, //its can simplify if want get data
            stream: myCounter.stream,
            builder: (context, snapshot) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      "${snapshot.data}",
                      style: const TextStyle(
                        fontSize: 50,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  myCounter.decrement(); //just call from this class
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  myCounter.increment();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
