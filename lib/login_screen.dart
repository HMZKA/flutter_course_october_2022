import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coursee/cubit.dart';
import 'package:flutter_coursee/states.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var formkey = GlobalKey<FormState>();
          var emailcontroller = TextEditingController();
          var passwordcontroller = TextEditingController();
          return Scaffold(
              appBar: AppBar(
                title: Text('Login'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 75,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'this is required';
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
                          controller: passwordcontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'this is required';
                            }
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              prefixIcon: Icon(CupertinoIcons.lock_fill),
                              label: Text('Password'),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () {},
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
                                AppCubit().get(context).login(
                                    emailcontroller.text,
                                    passwordcontroller.text);
                              }
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30)),
                                width: double.infinity,
                                padding: EdgeInsets.all(15),
                                child: state is! AppLoginLoadingState
                                    ? Text(
                                        'login',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      )
                                    : Center(
                                        child: CircularProgressIndicator()))),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}
