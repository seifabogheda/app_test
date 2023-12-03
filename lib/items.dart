import 'package:flutter/material.dart';

class ItemsTab extends StatefulWidget {
  const ItemsTab({Key? key}) : super(key: key);

  @override
  State<ItemsTab> createState() => _ItemsTabState();
}

class _ItemsTabState extends State<ItemsTab> {
  List<dynamic> items = []; //TODO Change type

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //TODO Implement items List
        ElevatedButton(
          onPressed: () async {
            //TODO Implement
          },
          child: const Text('Load items'),
        )
      ],
    );
  }
}

class ItemDetailsWidget extends StatefulWidget {
  const ItemDetailsWidget({Key? key}) : super(key: key);

  @override
  State<ItemDetailsWidget> createState() => _ItemDetailsWidgetState();
}

class _ItemDetailsWidgetState extends State<ItemDetailsWidget> {
  dynamic itemDetails; //TODO Change type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
            children: [
              Image.network(itemDetails!.imageUrl ?? ''),
              Text(itemDetails!.type ?? ''),
              //TODO Implement Related items List
            ],
          )),
    );
  }
}
