import 'package:flutter/material.dart';
import 'package:turbo_care_1/models/vehicle_model.dart';

class VehicleProfile extends StatelessWidget {
  const VehicleProfile({super.key, required this.vehicleModel});

  final VehicleModel vehicleModel;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          height: size.height * 0.35,
          width: double.infinity,
          color: Colors.deepPurple,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${vehicleModel.model} ${vehicleModel.fuelType}"
                      .toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 5),
                Text(
                  vehicleModel.vehicleNumber,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
              ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpecBlock(spec: "Make", value: vehicleModel.make),
                SpecBlock(spec: "Model", value: vehicleModel.model)
              ],
            ),
            //const SizedBox(height: ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpecBlock(spec: "Fuel Type", value: vehicleModel.fuelType),
                SpecBlock(
                    spec: "Transmission", value: vehicleModel.transmission)
              ],
            ),
          ],
        )
      ]),
    );
  }
}

class SpecBlock extends StatelessWidget {
  const SpecBlock({super.key, required this.spec, required this.value});

  final String spec;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              spec.toUpperCase(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 5),
            Text(
              value.toUpperCase(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
