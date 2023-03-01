import 'package:flutter/material.dart';
import 'package:instagram_clone/dummy_data/suggested_posts_model.dart';
import 'package:instagram_clone/utils/text_utils.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextUtils _textUtils = TextUtils();

  List<SuggestedPostModel> suggestedPostList = [];

  @override
  void initState() {
    super.initState();

    addData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          searchBarWidget(),
          const SizedBox(
            height: 10,
          ),
          suggestedPostsWidget()
        ],
      ),
    );
  }

  Widget searchBarWidget() {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xFF262626)),
      child: Row(
        children: [
          const Expanded(
            child: Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
            flex: 1,
          ),
          Expanded(
            child: _textUtils.normal16("Search", const Color(0xFF3E3E3E)),
            flex: 6,
          )
        ],
      ),
    );
  }

  Widget suggestedPostsWidget() {
    return Column(
      children: [
        for (int i = 0; i < suggestedPostList.length; i++)
          if (suggestedPostList[i].containsVideo) showWithVideoWidget(i) else showWithoutVideoWidget(i)
      ],
    );
  }

  Widget showWithVideoWidget(int index) {
    return Container(
      margin: const EdgeInsets.only(top: 2),
      child: Row(
        children: [
          Expanded(
            flex: 1,
              child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.335,
                height: MediaQuery.of(context).size.width * 0.335,
                child: Image.network(
                  suggestedPostList[index].contentLink1,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.335,
                height: MediaQuery.of(context).size.width * 0.335,
                child: Image.network(
                  suggestedPostList[index].contentLink2,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          )),
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.only(left: 2),
              height: MediaQuery.of(context).size.width * 0.67,
              child:Image.network(
                suggestedPostList[index].contentLink3,
                fit: BoxFit.fill,
              ),
            )
          ),
        ],
      ),
    );
  }

  Widget showWithoutVideoWidget(int index) {
    return Container(
      margin: const EdgeInsets.only(top: 2),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(right: 1),
              height: MediaQuery.of(context).size.width * 0.33,
              child: Image.network(
                suggestedPostList[index].contentLink1,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(right: 1,left: 1),
              height: MediaQuery.of(context).size.width * 0.33,
              child: Image.network(
                suggestedPostList[index].contentLink2,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(left: 1),
              height: MediaQuery.of(context).size.width * 0.33,
              child: Image.network(
                suggestedPostList[index].contentLink3,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addData() {
    suggestedPostList.add(SuggestedPostModel(
        false,
        "https://i.pinimg.com/474x/4f/9f/f8/4f9ff8f30550c89e483632c5df221b54.jpg",
        "https://i.pinimg.com/474x/2c/7a/b8/2c7ab8e9b82688542ad4832753d75018.jpg",
        "https://i.pinimg.com/474x/e0/b4/0a/e0b40a889f2b1213a6d5c6d43ebd6b2b.jpg"));

    suggestedPostList.add(SuggestedPostModel(
        true,
        "https://i.pinimg.com/474x/4f/9f/f8/4f9ff8f30550c89e483632c5df221b54.jpg",
        "https://i.pinimg.com/474x/2c/7a/b8/2c7ab8e9b82688542ad4832753d75018.jpg",
        "https://i.pinimg.com/474x/e0/b4/0a/e0b40a889f2b1213a6d5c6d43ebd6b2b.jpg"));

    suggestedPostList.add(SuggestedPostModel(
        false,
        "https://i.pinimg.com/474x/4f/9f/f8/4f9ff8f30550c89e483632c5df221b54.jpg",
        "https://i.pinimg.com/474x/2c/7a/b8/2c7ab8e9b82688542ad4832753d75018.jpg",
        "https://i.pinimg.com/474x/e0/b4/0a/e0b40a889f2b1213a6d5c6d43ebd6b2b.jpg"));

    suggestedPostList.add(SuggestedPostModel(
        true,
        "https://i.pinimg.com/474x/4f/9f/f8/4f9ff8f30550c89e483632c5df221b54.jpg",
        "https://i.pinimg.com/474x/2c/7a/b8/2c7ab8e9b82688542ad4832753d75018.jpg",
        "https://i.pinimg.com/474x/e0/b4/0a/e0b40a889f2b1213a6d5c6d43ebd6b2b.jpg"));
  }
}
