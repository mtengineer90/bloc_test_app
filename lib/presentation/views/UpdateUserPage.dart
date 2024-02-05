import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UpdateUserPageBody.dart';

class UpdateUserPage extends StatelessWidget {
  const UpdateUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: UpdateUserPageBody())
    );
  }
}
