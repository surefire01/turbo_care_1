import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbo_care_1/screens/vehicle_list.dart';
import 'package:turbo_care_1/utils/utils.dart';
import 'package:turbo_care_1/vehicle_data_controller.dart/controller.dart';

class TransmissionTypeSelection extends GetView<VechileController> {
  TransmissionTypeSelection({super.key});

  final List<String> transmissionList = [
    "Manual",
    "Automatic",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Select Transmission")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: transmissionList.length,
                  itemBuilder: ((context, index) {
                    return AppListTile(
                        title: transmissionList[index],
                        onTap: () {
                          controller.transmission = transmissionList[index];
                          controller.addVehicle();
                          Get.to(() => VehicleList());
                        });
                  }),
                ),
              )
            ],
          ),
        ));
  }
}
