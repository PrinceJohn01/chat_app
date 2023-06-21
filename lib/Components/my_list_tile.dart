import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Row(
          children: [CircleAvatar(radius: 30, backgroundImage: NetworkImage('url'),
          ),
            Column(children: [Text('name',style: TextStyle(fontSize: 17),), Text('preview')],
            )
          ]
        ), Row( children: [
          Column(children: [Text('18.00'),
          CircleAvatar(radius: 10,backgroundColor: Color(0xFFC10000), child: Text('3'),),
            Icon(CupertinoIcons.chevron_compact_right)
          ],)
        ],)
        ],
      ),
    );
  }
}
