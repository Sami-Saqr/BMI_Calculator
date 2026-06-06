import 'package:flutter/material.dart';
import 'package:flutter_test_two/modules/messenger/messenger_screen.dart';

import '../../shared/component/component.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 150),

              Text(
                'Login',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),

                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onFieldSubmitted: (value) {
                  print(value);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                onFieldSubmitted: (value) {
                  print(value);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 30),
              defaultButton(
                width: double.infinity,
                backgroundColor: Colors.transparent,
                text: 'Login',
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MessengerScreen()),
                  );
                },
              ),
              SizedBox(height: 20),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MessengerScreen(),
                          ),
                        );
                      },
                      child: Text('Register Now'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
