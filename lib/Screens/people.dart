import 'package:chat_app/Components/my_list_tile.dart';
import 'package:chat_app/Components/search_bar.dart';
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
            SearchBar(onChanged: () {}, onSummited: () {} ,),
          ]);
        })
    );
  }
}

class PeopleList extends StatelessWidget { final AsyncSnapshot<List<PeopleModel>> snapshot;
  const PeopleList({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
     return snapshot.hasData
        ? SliverList(
        delegate: SliverChildListDelegate(
          snapshot.data!.map((e) => MyListTile(
            icon: CupertinoIcons.chevron_compact_right,
            image: e.avatar,
            key: UniqueKey(),
            title: '${e.firstname}  ${e.lastname}',
            subtitle: e.status,
            onTap:() => {},
            onImageTap: () => {},
            border: false,
          )).toList(),
        ))
        : (snapshot.connectionState == ConnectionState.waiting)
        ? const SliverFillRemaining(
        child: CupertinoActivityIndicator())
        : SliverFillRemaining(
        child: Center(child: Text(snapshot.error.toString())));
  }
}



