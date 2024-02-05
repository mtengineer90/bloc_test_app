import 'package:equatable/equatable.dart';

import '../../models/user_new.dart';

abstract class UpdateUserState extends Equatable{
  const UpdateUserState();
}

class UpdateUserInitial extends UpdateUserState{
  const UpdateUserInitial();

  @override
  List<Object?> get props => [];
}

class UpdateUserLoading extends UpdateUserState{
  const UpdateUserLoading();

  @override
  List<Object?> get props => [];
}

class UpdateUserLoaded extends UpdateUserState{
  const UpdateUserLoaded({this.newUser = const NewUser()});

  final NewUser newUser;

  @override
  List<Object?> get props => [newUser];
}