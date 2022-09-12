
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/users_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBodyApp extends StatefulWidget {
  const MyBodyApp({Key? key}) : super(key: key);

  @override
  State<MyBodyApp> createState() => _MyBodyAppState();
}

class _MyBodyAppState extends State<MyBodyApp> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
      ),
      appBar: AppBar(
        title: const Text("API Bloc"),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UsersLoaded) {
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: scrollController,
              itemCount: state.userModels.length,
              itemBuilder: (context, index) {
                var data = state.userModels[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          NetworkImage(state.userModels[index].avatar),
                    ),
                    title: Text(data.first_name + data.last_name),
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text("Something went wrong !"),
          );
        },
      ),
    );
  }
}
