import 'package:flutter/material.dart';
// import 'package:r1/pages/homepage.dart';
import '../utilities/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String uName = '';
  bool changedButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/login.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Welcome $uName",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 32,
              ),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Username'),
                      hintText: 'Enter Username',
                    ),
                    onChanged: (value) {
                      uName = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text('Password'),
                      hintText: 'Enter Password',
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        changedButton = true;
                      });
                      await Future.delayed(
                        const Duration(
                          seconds: 1,
                          milliseconds: 1,
                        ),
                      );
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: changedButton ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: changedButton
                            ? BorderRadius.circular(50)
                            : BorderRadius.circular(10),
                      ),
                      child: changedButton
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () => {
                  //     // Navigator.push(
                  //     //   context,
                  //     //   MaterialPageRoute(
                  //     //     builder: (context) => MyHomepage(),
                  //     //   ),
                  //     // ),
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute),
                  //   },
                  //   style: TextButton.styleFrom(
                  //     minimumSize: const Size(150, 40),
                  //   ),
                  //   child: const Text('Login'),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
