import 'package:assignment_test/core/general_cubits/connection_network_cubit/connection_network_cubit.dart';
import 'package:assignment_test/core/helpers/snack_helper.dart';
import 'package:assignment_test/features/data/models/login_model.dart';
import 'package:assignment_test/features/data/repositories/base_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Future<void> close() {
    userNameController.dispose();
    passwordController.dispose();
    return super.close();
  }
  void validAndLogin(BuildContext context) async{
  LoginModel loginModel =  LoginModel(username: userNameController.text,password: passwordController.text);
    if(context.read<ConnectionNetworkCubit>().state.isConnected){
      if (formKey.currentState!.validate()) {
        emit(LoginLoading());
        var result = await BaseRepository().login(context,loginModel);
        if (result) {
          emit(LoginSuccess());
        }
        else{
          emit(LoginInitial());
        }
      }
    }else{
      SnackBarHelper.showBasicSnack(msg: "لا يوجد اتصال بالانترنت", context: context);
    }
  }
}
