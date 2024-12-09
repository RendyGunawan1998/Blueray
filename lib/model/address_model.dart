import '../core.dart';

List<AddressModel> addressModelFromJson(String str) => List<AddressModel>.from(
    json.decode(str).map((x) => AddressModel.fromJson(x)));

String addressModelToJson(List<AddressModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddressModel {
  int addressId;
  int provinceId;
  String provinceName;
  int districtId;
  String districtName;
  int subDistrictId;
  String subDistrictName;
  String cityCode;
  String npwpFile;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String service;
  String addressType;
  String addressLabel;
  String name;
  String countryName;
  String address;
  String postalCode;
  double long;
  double lat;
  String addressMap;
  String email;
  String phoneNumber;
  dynamic phoneNumber2;
  String npwp;
  bool isPrimary;
  dynamic note;
  int customer;
  int province;
  int district;
  int subDistrict;
  int country;

  AddressModel({
    required this.addressId,
    required this.provinceId,
    required this.provinceName,
    required this.districtId,
    required this.districtName,
    required this.subDistrictId,
    required this.subDistrictName,
    required this.cityCode,
    required this.npwpFile,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.service,
    required this.addressType,
    required this.addressLabel,
    required this.name,
    required this.countryName,
    required this.address,
    required this.postalCode,
    required this.long,
    required this.lat,
    required this.addressMap,
    required this.email,
    required this.phoneNumber,
    required this.phoneNumber2,
    required this.npwp,
    required this.isPrimary,
    required this.note,
    required this.customer,
    required this.province,
    required this.district,
    required this.subDistrict,
    required this.country,
  });

  AddressModel copyWith({
    int? addressId,
    int? provinceId,
    String? provinceName,
    int? districtId,
    String? districtName,
    int? subDistrictId,
    String? subDistrictName,
    String? cityCode,
    String? npwpFile,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? service,
    String? addressType,
    String? addressLabel,
    String? name,
    String? countryName,
    String? address,
    String? postalCode,
    double? long,
    double? lat,
    String? addressMap,
    String? email,
    String? phoneNumber,
    dynamic phoneNumber2,
    String? npwp,
    bool? isPrimary,
    dynamic note,
    int? customer,
    int? province,
    int? district,
    int? subDistrict,
    int? country,
  }) =>
      AddressModel(
        addressId: addressId ?? this.addressId,
        provinceId: provinceId ?? this.provinceId,
        provinceName: provinceName ?? this.provinceName,
        districtId: districtId ?? this.districtId,
        districtName: districtName ?? this.districtName,
        subDistrictId: subDistrictId ?? this.subDistrictId,
        subDistrictName: subDistrictName ?? this.subDistrictName,
        cityCode: cityCode ?? this.cityCode,
        npwpFile: npwpFile ?? this.npwpFile,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        service: service ?? this.service,
        addressType: addressType ?? this.addressType,
        addressLabel: addressLabel ?? this.addressLabel,
        name: name ?? this.name,
        countryName: countryName ?? this.countryName,
        address: address ?? this.address,
        postalCode: postalCode ?? this.postalCode,
        long: long ?? this.long,
        lat: lat ?? this.lat,
        addressMap: addressMap ?? this.addressMap,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        phoneNumber2: phoneNumber2 ?? this.phoneNumber2,
        npwp: npwp ?? this.npwp,
        isPrimary: isPrimary ?? this.isPrimary,
        note: note ?? this.note,
        customer: customer ?? this.customer,
        province: province ?? this.province,
        district: district ?? this.district,
        subDistrict: subDistrict ?? this.subDistrict,
        country: country ?? this.country,
      );

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        addressId: json["address_id"],
        provinceId: json["province_id"],
        provinceName: json["province_name"],
        districtId: json["district_id"],
        districtName: json["district_name"],
        subDistrictId: json["sub_district_id"],
        subDistrictName: json["sub_district_name"],
        cityCode: json["city_code"],
        npwpFile: json["npwp_file"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        service: json["service"],
        addressType: json["address_type"],
        addressLabel: json["address_label"],
        name: json["name"],
        countryName: json["country_name"],
        address: json["address"],
        postalCode: json["postal_code"],
        long: json["long"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
        addressMap: json["address_map"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        phoneNumber2: json["phone_number_2"],
        npwp: json["npwp"],
        isPrimary: json["is_primary"],
        note: json["note"],
        customer: json["customer"],
        province: json["province"],
        district: json["district"],
        subDistrict: json["sub_district"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "address_id": addressId,
        "province_id": provinceId,
        "province_name": provinceName,
        "district_id": districtId,
        "district_name": districtName,
        "sub_district_id": subDistrictId,
        "sub_district_name": subDistrictName,
        "city_code": cityCode,
        "npwp_file": npwpFile,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "service": service,
        "address_type": addressType,
        "address_label": addressLabel,
        "name": name,
        "country_name": countryName,
        "address": address,
        "postal_code": postalCode,
        "long": long,
        "lat": lat,
        "address_map": addressMap,
        "email": email,
        "phone_number": phoneNumber,
        "phone_number_2": phoneNumber2,
        "npwp": npwp,
        "is_primary": isPrimary,
        "note": note,
        "customer": customer,
        "province": province,
        "district": district,
        "sub_district": subDistrict,
        "country": country,
      };
}
