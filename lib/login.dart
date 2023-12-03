import 'package:flutter/material.dart';

class LoginTab extends StatelessWidget {
  LoginTab({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextFormField(
          controller: _usernameController,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            labelText: "Username",
          ),
        ),
        TextFormField(
          controller: _passwordController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: isObscure,
          decoration: InputDecoration(
            labelText: "Password",
            suffixIcon: IconButton(
              icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                isObscure = !isObscure;
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () async {
                //TODO Implement
              },
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('Login'),
                ),
              )),
        )
      ],
    );
  }
}
