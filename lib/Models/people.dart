import 'dart:convert';

class PeopleModel{
  final String firstname;
  final String lastname;
  final String msg;
  final String date;
  final int count;
  final bool story;
  final String image;
  final String avatar;
  final String status;
  final List<String>stories;

  PeopleModel({
      required this.firstname,
      required this.lastname,
      required this.msg,
      required this.date,
      required this.count,
      required this.story,
      required this.image,
      required this.avatar,
      required this.status,
      required this.stories});

  factory PeopleModel.fromJson(Map<String, dynamic> data) => PeopleModel(
      firstname: data ['firstname'],
      lastname: data ['lastname'],
      msg: data ['msg'],
      date: data ['date'],
      count: data ['count'],
      story: data ['story'],
      image: data ['image'],
      avatar: data ['avatar'],
      status: data ['status'],
      stories: data ['stories']);
}