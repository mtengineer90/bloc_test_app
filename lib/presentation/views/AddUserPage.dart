import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AddUserPageBody.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: AddUserPageBody()
      ),
    );
  }
}
