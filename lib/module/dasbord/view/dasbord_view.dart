import 'package:flutter/material.dart';
import 'package:crud/core.dart';

class DasbordView extends StatefulWidget {
  const DasbordView({Key? key}) : super(key: key);

  Widget build(context, DasbordController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Produk"),
        actions: [
          IconButton(
            onPressed: () {
              controller.tampilProduk();
            },
            icon: const Icon(
              Icons.refresh,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.item.length,
                padding: EdgeInsets.zero,
                clipBehavior: Clip.none,
                itemBuilder: (context, index) {
                  var item = controller.item[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          item['image'],
                        ),
                      ),
                      title: Text(item['name']),
                      subtitle: Text(
                          "creationAt ${item['creationAt']} updatedAt ${item['updatedAt']}"),
                      trailing: IconButton(
                        onPressed: () {
                          Get.to(UbahView(
                            item: item,
                          ));
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 24.0,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<DasbordView> createState() => DasbordController();
}
