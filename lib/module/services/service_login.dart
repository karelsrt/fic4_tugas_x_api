import 'package:crud/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../state_util.dart';

class ServiceLogin {
  Future scekLogin(user, password) async {
    EasyLoading.show(status: 'loading...');
    try {
      var response = await Dio().post(
        "https://api.escuelajs.co/api/v1/auth/login",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "email": user,
          "password": password,
        },
      );

      print(response.data);
      EasyLoading.showSuccess('Berhasil Login');
      EasyLoading.dismiss();
      Get.to(const DasbordView());
    } on Exception catch (err) {
      print(err);
      EasyLoading.dismiss();
      EasyLoading.showError("gagal Login");
    }
  }
}
