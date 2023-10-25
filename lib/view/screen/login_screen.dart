import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../controller/item_list_provider.dart';
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

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController offsetcontroller;

  @override
  void initState() {
    super.initState();
    offsetcontroller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _updateEyeVisibility(int textLength) {
    if (textLength > 0) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Colors.red,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50, // set the desired width
                  height: 50, // set the desired height
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white, // set the desired color
                  ),
                  child: AnimatedBuilder(
                      animation: offsetcontroller,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, 50 * offsetcontroller.value),
                          child: Container(
                            width: 30, // set the desired width
                            height: 30, // set the desired height
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black, // set the desired color
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 50, // set the desired width
                  height: 50, // set the desired height
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white, // set the desired color
                  ),
                  child: AnimatedBuilder(
                    animation: offsetcontroller,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, -50 * offsetcontroller.value),
                        child: Container(
                          width: 30, // set the desired width
                          height: 30, // set the desired height
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black, // set the desired color
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Form(
              key: loginKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      onChanged: (val) {
                        provider.updateEyeVisibility(
                          textLength: val.length,
                          animationController: _animationController,
                        );
                      },
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
                            color: Colors.white,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        suffixIconColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white,
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
                      onChanged: (val) {
                        provider.updateEyeVisibility(
                          textLength: val.length,
                          animationController: _animationController,
                        );
                      },
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
                            color: Colors.white,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        suffixIconColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "If you are already Login then,",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            MaterialButton(
              height: 60,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              color: Colors.black,
              onPressed: () async {
                await FireStoreHelper.storeHelper.addUser(
                    userModel: UserModel(
                        username: usernameController.text,
                        email: emailController.text));
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
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Image.network(
                          "https://lh3.googleusercontent.com/COxitqgJr1sJnIDe8-jiKhxDx1FrYbtRHKJ9z_hELisAlapwE9LUPh6fcXIfb5vwpbMl4xl9H9TRFPc5NOO8Sb3VSgIBrfRYvW6cUA"),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Image.network(
                        "https://w7.pngwing.com/pngs/339/149/png-transparent-incognito-hd-logo.png",
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
                "User Name : ${LoginController.storage.read("userName") ?? ""}"),
            Text(" Email : ${LoginController.storage.read("email") ?? ""}"),
          ],
        ),
      );
    });
  }
}
