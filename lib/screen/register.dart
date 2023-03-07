// ignore_for_file: avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_auth/model/profile.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("สร้างบัญชีผู้ใช้"),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Email", style: TextStyle(fontSize: 24)),
                  TextFormField(
                    validator: MultiValidator([
                  RequiredValidator(errorText: "Please Enter Email!"),
                  EmailValidator(errorText: "Please Check Your Email!"),
                    ]),
    
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (email) {
                      profile.email = email!;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text("Password", style: TextStyle(fontSize: 24)),
                  TextFormField(
                    validator:
                        RequiredValidator(errorText: "Please Enter Password!"),
                    obscureText: true,
                    onSaved: (password) {
                      profile.password = password!;
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        child: const Text(
                          "Register Now!!",
                          style: TextStyle(fontSize: 24),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            print(
                                "email = ${profile.email} password = ${profile.password}");
                            formKey.currentState?.reset();
                          }
                        }),
                  ),
                ],
              )),
            ),
          ),
        ));
  }
}
