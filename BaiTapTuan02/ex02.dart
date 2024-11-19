
void main(){
  // Khai bao bien co ban
  var ten = 'Cong';
  int tuoi = 21;

  // Su dung null safety
  String? tenNullable;
  tenNullable = null;

  // Late
  late String moTa;
  moTa = 'Lap Trinh Di Dong';

  // Su dung final va const
  final String quocGia;
  quocGia = 'Viet Nam';
  // quocGia = 'Lao'; -> Error
  const int nam = 2024;

  // Error neu # 2024
  assert(nam == 2024);

  // In ra nam
  print('Nam: $nam');
}