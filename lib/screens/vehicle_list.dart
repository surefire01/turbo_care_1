import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbo_care_1/screens/vehicle_number_input.dart';
import 'package:turbo_care_1/screens/vehicle_profile.dart';
import 'package:turbo_care_1/vehicle_data_controller.dart/controller.dart';

class VehicleList extends GetView<VechileController> {
  VehicleList({super.key});

  final VechileController vechileController = Get.put(VechileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vehicles")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: GetX(
                  init: controller,
                  builder: (controller) {
                    return ListView.builder(
                      itemCount: controller.vehicleList.value.length,
                      itemBuilder: ((context, index) {
                        return Card(
                          margin: EdgeInsets.zero,
                          elevation: 0,
                          color: Colors.white.withOpacity(0),
                          shape: Border(
                              bottom: BorderSide(
                                  width: 0.3, color: Colors.grey[400]!)),
                          child: ListTile(
                            onTap: () {
                              Get.to(() => VehicleProfile(
                                  vehicleModel:
                                      controller.vehicleList.value[index]));
                            },
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              controller.vehicleList.value[index].vehicleNumber,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "${controller.vehicleList.value[index].make} ${controller.vehicleList.value[index].model}",
                              style: const TextStyle(color: Colors.black),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                            ),
                          ),
                        );
                      }),
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
        child: FloatingActionButton(
          onPressed: () {
            Get.to(() => const VehicleInputNumber());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
