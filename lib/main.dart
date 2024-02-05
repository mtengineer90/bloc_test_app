import 'package:bloc_test_app/presentation/app_screen.dart';
import 'package:bloc_test_app/repositories/user_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App(userService: UserService()));
}