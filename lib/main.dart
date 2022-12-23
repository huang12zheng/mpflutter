// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:mpcore/mpcore.dart';
// import 'package:mpcore/mpkit/mpkit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MPApp(
      title: 'MPFlutter Demo',
      color: Colors.blue,
      routes: {
        '/': (context) => Demo(),
      },
      navigatorObservers: [MPCore.getNavigationObserver()],
    );
  }
}

class Demo extends StatelessWidget {
  const Demo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: ListView.custom(childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          print(index);
//               if (index >= 10) return null;
          return Container(
              color: index % 2 == 0 ? Colors.red : Colors.black, height: 20);
        },
      )),
    );
  }
}
