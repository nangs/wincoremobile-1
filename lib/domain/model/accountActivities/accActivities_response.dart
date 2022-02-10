// ignore_for_file: file_names, prefer_collection_literals, unnecessary_new, unnecessary_this

class AccountActivitiesResponse {
  int? sequenceNo;
  bool? eof;
  List<Mutasi>? mutasi;

  AccountActivitiesResponse({this.sequenceNo, this.eof, this.mutasi});

  AccountActivitiesResponse.fromJson(Map<String, dynamic> json) {
    sequenceNo = json['sequence_no'];
    eof = json['eof'];
    if (json['mutasi'] != null) {
      mutasi = <Mutasi>[];
      json['mutasi'].forEach((v) {
        mutasi!.add(new Mutasi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sequence_no'] = this.sequenceNo;
    data['eof'] = this.eof;
    if (this.mutasi != null) {
      data['mutasi'] = this.mutasi!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Mutasi {
  String? tanggalPosting;
  String? tanggalValuta;
  String? jamInput;
  String? noReferensi;
  String? mataUang;
  String? nilaiTransaksi;
  String? signTransaksi;
  String? keterangan1;
  String? keterangan2;
  String? userInput;

  Mutasi(
      {this.tanggalPosting,
      this.tanggalValuta,
      this.jamInput,
      this.noReferensi,
      this.mataUang,
      this.nilaiTransaksi,
      this.signTransaksi,
      this.keterangan1,
      this.keterangan2,
      this.userInput});

  Mutasi.fromJson(Map<String, dynamic> json) {
    tanggalPosting = json['tanggal_posting'];
    tanggalValuta = json['tanggal_valuta'];
    jamInput = json['jam_input'];
    noReferensi = json['no_referensi'];
    mataUang = json['mata_uang'];
    nilaiTransaksi = json['nilai_transaksi'];
    signTransaksi = json['sign_transaksi'];
    keterangan1 = json['keterangan_1'];
    keterangan2 = json['keterangan_2'];
    userInput = json['user_input'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tanggal_posting'] = this.tanggalPosting;
    data['tanggal_valuta'] = this.tanggalValuta;
    data['jam_input'] = this.jamInput;
    data['no_referensi'] = this.noReferensi;
    data['mata_uang'] = this.mataUang;
    data['nilai_transaksi'] = this.nilaiTransaksi;
    data['sign_transaksi'] = this.signTransaksi;
    data['keterangan_1'] = this.keterangan1;
    data['keterangan_2'] = this.keterangan2;
    data['user_input'] = this.userInput;
    return data;
  }
}
