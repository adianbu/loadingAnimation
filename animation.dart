import 'package:flutter/material.dart';

class Anime extends StatefulWidget {
  @override
  _AnimeState createState() => _AnimeState();
}

class _AnimeState extends State<Anime> with TickerProviderStateMixin {
  Animation anime1;
  Animation anime2;
  Animation anime3;
  Animation anime4;

  AnimationController animeController;

  int delayTime = 0;

  @override
  void initState() {
    super.initState();
    animeController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    anime1 = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 2.0), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 2.0, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(
        parent: animeController, curve: Interval(0, 0.25, curve: Curves.ease)));

    anime2 = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 2.0), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 2.0, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(
        parent: animeController,
        curve: Interval(0.1, 0.35, curve: Curves.ease)));

    anime3 = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 2.0), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 2.0, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(
        parent: animeController,
        curve: Interval(0.2, 0.45, curve: Curves.ease)));

    anime4 = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 2.0), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 2.0, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(
        parent: animeController,
        curve: Interval(0.3, 0.55, curve: Curves.ease)));

    // animeController.isCompleted?Navigator.push(context, NewAnime):animeController.forward();

    animeController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: animation()),
    );
  }

  Widget builds(Animation a) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: AnimatedBuilder(
          animation: animeController,
          builder: (context, child) => Transform.scale(
                scale: a.value,
                origin: Offset.zero,
                child: Container(
                  height: 30,
                  width: 8,
                  color: Colors.red,
                ),
              )),
    );
  }

  Widget animation() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // OutlineButton(
          //   color: Colors.white,
          //   textColor: Colors.black,
          //   padding: EdgeInsets.all(12.0),
          //   child: Text('Start Icon Animation'),
          //   onPressed: () {
          //     animeController.repeat();
          //     // animeController.isCompleted
          //     //     ? animeController.reverse()
          //     //     : animeController.forward();
          //     // animeController.forward();
          //   },
          //   splashColor: Colors.red,
          // ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              builds(anime1),
              builds(anime2),
              builds(anime3),
              builds(anime4)
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animeController.dispose();
  }
}
