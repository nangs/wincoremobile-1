class PassRequest {
  String? username;
  String? oldpass;
  String? newpass;

  PassRequest({
    this.username,
    this.oldpass,
    this.newpass,
  });

  PassRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    oldpass = json['oldpass'];
    newpass = json['newpass'];
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_new
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = username;
    data['oldpass'] = oldpass;
    data['newpass'] = newpass;
    return data;
  }
}
