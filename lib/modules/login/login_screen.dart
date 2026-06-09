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
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150),

                Text(
                  'Login',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50),
                defaultTextField(
                  controller: emailController,
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Email',

                  type: TextInputType.emailAddress,
                  function: (String? value) {
                    if (value!.isEmpty) {
                      return 'Email field can not be empty';
                    }
                    return null;
                  },
                  isPassword: false,
                ),
                SizedBox(height: 20),
                defaultTextField(
                  suffix: isPasswordShow
                      ? Icons.visibility
                      : Icons.visibility_off,
                  suffixPressed: () {
                    setState(() {
                      isPasswordShow = !isPasswordShow;
                    });
                  },
                  isPassword: isPasswordShow,
                  type: TextInputType.visiblePassword,
                  controller: passwordController,
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                  function: (String? value) {
                    if (value!.isEmpty) {
                      return 'Password field can not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                defaultButton(
                  width: double.infinity,
                  backgroundColor: Colors.transparent,
                  text: 'Login',
                  function: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MessengerScreen()),
                    if (formKey.currentState!.validate()) {
                      print('Email: ${emailController.text}');
                      print('Password: ${passwordController.text}');
                    }
                  },
                ),defaultButton(
                  width: double.infinity,
                  backgroundColor: Colors.transparent,
                  text: 'Register',
                  function: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => MessengerScreen()),
                    if (formKey.currentState!.validate()) {
                      print(emailController.text);
                      print(emailController.text);
                    }
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
      ),
    );
  }
}
