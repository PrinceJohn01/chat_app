import 'package:chat_app/Models/calls.dart';
import 'package:chat_app/global.dart';
import 'package:flutter/cupertino.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CallsModel>>(
      future: WhatsApp.Calls(),
      builder: ((context, snapshot) {
        return CustomScrollView(slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Calls'),
          ),
          snapshot.hasData
          ? SliverList(
          delegate: SliverChildListDelegate(
            snapshot.data!.map((e) => Text(e.name)).toList(),
          ))
            : (snapshot.connectionState == ConnectionState.waiting)
          ? const SliverFillRemaining(
            child: CupertinoActivityIndicator())
            : SliverFillRemaining(
            child: Center(child: Text(snapshot.error.toString()))),
        ]);
     })
    );
  }
}
