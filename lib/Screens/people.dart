import 'package:chat_app/Models/people.dart';
import 'package:chat_app/global.dart';
import 'package:flutter/cupertino.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PeopleModel>>(
        future: WhatsApp.People(),
        builder: ((context, snapshot) {
          return CustomScrollView(slivers: [
            const CupertinoSliverNavigationBar(
              largeTitle: Text('People'),
            ),
            snapshot.hasData
                ? SliverList(
                delegate: SliverChildListDelegate(
                  snapshot.data!.map((e) => Text(e.firstname + e.lastname)).toList(),
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
