import 'package:flutter/material.dart';
import 'package:crud/core.dart';
import '../controller/ubah_controller.dart';

class UbahView extends StatefulWidget {
  final Map<String, dynamic> item;
  const UbahView({
    Key? key,
    required this.item,
  }) : super(key: key);

  Widget build(context, UbahController controller) {
    controller.view = this;

    TextEditingController namaIdController;
    namaIdController = TextEditingController();
    namaIdController.text = item['name'] ?? 'ol';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Data"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                //initialValue: item['name'],
                controller: namaIdController,
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                  helperText: "What's your name?",
                ),
                onChanged: (value) {},
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  controller.ubah(namaIdController.text, item['id']);
                },
                child: const Text("ubah"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<UbahView> createState() => UbahController();
}
