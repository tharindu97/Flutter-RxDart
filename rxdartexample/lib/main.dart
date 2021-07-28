import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdartexample/bloc/read_bloc.dart';
import 'package:rxdartexample/views/launch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ReaderBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter RxDart',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Launch(),
      ),
    );
  }
}
