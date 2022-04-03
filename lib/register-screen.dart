import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/login-screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  var errorMsg = "";

  bool? isChecked = false;

  Widget _buildTextField({
    required bool obscureText,
    Widget? prefixedIcon,
    String? hintText,
    required var typeTxt,
    FormFieldValidator<String>? validator
  }) {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      child: TextFormField(
        controller: typeTxt,
        cursorColor: Colors.white,
        cursorWidth: 2,
        obscureText: obscureText,
        validator: validator,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          errorStyle: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.red,
              color: Colors.black
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: const Color.fromRGBO(255, 159, 129, 1.0),
          prefixIcon: prefixedIcon,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white54,
            fontWeight: FontWeight.bold,
            fontFamily: 'PTSans',
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return SizedBox(
      height: 64,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.white,
          ),
          elevation: MaterialStateProperty.all(6),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        child: const Text(
          'Register',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        onPressed: () {
          try {
            if (_key.currentState!.validate()) {
              FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text).then((value){
                  FirebaseFirestore.instance.collection('UserData').doc(value.user?.uid).set({"email": value.user?.email});
              });
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const LoginScreen();
              }));
            }
            errorMsg = "";
          }on FirebaseAuthException catch(error){
            errorMsg = error.message!;
          }

          setState(() {});
        },
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _key,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(255, 130, 100, 1),
                  Color.fromRGBO(255, 136, 106, 1.0),
                  Color.fromRGBO(255, 138, 108, 1.0),
                  Color.fromRGBO(255, 146, 123, 1.0),
                  Color.fromRGBO(255, 153, 128, 1.0),
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ).copyWith(top: 110),
                child: Column(
                  children: [
                    const Text(
                      'Register',
                      style: TextStyle(
                        fontFamily: 'PT-Sans',
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Email',
                        style: TextStyle(
                          fontFamily: 'PT-Sans',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _buildTextField(
                      hintText: 'Enter your email',
                      obscureText: false,
                      prefixedIcon: const Icon(Icons.mail, color: Colors.white),
                      typeTxt: emailController,
                      validator: validateEmail
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Password',
                        style: TextStyle(
                          fontFamily: 'PT-Sans',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _buildTextField(
                      hintText: 'Enter your password',
                      obscureText: true,
                      prefixedIcon: const Icon(Icons.lock, color: Colors.white),
                      typeTxt: passwordController,
                      validator: validatePassword
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    _buildRegisterButton(),
                    const SizedBox(
                      height: 20,
                    ),

                    const SizedBox(
                      height: 30,
                      width: 50,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        errorMsg,
                        style: const TextStyle(
                            color: Color.fromRGBO(246, 6, 6, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String? validateEmail(String? formEmail){
  if(formEmail == null || formEmail.isEmpty){
    return 'E-mail address is required.';
  }

  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';

  return null;
}

String? validatePassword(String? formPass){
  if(formPass == null || formPass.isEmpty){
    return 'Password is required.';
  }


  return null;

}