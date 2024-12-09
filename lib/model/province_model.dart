import '../core.dart';

ProvinceModel provinceModelFromJson(String str) =>
    ProvinceModel.fromJson(json.decode(str));

String provinceModelToJson(ProvinceModel data) => json.encode(data.toJson());

class ProvinceModel {
  String address;
  String province;
  String district;
  String subDistrict;
  String subDistrictCode;
  int provinceId;
  int districtId;
  int subDistrictId;

  ProvinceModel({
    required this.address,
    required this.province,
    required this.district,
    required this.subDistrict,
    required this.subDistrictCode,
    required this.provinceId,
    required this.districtId,
    required this.subDistrictId,
  });

  ProvinceModel copyWith({
    String? address,
    String? province,
    String? district,
    String? subDistrict,
    String? subDistrictCode,
    int? provinceId,
    int? districtId,
    int? subDistrictId,
  }) =>
      ProvinceModel(
        address: address ?? this.address,
        province: province ?? this.province,
        district: district ?? this.district,
        subDistrict: subDistrict ?? this.subDistrict,
        subDistrictCode: subDistrictCode ?? this.subDistrictCode,
        provinceId: provinceId ?? this.provinceId,
        districtId: districtId ?? this.districtId,
        subDistrictId: subDistrictId ?? this.subDistrictId,
      );

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
        address: json["address"],
        province: json["province"],
        district: json["district"],
        subDistrict: json["sub_district"],
        subDistrictCode: json["sub_district_code"],
        provinceId: json["province_id"],
        districtId: json["district_id"],
        subDistrictId: json["sub_district_id"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "province": province,
        "district": district,
        "sub_district": subDistrict,
        "sub_district_code": subDistrictCode,
        "province_id": provinceId,
        "district_id": districtId,
        "sub_district_id": subDistrictId,
      };
}
