import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ServiceProduk {
  Future sTampilProduk() async {
    EasyLoading.show(status: 'loading...');
    var response = await Dio().get(
      "https://api.escuelajs.co/api/v1/categories/",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    print(response.data);
    List<dynamic> obj = response.data;
    EasyLoading.dismiss();
    return obj;
  }

  sUbahProduk(nama, id) async {
    try {
      String url = "https://api.escuelajs.co/api/v1/categories/$id";
      var response = await Dio().put(
        url,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "name": nama,
        },
      );
      print(response.data);
    } on Exception catch (err) {
      print(err);
    }
  }
}
