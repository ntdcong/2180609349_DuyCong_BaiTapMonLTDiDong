import '../models/CuaHang.dart';
import '../models/DienThoai.dart';
import '../models/HoaDon.dart';

void main() {
    // Tạo cửa hàng
    var cuaHang = CuaHang("Cửa hàng điện thoại TOP 1", "9898 Đường ABC");

    // Thêm điện thoại mới
    try {
      var dienThoai1 = DienThoai("DT-001", "iPhone 14", "Apple", 20000, 30000, 10, true);
      cuaHang.themDienThoai(dienThoai1);
      
      var dienThoai2 = DienThoai("DT-002", "Galaxy S20", "Samsung", 18000, 25000, 15, true);
      cuaHang.themDienThoai(dienThoai2);

      // Hiển thị danh sách điện thoại
      cuaHang.hienThiDanhSachDienThoai();

      // Tạo hóa đơn
      var hoaDon1 = HoaDon("HD-001", DateTime.now(), dienThoai1, 2, 30000, "Nguyễn Văn A", "0123456789");
      cuaHang.taoHoaDon(hoaDon1);
      
      // Hiển thị danh sách hóa đơn
      cuaHang.hienThiDanhSachHoaDon();

      // Thống kê doanh thu và lợi nhuận
      print("Tổng doanh thu: ${cuaHang.tinhTongDoanhThu()}");
      print("Tổng lợi nhuận: ${cuaHang.tinhTongLoiNhuan()}");

      // Tìm kiếm
      print("Tìm kiếm điện thoại 'iPhone':");
      var ketQuaTimKiem = cuaHang.timKiemDienThoai("iPhone");
      ketQuaTimKiem.forEach((dt) => dt.hienThiThongTin());

    } catch (e) {
      print(e);
    }
}
