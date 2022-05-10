import 'package:components/themes/app_theme.dart';
import 'package:flutter/material.dart';

import '../widgets/index.dart' show LoadingIcon;

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  final _scrollController = ScrollController();
  final List<int> imagesId = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      double maxHeight = _scrollController.position.maxScrollExtent;
      double pixels = _scrollController.position.pixels;
      if ((pixels + 500) >= maxHeight) {
        fetchData();
      }
    });
  }

  Future fetchData() async {
    if (_isLoading) return;

    _isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    addImages();
    _isLoading = false;

    if (_scrollController.position.pixels + 100 <=
        _scrollController.position.maxScrollExtent) return;

    _scrollController.animateTo(
      _scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  void addImages() {
    int lastId = imagesId.last;
    imagesId.addAll([1, 2, 3, 4, 5].map((imageId) => lastId + imageId));
    setState(() {});
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    final lastId = imagesId.last;
    imagesId.clear();
    imagesId.add(lastId + 1);
    addImages();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.primaryColor.withOpacity(0.85),
      body: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: Stack(
          children: [
            RefreshIndicator(
              onRefresh: onRefresh,
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
            if (_isLoading)
              Positioned(
                bottom: 40,
                left: size.width * .5 - 30,
                child: const LoadingIcon(),
              ),
          ],
        ),
      ),
    );
  }
}
