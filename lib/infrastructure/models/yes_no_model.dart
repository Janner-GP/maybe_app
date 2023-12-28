import 'package:maybe_app/domain/message.dart';

class YesNoModel {
  String answer;
  bool forced;
  String image;

  YesNoModel({required this.answer, required this.forced, required this.image});

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json, message) => YesNoModel(
    answer: json["answer"] + ", " + message.replaceAll("?", ""),
    forced: json["forced"],
    image: json["image"],
  );

  Message toMessage() => Message(
    text: answer,
    imageUrl: image,
    fromWho: FromWho.other
  );

}