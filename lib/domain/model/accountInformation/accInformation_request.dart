// ignore_for_file: file_names, prefer_collection_literals, unnecessary_new, unnecessary_this

class AccountInfoRequest {
  String? traceNo;
  String? accountNo;

  AccountInfoRequest({this.traceNo, this.accountNo});

  AccountInfoRequest.fromJson(Map<String, dynamic> json) {
    traceNo = json['trace_no'];
    accountNo = json['account_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trace_no'] = this.traceNo;
    data['account_no'] = this.accountNo;
    return data;
  }
}
