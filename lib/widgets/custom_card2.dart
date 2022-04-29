import 'package:components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCard2 extends StatelessWidget {
  const CustomCard2(
      {Key? key, required this.imageUrl, this.title, this.paddingBottom = 20})
      : super(key: key);

  final String imageUrl;
  final String? title;
  final double paddingBottom;

  @override
  Widget build(BuildContext context) {
    var loadingImage = 'assets/jar-loading.gif';
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        shadowColor: AppTheme.primaryColor.withOpacity(0.8),
        child: Column(
          children: [
            FadeInImage(
              image: NetworkImage(imageUrl),
              placeholder: AssetImage(loadingImage),
              width: double.infinity,
              height: 230,
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 300),
            ),
            if (title != null)
              Container(
                alignment: AlignmentDirectional.bottomEnd,
                padding: const EdgeInsets.only(right: 20, top: 5, bottom: 5),
                child: Text(title ?? 'NO title'),
              ),
          ],
        ),
      ),
    );
  }
}
