import 'package:flutter_chatgpt_api/flutter_chatgpt_api.dart';
import 'package:flutter/material.dart'

class chatgpt extends StatefulWidget {
  const chatgpt({super.key});

  @override
  State<chatgpt> createState() => _chatgptState();
}

 _api = ChatGPTApi(sessionToken: SESSION_TOKEN);

setState(() {
  _messages.add(
    ChatMessage(
      text: _textController.text,
      chatMessageType: ChatMessageType.user,
    ),
  );
  isLoading = true;
});  

var newMessage = await _api.sendMessage(
  input,
  conversationId: _conversationId,
  parentMessageId: _parentMessageId,
);

setState(() {
  _conversationId = newMessage.conversationId;
  _parentMessageId = newMessage.messageId;
  isLoading = false;
  _messages.add(
    ChatMessage(
      text: newMessage.message,
      chatMessageType: ChatMessageType.bot,
    ),
  );
});