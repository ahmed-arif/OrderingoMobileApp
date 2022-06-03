import 'dart:async';

import 'package:com_unrealprogrammer_orderingo/controllers/user_controller.dart';
import 'package:com_unrealprogrammer_orderingo/pages/home.dart';
import 'package:com_unrealprogrammer_orderingo/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  late AnimationController _animationControler;
  final bool isOpened = false;
  final _animationDuration = const Duration(milliseconds: 500);
  late StreamController<bool> isSideBarStreamController;
  late Stream<bool> isSideBarOpenedStream;
  late StreamSink<bool> isSideBarOpenSink;
  final UserController _con = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    _animationControler =
        AnimationController(vsync: this, duration: _animationDuration);
    isSideBarStreamController = PublishSubject<bool>();
    isSideBarOpenedStream = isSideBarStreamController.stream;
    isSideBarOpenSink = isSideBarStreamController.sink;
  }

  @override
  void dispose() {
    _animationControler.dispose();
    isSideBarStreamController.close();
    isSideBarOpenSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationControler.status;
    final animationCompleted = animationStatus == AnimationStatus.completed;
    if (animationCompleted) {
      isSideBarOpenSink.add(false);
      _animationControler.reverse();
    } else {
      isSideBarOpenSink.add(true);
      _animationControler.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSideBarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data == true ? 0 : -screenwidth,
          right: isSideBarOpenedAsync.data == true ? 90 : screenwidth - 35,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                color: Theme.of(context).primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      child: const Text(
                        "Home Page",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      onTap: () {
                        onIconPressed();
                      },
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      child: const Text(
                        "Messages",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      onTap: () {},
                    ),
                    // const SizedBox(height: 20),
                    // InkWell(
                    //   child: const Text(
                    //     "Reports",
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 25,
                    //     ),
                    //   ),
                    //   onTap: () {},
                    // ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 80,
                      height: AppBar().preferredSize.height,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => CustomDialog(
                              title: "Are you sure?",
                              description: "You want to logout?",
                              actionButtonList: <Widget>[
                                CustomDialogActionButton(
                                  buttonText: 'Yes',
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    _con.logoutUser();
                                  },
                                ),
                                CustomDialogActionButton(
                                  buttonText: 'Cancel',
                                  isRed: true,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            ),
                          );
                        },
                        child: const Center(
                          child: Text(
                            "Logout",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
              Align(
                alignment: const Alignment(0, -1.0),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.height * 0.14,
                      color: Theme.of(context).primaryColor,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: _animationControler.view,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
