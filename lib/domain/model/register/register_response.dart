// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

class RegisterResponse {
  String? status;

  RegisterResponse({this.status});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}
