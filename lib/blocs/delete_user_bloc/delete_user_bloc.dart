import 'package:bloc_test_app/blocs/delete_user_bloc/delete_user_event.dart';
import 'package:bloc_test_app/repositories/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'delete_user_state.dart';

class DeleteUserBloc extends Bloc<DeleteUserEvent, DeleteUserState> {
  final UserService userService;

  DeleteUserBloc({required this.userService}) : super(DeleteUserInitial()) {
    on<DeleteUser>((event, emit) async {
      emit(const DeleteUserLoading());
      try {
        await userService.deleteUser(event.id);
        emit(DeleteUserLoaded());
      } catch (_) {}
    });
  }
}
