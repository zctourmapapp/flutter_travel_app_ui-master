import 'dart:async';

import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_travel_app_ui/models/user_model.dart';

class Authentication extends GetxController{
  
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController profile = TextEditingController();


  String userCollection = 'User';
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Rxn<UserModel> user = Rxn<UserModel>().obs();

  //Stream location of user
  Stream<LocationData> myLocation = Location().onLocationChanged;
  Rxn<LatLng?> myCurrentLocation = Rxn<LatLng>(null).obs(); 

  RxString exception = ''.obs;

  
  RxString authSuccess = ''.obs;

  RxString authException = ''.obs;

  RxBool obscureStatus = true.obs;
  RxBool obscureStatus2 = true.obs;

  RxBool newAccount = false.obs;
  
  final String weekPasswordException = 'The password provided is too weak.';
  final String emailExistException = 'Email already exist';
  final String invalidEmailException = "Email is invalid";

  @override
  void onInit() {
    myLocation.listen((event) { 
      myCurrentLocation.value = LatLng(event.latitude!, event.longitude!);
    });

    super.onInit();
  }
  


  Future<LatLng?> currentLocation() async {
    try {
      LocationData locationData = await Location().getLocation();

      return LatLng(locationData.latitude!, locationData.longitude!);
    } catch (e) {
      exception.value = ' currentLocation module';
    }
    return null;
  }


   Future<bool> sendEmailRecoveryLink() async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email.text);
      authSuccess.value = 'Recovery lint sent.';
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code.contains('auth/invalid-email')) {
        authException.value = 'Invalid email.';
      } else if (e.code.contains('auth/user-not-found')) {
        authException.value = 'User not found.';
      }

      authException.refresh();
    } catch (e) {
      authException.value = e.toString();
    }
    return false;
  }

  /// [currentUser] is safe from null Error Exception
  void changePassword() =>
      firebaseAuth.currentUser!.updatePassword(password.text);

  /// [verifyMatchPassword] on password and confirm password match will return true
  bool verifyMatchPassword() => password.text == confirmPassword.text;

  bool verifyIfEmptyControllers(bool isLogin) {
    if (isLogin) {
      bool emailCheck = email.text != '';
      bool passwordCheck = email.text != '';

      return emailCheck && passwordCheck;
    }

    bool emailCheck = email.text != '';
    bool passwordCheck = email.text != '';
    bool cpasswordCheck = email.text != '';

    return emailCheck && passwordCheck && cpasswordCheck;
  }

  bool verifyEmptyUserInformation() {
    bool fname = firstname.text != '';
    bool lname = lastname.text != '';
    bool addr = address.text != '';

    return fname && lname && addr;
  }

  //// Handle call for request Signin method
  void siginIn() => requestSignIn();

  //// Handle call for request Signup method
  void signup() => requestSignUp();

  //// Handle call for sign out method
  void signOut() => requestSignout();

  //// Handle call for Registration of user account
  void registerInformation() => requestPostUser();

  //// [verifyIfEmptyControllers]
  /// validating for empty [TextEditingController] any false state will return false response
  /// toggle response on true result return or stop process
  void requestSignIn() async {
    try {
      if (!verifyIfEmptyControllers(true)) {
        return;
      }

      await firebaseAuth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code.contains('user-not-found')) {
        authException.value = 'No user found for that email.';
      } else if (e.code.contains('wrong-password')) {
        authException.value = 'Wrong password.';
      } else if (e.code.contains('too-many-requests')) {
        authException.value = 'Your account has temporary blocked';
      }

      authException.refresh();
    }
  }

  void requestSignUp() async {
    try {
      if (!verifyIfEmptyControllers(false)) {
        return;
      }

      newAccount.value = true;
      UserCredential res = await firebaseAuth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      if (res.user != null) {
        // Get.toNamed(userRoute);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        authException.value = invalidEmailException;
      } else if (e.code == 'weak-password') {
        authException.value = weekPasswordException;
      } else if (e.code == 'email-already-in-use') {
        authException.value = emailExistException;
      }
      authException.refresh();
      newAccount.value = false;
    }
  }

  void requestSignout() {
    try {
      firebaseAuth.signOut();
    } catch (e) {
      exception.value = e.toString();
    }
  }

  void requestGetUser() async {
    try {
      DocumentSnapshot document = await firebaseFirestore
          .collection(userCollection)
          .doc(firebaseAuth.currentUser!.uid)
          .get();

      if (document.exists == false) {
        exception.value = 'User information doesn`t exist';
        // Get.toNamed(userRoute);
        throw Exception('Null document');
      }

      user.value = UserModel.fromJson(
          document.data() as Map<String, dynamic>, document.id);

      Timer(const Duration(milliseconds: 300), () => Get.toNamed('/home'));
    } catch (err) {
      if (err == Exception('Null document')) {
        exception.value = 'User information doesn`t exist';
        // Get.toNamed(userRoute);
      }
      if (err == 'permission-denied') {
        exception.value = 'UnAuthorized';
      }
      exception.value = err.toString();
    }
  }

  void requestPostUser() async {
    try {
      if (!verifyEmptyUserInformation()) {
        return;
      }

      firebaseFirestore
          .collection(userCollection)
          .doc(firebaseAuth.currentUser!.uid)
          .set({
        'user_first_name': firstname.text,
        'user_last_name': lastname.text,
        'user_address': address.text,
        'user_profile': 'NONE',
      }).then((value) => requestGetUser());
    } catch (e) {
      exception.value = e.toString();
    }
  }

  //// On success response call [requestGetUser] to update fetch update user information
  void requestPutUser() async {
    try {
      firebaseFirestore
          .collection(userCollection)
          .doc(firebaseAuth.currentUser!.uid)
          .update({
        'user_first_name': firstname.text,
        'user_last_name': lastname.text,
        'user_address': address.text,
        'user_profile': profile.text,
      }).then((_) => requestGetUser());
    } catch (e) {
      exception.value = e.toString();
    }
  }
}