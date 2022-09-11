import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/models/user_models.dart';
import 'package:flutter_application_1/repository/repository.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersLoaded()) {
    on<LoadUser>((event, emit) async {
      emit(UserLoading());
      var response = await event.getAllUser();
      emit(UsersLoaded(userModels: response!));
    });
  }
}
