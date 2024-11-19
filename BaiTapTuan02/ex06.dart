/* 
    Bai tap 01:
    Viet chuong trinh chuyen doi 1 so nguyen (b>=1) 
    duoc nhap tu ban phim thanh so nhi phan.
*/

import 'dart:io';

void main() {
  print("Nhap so nguyen duong (b >= 1): ");
  String? input = stdin.readLineSync();
  
  if (input != null && int.tryParse(input) != null) {
    int number = int.parse(input);
    if (number >= 1) {
      String binary = chuyenDoi(number);
      print("So nhi phan cua $number la: $binary");
    } else {
      print("Vui long nhap so nguyen lon hon hoac bang 1");
    }
  } else {
    print("Sai, hay nhap lai.");
  }
}

String chuyenDoi(int number) {
  return number.toRadixString(2);
}
