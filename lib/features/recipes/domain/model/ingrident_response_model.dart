// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
    part 'ingrident_response_model.g.dart';
@JsonSerializable(explicitToJson: true)
class GetIngridentResponseModel {
  String? title;
  @JsonKey(name: "use-by")
  String? useBy;

  GetIngridentResponseModel({this.title, this.useBy});

  factory GetIngridentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetIngridentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetIngridentResponseModelToJson(this);

  @override
  bool operator ==(covariant GetIngridentResponseModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.useBy == useBy;
  }

  @override
  int get hashCode => title.hashCode ^ useBy.hashCode;

  @override
  String toString() =>
      'GetIngridentResponseModel(title: $title, useBy: $useBy)';
}
