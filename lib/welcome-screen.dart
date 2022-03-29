import 'package:flutter/material.dart';
import 'package:project/register-screen.dart';
import 'login-screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}


class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {

    Widget _buildLoginButton() {
      return SizedBox(
        height: 64,
        width: 400,
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
            child:  const Text(
              'Login',
              style: TextStyle(
                fontFamily: 'PT-Sans',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const LoginScreen();
              }));
            }
        ),
      );
    }

    Widget _buildRegisterButton() {
      return SizedBox(
        height: 64,
        width: 400,
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
            child:  const Text(
              'Register',
              style: TextStyle(
                fontFamily: 'PT-Sans',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const RegisterScreen();
              }));
            }
        ),
      );
    }

    Widget _buildLogoButton({
      required String image,
      required VoidCallback onPressed,
    }) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          fixedSize: const Size(250, 50),
        ),
        onPressed: onPressed,
        child: SizedBox(
          height: 40,
          child: Image.asset(image),
        ),
      );
    }

    Widget _buildGoogleButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildLogoButton(
            image: 'assets/images/google_logo.png',
            onPressed: () {},
          )
        ],
      );
    }

    return  Scaffold(

        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(255, 130, 100, 1),
                Color.fromRGBO(255, 130, 100, 1),
                Color.fromRGBO(255, 130, 100, 1),
                Color.fromRGBO(255, 130, 100, 1),
                Color.fromRGBO(255, 130, 100, 1),
              ],
            ),
          ),

          child: Column(
              children: [
                Container(
                    alignment: Alignment.topCenter,
                    child: Padding(padding: const EdgeInsets.only(top: 50),
                      child: Image.asset('assets/images/logo.png'),
                    )),


                const SizedBox(
                  height: 50,
                ),
                _buildLoginButton(),
                const SizedBox(
                  height: 30,
                ),
                _buildRegisterButton(),
                const SizedBox(
                  height: 60,
                ),
                _buildGoogleButton()
              ]),


        ));

  }


}
