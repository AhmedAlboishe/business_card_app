import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Row(
            children: [
              const Text(
                'Edit my Information',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: homeController.clearAllTextField,
                icon: const Icon(
                  Icons.delete_outline_rounded,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Form(
            key: homeController.formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  label: 'Name',
                  controller: homeController.nameCtrl,
                ),
                const Gap(15),
                CustomTextFormField(
                  label: 'Descriptoin',
                  controller: homeController.descriptoinCtrl,
                ),
                const Gap(15),
                CustomTextFormField(
                  label: 'Phone Number',
                  controller: homeController.phoneNumberCtrl,
                  isNumber: true,
                ),
                const Gap(15),
                CustomTextFormField(
                  label: 'Email',
                  controller: homeController.emailCtrl,
                ),
                CustomButton(
                  text: 'Upload Image',
                  onTap: homeController.pickImageFromGallery,
                  usePrimaryClr: false,
                ),
                const Spacer(),
                CustomButton(
                  text: 'Save',
                  onTap: homeController.saveNewData,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
