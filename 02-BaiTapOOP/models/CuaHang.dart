class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  // Constructor
  CuaHang(this._tenCuaHang, this._diaChi);

  // Thêm điện thoại mới
  void themDienThoai(DienThoai dienThoai) {
    _danhSachDienThoai.add(dienThoai);
  }

  // Cập nhật thông tin điện thoại
  void capNhatDienThoai(String maDienThoai, {String? tenDienThoai, double? giaNhap, double? giaBan, int? soLuongTon}) {
    var dienThoai = _danhSachDienThoai.firstWhere((dt) => dt.maDienThoai == maDienThoai, orElse: () => throw Exception("Điện thoại không tồn tại."));
    if (tenDienThoai != null) dienThoai.tenDienThoai = tenDienThoai;
    if (giaNhap != null) dienThoai._giaNhap = giaNhap;
    if (giaBan != null) dienThoai._giaBan = giaBan;
    if (soLuongTon != null) dienThoai.soLuongTon = soLuongTon;
  }

  // Ngừng kinh doanh điện thoại
  void ngungKinhDoanh(String maDienThoai) {
    var dienThoai = _danhSachDienThoai.firstWhere((dt) => dt.maDienThoai == maDienThoai, orElse: () => throw Exception("Điện thoại không tồn tại."));
    dienThoai._trangThai = false;
  }

  // Tìm kiếm điện thoại
  List<DienThoai> timKiemDienThoai(String keyword) {
    return _danhSachDienThoai.where((dt) => dt.maDienThoai.contains(keyword) || dt.tenDienThoai.contains(keyword) || dt.hangSanXuat.contains(keyword)).toList();
  }

  // Hiển thị danh sách điện thoại
  void hienThiDanhSachDienThoai() {
    _danhSachDienThoai.forEach((dienThoai) => dienThoai.hienThiThongTin());
  }

  // Tạo hóa đơn mới
  void taoHoaDon(HoaDon hoaDon) {
    _danhSachHoaDon.add(hoaDon);
  }

  // Tìm kiếm hóa đơn
  List<HoaDon> timKiemHoaDon(String keyword) {
    return _danhSachHoaDon.where((hd) => hd.maHoaDon.contains(keyword) || hd.tenKhachHang.contains(keyword)).toList();
  }

  // Hiển thị danh sách hóa đơn
  void hienThiDanhSachHoaDon() {
    _danhSachHoaDon.forEach((hoaDon) => hoaDon.hienThiThongTinHoaDon());
  }

  // Thống kê doanh thu và lợi nhuận
  double tinhTongDoanhThu() {
    return _danhSachHoaDon.fold(0, (previousValue, hoaDon) => previousValue + hoaDon.tinhTongTien());
  }

  double tinhTongLoiNhuan() {
    return _danhSachHoaDon.fold(0, (previousValue, hoaDon) => previousValue + hoaDon.tinhLoiNhuanThucTe());
  }
}