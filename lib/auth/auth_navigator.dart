import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whfms_mobile_app/auth/auth_cubit.dart';
import 'package:whfms_mobile_app/auth/confirm/confirmation_view.dart';
import 'package:whfms_mobile_app/auth/login/login_view.dart';
import 'package:whfms_mobile_app/auth/sign_up/sign_up_view.dart';

class AuthNavigator extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthState>(builder: (context,state){
      return Navigator(
        pages: [
          if (state == AuthState.login) MaterialPage(child: LoginView()),

          if(state == AuthState.signUP ||
              state == AuthState.confirmSignUP) ...[
            MaterialPage(child: SignUpView()),

            if(state == AuthState.confirmSignUP)
              MaterialPage(child: ConfirmationView())
          ]
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }

}