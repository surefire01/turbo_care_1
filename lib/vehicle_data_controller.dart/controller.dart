import 'package:get/state_manager.dart';
import 'package:turbo_care_1/models/vehicle_model.dart';
import 'package:turbo_care_1/services/save_data_to_json.dart';

//to save the current in progress vehicle model
class VechileController extends GetxController {
  String vehicleNumber = "";
  String make = "";
  String model = "";
  String fuelType = "";
  String transmission = "";

  Rx<List<VehicleModel>> vehicleList = Rx([]);

  // locally store the vehicle
  void addVehicle() async {
    VehicleModel vehicleModel = VehicleModel(
      fuelType: fuelType,
      vehicleNumber: vehicleNumber.toUpperCase(),
      make: make,
      model: model,
      transmission: transmission,
    );

    vehicleList.value.add(vehicleModel);
    await SaveDataToJson.saveVehicleData(vehicleList.value);
  }

  void fetchVehileList() async {
    vehicleList.value = await SaveDataToJson.readVehicleData();
  }

  @override
  void onInit() {
    fetchVehileList();
    super.onInit();
  }
}
