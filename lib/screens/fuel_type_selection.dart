import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbo_care_1/screens/trasmission_selection.dart';
import 'package:turbo_care_1/utils/utils.dart';
import 'package:turbo_care_1/vehicle_data_controller.dart/controller.dart';

class FuelTypeSelection extends GetView<VechileController> {
  FuelTypeSelection({super.key});

  final List<String> fuelList = [
    "Petrol",
    "Diesel",
    "CNG",
    "Petrol+CNG",
    "Electric",
    "Hybrid"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Select Fuel Type")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: fuelList.length,
                  itemBuilder: ((context, index) {
                    return AppListTile(
                        title: fuelList[index],
                        onTap: () {
                          controller.fuelType = fuelList[index];
                          Get.to(() => TransmissionTypeSelection());
                        });
                  }),
                ),
              )
            ],
          ),
        ));
  }
}
