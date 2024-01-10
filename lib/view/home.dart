import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/bloc/user.dart';

class HomeBlocSelector extends StatelessWidget {
  HomeBlocSelector({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // BlocBuilder<UserBloc, Map<String, dynamic>>(
          //   bloc: userBloc,
          //   builder: (context, state) {
          //     return Text("Name : ${state["name"]}");
          //   },
          // ),
          // BlocBuilder<UserBloc, Map<String, dynamic>>(
          //   bloc: userBloc,
          //   builder: (context, state) {
          //     return Text("Age : ${state["age"]} Tahun");
          //   },
          // ),

          BlocSelector<UserBloc, Map<String, dynamic>, String>(
            selector: (state) => state["name"],
            builder: (context, state) {
              return Text("Name : $state");
            },
          ),
          BlocSelector<UserBloc, Map<String, dynamic>, int>(
            selector: (state) => state["age"],
            builder: (context, state) {
              return Text("Age : $state year");
            },
          ),
          const SizedBox(height: 20),
          TextField(
            onChanged: (value) => userBloc.changeName(value),
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  userBloc.changeAge(userBloc.state["age"] - 1);
                },
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  userBloc.changeAge(userBloc.state["age"] + 1);
                },
                icon: Icon(Icons.add),
              )
            ],
          )
        ],
      ),
    );
  }
}

class HomePageExtensionMethod extends StatelessWidget {
  HomePageExtensionMethod({super.key});

  @override
  Widget build(BuildContext context) {
    //EXTENTION METHOD
    // 1. context.read()
    // 2. context.watch()
    // 3. context.select()

    UserBloc myUser = context.read<UserBloc>();

    // Counter myCounter = context.read<Counter>();//only 1x read (at first time)
    // Counter myCounter = context.watch<Counter>();//read again and re-build repeatly
    // String nameUser =
    //     context.select<UserBloc, String>((value) => value.state["name"]);
    // int ageUser = context.select<UserBloc, int>((value) => value.state["age"]);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Builder(builder: (context) {
              String nameUser = context
                  .select<UserBloc, String>((value) => value.state["name"]);
              return Text("Name : $nameUser");
            }),
            Builder(builder: (context) {
              int ageUser =
                  context.select<UserBloc, int>((value) => value.state["age"]);
              return Text("Age : $ageUser");
            }),
            // Builder(builder: (context) {
            //   //use this method if you don't want re-build again
            //   Counter myCounter = context.watch<Counter>();
            //   return Text(
            //     "${myCounter.state}",
            //     style: const TextStyle(fontSize: 100),
            //   );
            // }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => myUser
                      .changeAge(context.read<UserBloc>().state["age"] - 1),
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () => myUser
                      .changeAge(context.read<UserBloc>().state["age"] - 1),
                  icon: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
