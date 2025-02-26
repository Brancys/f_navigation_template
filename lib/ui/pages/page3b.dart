import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/responsive_widget.dart';

class Page3B extends StatelessWidget {
  Page3B({super.key});
  final String? name = Get.parameters['name'];
  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text('$name Option B'),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                  'This is a snackbar demo. Click the button below to see it in action.'),
              ElevatedButton(
                  //todo: Implement logic for the Top Snackbar to show this text:
                  // This is a snackbar on Top
                  onPressed: () => null,
                  child: const Text('Show Top Snackbar')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => Get.snackbar(
                      'Hi', 'This is a snackbar on Bottom',
                      snackPosition: SnackPosition.BOTTOM),
                  child: const Text('Show Bottom Snackbar'))
            ],
          ),
        )),
      ),
    );
  }
}
