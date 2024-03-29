// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this
class AuthResponse {
  Info? info;
  String? status;

  AuthResponse({this.info, this.status});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Info {
  String? accountName;
  List<String>? accountList;

  Info({this.accountName, this.accountList});

  Info.fromJson(Map<String, dynamic> json) {
    accountName = json['account_name'];
    accountList = json['account_list'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_name'] = this.accountName;
    data['account_list'] = this.accountList;
    return data;
  }
}
