/* 
    Bai tap 02:
    Viet chuong trinh tinh tong cac uoc so
    cua mot so nguyen duoc tu ban phim (n>=1)
*/

import 'dart:io';

void main() {
  print("Nhap so nguyen duong (n >= 1): ");
  String? input = stdin.readLineSync();

  if (input != null && int.tryParse(input) != null) {
    int n = int.parse(input);
    if (n >= 1) {
      int tongUoc = tongUocSo(n);
      print("Tong cac uoc so cua $n la: $tongUoc");
    } else {
      print("Vui long nhap so nguyen lon hon hoac bang 1");
    }
  } else {
    print("Sai, hay nhap lai");
  }
}

int tongUocSo(int n) {
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    if (n % i == 0) {
      sum += i;
    }
  }
  return sum;
}
