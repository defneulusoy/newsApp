import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tech_news_app/components/components.dart';
import 'package:tech_news_app/utils/colors.dart';
import 'package:tech_news_app/utils/text.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'bottomsheet.dart'
import 'components.dart';

class NewsBox extends StatelessWidget {
  final String imageurl, title, time, description, url;
  const NewsBox(
      {Key? key,
      required this.imageurl,
      required this.title,
      required this.description,
      required this.time,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
      showMyBottomSheet(context, title, description, url, imageurl);
    },
    child: Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
      width: w,
      color: AppColors.black,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: imageurl,
            imageBuilder: (context, imageProvider) => Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.yellow,
              ),
            ),
            placeholder: (context, url) =>
            CircularProgressIndicator(color: AppColors.primary,),
            errorWidget: (context, url, error) => Icon(Icons.error),)
        ],
      ),

    ),),
    DividerWidget()]);
  }
}
