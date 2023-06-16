import 'package:chat_app/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:chat_app/Models/chats.dart';
import 'package:chat_app/Models/me.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
      brightness: Brightness.light,
        primaryColor: AppColors.primaryColor,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    getMe();
    super.initState();
  }

  void getMe () async{
    var me = await WhatsApp.Me();
    await WhatsApp.Chats;
    await WhatsApp.People();
    await WhatsApp.Calls();
  }
  var screen = [Text('Chat'), Text('Calls'),Text('People'), Text('Setting')];

  @override
  CupertinoPageScaffold build(BuildContext context)  {
    return  CupertinoPageScaffold(
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: const [
           BottomNavigationBarItem(
             label: "Chats",
               icon: Icon(CupertinoIcons.chat_bubble_2_fill),
           ),
            BottomNavigationBarItem(
              label: "Calls",
              icon: Icon(CupertinoIcons.phone),
            ),
            BottomNavigationBarItem(
              label: "People",
              icon: Icon(CupertinoIcons.person_alt_circle),
            ),BottomNavigationBarItem(
              label: "Settings",
              icon: Icon(CupertinoIcons.settings_solid),
            ),
         ],), tabBuilder: (BuildContext context, int index) {
         return  Center(
           child: screen[index],
           );
           },
         ));
  }
}
