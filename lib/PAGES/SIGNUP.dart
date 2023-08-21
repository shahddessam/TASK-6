// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:listview/WIDGET/homelayout.dart';
import 'package:listview/data/NEW/cubit/new_app_cubit.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signup();
}

class _signup extends State<signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Welcome back! Glad\n to see you, Again!',
              style: TextStyle(
                fontSize: 30,
                fontWeight:FontWeight.bold


              ),
              ),
              SizedBox(
                height: 50,
              ),
              
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFFDADADA))),
                ),
                controller: email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'email must be not empty';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Your Name',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFFDADADA))),
                ),
                controller: name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'name must be not empty';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Your Phone',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFFDADADA))),
                ),
                controller: phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'phone must be not empty';
                  } else if (value.length < 11) {
                    return 'phone must be 11 number';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Your Password',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xFFDADADA))),
                ),
                controller: password,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'password must be not empty';
                  } else if (value.length < 6) {
                    return 'password must be 6 numbers';
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: BlocConsumer<NewAppCubit, NewAppState>(
                  listener: (context, state) {
                    if (state is CreateAccErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            state.error,
                          ),
                        ),
                      );
                    } else if (state is CreateAccDoneState) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const HomeLayout();
                          },
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await context.read<NewAppCubit>().signup(
                                email: email.text,
                                password: password.text,
                                phone: phone.text,
                                name: name.text,
                              );
                        }
                      },
                      child: State is CreateAccLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text('Sign up'),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    'Or Login with',
                    style: TextStyle(fontSize: 15),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      indent: 10,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/facebook.svg'),
                  SvgPicture.asset('assets/google.svg'),
                  SvgPicture.asset('assets/apple.svg'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
