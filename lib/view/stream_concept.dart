import 'package:flutter/material.dart';

class StreamPage extends StatelessWidget {
  StreamPage({super.key});

  Stream<int> countStream() async* {
    //stream concept
    //use * in await if not Future type
    for (var i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      //yield like return but doesn't terminate the function.
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Apps"),
      ),
      body: StreamBuilder(
        //build only inside streambuilder
        stream: countStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Text(
                "${snapshot.data}",
                style: TextStyle(fontSize: 50),
              ),
            );
          }
        },
      ),
    );
  }
}
