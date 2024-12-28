import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../core/theme/theme.dart';
import '../controllers/home_controller.dart';
import '../widgets/custom_container.dart';
import '../widgets/qr_code_widget.dart';
import 'edit_screen.dart';
 
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () => Get.to(() => const EditScreen()),
            icon: const Icon(
              Icons.edit_rounded,
            ),
          ),
        ),
      ),
      body: GetBuilder(
        init: HomeController(),
        builder: (homeController) => Column(
          children: [
            const MaxGap(50),
            homeController.pickedFile != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Image.file(
                      File(
                        homeController.pickedFile!.path,
                      ),
                      fit: BoxFit.fill,
                      height: 100,
                      width: 100,
                    ),
                  )
                : CircleAvatar(
                    foregroundImage: AssetImage(
                      homeController.userModel!.image,
                    ),
                    radius: 50,
                  ),
            const Gap(10),
            Text(
              homeController.userModel!.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(5),
            Text(
              homeController.userModel!.descriptoin,
              textAlign: TextAlign.center,
            ),
            const Divider(
              indent: 100,
              endIndent: 100,
              color: iconClr,
            ),
            const Gap(10),
            CustomContainer(
              icon: Icons.phone,
              text: homeController.userModel!.phoneNumber,
            ),
            const Gap(10),
            CustomContainer(
              icon: Icons.mail,
              text: homeController.userModel!.email,
            ),
            const Gap(30),
            const QrCodeWidget(),
          ],
        ),
      ),
    );
  }
}
