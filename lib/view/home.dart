import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/bloc/theme.dart';
import 'package:latihan_bloc/view/data_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Counter myCounter = context.read<Counter>();
    ThemeBloc myTheme = context.read<ThemeBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MultiBlocListener(
              listeners: [
                //for dark mode
                BlocListener<Counter, int>(
                  listener: (context, state) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Diatas 10"),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  listenWhen: (previous, current) {
                    if (current > 10) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                ),

                //for upper of 10
                BlocListener<ThemeBloc, bool>(
                  listener: (context, state) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Dark Mode"),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  listenWhen: (previous, current) {
                    if (current == false) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                )
              ],
              child: BlocBuilder<Counter, int>(
                builder: (context, state) {
                  return Text(
                    "$state",
                    style: const TextStyle(fontSize: 51),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    myCounter.decrement();
                  },
                  icon: Icon(Icons.minimize),
                ),
                IconButton(
                  onPressed: () {
                    myCounter.increment();
                  },
                  icon: Icon(Icons.add),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //call theme bloc
          myTheme.changeTheme();
        },
        child: Icon(Icons.dark_mode),
      ),
    );
  }
}
