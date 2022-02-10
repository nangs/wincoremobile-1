// ignore_for_file: file_names, unnecessary_new, unnecessary_this, prefer_collection_literals

class AccountInfoResponse {
  String? accountNo;
  String? accountName;
  int? saldoEfektif;
  String? saldoEfektifSign;
  String? noTelphone;
  String? email;
  String? ktp;
  String? tanggalLahir;
  String? namaIbu;
  String? alamat;

  AccountInfoResponse(
      {this.accountNo,
      this.accountName,
      this.saldoEfektif,
      this.saldoEfektifSign,
      this.noTelphone,
      this.email,
      this.ktp,
      this.tanggalLahir,
      this.namaIbu,
      this.alamat});

  AccountInfoResponse.fromJson(Map<String, dynamic> json) {
    accountNo = json['account_no'];
    accountName = json['account_name'];
    saldoEfektif = json['saldo_efektif'];
    saldoEfektifSign = json['saldo_efektif_sign'];
    noTelphone = json['no_telphone'];
    email = json['email'];
    ktp = json['ktp'];
    tanggalLahir = json['tanggal_lahir'];
    namaIbu = json['nama_ibu'];
    alamat = json['alamat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_no'] = this.accountNo;
    data['account_name'] = this.accountName;
    data['saldo_efektif'] = this.saldoEfektif;
    data['saldo_efektif_sign'] = this.saldoEfektifSign;
    data['no_telphone'] = this.noTelphone;
    data['email'] = this.email;
    data['ktp'] = this.ktp;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['nama_ibu'] = this.namaIbu;
    data['alamat'] = this.alamat;
    return data;
  }
}
