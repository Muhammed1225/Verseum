import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:verseum/input.dart';
import 'package:verseum/pages/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;

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
                    "Create an account",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30.0,
                      fontFamily: 'Arial',
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  FormInput(
                    labelText: 'Name',
                    icon: Icons.person,
                    type: TextInputType.name,
                    obscureText: false,
                    controller: nameController,
                  ),
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
                  FormInput(
                    labelText: 'Confirm Password',
                    icon: Icons.lock,
                    type: TextInputType.visiblePassword,
                    obscureText: true,
                    suffixIcon: Icons.remove_red_eye_outlined,
                    controller: confirmPasswordController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: ElevatedButton(
                      onPressed: () => {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(devicewidth / 1.2, 10),
                        backgroundColor: HexColor('#FFC122'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'SIGN UP',
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
                        Text("Already have an account? "),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          ),
                          child: Text(
                            'Login',
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
            ],
          ),
        ),
      ),
    );
  }
}
