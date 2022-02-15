// ignore_for_file: file_names, prefer_collection_literals, unnecessary_new, unnecessary_this
class AccountActivitiesResponse {
  String? status;
  Info? info;

  AccountActivitiesResponse({this.status, this.info});

  AccountActivitiesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    return data;
  }
}

class Info {
  int? statusCode;
  List<Mutasi>? mutasi;
  bool? eof;
  int? sequenceNo;

  Info({this.statusCode, this.mutasi, this.eof, this.sequenceNo});

  Info.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['mutasi'] != null) {
      mutasi = <Mutasi>[];
      json['mutasi'].forEach((v) {
        mutasi!.add(new Mutasi.fromJson(v));
      });
    }
    eof = json['eof'];
    sequenceNo = json['sequence_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    if (this.mutasi != null) {
      data['mutasi'] = this.mutasi!.map((v) => v.toJson()).toList();
    }
    data['eof'] = this.eof;
    data['sequence_no'] = this.sequenceNo;
    return data;
  }
}

class Mutasi {
  String? keterangan1;
  String? keterangan2;
  String? nilaiTransaksi;
  String? userInput;
  String? jamInput;
  String? tanggalValuta;
  String? noReferensi;
  String? mataUang;
  String? signTransaksi;
  String? tanggalPosting;

  Mutasi(
      {this.keterangan1,
      this.keterangan2,
      this.nilaiTransaksi,
      this.userInput,
      this.jamInput,
      this.tanggalValuta,
      this.noReferensi,
      this.mataUang,
      this.signTransaksi,
      this.tanggalPosting});

  Mutasi.fromJson(Map<String, dynamic> json) {
    keterangan1 = json['keterangan_1'];
    keterangan2 = json['keterangan_2'];
    nilaiTransaksi = json['nilai_transaksi'];
    userInput = json['user_input'];
    jamInput = json['jam_input'];
    tanggalValuta = json['tanggal_valuta'];
    noReferensi = json['no_referensi'];
    mataUang = json['mata_uang'];
    signTransaksi = json['sign_transaksi'];
    tanggalPosting = json['tanggal_posting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['keterangan_1'] = this.keterangan1;
    data['keterangan_2'] = this.keterangan2;
    data['nilai_transaksi'] = this.nilaiTransaksi;
    data['user_input'] = this.userInput;
    data['jam_input'] = this.jamInput;
    data['tanggal_valuta'] = this.tanggalValuta;
    data['no_referensi'] = this.noReferensi;
    data['mata_uang'] = this.mataUang;
    data['sign_transaksi'] = this.signTransaksi;
    data['tanggal_posting'] = this.tanggalPosting;
    return data;
  }
}
