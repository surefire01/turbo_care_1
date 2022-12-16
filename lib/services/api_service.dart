import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/constants.dart';

class ApiService {
  // to get make list from the api
  static Future<List<String>> fetchMakeList(String vehicleType) async {
    try {
      var url = Uri.parse("${ApiConstants.baseUrl}makes?class=$vehicleType");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List lis = jsonDecode(response.body);

        return lis.map((e) => e.toString()).toList();
      }
    } catch (e) {
      return [""];
    }

    return [""];
  }

  // to get model list from the api
  static Future<List<String>> fetchModelList(
      String make, String vehicleType) async {
    try {
      var url = Uri.parse(
          "${ApiConstants.baseUrl}models?class=$vehicleType&make=${make.toLowerCase()}");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List lis = jsonDecode(response.body);

        return lis.map((e) => e.toString()).toList();
      }
    } catch (e) {
      return [""];
    }

    return [];
  }
}
