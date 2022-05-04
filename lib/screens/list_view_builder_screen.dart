import 'package:components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  final _scrollController = ScrollController();
  final List<int> imagesId = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      double maxHeight = _scrollController.position.maxScrollExtent;
      double pixels = _scrollController.position.pixels;
      if ((pixels + 500) >= maxHeight) {
        addImages();
      }
    });
  }

  void addImages() {
    int lastId = imagesId.last;
    imagesId.addAll([1, 2, 3, 4, 5].map((imageId) => lastId + imageId));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor.withOpacity(0.85),
      body: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: ListView.builder(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          itemCount: imagesId.length,
          itemBuilder: (context, index) {
            return FadeInImage(
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(
                  'https://picsum.photos/500/300?image=${imagesId[index]}'),
            );
          },
        ),
      ),
    );
  }
}
