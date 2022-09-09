
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:house/features/theme/colors.dart';
import 'package:house/model/post_model.dart';

class PostImageItem extends StatelessWidget {
  const PostImageItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: post.image!,
      imageBuilder: (context, imageProvider) => Container(
        width: MediaQuery.of(context).size.width * 0.33,
        height: 160,
        // padding: EdgeInsets.all(10),
        // height: MediaQuery.of(context).size.height *
        //     0.2,
        decoration: BoxDecoration(
          border: Border.all(color: greyBlue, width: 1),
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        width: MediaQuery.of(context).size.width * 0.33,
        // padding: EdgeInsets.all(10),
        height: 160,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        decoration: BoxDecoration(
            border: Border.all(color: greyBlue, width: 1),
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),

        width: MediaQuery.of(context).size.width * 0.33,
        // padding: EdgeInsets.all(10),
        height: 160,
        child: Center(child: Image.asset('assets/images/bgposter.jpg')),
      ),
    );
  }
}
