import 'package:chat_app/Components/my_list_tile.dart';
import 'package:chat_app/Components/search_bar.dart';
import 'package:chat_app/Models/chats.dart';
import 'package:chat_app/global.dart';
import 'package:flutter/cupertino.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChatsModel>>(
        future: WhatsApp.Chats(),
        builder: ((context, snapshot) {
          return CustomScrollView(slivers: [
            const CupertinoSliverNavigationBar(
              largeTitle: Text('Chats'),
            ),
             SearchBar(onChanged: () {}, onSummited: () {} ,),
            snapshot.hasData
                ? SliverList(
                delegate: SliverChildListDelegate(
                  snapshot.data!.map((e) => MyListTile()).toList(),
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

