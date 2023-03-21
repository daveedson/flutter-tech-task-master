// ignore_for_file: public_member_api_docs, sort_constructors_first
class GetIngridentResponseModel {
  String? title;
  String? useBy;

  GetIngridentResponseModel({this.title, this.useBy});

  GetIngridentResponseModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    useBy = json['use-by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['use-by'] = this.useBy;
    return data;
  }

  @override
  bool operator ==(covariant GetIngridentResponseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.useBy == useBy;
  }

  @override
  int get hashCode => title.hashCode ^ useBy.hashCode;

  @override
  String toString() => 'GetIngridentResponseModel(title: $title, useBy: $useBy)';
}
