import 'models.dart';
import '../utils/utils.dart';

class FarmerList {
  List<Farmer> farmers = [];

  FarmerList();

  factory FarmerList.fromJson(Map<String, dynamic> json) => _farmerListFromJson(json);
}

List<Farmer> _extractFarmers(Map<String, dynamic> json) {
  List<Farmer> farmerList = [];
  if (json.containsKey(KEY_DATA)) {
    var jsonData = json[KEY_DATA] as List;
    var jsonList = jsonData.map((e) => Farmer.fromJson(e)).toList();
    farmerList = jsonList;
  }

  return farmerList;
}

FarmerList _farmerListFromJson(Map<String, dynamic> json) {
  FarmerList farmerList = FarmerList();
  List<Farmer> list = _extractFarmers(json);
  farmerList.farmers = list;
  return farmerList;
}


class windows {

  String? username;
  String? password;

  windows({this.username, this.password});
}