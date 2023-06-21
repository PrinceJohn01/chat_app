import 'package:chat_app/Components/my_list_tile.dart';
import 'package:chat_app/Components/search_bar.dart';
import 'package:chat_app/Models/me.dart';
import 'package:chat_app/Models/people.dart';
import 'package:chat_app/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PeopleModel>>(
        future: WhatsApp.People(),
        builder: ((context, snapshot) {
          return  CustomScrollView(slivers: [
            const CupertinoSliverNavigationBar(largeTitle: Text('People')),
            SearchBar(onChanged: () {}, onSummited: () {} ),
            const MyStatus(),
            PeopleList(snapshot: snapshot)
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

class MyStatus extends StatelessWidget {
  const MyStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<MeModel>(
        future: WhatsApp.Me(),
        builder: ((context, snapshot) {
          if (snapshot.hasData){
            MeModel me = snapshot.data!;
            return Padding(
              padding:  const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                      children: [
                        GestureDetector(
                          onTap: () => {},
                          child: const CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xFFC10000),
                            child: CircleAvatar(
                              radius:  26,
                              backgroundImage: NetworkImage(''),
                            ),
                          ),
                        ),
                        const Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              Text('name', style: TextStyle(fontSize: 17),),
                              Text('status', style: TextStyle(fontSize: 11))
                                  ,],
                          ),
                        )
                      ]
                  ), Row( children: [
                    Column(children: [
                    Icon(CupertinoIcons.chevron_compact_right, color: Colors.grey.shade400,)
                  ],
                  )
                ],
              ),
          ]));
          }

        })
    );
  }
}




