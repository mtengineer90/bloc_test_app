import 'package:dio/dio.dart';

import '../constants/url_constants.dart';
import '../models/user_model.dart';
import '../models/user_new.dart';
import 'dio_client.dart';
import 'dio_exceptions.dart';

class UserService{
  Future<NewUser> addNewUser(String name, String job) async {
    try{
      final response = await DioClient.instance.post(
        Paths.usersUrl,
        data: {
          'name': name,
          'job': job,
        },
      );
      return NewUser.fromJson(response);
    }on DioException catch(e){
      var error = DioErrors(e);
      throw error.errorMessage;
    }
  }
  Future<User> getUser() async{
    try {
      final response = await DioClient.instance.get(Paths.users);
      final user = User.fromJson(response["data"]);
      return user;
    }on DioException catch(e){
      var error = DioErrors(e);
      throw error.errorMessage;
    }
  }
  Future<NewUser> updateUser(String id, String name, String job)async {
    try{
      final response = await DioClient.instance.put(
        '${Paths.users}/$id',
        data: {
          'id': id,
          'name': name,
          'job': job,
        },
      );
      return NewUser.fromJson(response);
    }on DioException catch(e){
      var error = DioErrors(e);
      throw error.errorMessage;
    }
  }
  Future<void> deleteUser(String id) async{
    try{
      await DioClient.instance.delete('${Paths.users}/$id');
    }on DioException catch(e){
      var error = DioErrors(e);
      throw error.errorMessage;
    }
  }
}