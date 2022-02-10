// ignore_for_file: file_names, prefer_collection_literals, unnecessary_new, unnecessary_this

class AccountActivitiesRequest {
  String? accessToken;
  String? traceNo;
  String? accessId;
  String? accountNo;
  String? tanggalAwal;
  String? tanggalAkhir;
  int? sequenceNo;

  AccountActivitiesRequest(
      {this.accessToken,
      this.traceNo,
      this.accessId,
      this.accountNo,
      this.tanggalAwal,
      this.tanggalAkhir,
      this.sequenceNo});

  AccountActivitiesRequest.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    traceNo = json['trace_no'];
    accessId = json['access_id'];
    accountNo = json['account_no'];
    tanggalAwal = json['tanggal_awal'];
    tanggalAkhir = json['tanggal_akhir'];
    sequenceNo = json['sequence_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['trace_no'] = this.traceNo;
    data['access_id'] = this.accessId;
    data['account_no'] = this.accountNo;
    data['tanggal_awal'] = this.tanggalAwal;
    data['tanggal_akhir'] = this.tanggalAkhir;
    data['sequence_no'] = this.sequenceNo;
    return data;
  }
}
