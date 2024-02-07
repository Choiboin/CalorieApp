import 'package:flutter_chatgpt_api/flutter_chatgpt_api.dart';
import 'package:flutter/material.dart';

class chatgpt extends StatefulWidget {
  const chatgpt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("Chatgpt"),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}


//  State<chatgpt> createState() => _chatgptState();
//}

// _api = ChatGPTApi(sessionToken: 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);

//setState(() {
//  _messages.add(
//    ChatMessage(
//      text: _textController.text,
//      chatMessageType: ChatMessageType.user,
//    ),
//  );
//  isLoading = true;
//});  

//var newMessage = await _api.sendMessage(
  //input,
  //conversationId: _conversationId,
  //parentMessageId: _parentMessageId,
//);

//setState(() {
//  _conversationId = newMessage.conversationId;
//  _parentMessageId = newMessage.messageId;
//  isLoading = false;
//  _messages.add(
//    ChatMessage(
//      text: newMessage.message,
//      chatMessageType: ChatMessageType.bot,
//    ),
//  );
//});
