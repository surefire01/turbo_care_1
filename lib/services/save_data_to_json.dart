import 'dart:convert';
import 'dart:io';
import '../models/vehicle_model.dart';

import 'package:path_provider/path_provider.dart';

class SaveDataToJson {
  static Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;

    return File('$path/vehicle_list.json');
  }

  static Future<List<VehicleModel>> readVehicleData() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();
      List jsonResponse;
      if (contents.isNotEmpty) {
        jsonResponse = jsonDecode(contents);
        return jsonResponse.map((e) => VehicleModel.fromJson(e)).toList();
      }
    } catch (e) {
      // If encountering an error, return 0
    }

    return [];
  }

  static Future<void> saveVehicleData(List<VehicleModel> vehicles) async {
    final file = await _localFile;
    vehicles
        .map(
          (vehicle) => vehicle.toJson(),
        )
        .toList();

    file.writeAsStringSync(json.encode(vehicles));
  }
}
