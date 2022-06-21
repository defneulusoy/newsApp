import 'package:flutter/material.dart';
import 'package:tech_news_app/backend/functions.dart';
//import 'package:tech_news_app/components/appbar.dart';
import 'package:tech_news_app/components/newsbox.dart';
import 'package:tech_news_app/components/searchbar.dart';
import 'package:tech_news_app/utils/colors.dart';
import 'package:tech_news_app/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;
  @override
  void initState() {
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(),
      body: Column(
        children: [
          SearchBar(),
          Expanded(
              child: Container(
            width: w,
            child: FutureBuilder<List>(
              future: fetchnews(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return NewsBox(
                          url: snapshot.data![index]['url'],
                          imageurl: snapshot.data![index]['urlToImage'] != null
                              ? snapshot.data![index]['urlToImage']
                              : Constants.imageurl,
                          title: snapshot.data![index]['title'],
                          time: snapshot.data![index]['publishedAt'],
                          description:
                              snapshot.data![index]['description'].toString(),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primary,
                ));
              },
            ),
          ))
        ],
      ),
    );
  }
}
