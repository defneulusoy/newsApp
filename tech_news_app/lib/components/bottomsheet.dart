//import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_news_app/components/components.dart';
import 'package:tech_news_app/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

void showMyBottomSheet(
    BuildContext context, String title, String description, imageurl, url) {
  showBottomSheet(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      elevation: 20,
      context: context,
      builder: (context) {
        return MyBottomSheetLayout(
          url: url,
          imageurl: imageurl,
          title: title,
          description: description,
        );
      });
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class MyBottomSheetLayout extends StatelessWidget {
  final String title;
  final String description;
  final String imageurl;
  final String url;

  const MyBottomSheetLayout(
      {Key? key,
      required this.title,
      required this.description,
      required this.imageurl,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BottomSheetImage(imageurl: imageurl, title: title),
          Container(
            padding: EdgeInsets.all(10),
            child:
                modifiedText(text: description, color: Colors.white, size: 16),
          ),
          GestureDetector(
            onTap: () {
              _launchURL(url);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black
              ),
              child: Text('Read Full Article', style: GoogleFonts.lato(color: Colors.deepPurple),),
              /* child: RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: 'Read Full Article',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _launchURL(url);
                      },
                      style: GoogleFonts.lato(
                        color: Colors.blue.shade400,
                      ))
              ])), */
            ),
          )
        ],
      ),
    );
  }
} 
