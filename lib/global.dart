import 'dart:convert';

import 'package:chat_app/Models/calls.dart';
import 'package:chat_app/Models/chats.dart';
import 'package:chat_app/Models/me.dart';
import 'package:chat_app/Models/people.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
 const _url = 'https://faker-node-app.herokuapp.com';
class AppColors {
  static Color? primaryColor = const Color(0xFFC10000);
}
class WhatsApp{
  static const WHATSAPP = "$_url/whatsapp";

 static Future<MeModel> Me() async {
     Response response = await get(Uri.parse('$WHATSAPP/me'));
     if (response.statusCode == 200){
      return MeModel.fromJson(jsonDecode(response.body));
    }
 throw Exception(response.reasonPhrase);
  }
 static Future<List<ChatsModel>> Chats() async {
    Response response = await get(Uri.parse('$WHATSAPP/chats'));
    if (response.statusCode == 200){
      return (jsonDecode(response.body) as List)
          .map((e) => ChatsModel.fromJson(e))
          .toList();
    }
    throw Exception(response.reasonPhrase);
  }
  static Future<List<PeopleModel>> People() async {
    Response response = await get(Uri.parse('$WHATSAPP/people'));
    if (response.statusCode == 200){
      return (jsonDecode(response.body) as List)
          .map((e) => PeopleModel.fromJson(e))
          .toList();
    }
    throw Exception(response.reasonPhrase);
  }
  static Future<List<CallsModel>> Calls() async {
    Response response = await get(Uri.parse('$WHATSAPP/calls'));
    if (response.statusCode == 200){
      return (jsonDecode(response.body) as List)
          .map((e) => CallsModel.fromJson(e))
          .toList();
    }
    throw Exception(response.reasonPhrase);
  }
}