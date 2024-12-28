import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/models/user_model.dart';

class HomeController extends GetxController {
  UserModel? userModel;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController descriptoinCtrl = TextEditingController();
  final TextEditingController phoneNumberCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  XFile? pickedFile;

  @override
  void onInit() {
    initalData();
    super.onInit();
  }

  void initalData() {
    userModel = UserModel(
      image: 'assets/images/user.png',
      name: 'Ahmed Alboishe',
      descriptoin: 'Flutter Developer and UI/UX designer',
      phoneNumber: '+218 123456789',
      email: 'email@gmail.com',
    );
    nameCtrl.text = userModel!.name;
    descriptoinCtrl.text = userModel!.descriptoin;
    phoneNumberCtrl.text = userModel!.phoneNumber;
    emailCtrl.text = userModel!.email;
  }

  void saveNewData() {
    if (formKey.currentState!.validate()) {
      userModel = UserModel(
        image: 'assets/images/user.png',
        name: nameCtrl.text.trim(),
        descriptoin: descriptoinCtrl.text.trim(),
        phoneNumber: phoneNumberCtrl.text.trim(),
        email: emailCtrl.text.trim(),
      );
      update();
      Get.back();
    }
  }

  void clearAllTextField() {
    nameCtrl.text = '';
    descriptoinCtrl.text = '';
    phoneNumberCtrl.text = '';
    emailCtrl.text = '';
  }

  void pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
  }
}
