import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IUT Industrial Training',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> members = [
    {"name": "+880 1744-113344", "status": "Group Admin"},
    {"name": "+880 1973-345r", "status": "Group Admin"},
    {"name": "Abrar", "status": "Hey there! I am using WhatsApp."},
    {"name": "Amitbin", "status": "Hey there! I am using WhatsApp."},
    {"name": "Dihan IUT", "status": "Hey there! I am using WhatsApp."},
    {"name": "PaknaRizwan", "status": "Hey there! I am using WhatsApp."},
    {"name": "Sahab IUT3", "status": "Surely you've better things to do than reading..."},
    {"name": "Sakif IUT", "status": "Hey there! I am using WhatsApp."},
    // Add more members if necessary
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Group Info'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Icon(Icons.group, size: 50),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'IUT Industrial Training 2024 - Batch 1',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Group · 18 members',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.call),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.videocam),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.person_add),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(height: 32, thickness: 1),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Media visibility'),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Encryption'),
              subtitle: Text('Messages and calls are end-to-end encrypted. Tap to learn more.'),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Disappearing messages'),
              subtitle: Text('Off'),
            ),
            ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text('Chat lock'),
              subtitle: Text('Lock and hide this chat on this device.'),
              trailing: Switch(value: false, onChanged: (value) {}),
            ),
            ListTile(
              title: Text('Add group description', style: TextStyle(color: Colors.green)),
              subtitle: Text('Created by +880 1620-470430, yesterday at 13:33'),
            ),
            Divider(height: 32, thickness: 1),
            ...members.map((member) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: member["name"]!.contains('+') ? Icon(Icons.person) : null,
                ),
                title: Text(member["name"]!),
                subtitle: Text(member["status"]!),
                trailing: member["status"] == "Group Admin" ? Chip(label: Text("Group Admin")) : null,
              );
            }).toList(),
            SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'View all (8 more)',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
            Divider(height: 32, thickness: 1),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.red),
              title: Text('Exit group', style: TextStyle(color: Colors.red)),
            ),
            ListTile(
              leading: Icon(Icons.report, color: Colors.red),
              title: Text('Report group', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
