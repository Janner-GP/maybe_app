import 'package:flutter/material.dart';
import 'package:maybe_app/domain/message.dart';

class HerMessageBubble extends StatelessWidget {

  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BubbleMessage(colors: colors, message: message),
        const SizedBox(height: 5),
        _ImageBubble(message: message),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _BubbleMessage extends StatelessWidget {
  const _BubbleMessage({
    required this.colors,
    required this.message,
  });

  final ColorScheme colors;
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(message.text, style: const TextStyle( color: Colors.white ),)
        ),
    );
  }
}

class _ImageBubble extends StatelessWidget {

  final Message message;

  const _ImageBubble({required this.message});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        message.imageUrl!,
        width: size.width * 0.5,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: const Text('Cargando...'),
          );
        },
      ),
    );
  }
}