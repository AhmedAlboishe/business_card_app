import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../core/theme/theme.dart';
import '../controllers/home_controller.dart';

class QrCodeWidget extends StatelessWidget {
  const QrCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: containerPClr,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Scan my Qr code ✨',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          GetBuilder<HomeController>(
            builder: (homeController) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: QrImageView(
                data:
                    'Name: ${homeController.userModel!.name}\nDescription: ${homeController.userModel!.descriptoin}\nPhone Number: ${homeController.userModel!.phoneNumber}\nEmail: ${homeController.userModel!.email}',
                size: 100,
                backgroundColor: dialogClr,
                dataModuleStyle: const QrDataModuleStyle(
                  color: primaryClr,
                  dataModuleShape: QrDataModuleShape.circle,
                ),
                eyeStyle: const QrEyeStyle(
                  color: primaryClr,
                  eyeShape: QrEyeShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
