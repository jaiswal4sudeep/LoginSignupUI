import 'package:flutter/material.dart';
import 'package:intro/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "User";
  bool changeButton = false;
  bool isBtnPressed = false;
  bool isPassHidden = true;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if ((_formKey.currentState!.validate()) && (isBtnPressed == true)) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(milliseconds: 500));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/images/log_in.png",
                  fit: BoxFit.cover,
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3F3D56),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter username",
                          labelText: "Username",
                          labelStyle: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF673AB7),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF673AB7),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }

                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: isPassHidden,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF673AB7),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF673AB7),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isPassHidden = !isPassHidden;
                              });
                            },
                            icon: isPassHidden == true
                                ? Icon(
                                    Icons.visibility,
                                    color: Color(0xFF673AB7),
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: Color(0xFF3F3D56),
                                  ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password length should be atleast 6";
                          }

                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isBtnPressed = !isBtnPressed;
                                });
                              },
                              icon: isBtnPressed == true
                                  ? Icon(
                                      Icons.check_box,
                                      color: Color(0xFF673AB7),
                                    )
                                  : Icon(
                                      Icons.check_box_outline_blank,
                                      color: Color(0xFF3F3D56),
                                    ),
                            ),
                            Text(
                              "Remember Me",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF3F3D56),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Material(
                        color: Color(0xFF673AB7),
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 100),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            width: changeButton ? 50 : 300,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Not registered yet?",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF3F3D56),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, MyRoutes.signupRoute);
                              },
                              child: Text(
                                "Create an Account",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF673AB7).withOpacity(0.9),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
