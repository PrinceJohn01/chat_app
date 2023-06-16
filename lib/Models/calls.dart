class CallsModel{
final String name;
final String outbound;
final String type;
final String date;
final avatar;

  CallsModel(
      {required this.name,
       required this.outbound,
       required this.type,
       required this.date,
       required this.avatar});
  factory CallsModel.fromJson(Map<String, dynamic> data ) => CallsModel(
      name: data ['name'],
      outbound: data ['outbound'],
      type: data ['type'],
      date: data ['date'],
      avatar: data ['avatar'],
  );
}