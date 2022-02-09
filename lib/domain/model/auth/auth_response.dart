// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

class AuthResponse {
  String? status;
  // String? token;

  AuthResponse({this.status});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}
