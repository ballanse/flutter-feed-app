import 'package:flutter/material.dart';
import 'package:healthnest/postpage/postdetail_page.dart';
import 'package:healthnest/ui/newsFeedPage/widgets/category_list.dart';
import 'package:healthnest/ui/newsFeedPage/widgets/feedBloc.dart';
import 'package:healthnest/ui/newsFeedPage/widgets/widgetFeed.dart';
import 'package:healthnest/ui/newsFeedPage/FeedLatestArticle.dart';

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(style: BorderStyle.solid, color: Colors.grey, width: 0.5)
                  ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          actionBarRow(),
                          topSpace(),
                          searchTextField(),
                          topSpace(),
                          Container(height: 55, child: CategoryList()),
                        ],
                      ),
                    ),

                ),

                topSpace(),

                // List section for the News Feed.
                GestureDetector(
                  onTap: viewDetailPage,
                  child: feedNewsCardItem(context, FeedBloc().feedList[0]),
                ),


                topSpace(),
                GestureDetector(
                  onTap: viewDetailPage,
                  child: feedNewsCardItem(context, FeedBloc().feedList[1]),
                ),


                topSpace(),
                GestureDetector(
                  onTap: viewDetailPage,
                  child: feedNewsCardItemQuestion(context, FeedBloc().feedList[2]),
                ),

                topSpace(),
                GestureDetector(
                  onTap: viewDetailPage,
                  child: feedNewsCardWithImageItem(context, FeedBloc().feedList[3]),
                ),

                SizedBox(height: 20),

                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('LATEST ARTICLE', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),

                topSpace(),

                Container(height: 200, padding: EdgeInsets.all(10), child: LatestArticle()),

                topSpace(),
                pollingCard(context, FeedBloc().feedList[4]),

                topSpace(),
                GestureDetector(
                  onTap: viewDetailPage,
                  child: feedNewsCardItem(context, FeedBloc().feedList[1]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget viewDetailPage() {
    print('Go To Detail Screen');
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) =>
            PostPageDetails()));
    return null;
  }
}