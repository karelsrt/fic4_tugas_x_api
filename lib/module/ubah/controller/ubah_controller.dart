import 'package:crud/core.dart';
import 'package:flutter/material.dart';

class UbahController extends State<UbahView> implements MvcController {
  static late UbahController instance;
  late UbahView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  Future ubah(nama, id) async {
    ServiceProduk ubah = ServiceProduk();

    await ubah.sUbahProduk(nama, id);
    Get.offAll(const DasbordView());
  }
}
