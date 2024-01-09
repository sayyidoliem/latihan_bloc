import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/view/data_widget.dart';

class HomePage extends StatelessWidget {
  // Counter myCounter = Counter();
  //use blocprovider fr alternative

  //create more var with Cubit class if want
  Counter myCounter2 = Counter();

  @override
  Widget build(BuildContext context) {
    Counter myCounter = BlocProvider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BLOC Provider",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //local or anonymous access
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const OtherScreen()),
          // );
          //name route access
          Navigator.of(context).pushNamed("/detail");
        },
        child: const Icon(Icons.arrow_forward),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Button decrement
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<Counter>(context)
                        .decrement(); //call the blocprovider like this
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Center(
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              //Widget data counter
              const DataWidget(), //with extract widget method
              //Button increment
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  onTap: () {
                    myCounter.increment(); //simplify
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
