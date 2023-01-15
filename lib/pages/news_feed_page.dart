
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fm_mahanama_app/entities/feed_response.dart';
import 'package:fm_mahanama_app/main.dart';


class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({super.key});

  @override
  State<NewsFeedPage> createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {

  List<NewsFeedResponse> _feedResponseList = [];

  bool _networkAvailable = false;

  @override
  void initState() {
    super.initState();
    initNetworkState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 110),
        child: Container(
          alignment: Alignment.center,
          child: _networkAvailable ? SingleChildScrollView(
            child: Text("Feature under development"),
          ) : const Text('No Internet Connection'),
        ),
      ),
    );
  }

  void initNetworkState() {
    Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        setState(() {
          _networkAvailable = false;
        });
      } else {
        setState(() {
          _networkAvailable = true;
        });
      }
    });
  }
}