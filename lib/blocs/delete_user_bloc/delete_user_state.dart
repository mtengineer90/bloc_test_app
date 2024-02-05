import 'package:equatable/equatable.dart';

abstract class DeleteUserState extends Equatable{
  const DeleteUserState();
}

class DeleteUserInitial extends DeleteUserState{
  const DeleteUserInitial();

  @override
  List<Object?> get props => [];
}

class DeleteUserLoading extends DeleteUserState{
  const DeleteUserLoading();

  @override
  List<Object?> get props => [];
}

class DeleteUserLoaded extends DeleteUserState{
  const DeleteUserLoaded();

  @override
  List<Object?> get props => [];
}