import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:turbo_care_1/constants/constants.dart';
import 'package:turbo_care_1/screens/make_selection.dart';
import 'package:turbo_care_1/utils/utils.dart';
import 'package:turbo_care_1/vehicle_data_controller.dart/controller.dart';

class ClassSelection extends GetView<VechileController> {
  const ClassSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Class")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  AppListTile(
                    title: "Car",
                    onTap: () {
                      Get.to(() => const MakeSelection(
                          vehicleType: VehicleClassType.car));
                    },
                  ),
                  AppListTile(
                    title: "Bike",
                    onTap: () {
                      Get.to(() => const MakeSelection(
                          vehicleType: VehicleClassType.bike));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
