import 'package:flutter/material.dart';
import 'geolocator.dart';
import 'image_picker.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        '/image-picker': (context) => const ImagePickerWidget(),
        '/geolocator': (context) => const GeolocatorWidget(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/image-picker');
              },
              child: const Text('Go to Image Picker'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/geolocator');
              },
              child: const Text('Go to Geolocator'),
            ),
          ],
        ),
      ),
    );
  }
}
