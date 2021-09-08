// User model
import '../utils/utils.dart';

class Farmer {
  String? firstName;
  String? lastName;
  String? folioId;
  String? picture;
  String? cooperativeId;

  Farmer();

  factory Farmer.fromJson(Map<String, dynamic> json) => _farmerFromJson(json);
}

Farmer _farmerFromJson(Map<String, dynamic> json) {
  Farmer farmer = Farmer();

  farmer.picture = json[KEY_PICTURE];
  farmer.firstName = json[KEY_FIRST_NAME];
  farmer.lastName = json[KEY_LAST_NAME];
  farmer.cooperativeId = json[KEY_COOPERATIVE];
  farmer.folioId = json[KEY_FOLIO_ID];

  return farmer;
}
