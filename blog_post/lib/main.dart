// lib/main.dart
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'models/post.dart';
import 'models/comment.dart';
import 'services/api_services.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromARGB(255, 16, 102, 138),
          secondary: Color.fromARGB(255, 109, 154, 163),
        ),
        scaffoldBackgroundColor: Color.fromARGB(203, 180, 224, 222),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PostsScreen(),
    );
  }
}

class PostsScreen extends HookConsumerWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        backgroundColor: Color(0xFF0E82B4),
      ),
      body: FutureBuilder<List<Post>>(
        future: apiService.fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No posts available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Post post = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.all(10.0),
                  elevation: 5.0,
                  shadowColor: Colors.grey,
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        post.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF0E82B4),
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        post.body.split(' ').take(8).join(' ') + '...',
                        style: TextStyle(fontSize: 16, color: const Color.fromARGB(234, 0, 0, 0)),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostDetailScreen(post: post),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class PostDetailScreen extends StatelessWidget {
  final Post post;
  final ApiService apiService = ApiService();

  PostDetailScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        backgroundColor: Color(0xFF0E82B4),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              post.body,
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Comment>>(
              future: apiService.fetchComments(post.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No comments available'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Comment comment = snapshot.data![index];
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 26.0, vertical: 8.0),
                        elevation: 4.0,
                        shadowColor: Colors.grey,
                        child: ListTile(
                          title: Text(
                            comment.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0E82B4),
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8.0),
                              Text(
                                comment.body,
                                style: TextStyle(fontSize: 16, color: Colors.black87),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'By: ${comment.email}',
                                style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black54
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
