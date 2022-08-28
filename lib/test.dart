import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tut_app/app/app.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  void undateAppState() {
    MyApp.instance.appState = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
