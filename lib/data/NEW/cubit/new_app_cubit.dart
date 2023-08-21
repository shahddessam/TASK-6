// ignore_for_file: empty_catches

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listview/data/USERDATA.dart';
import 'package:listview/data/product.dart';
part 'new_app_state.dart';

class NewAppCubit extends Cubit<NewAppState> {
  NewAppCubit() : super(NewAppInitial());

  List<Product> products = [];
  UserDataModel? userData;

  Future<void> getDataFromFirebase() async {
    try {
      emit(GetDatLoadingState());
      String? uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userA =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      userData = UserDataModel(
          name: userA['name'],
          password: userA['password'],
          phone: userA['phone'],
          email: userA['email'],
          uid: userA['uid'],
          img: userA['image']);
      emit(GetDatDoneState());
    } catch (e) {
      // ignore: avoid_print
      print(e);
      emit(GetDatErrorState(e.toString()));
    }
  }

  Future<void> login(
    String email,
    String password,
  ) async {
    try {
      emit(LoginLoadingState());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        if (value.user != null) {
          emit(LoginDoneState());
        }
      });
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }

  Future<void> signup({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    try {
      emit(CreateAccLoadingState());
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        if (value.user != null) {
          saveUserData(
            email: email,
            password: password,
            name: name,
            phone: phone,
            uid: value.user!.uid, 
            img: '',
           
          ).then((value) {
            if (value) {
              emit(CreateAccDoneState());
            } else {
              emit(CreateAccErrorState(' SaveUserData Error '));
            }
          });
        }
      });
    } catch (e) {
      emit(CreateAccErrorState(e.toString()));
    }
  }

  Future<bool> saveUserData({
    required String email,
    required String password,
    required String phone,
    required String name,
    required String uid,
   required String img,
  }) async {
    try {
      FirebaseFirestore.instance.collection('users').doc(uid).set({
        'email': email,
        'password': password,
        'phone': phone,
        'name': name,
        'uid': uid,
        'image':img,
      }, SetOptions(merge: true));
      return true;
    } catch (error) {
      return false;
    }
  }

  ImagePicker picker = ImagePicker();
  File? img;

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      img = File(image.path);
      uploadImageToUserData(File(image.path));
      emit(PickImageState());
    } else {
      // ignore: avoid_print
      print('null image');
    }
  }

  Future<void> uploadImageToUserData(File image) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      final ref = FirebaseStorage.instance
          .ref()
          .child('usersImages')
          .child('${DateTime.now()}.jpg');

      await ref.putFile(File(image.path));

      String? url;

      url = await ref.getDownloadURL();

      await FirebaseFirestore.instance.collection('users').doc(uid).update(
        {
          'image': url,
        },
      );
    } catch (e) {}
  }

  double sum = 0;

  void getSum(
    double input1,
    double input2,
  ) {
    sum = input1 + input2;
    emit(GetSum());
  }
}
