import 'package:flutter/material.dart';
import 'package:maybe_app/config/helpers/get_yes_no_answer.dart';
import 'package:maybe_app/domain/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesOrNo = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: "Hola Messi", fromWho: FromWho.me),
    Message(text: "Como estas?", fromWho: FromWho.me),
  ];

  Future<void> sendMessage (String message) async {

    if (message.isEmpty) return;

    final newMessage = Message(text: message, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (message.endsWith("?")){
      herReply(message);
    }

    notifyListeners();
    scrollToBottom();
  }

  Future<void> scrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future<void> herReply (String message) async {
    final herMessage = await getYesOrNo.getAnswer(message);
    messageList.add(herMessage);
    notifyListeners();
    scrollToBottom();
  }

}