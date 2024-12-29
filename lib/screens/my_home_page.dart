import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/item_provider.dart';

import '../models/item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final itemController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Add Items',
                      border: OutlineInputBorder(),
                    ),
                    controller: itemController,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final provider = context.read<ItemProvider>();
                      provider.addItem(Item(item: itemController.text));
                      itemController.clear();
                    },
                    child: const Text('Add Item'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<ItemProvider>(builder: (context, myItem, child) {
                return ListView.builder(
                  itemCount: context.watch<ItemProvider>().itemCount,
                  itemBuilder: (context, index) {
                    // final provider = context.watch<ItemProvider>();
                    final item = myItem.items[index];

                    return ListTile(
                      leading: Checkbox(
                        value: item.complete,
                        onChanged: (value) {
                          // final provider = context.read<ItemProvider>();
                          myItem.toggleCheckbox(item);
                        },
                      ),
                      title: Text(item.item),
                      trailing: IconButton(
                        onPressed: () {
                          // final provider = context.read<ItemProvider>();
                          myItem.removeItem(item);
                        },
                        icon: const Icon(Icons.delete, color: Colors.red),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
