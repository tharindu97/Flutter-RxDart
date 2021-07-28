import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdartexample/bloc/read_bloc.dart';
import 'package:rxdartexample/views/reader.dart';

class Launch extends StatefulWidget {
  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  ReaderBloc readerBloc;
  @override
  void dispose() {
    readerBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    readerBloc = Provider.of<ReaderBloc>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Text(
            "Tharindu Kavishna",
            style: TextStyle(fontSize: 26.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            color: Colors.red,
            child: Text(
              "Engage",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              // Launch reader
              readerBloc.startReading();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Read()));
            },
          ),
        ],
      ),
    );
  }
}
