import 'package:flutter/material.dart';
import 'package:maybe_app/domain/message.dart';
import 'package:maybe_app/presentation/providers/chat_provider.dart';
import 'package:maybe_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:maybe_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:maybe_app/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage('https://as01.epimg.net/img/comunes/fotos/fichas/deportistas/m/mes/large/15167.png'),
          )
          ),
        title: const Text('Messi ⚽'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

// Vista de la pantalla de chat
class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  return ( message.fromWho == FromWho.other )
                  ? HerMessageBubble(message: message,)
                  : MyMessageBubble(message: message);
                },
              )
            ),
            MessageFieldBox( onValue: (value) => chatProvider.sendMessage(value)),
          ],
        ),
      ),
    );
  }
}