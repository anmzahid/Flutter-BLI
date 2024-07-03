import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WhatsAppHomePage(),
    );
  }
}

class WhatsAppHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 10, 143, 101),
        title: Text('WhatsApp'),
        actions: [
          Icon(Icons.camera_alt),
          SizedBox(width: 15),
          Icon(Icons.search),
          SizedBox(width: 15),
          Icon(Icons.more_vert),
          SizedBox(width: 10),
        ],
      ),
      body: ChatList(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF075E54),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: 'Communities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF25D366),
        child: Icon(Icons.message),
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  final List<Map<String, String>> chatData = [
    {
      'name': 'Person 1',
      'message': 'Photo',
      'time': 'Yesterday',
    },
    {
      'name': 'Person 2',
      'message': 'https://www.facebook.com/share/r/..',
      'time': '01/07/2024',
    },
    {
      'name': 'Person 3',
      'message': 'Voice call',
      'time': '01/07/2024',
    },
    {
      'name': 'Person 4',
      'message': 'https://meet.google.com/cuk-cxm...',
      'time': '30/06/2024',
    },
    {
      'name': 'WhatsApp',
      'message': 'Understanding end-to-end encryption',
      'time': '29/06/2024',
    },
    {
      'name': 'Person 5',
      'message': ' :)',
      'time': '24/06/2024',
    },
    {
      'name': 'Person 6',
      'message': '7k',
      'time': '18/06/2024',
    },
    {
      'name': 'Person 7',
      'message': 'You reacted ❤️ to "Photo"',
      'time': '17/06/2024',
    },
    {
      'name': 'Person 9',
      'message': '',
      'time': '15/06/2024',
    },
    {
      'name': 'Person 10',
      'message': '',
      'time': '15/06/2024',
    },
    {
      'name': 'Person 11',
      'message': '',
      'time': '15/06/2024',
    },
    {
      'name': 'Person 12',
      'message': '',
      'time': '15/06/2024',
    },
    {
      'name': 'Person 13',
      'message': '',
      'time': '15/06/2024',
    },
    {
      'name': 'Person 14',
      'message': '',
      'time': '15/06/2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatData.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text(chatData[index]['name']!),
          subtitle: Text(chatData[index]['message']!),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(chatData[index]['time']!),
              if (index == 4) // For WhatsApp chat item
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.green,
                  child: Text(
                    '1',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )
              else if (index == 5) // For IUT CSE 2 chat item
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.green,
                  child: Text(
                    '3',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
