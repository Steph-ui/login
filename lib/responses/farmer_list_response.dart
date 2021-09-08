import '../models/models.dart';
import '../utils/utils.dart';
class FarmerListResponse {

  FarmerList? farmers;
  String? message;
  String? responseCode;
  int? count;
  String? next;
  String? previous;
  int? statusCode;

  FarmerListResponse();

  bool isRequestSuccessful() => responseCode == "100";

  factory FarmerListResponse.fromJson(Map<String, dynamic> json) => _farmerListResponseFromJson(json);
}

FarmerListResponse _farmerListResponseFromJson(Map<String, dynamic> json) {
  FarmerListResponse response = FarmerListResponse();
  response.next = json[KEY_NEXT];
  response.message = json[KEY_MESSAGE];
  response.responseCode = json[KEY_RESPONSE_CODE];
  response.count = json[KEY_COUNT];
  response.previous = json[KEY_PREVIOUS];
  response.farmers = FarmerList.fromJson(json);
  return response;
}
