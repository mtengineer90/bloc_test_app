
import 'package:bloc_test_app/blocs/update_user_bloc/update_user_event.dart';
import 'package:bloc_test_app/blocs/update_user_bloc/update_user_state.dart';
import 'package:bloc_test_app/repositories/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateUserBloc extends Bloc<UpdateUserEvent, UpdateUserState>{
  final UserService userService;

  UpdateUserBloc({required this.userService}) : super(UpdateUserInitial()){
    on<UpdateUser>((event, emit) async {
      emit(UpdateUserLoading());
      try{
        final result = await userService.updateUser(event.id, event.name, event.job);
        emit(UpdateUserLoaded(newUser: result));
      } catch (_){
        rethrow;
      }
    });
  }
}