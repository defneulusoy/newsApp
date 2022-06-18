import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tech_news_app/utils/text.dart';
import 'package:tech_news_app/utils/colors.dart';


class DividerWidget extends StatelessWidget {
  const DividerWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Divider(
        color: AppColors.white,
      ),

      
    );
  }
}