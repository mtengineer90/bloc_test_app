import 'package:bloc_test_app/presentation/views/UpdateUserPage.dart';
import 'package:flutter/material.dart';

import '../presentation/views/AddUserPage.dart';
import '../presentation/views/HomePage.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 200,
        child: Container(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
                children: [
                  ListTile(
                      leading: const Icon(Icons.new_label),
                      title: const Text("Get User",style: TextStyle(
                          color: Colors.white,  fontSize: 15)),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=> const HomePage()));
                      }
                  ),
                  ListTile(
                      leading: const Icon(Icons.new_label),
                      title: const Text("Create New User",style: TextStyle(
                          color: Colors.white,  fontSize: 15)),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=> const AddUserPage()));

                      }
                  ),
                  ListTile(
                      leading: const Icon(Icons.new_label),
                      title: const Text("Update User",style: TextStyle(
                          color: Colors.white,  fontSize: 15)),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=> const UpdateUserPage()));
                      }
                  ),
                  ListTile(
                      leading: const Icon(Icons.new_label),
                      title: const Text("Delete User",style: TextStyle(
                          color: Colors.white,  fontSize: 15)),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=> const DeleteUserView()));
                      }
                  ),
                ]
            )
        )
    );
  }
}