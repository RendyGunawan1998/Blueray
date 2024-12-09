import '../core.dart';

DistrictModel districtModelFromJson(String str) =>
    DistrictModel.fromJson(json.decode(str));

String districtModelToJson(DistrictModel data) => json.encode(data.toJson());

class DistrictModel {
  int districtId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String districtName;
  int province;

  DistrictModel({
    required this.districtId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.districtName,
    required this.province,
  });

  DistrictModel copyWith({
    int? districtId,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? districtName,
    int? province,
  }) =>
      DistrictModel(
        districtId: districtId ?? this.districtId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        districtName: districtName ?? this.districtName,
        province: province ?? this.province,
      );

  factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
        districtId: json["district_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        districtName: json["district_name"],
        province: json["province"],
      );

  Map<String, dynamic> toJson() => {
        "district_id": districtId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "district_name": districtName,
        "province": province,
      };
}
