import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/helper/FireStroreHelper.dart';
import 'package:flutter/material.dart';

import '../../model/user_model.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FireStoreHelper.storeHelper.getAllUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            QuerySnapshot<Map<String, dynamic>>? data = snapshot.data;

            List allData = data!.docs;

            List<UserModel> allUser =
                allData.map((e) => UserModel.fromMap(data: e.data())).toList();

            return ListView.builder(
              itemBuilder: (context, index) {
                UserModel userModel = allUser[index];
                return ListTile(
                  leading: Text(userModel.username),
                  title: Text(userModel.email),
                  trailing: const Text(">"),
                );
              },
              itemCount: allData.length,
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.hasError}");
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
