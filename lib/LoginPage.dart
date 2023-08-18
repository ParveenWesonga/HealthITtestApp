import 'package:flutter/material.dart';
import 'package:healthittestapp/services.dart';

import 'constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool _isObscure = true, isLoading = false;

  bool isValid(BuildContext ctx) {
    if (_username.text.isEmpty) {
      Services().showSnack('Please provide your username..!', Colors.red,
          Icons.warning_amber_rounded, ctx);
      return false;
    }
    if (_password.text.isEmpty) {
      Services().showSnack('Enter your password..!', Colors.red,
          Icons.warning_amber_rounded, ctx);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo.jpeg',
                        width: MediaQuery.of(context).size.width * 0.35),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Please provide your credentials to proceed.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextField(
                controller: _username,
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(
                    12,
                  ),
                  fillColor: Colors.grey.withOpacity(0.1),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      gapPadding: 8, borderRadius: BorderRadius.circular(4)),
                  label: Text('Username'),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: _password,
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.visiblePassword,
                obscureText: _isObscure,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      }),
                  contentPadding: EdgeInsets.all(
                    12,
                  ),
                  fillColor: Colors.grey.withOpacity(0.1),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      gapPadding: 8, borderRadius: BorderRadius.circular(4)),
                  label: Text('Password'),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextButton(
                onPressed: () async {
                  if (isValid(context)) {
                    setState(()  {
                      isLoading = true;
                    });
                    //login get token
                    await Services().isTokenGotten(
                        _username.text.toString(),
                        _password.text.toString(),
                        context).then((value) {
                          setState(() {
                            isLoading = false;
                          });
                    });
                  }
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width, 48)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kPrimaryColor),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: const Text('Login'),
              ),
              const SizedBox(
                height: 12,
              ),
              if (isLoading)
                const Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                        color: kPrimaryColor, strokeWidth: 2),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
