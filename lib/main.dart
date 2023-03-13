import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyAppPage();
  }
}

class MyAppPage extends StatefulWidget {
  const MyAppPage({Key? key}) : super(key: key);

  @override
  State<MyAppPage> createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InvitePage(),
    );
  }
}

class InvitePage extends StatefulWidget {
  const InvitePage({Key? key}) : super(key: key);

  @override
  State<InvitePage> createState() => _InvitePageState();
}

class MusicManger {
  static final musicManger = MusicManger(
      url:
          "https://wj1.kumeiwp.com:812/wj/bl/2021/02/24/5fcb36e87363c883fc31e0a3c5344524.mp3?t=1678678265&key=391ec6d8d1ea55efd653");
  String url;
  final AudioPlayer player = AudioPlayer();

  MusicManger({required this.url, this.isPlay = true}) {
    setUrl(url);
  }

  bool isPlay;

  Future<void> setUrl(String url) async {
    await player.setUrl(url);
  }
}

class _InvitePageState extends State<InvitePage> {
  var isShow = true;
  var bgmManger = MusicManger.musicManger;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundWidget(),
            PageView(
              scrollDirection: Axis.vertical,
              children: const [PageOne(), PageTwo(), PageThree(), PageFour()],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 30, 0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      bgmManger.isPlay = !bgmManger.isPlay;
                      if (bgmManger.isPlay)
                        bgmManger.player.play();
                      else
                        bgmManger.player.pause();
                    });
                  },
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      "assets/images/music.svg",
                      color: bgmManger.isPlay ? Colors.red : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            AnimatedContainer(
                duration: Duration(seconds: 1),
                child: isShow
                    ? GestureDetector(
                        onTap: () {
                          bgmManger.player.play();
                          setState(() {
                            this.isShow = false;
                          });
                        },
                        child: Container(
                          color: Colors.white.withOpacity(0.5),
                          width: double.infinity,
                          height: double.infinity,
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "点击开始",
                                style: GoogleFonts.zcoolXiaoWei(
                                    fontSize: 40,
                                    textStyle: TextStyle(color: Colors.red),
                                    fontWeight: FontWeight.w900),
                              )),
                        ),
                      )
                    : Container()),
          ],
        ),
      ),
    );
  }
}

class PageFour extends StatelessWidget {
  const PageFour({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopIcon(),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  MyVerticalText("3月26日，期待您的到来", 20),
                  MyVerticalText("惠然肯来", 80),
                ],
              ),
              Expanded(
                child: Container(),
              )
            ],
          ),
        ),
        const ButtomIcon()
      ],
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopIcon(),
        Expanded(
          child: Column(
            children: [
              Expanded(child: Container()),
              Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      const url = 'https://surl.amap.com/62NRKSz1afHF';
                      if (await canLaunchUrl(Uri.parse(url)))
                        await launchUrl(Uri.parse(url));
                      else
                        // can't launch url, there is some error
                        throw "Could not launch $url";
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          "assets/images/map.png",
                          width: 220,
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/ezgif-3-88a030c11b.gif",
                        height: 30,
                      ),
                      const Text(
                        '点击图片仔细查看目标地点',
                        style: TextStyle(color: Color(0xFFFFD3AB)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("地址：         ",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFFFFD3AB),
                              )),
                          SizedBox(
                              width: 150,
                              child: Text("江苏省苏州市虎丘区科技城锦峰路198号",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFFFFD3AB),
                                  ))),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("餐厅包厢：",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFFFFD3AB),
                              )),
                          SizedBox(
                            width: 150,
                            child: Text("三楼石湖厅&阳澄湖厅",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFFFFD3AB),
                                )),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
        const ButtomIcon()
      ],
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopIcon(),
        Expanded(
            child: Column(
          children: [
            Expanded(child: Container()),
            Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(5, 10),
                          )
                        ]),
                    child: Image.asset(
                      "assets/images/img11.jpg",
                      width: 180,
                    )),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("我们将于",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFFD3AB),
                            letterSpacing: 3)),
                    SizedBox(
                      height: 5,
                    ),
                    Text("3月26日",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFFFFD3AB),
                            letterSpacing: 3)),
                    SizedBox(
                      height: 5,
                    ),
                    Text("进行订婚仪式\n诚邀您的参加",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFFD3AB),
                            letterSpacing: 3)),
                  ],
                )
              ],
            ),
            Expanded(child: Container()),
          ],
        )),
        const ButtomIcon()
      ],
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TopIcon(),
        Expanded(
            child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      Expanded(
                        flex: 1,
                        child: Image.asset("assets/images/img6.png"),
                      ),
                      Expanded(
                        flex: 4,
                        child: Image.asset(
                          "assets/images/img5.png",
                          color: const Color(0xFFFFCC8F),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Image.asset("assets/images/img7.png"),
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Image.asset(
                    "assets/images/img9.png",
                    width: 80,
                  ),
                  const Text("袁杰先生&鞠婕女士",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w100,
                          color: Color(0xFFFFD3AB),
                          letterSpacing: 3)),
                  const SizedBox(
                    height: 14,
                  ),
                  SizedBox(
                    width: 340,
                    child: Image.asset("assets/images/img8.png"),
                  ),
                  const Text("诚邀您参与\n我们的订婚典礼",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFD3AB),
                          letterSpacing: 3)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      "We sincerely invite you to have an \nengagement ceremony with us",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFFFD3AB).withOpacity(0.6),
                      )),
                ],
              ),
              Expanded(
                child: Container(),
                flex: 2,
              ),
            ],
          ),
        )),
        const ButtomIcon(),
      ],
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.red,
      ),
      height: double.infinity,
      width: double.infinity,
      child: Image.asset(
        "assets/images/img2.png",
        fit: BoxFit.cover,
      ),
    );
  }
}

class MyVerticalText extends StatelessWidget {
  final String text;
  final double fontSize;

  const MyVerticalText(this.text, this.fontSize);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      direction: Axis.vertical,
      alignment: WrapAlignment.center,
      children: text
          .split("")
          .map((string) => Text(string,
              style: GoogleFonts.zcoolXiaoWei(
                  textStyle: TextStyle(
                      fontSize: fontSize, color: const Color(0xFFFFD3AB)))))
          .toList(),
    );
  }
}

/// Use this to call it

class Position {
  double latitude;
  double longitude;
  int scale;

  Position(this.latitude, this.longitude, this.scale);
}

class ButtomIcon extends StatelessWidget {
  const ButtomIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      heightFactor: 0,
      child: Image.asset(
        "assets/images/img4.png",
        fit: BoxFit.contain,
        width: 300,
      ),
    );
  }
}

class TopIcon extends StatelessWidget {
  const TopIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      heightFactor: 0,
      child: Image.asset(
        "assets/images/img4.png",
        fit: BoxFit.contain,
        width: 300,
      ),
    );
  }
}
