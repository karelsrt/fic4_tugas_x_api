import 'package:flutter/material.dart';
import 'package:crud/state_util.dart';
import '../../services/service_produk.dart';
import '../view/dasbord_view.dart';

class DasbordController extends State<DasbordView> implements MvcController {
  static late DasbordController instance;
  late DasbordView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    tampilProduk();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  List item = [];
  tampilProduk() async {
    ServiceProduk tampil = ServiceProduk();
    item = await tampil.sTampilProduk();

    setState(() {});
    //  / item = tampil.obj;
  }
}
