import 'package:flutter/material.dart';

import '../widgets/index.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'firstName': 'Leo',
      'lastName': 'Ortiz',
      'email': 'leodrumers@gmail.com',
      'password': '12pass',
      'role': 'admin',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Input and Forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(children: [
              CustomInputField(
                hintText: 'User name',
                labelText: 'My label',
                formProperties: formValues,
                formProperty: 'firstName',
              ),
              const SizedBox(height: 20),
              CustomInputField(
                labelText: 'Last name',
                hintText: 'Last name',
                formProperties: formValues,
                formProperty: 'lastName',
              ),
              const SizedBox(height: 20),
              CustomInputField(
                hintText: 'Email',
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                formProperties: formValues,
                formProperty: 'email',
              ),
              const SizedBox(height: 20),
              CustomInputField(
                hintText: 'Password',
                labelText: 'Password',
                obscureText: true,
                formProperties: formValues,
                formProperty: 'password',
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: 'Senior',
                items: const [
                  DropdownMenuItem(child: Text('Senior'), value: 'Senior'),
                  DropdownMenuItem(child: Text('Semi senior'), value: 'Semi'),
                  DropdownMenuItem(child: Text('Junior'), value: 'Junior'),
                ],
                onChanged: (value) {
                  formValues['role'] = value ?? 'Admin';
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                        child: Text(
                      'Save',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
