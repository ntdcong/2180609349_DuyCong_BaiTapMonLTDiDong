import '../models/CuaHang.dart';
import '../models/DienThoai.dart';
import '../models/HoaDon.dart';

class HoaDon {
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  // Constructor
  HoaDon(this._maHoaDon, this._ngayBan, this._dienThoai, this._soLuongMua,
      this._giaBanThucTe, this._tenKhachHang, this._soDienThoaiKhach) {
    // Validation
    if (!_maHoaDon.startsWith("HD-") || _maHoaDon.length != 7) {
      throw Exception("Mã hóa đơn không hợp lệ.");
    }
    if (_ngayBan.isAfter(DateTime.now())) {
      throw Exception("Ngày bán không được sau ngày hiện tại.");
    }
    if (_soLuongMua <= 0 || _soLuongMua > _dienThoai.soLuongTon) {
      throw Exception("Số lượng mua không hợp lệ.");
    }
    if (_giaBanThucTe <= 0) {
      throw Exception("Giá bán thực tế không hợp lệ.");
    }
    if (_tenKhachHang.isEmpty || !_soDienThoaiKhach.startsWith("0") || _soDienThoaiKhach.length != 10) {
      throw Exception("Thông tin khách hàng không hợp lệ.");
    }
    // Cập nhật tồn kho
    _dienThoai.soLuongTon -= _soLuongMua;
  }

  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return _giaBanThucTe * _soLuongMua;
  }

  // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() {
    return (_dienThoai.giaBan - _dienThoai.giaNhap) * _soLuongMua;
  }

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTinHoaDon() {
    print("Mã: $_maHoaDon, Ngày: $_ngayBan, Điện Thoại: ${_dienThoai.tenDienThoai}, "
        "Số Lượng: $_soLuongMua, Giá Bán: $_giaBanThucTe, Khách Hàng: $_tenKhachHang, "
        "SĐT: $_soDienThoaiKhach");
  }
}