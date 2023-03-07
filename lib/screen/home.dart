import 'package:flutter/material.dart';
import 'package:google_auth/screen/login.dart';
import 'package:google_auth/screen/register.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register / Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 100, 30, 10),
        child: SingleChildScrollView(
          child: Column(children: [
            Image.asset("assets/images/me.jpg"),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("สร้างบัญชีผู้ใช้", style: TextStyle(fontSize: 24)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Register();
                  }));
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.login),
                label: const Text("เข้าสู่ระบบ", style: TextStyle(fontSize: 24)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Login();
                  }));
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
