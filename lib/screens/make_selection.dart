import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbo_care_1/screens/model_selection.dart';
import 'package:turbo_care_1/services/api_service.dart';
import 'package:turbo_care_1/utils/utils.dart';
import 'package:turbo_care_1/vehicle_data_controller.dart/controller.dart';

class MakeSelection extends GetView<VechileController> {
  const MakeSelection({super.key, required this.vehicleType});

  final String vehicleType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Make")),
      body: FutureBuilder(
          future: ApiService.fetchMakeList(vehicleType),
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
                              controller.make = snapshot.data![index];
                              Get.to(() => ModelSelection(
                                  vehicleType: vehicleType,
                                  make: snapshot.data![index]));
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
