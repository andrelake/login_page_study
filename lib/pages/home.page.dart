import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page_study/services/movies.service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Widget svgLogo = SvgPicture.asset(
    'assets/tmdb.svg',
    semanticsLabel: 'Tmdb Logo',
    color: Colors.black,
    fit: BoxFit.contain,
  );

  var nowPlayingList = [];

  @override
  void initState() {
    super.initState();
    _getNowPlayingList();
  }

  void _getNowPlayingList() async {
    var list = await MoviesService().fetchNowPlaying();
    setState(() {
      nowPlayingList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              logoWidget(),
              simpleText('Now Playing...'),
              // Card(
              //   child: InkWell(
              //     splashColor: Colors.blue.withAlpha(30),
              //     onTap: () {
              //       print('Card tapped.');
              //     },
              //     child: const SizedBox(
              //       width: 300,
              //       height: 100,
              //       child: Text('A card that can be tapped'),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Align simpleText(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Text(text),
      ),
    );
  }

  Padding logoWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: svgLogo,
      ),
    );
  }
}
