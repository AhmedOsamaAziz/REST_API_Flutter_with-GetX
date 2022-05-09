import 'package:get/get.dart';

import 'package:src/model/post.dart';
import 'package:src/repositories/postRepository.dart';

class PostController extends GetxController {
  List<Post>? posts = <Post>[].obs;
  var isLoaded = false.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    posts = await PostRepository().getAllPosts();
    if (posts != null) {
      isLoaded.value = true;
    }
  }
}
