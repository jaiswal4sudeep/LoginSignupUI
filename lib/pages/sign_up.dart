import 'package:flutter/material.dart';
import 'package:intro/utils/routes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String name = "User";
  bool changeButton = false;
  bool isBtnPressed = false;
  bool isPassHidden = true;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/sign_up.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Name",
                            labelText: "Name",
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
                          decoration: InputDecoration(
                            hintText: "mail@website.com",
                            labelText: "E-Mail",
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
                              return "E-Mail cannot be empty";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-zA-Z0-9+_.-]+.[a-z]")
                                .hasMatch(value)) {
                              return "Please enter a valid E-Mail";
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
                                      Icons.visibility_off,
                                      color: Color(0xFF673AB7),
                                    )
                                  : Icon(
                                      Icons.visibility,
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
                        Container(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    setState(() {
                                      isBtnPressed = !isBtnPressed;
                                    });
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
                                'I agree to the ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF3F3D56),
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                'Terms & Conditions',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF673AB7),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
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
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                "Already have an Account?",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF3F3D56),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, MyRoutes.loginRoute);
                                },
                                child: Text(
                                  "Sign in",
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
      ),
    );
  }
}
