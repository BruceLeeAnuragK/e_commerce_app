import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/login_controller.dart';
import '../../helper/FireStroreHelper.dart';
import '../../model/user_model.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

LoginController controller = Get.put(LoginController());
final usernameController = TextEditingController();
final emailController = TextEditingController();
GlobalKey<FormState> loginKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                ),
              ),
            ],
          ),
          Form(
            key: loginKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    controller: usernameController,
                    keyboardType: TextInputType.name,
                    validator: (val) {
                      if (val!.isEmpty) {
                        "Enter the User name.";
                      } else if (val.length > 6) {
                        "Enter only 6 digit username.";
                      } else {
                        "";
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue.shade900,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.blue.shade900,
                      ),
                      suffixIconColor: Colors.blue,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    controller: emailController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        "Enter the your Email here.";
                      } else if (val.length > 6) {
                        "Enter only 6 digit username";
                      } else {
                        "";
                      }
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue.shade900,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.blue.shade900,
                      ),
                      suffixIconColor: Colors.blue,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          MaterialButton(
            height: 60,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.blue.shade900,
              ),
            ),
            color: Colors.blue.shade900,
            onPressed: () async {
              await FireStoreHelper.storeHelper.addUser(
                userModel: UserModel(
                  username: usernameController.text,
                  email: emailController.text,
                ),
              );
              Get.toNamed("/HomePage");
              if (loginKey.currentState!.validate()) {
                controller.OnSubmit(
                    usernameController.text, emailController.text);
                usernameController.clear();
                emailController.clear();
              } else {
                "not saved";
              }
            },
            child: Text(
              "Submit",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Obx(
          //   () => Text("name : ${controller.username.value}"),
          // ),
          // Obx(
          //   () => Text("last : ${controller.email.value}"),
          // ),
          Text("User Name : ${LoginController.storage.read("userName") ?? ""}"),
          Text(" Email : ${LoginController.storage.read("email") ?? ""}"),
        ],
      ),
    );
  }
}
