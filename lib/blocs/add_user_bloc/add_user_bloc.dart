
import 'package:bloc_test_app/blocs/add_user_bloc/add_user_event.dart';
import 'package:bloc_test_app/blocs/add_user_bloc/add_user_state.dart';
import 'package:bloc_test_app/repositories/user_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewUserBloc extends Bloc<AddNewUserEvent, AddNewUserState>{
  final UserService userService;
  AddNewUserBloc({required this.userService}) : super(AddNewUserInitial()){
    on<AddNewUser>((event, emit) async {
      emit(AddNewUserLoading());
      try{
        final result = await userService.addNewUser(event.name, event.job);
        emit(AddNewUserLoaded(newUser: result));
      } catch(_){
        rethrow;
      }
    });
  }
}