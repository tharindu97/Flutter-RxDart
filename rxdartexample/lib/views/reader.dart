import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rxdartexample/bloc/read_bloc.dart';

class Read extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var readerBloc = Provider.of<ReaderBloc>(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tharindu"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Stream",
              ),
              Tab(
                text: "Publish",
              ),
              Tab(
                text: "Behavior",
              ),
              Tab(
                text: "Replay",
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TabBarView(
            children: [
              Scaffold(
                body: tabBody(
                    readerBloc.dartStream, "Standard dart Stream Controller"),
              ),
              Scaffold(
                body: tabBody(readerBloc.publishStream,
                    "Standard dart Publish Controller"),
              ),
              Scaffold(
                body: tabBody(readerBloc.behaviorStream,
                    "Standard dart Behavior Controller"),
              ),
              Scaffold(
                body: tabBody(
                    readerBloc.replayStream, "Standard dart Replay Controller"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  tabBody(Stream<String> stream, String desc) {
    return ListView(
      children: [
        Text(desc),
        SizedBox(
          height: 20.0,
        ),
        Divider(),
        StreamBuilder<String>(
            stream: stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Text("loading.........!");
              if (snapshot.hasError) return Text("Error.........!");
              return Text(
                snapshot.data,
                style: GoogleFonts.imFellEnglish(
                  textStyle: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              );
            }),
      ],
    );
  }
}
