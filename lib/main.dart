import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

class _InvitePageState extends State<InvitePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "assets/images/img2.png",
                fit: BoxFit.cover,
              ),
            ),
            PageView(
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  children: [
                    TopIcon(),
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(),
                            flex: 1,
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
                                    child:
                                        Image.asset("assets/images/img6.png"),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Image.asset(
                                      "assets/images/img5.png",
                                      color: Color(0xFFFFCC8F),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child:
                                        Image.asset("assets/images/img7.png"),
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
                              Text("袁杰先生&鞠婕女士",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: "GenJyuuGothic",
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
                              Text("诚邀您参与\n我们的订婚典礼",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFFFD3AB),
                                      letterSpacing: 3)),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "We sincerely invite you to have an \nengagement ceremony with us",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFFFD3AB).withOpacity(0.6),
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
                    ButtomIcon(),
                  ],
                ),
                Column(
                  children: [
                    TopIcon(),
                    Expanded(
                        child: Column(
                      children: [
                        Expanded(child: Container()),
                        Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(5, 10),
                                      )
                                    ]),
                                child: Image.asset(
                                  "assets/images/img11.jpg",
                                  width: 180,
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("我们将于",
                                    style: TextStyle(
                                        fontFamily: "GenJyuuGothic",
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFFFD3AB),
                                        letterSpacing: 3)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("3月26日",
                                    style: TextStyle(
                                        fontFamily: "GenJyuuGothic",
                                        fontSize: 25,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xFFFFD3AB),
                                        letterSpacing: 3)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("进行订婚仪式\n诚邀您的参加",
                                    style: TextStyle(
                                        fontFamily: "GenJyuuGothic",
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
                    ButtomIcon()
                  ],
                ),
                Column(
                  children: [
                    TopIcon(),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(child: Container()),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  const url =
                                      'https://surl.amap.com/62NRKSz1afHF';
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
                                  Text(
                                    '点击图片仔细查看目标地点',
                                    style: TextStyle(color: Color(0xFFFFD3AB)),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("地址：         ",
                                          style: TextStyle(
                                            fontFamily: "GenJyuuGothic",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xFFFFD3AB),
                                          )),
                                      SizedBox(
                                          width: 150,
                                          child: Text("江苏省苏州市虎丘区科技城锦峰路198号",
                                              style: TextStyle(
                                                fontFamily: "GenJyuuGothic",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w900,
                                                color: Color(0xFFFFD3AB),
                                              ))),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("餐厅包厢：",
                                          style: TextStyle(
                                            fontFamily: "GenJyuuGothic",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xFFFFD3AB),
                                          )),
                                      SizedBox(
                                        width: 150,
                                        child: Text("三楼石湖厅&阳澄湖厅",
                                            style: TextStyle(
                                              fontFamily: "GenJyuuGothic",
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
                    ButtomIcon()
                  ],
                ),
                Column(
                  children: [
                    TopIcon(),
                    Expanded(
                      child: Column(
                        children: [Expanded(child: Container(),),Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyVerticalText("3月26日，期待您的到来", 20),
                            MyVerticalText("惠然肯来", 80),
                          ],
                        ),Expanded(child: Container(),)],
                      ),
                    ),
                    ButtomIcon()
                  ],
                )
              ],
            ),
          ],
        ),
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
          .map((string) => Text(string, style: GoogleFonts.zcoolXiaoWei(textStyle: TextStyle(fontSize: fontSize,color: Color(0xFFFFD3AB)))))
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
