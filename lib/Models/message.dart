class MessageModel{
  final String image;
  final String mgs;
  final bool sender;
  final String type;
  final bool opened;

  MessageModel(
      {required this.image,
        required this.mgs,
        required this.sender,
        required this.type,
        required this.opened});

  factory MessageModel.fromJson(Map<String, dynamic> data ) => MessageModel(
    image: data ['image'],
    mgs: data ['mgs'],
    sender: data ['sender'],
    type: data ['type'],
    opened: data ['opened'],
  );
}