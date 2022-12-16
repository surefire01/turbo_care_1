class VehicleModel {
  VehicleModel({
    required this.vehicleNumber,
    required this.make,
    required this.model,
    required this.fuelType,
    required this.transmission,
  });

  String vehicleNumber = "";
  String make = "";
  String model = "";
  String fuelType = "";
  String transmission = "";

  VehicleModel.fromJson(Map map) {
    vehicleNumber = map["vehicleNumber"];
    make = map["make"];
    model = map["model"];
    fuelType = map["fuelType"];
    transmission = map["transmission"];
  }

  Map<String, String> toJson() {
    return {
      "vehicleNumber": vehicleNumber,
      "make": make,
      "model": model,
      "fuelType": fuelType,
      "transmission": transmission
    };
  }
}
