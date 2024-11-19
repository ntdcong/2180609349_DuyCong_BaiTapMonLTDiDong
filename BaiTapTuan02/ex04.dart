/*
Giai Phuong Trinh Bac Hai
*/

import 'dart:io';
import 'dart:math';

void main() {
  double a = 0, b = 0, c = 0;
  // Nhap a va kiem tra dieu kien
  do {
    stdout.write('Nhap he so a (a khac 0): ');
    String? inputA = stdin.readLineSync();
    if (inputA != null) {
      a = double.tryParse(inputA) ?? 0;
    }
    if (a == 0) {
      print('He so a phai khac 0, hay nhap lai ^^');
    }
  } while (a == 0);

  // Nhap b
  stdout.write('Nhap he so b: ');
    String? inputB = stdin.readLineSync();
    if (inputB != null) {
      b = double.tryParse(inputB) ?? 0;
    }

  // Nhap c
    stdout.write('Nhap he so c: ');
    String? inputC = stdin.readLineSync();
    if (inputC != null) {
      c = double.tryParse(inputC) ?? 0;
    }

    print('Phuong trinh: ${a}x^2 + ${b}x + c =0');

    // Tính delta
  double delta = b * b - 4 * a * c;
  print('Delta = $delta');

  // Giải phương trình dựa vào delta
  if (delta < 0) {
    print('Phương trình vô nghiệm');
  } else if (delta == 0) {
    double x = -b / (2 * a);
    // Làm tròn đến 2 chữ số thập phân
    x = double.parse(x.toStringAsFixed(2));
    print('Phương trình có nghiệm kép x = $x');
  } else {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    // Làm tròn đến 2 chữ số thập phân
    x1 = double.parse(x1.toStringAsFixed(2));
    x2 = double.parse(x2.toStringAsFixed(2));
    print('Phương trình có 2 nghiệm phân biệt:');
    print('x1 = $x1');
    print('x2 = $x2');
  }
}
