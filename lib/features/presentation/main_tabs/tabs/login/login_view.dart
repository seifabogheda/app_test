import 'package:assignment_test/core/helpers/validator.dart';
import 'package:assignment_test/features/presentation/main_tabs/tabs/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/base_widgets/custom_button.dart';

class LoginTabView extends StatelessWidget {
  const LoginTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: BlocProvider.of<LoginCubit>(context).formKey,
        child: Column(
          children: [
            TextFormField(
              controller:
                  BlocProvider.of<LoginCubit>(context).userNameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Username",
              ),
              validator: (value) => value?.validateEmpty(context),
            ),
            TextFormField(
              controller:
                  BlocProvider.of<LoginCubit>(context).passwordController,
              keyboardType: TextInputType.visiblePassword,
              // obscureText: isObscure,
              validator: (value) => value?.validatePassword(context),
              decoration: InputDecoration(
                labelText: "Password",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility_off),
                  onPressed: () {},
                ),
              ),
            ),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const Center(child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ));
                }
                if (state is LoginFailed ||
                    state is LoginInitial ||
                    state is LoginNoInternet) {
                  return CustomButton(
                    title: 'Login',
                    onTap: () {
                      LoginCubit.get(context).validAndLogin(context);
                    },
                    width: MediaQuery.of(context).size.width,
                    height: 35,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                    borderRadius: BorderRadius.circular(4),
                  );
                }
                return CustomButton(
                  title: 'Login',
                  onTap: () {
                    LoginCubit.get(context).validAndLogin(context);
                  },
                  width: MediaQuery.of(context).size.width,
                  height: 35,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  borderRadius: BorderRadius.circular(4),
                );
              },
            ),
          ],
        ));
  }
}
