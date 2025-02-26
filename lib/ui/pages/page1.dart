import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/responsive_widget.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to this app!'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Please enter your name and press the button below to continue.',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.go,
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  //todo: call name routing here to page2 sending the name as a parameter
                  ElevatedButton(
                      onPressed: () => _formKey.currentState!.validate()
                          ? print('Hello ${_controller.text}!')
                          : null,
                      child: const Text('Continue'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
