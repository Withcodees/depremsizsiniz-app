import 'dart:ffi';

class LoadData {
  final Float derinlik;
  final Float siddet;

  LoadData({required this.derinlik, required this.siddet});

  factory LoadData.fromJson(Map<String, dynamic> json){
    return LoadData(
      derinlik: json['dept'],
      siddet: json['mag']
      );
  }

}
