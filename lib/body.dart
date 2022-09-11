import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/users_bloc.dart';
import 'package:flutter_application_1/providers/user_providers.dart';
import 'package:flutter_application_1/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBodyApp extends StatelessWidget {
  const MyBodyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var response = await UserProvider().getAllUsers();
          log(response.toString());
        },
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
              itemCount: state.userModels.length,
              itemBuilder: (context, index) {
                var data = state.userModels[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(state.userModels[index].avatar),
                  ),
                  title: Text(data.first_name + data.last_name),
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
