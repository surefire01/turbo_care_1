import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbo_care_1/screens/fuel_type_selection.dart';
import 'package:turbo_care_1/services/api_service.dart';
import 'package:turbo_care_1/utils/utils.dart';
import 'package:turbo_care_1/vehicle_data_controller.dart/controller.dart';

class ModelSelection extends GetView<VechileController> {
  const ModelSelection(
      {super.key, required this.vehicleType, required this.make});

  final String vehicleType;
  final String make;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Model")),
      body: FutureBuilder(
          future: ApiService.fetchModelList(make, vehicleType),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const LinearProgressIndicator();
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) {
                        return AppListTile(
                            title: snapshot.data![index],
                            onTap: () {
                              controller.model = snapshot.data![index];
                              Get.to(() => FuelTypeSelection());
                            });
                      }),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
