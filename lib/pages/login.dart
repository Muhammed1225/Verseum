import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:verseum/input.dart';
import 'package:verseum/pages/signup.dart';
import 'package:verseum/services/login_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isRemember = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    LoginService loginService = LoginService();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: deviceHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/login_background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: deviceHeight / 3),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40.0,
                      fontFamily: 'Arial',
                    ),
                  ),
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    FormInput(
                      labelText: 'Email',
                      icon: Icons.mail,
                      type: TextInputType.emailAddress,
                      obscureText: false,
                      controller: emailController,
                    ),
                    FormInput(
                      labelText: 'Password',
                      icon: Icons.lock,
                      type: TextInputType.visiblePassword,
                      obscureText: true,
                      suffixIcon: Icons.remove_red_eye_outlined,
                      controller: passwordController,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Transform.scale(
                        scale: .9,
                        child: Checkbox(
                          value: isRemember,
                          onChanged: (val) => {
                            setState(() {
                              isRemember = val!;
                            }),
                          },
                          side: BorderSide.none,
                          checkColor: Colors.blueGrey,

                          fillColor: WidgetStateProperty.resolveWith<Color>((
                            Set<WidgetState> states,
                          ) {
                            return HexColor('#FAE7B3');
                          }),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() {
                          isRemember = !isRemember;
                        }),
                        child: Text(
                          'Remember me',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  Text('Forgot password?', style: TextStyle(fontSize: 10)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      int status = await loginService.login(
                        emailController.text,
                        passwordController.text,
                      );
                      if (!mounted) return;
                      if (status == 401) {
                        setState(() {
                          emailController.text = '';
                          passwordController.text = '';
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(seconds: 3),
                            content: Text(
                              'Incorrect credentials. Please try again',
                            ),
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(devicewidth / 1.2, 10),
                    backgroundColor: HexColor('#FFC122'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: HexColor('#FFC122'),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: HexColor('#FFC122'),
                        ),
                      ),
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
