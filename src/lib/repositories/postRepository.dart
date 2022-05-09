import 'package:http/http.dart' as http;
import 'package:src/helper/network.dart';
import 'package:src/model/post.dart';

class PostRepository {
  Future<List<Post>?> getAllPosts() async {
    http.Response response =
        await NetWork.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      var json = response.body;
      var posts = postFromJson(json);
      if (posts != null) {
        return posts;
      } else {
        return null;
      }
    }
  }
}
