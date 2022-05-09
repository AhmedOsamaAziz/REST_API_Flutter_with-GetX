import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:src/controller/postController.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key? key}) : super(key: key);
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Scrollbar(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'All Posts',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.view_list)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.grid_view)),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => Visibility(
                  visible: postController.isLoaded.value,
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.blueGrey[50],
                              ),
                              height: 50,
                              width: 50,
                              child: const Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                height: 100,
                                width: 100,
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      postController.posts![index].title
                                          .toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.blue[700],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      postController
                                              .posts![index].body!.capitalize ??
                                          '',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: postController.posts?.length,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
