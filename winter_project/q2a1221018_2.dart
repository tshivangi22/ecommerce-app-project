import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  Post({required this.userId, required this.id, required this.title, required this.body});
  factory Post.fromJson(Map <String, dynamic> json){
    return Post(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }
}
void main() async{
  try{
   final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if(response.statusCode == 200){
        List<Post> posts = (json.decode(response.body) as List)
           .map((post) => Post.fromJson(post))
           .toList();
        List<Post> filteredPosts = posts.where((post) => post.userId == 1).toList();
        print('Filtered Posts:');
        for(var post in filteredPosts){
            print('Post ID: ${post.id}');
            print('Title: ${post.title}');
            print('Body: ${post.body}');
            }
    } else {
        print('Failed to fetch posts. Status Code: ${response.statusCode}');
    }
  }catch(e){
    print('Error: $e');
  }   
}