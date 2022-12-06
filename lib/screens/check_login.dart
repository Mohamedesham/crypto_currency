import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../provider/contol_provider.dart';
import 'home_screen.dart';
import 'login_screen.dart';


class CheckLogin extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Consumer<ControlProvider>(builder: (context, value, child) {
      return value.id==null ? LoginScreen():HomeScreen();
    },);
  }
}
