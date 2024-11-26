class DienThoai {
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTon;
  bool _trangThai;

  // Constructor
  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat,
      this._giaNhap, this._giaBan, this._soLuongTon, this._trangThai) {
    // Validation
    if (!_maDienThoai.startsWith("DT-") || _maDienThoai.length != 7) {
      throw Exception("Mã điện thoại không hợp lệ.");
    }
    if (_tenDienThoai.isEmpty || _hangSanXuat.isEmpty) {
      throw Exception("Tên điện thoại và hãng sản xuất không được để trống.");
    }
    if (_giaNhap <= 0 || _giaBan <= _giaNhap) {
      throw Exception("Giá nhập và giá bán không hợp lệ.");
    }
    if (_soLuongTon < 0) {
      throw Exception("Số lượng tồn không được âm.");
    }
  }

  // Getters and Setters
  String get maDienThoai => _maDienThoai;
  String get tenDienThoai => _tenDienThoai;
  String get hangSanXuat => _hangSanXuat;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get soLuongTon => _soLuongTon;
  bool get trangThai => _trangThai;

  set soLuongTon(int value) {
    if (value < 0) throw Exception("Số lượng tồn không được âm.");
    _soLuongTon = value;
  }

  // Phương thức tính lợi nhuận dự kiến
  double tinhLoiNhuanDuKien(int soLuong) {
    return (giaBan - giaNhap) * soLuong;
  }

  // Phương thức hiển thị thông tin
  void hienThiThongTin() {
    print("Mã: $_maDienThoai, Tên: $_tenDienThoai, Hãng: $_hangSanXuat, "
        "Giá Nhập: $_giaNhap, Giá Bán: $_giaBan, Tồn Kho: $_soLuongTon, "
        "Trạng Thái: ${_trangThai ? 'Còn Kinh Doanh' : 'Ngừng Kinh Doanh'}");
  }

  // Phương thức kiểm tra có thể bán không
  bool coTheBan() {
    return _soLuongTon > 0 && _trangThai;
  }
}