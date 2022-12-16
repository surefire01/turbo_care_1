import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbo_care_1/screens/class_selection.dart';
import 'package:turbo_care_1/vehicle_data_controller.dart/controller.dart';

class VehicleInputNumber extends GetView<VechileController> {
  const VehicleInputNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create new vehicle profile")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "VEHICLE NUMBER",
              style: TextStyle(fontSize: 13),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 38,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 252, 252, 252),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.grey[400]!)),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.2, color: Colors.grey[100]!))),
                onChanged: ((value) {
                  controller.vehicleNumber = value;
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
        child: FloatingActionButton(
          child: const Icon(Icons.arrow_forward_ios),
          onPressed: () {
            if (controller.vehicleNumber.isNotEmpty) {
              Get.to(() => const ClassSelection());
            }
          },
        ),
      ),
    );
  }
}
