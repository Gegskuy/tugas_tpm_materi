import "package:flutter/material.dart";
import 'package:mobilebgs/home_screen.dart';
import 'package:mobilebgs/styles.dart';
import 'package:mobilebgs/widget/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final userController = TextEditingController();
  final passController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: TextStyles.title,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/login_ui.png'),
              const SizedBox(height: 24.0),
              Text('Login Inputs', style: TextStyles.title.copyWith(fontSize: 24.0),),
              const SizedBox(height: 24.0),
              CustomTextField(
                  controller: userController,
                  hint: 'Email or Username',
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                controller: passController,
                  hint: 'Password',
                  isObscure: isObscure,
                  hasSuffix: true,
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
              ),
              const SizedBox(height: 50.0,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)
                  )
                ),
                  onPressed: (){
                    String text = "";
                    if (userController.text == "gega" && passController.text == "timot"){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return HomeScreen();
                      }));
                      text = "Login Success";
                    }
                    else {
                      text = "Login Failed";
                    }
                    SnackBar snackBar = SnackBar(content: Text(text));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Login',
                      style: TextStyles.title.copyWith(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ),
              const SizedBox(height: 16.0,),
              Text('Don\'t have an account?', style: TextStyles.body.copyWith(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 1.0,),
              Text('Sign Up', style: TextStyles.body.copyWith(fontSize: 18.0, color: AppColors.darkBlue),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
