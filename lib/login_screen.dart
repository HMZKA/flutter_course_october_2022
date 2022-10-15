import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercourse/messenger.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isShow = true;
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  String email = '';

  var icon = Icon(CupertinoIcons.eye_slash_fill);
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    email = emailcontroller.text;
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This required';
                      }
                    },
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        // hintText: 'Email',
                        label: Text('Email'),
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This required';
                      }
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    controller: passwordcontroller,
                    obscureText: isShow,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(CupertinoIcons.lock_fill),
                        label: Text('Password'),
                        suffixIcon: IconButton(
                          icon: icon,
                          onPressed: () {
                            setState(() {
                              if (isShow) {
                                isShow = false;
                                icon = Icon(CupertinoIcons.eye_fill);
                              } else {
                                isShow = true;
                                icon = Icon(CupertinoIcons.eye_slash_fill);
                              }
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  TextButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => MessengerScreen()),
                              (route) => false);
                        }
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30)),
                          width: double.infinity,
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'login',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )))
                ],
              ),
            ),
          ),
        ));
  }
}
