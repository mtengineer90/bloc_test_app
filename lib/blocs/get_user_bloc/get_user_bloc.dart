
import 'package:bloc_test_app/blocs/get_user_bloc/get_user_event.dart';
import 'package:bloc_test_app/blocs/get_user_bloc/get_user_state.dart';
import 'package:bloc_test_app/repositories/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  GetUserBloc({required this.userService}) : super(GetUserLoading()){
    on<GetUser>(_onGetUser);

  }
  final UserService userService;

  Future<void> _onGetUser(GetUser event, Emitter<GetUserState> emit) async {
    emit(GetUserLoading());
    try{
      final result = await userService.getUser();
      emit(GetUserLoaded(user: result));
    } catch(_){
      emit(GetUserError());
    }
  }
}