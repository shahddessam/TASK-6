
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listview/PAGES/LOGIN.dart';

import '../data/NEW/cubit/new_app_cubit.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center ,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                            color: Colors.black,
                            onPressed: () async {
                              await signOut().then((value) {
                                if (value) {
                                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return  LoginScreen();
                                  })
                                  );
                                }
                              });
                            },
                            icon: const Icon(Icons.logout),
                          ),
                  ),
          BlocBuilder<NewAppCubit, NewAppState>(
            builder: (context, state) {
              if (context.read<NewAppCubit>().userData != null) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 80,
                            backgroundImage: context
                                        .read<NewAppCubit>()
                                        .userData!
                                        .img ==
                                    ''
                                ? const NetworkImage(
                                    'https://cdn2.vectorstock.com/i/1000x1000/54/41/young-and-elegant-woman-avatar-profile-vector-9685441.jpg')
                                : NetworkImage(
                                    context.read<NewAppCubit>().userData!.img),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(90)),
                              child: IconButton(
                                onPressed: () {
                                  context.read<NewAppCubit>().pickImage();
                                },
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        style: ListTileStyle.list,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Colors.black)),
                        title: Text(
                          context.read<NewAppCubit>().userData!.email,
                          textAlign: TextAlign.center,
                        ),
                        leading: const Icon(Icons.email),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        style: ListTileStyle.list,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Colors.black)),
                        title: Text(
                          context.read<NewAppCubit>().userData!.name,
                          textAlign: TextAlign.center,
                        ),
                        leading: const Icon(Icons.person),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        style: ListTileStyle.list,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Colors.black)),
                        title: Text(
                          context.read<NewAppCubit>().userData!.phone,
                          textAlign: TextAlign.center,
                          style:
                              const TextStyle(fontFamily: 'Urbanist', fontSize: 20),
                        ),
                        leading: const Icon(Icons.phone),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        style: ListTileStyle.list,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Colors.black)),
                        title: Text(
                          context.read<NewAppCubit>().userData!.password,
                          textAlign: TextAlign.center,
                        ),
                        leading: const Icon(Icons.security),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ListTile(
                        style: ListTileStyle.list,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Colors.black)),
                        title: Text(
                          context.read<NewAppCubit>().userData!.uid,
                          textAlign: TextAlign.center,
                        ),
                        leading: const Icon(Icons.insert_drive_file),
                      ),
                    ],
                  ),
                );
              } else {
                return const Text('ERROR');
              }
            },
          ),
        ],
      ),
    );
  }
}