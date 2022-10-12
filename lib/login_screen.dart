import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isShow = true;
  var icon = Icon(CupertinoIcons.eye_slash_fill);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
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
                  onPressed: () {},
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
        ));
  }
}
