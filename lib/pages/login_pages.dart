import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();


  String? email;
  String? password;
  bool _obscureText = true;

  Future<void> login() async {
    final auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(
        email: emailcontroller.text, password: passcontroller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
              'https://www.smallofficeideas.com/wp-content/uploads/2013/01/stationery-for-small-or-home-office.jpg'),
          const Padding(
            padding: EdgeInsets.only(right: 280),
            child: Text(
              'Log in',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 345,
            child: TextFormField(
              controller: emailcontroller,
              decoration: const InputDecoration(
                hintText: 'Username or Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 37),
          SizedBox(
            width: 345,
            child: TextFormField(
              controller: passcontroller,
              decoration: InputDecoration(
                hintText: 'Password',
                
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(_obscureText?Icons.visibility_off : Icons.visibility),
                ),
                
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                
              ),
              obscureText: _obscureText,
            ),
          ),
          const SizedBox(height: 40),
          
          ElevatedButton(
              onPressed: () {
                login();
              },
              child: const Text('Sign in')),
          Row(children: [
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(left: 34.0, right: 15.0),
                  child: const Divider(
                    color: Colors.black,
                    height: 30,
                  )),
            ),
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(left: 15.0, right: 34.0),
                  child: const Divider(
                    color: Colors.black,
                    height: 30,
                  )),
            ),
          ]),
        ],
      ),
    );
  }
}
