import 'package:flutter/material.dart';
import 'package:seminar/dashboard.dart';

class FormInputSenopati extends StatefulWidget {
  const FormInputSenopati({super.key});

  @override
  State<FormInputSenopati> createState() => _FormInputSenopatiState();
}

class _FormInputSenopatiState extends State<FormInputSenopati> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Login Absen Senopati"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.network('https://masputra.nextjiesdev.site/assets/seminar/logo.png', width: size.width / 3),
              const SizedBox(height: 20),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(hintText: "Masukkan Username"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                autovalidateMode: AutovalidateMode.always,
                controller: passwordController,
                decoration:
                    const InputDecoration(hintText: "Masukkan Password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: size.width,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      debugPrint("Form Valid");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard()));
                    }
                  },
                  child: const Text("Login", style: TextStyle(color: Colors.white))
                ),
              )
            ],
          )
        ),
      )
    );
  }
}