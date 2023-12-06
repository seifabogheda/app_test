

import 'package:assignment_test/core/base_widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ItemsTabView extends StatelessWidget {
  const ItemsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //TODO Implement items List
        CustomButton(title: "Load items",
          width: 100,
          height: 40,
          onTap: (){},
        ),
      ],
    );
  }
}
