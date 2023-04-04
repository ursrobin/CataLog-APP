import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:r1/pages/homepage.dart';
import '../utilities/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String uName = '';
  bool changedButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
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
      await Navigator.pushNamed(context, MyRoutes.homeRoute);

      setState(() {
        changedButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/login.png',
              color: context.canvasColor,
              colorBlendMode: BlendMode.color,
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
              child: Form(
                key: _formKey,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username can't be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text('Password'),
                        hintText: 'Enter Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password can't be empty";
                        } else if (value.length < 4) {
                          return "Password length should be atleast of 4";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Material(
                      borderRadius: changedButton
                          ? BorderRadius.circular(50)
                          : BorderRadius.circular(8),
                      // ignore: deprecated_member_use
                      color: context.theme.buttonColor,
                      child: InkWell(
                        borderRadius: changedButton
                            ? BorderRadius.circular(50)
                            : BorderRadius.circular(8),
                        onTap: (() => moveToHome(context)),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: changedButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
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
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
