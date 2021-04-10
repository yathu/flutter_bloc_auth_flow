import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whfms_mobile_app/auth/auth_cubit.dart';
import 'package:whfms_mobile_app/auth/auth_navigator.dart';
import 'package:whfms_mobile_app/loading_view.dart';
import 'package:whfms_mobile_app/session_cubit.dart';
import 'package:whfms_mobile_app/session_state.dart';
import 'package:whfms_mobile_app/session_view.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(builder: (context, state) {
      return Navigator(
        pages: [
          //show loading Screen
          if(state is UnKnownSessionState) MaterialPage(child: LoadingView()),

          //show Auth Flow
          if(state is UnAuthenticated)
            MaterialPage(child: BlocProvider(
              create: (context) => AuthCubit(sessionCubit: context.read<SessionCubit>()),
              child: AuthNavigator(),
            )
            ),

          //show session flow
          if(state is Authenticated) MaterialPage(child: SessionView())
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }

}