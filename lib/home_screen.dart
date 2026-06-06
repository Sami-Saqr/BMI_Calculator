import 'package:flutter/material.dart';
import 'package:flutter_test_two/messenger_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

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
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MessengerScreen()));

                      print('Email: ${emailController.text}');
                      print('Password: ${passwordController.text}');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
          
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Login', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
              SizedBox(height: 20),
          
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => MessengerScreen()));
                    }, child: Text('Register Now')),
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
