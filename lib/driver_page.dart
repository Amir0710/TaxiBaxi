import 'dart:io';
import 'package:baxi/data.dart';
import 'package:baxi/map_page.dart';
import 'package:baxi/personal_driver_page.dart';
import 'package:baxi/theme.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'drawer.dart';
import 'image_controller.dart';

class DiverHomePage extends StatefulWidget {
  const DiverHomePage({super.key});

  @override
  State<DiverHomePage> createState() => _DiverHomePageState();
}

class _DiverHomePageState extends State<DiverHomePage> {
  String filePath = '';
  String imageKey = 'imagePath';
  bool drawerState = false;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void _updateImage(String newPath) {
    setState(() {
      filePath = newPath;
    });
  }

  void _updateState() {
    setState(() {
      drawerState = !drawerState;
    });
  }

  Future<void> initialization() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString(imageKey);
    if (imagePath != null) {
      setState(() {
        filePath = imagePath;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            highlightColor: Colors.transparent,
            padding: const EdgeInsets.only(left: 12),
            onPressed: () {
              themeProvider.toggleTheme();
            },
            icon: Icon(
              themeProvider.isDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
              size: 30,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 108,
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 12,
              top: 12,
            ),
            child: InkWell(
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Driver();
                    },
                  ),
                );
              },
              child: Align(
                  alignment: Alignment.topLeft,
                  child: filePath != ''
                      ? ClipOval(
                          child: filePath.contains(
                                  'assets') // to detect read from storage/assets
                              ? Image.asset(
                                  filePath,
                                  width: 48,
                                  height: 48,
                                  fit: BoxFit.cover,
                                )
                              : Image.file(
                                  File(filePath),
                                  width: 48,
                                  height: 48,
                                  fit: BoxFit.fill,
                                ),
                        )
                      : null),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const List(),
            ),
          ),
          drawerState
              ? DrawerLayer(
                  imageKey: imageKey,
                  drawerState: _updateState,
                  filePath: filePath,
                  updatePath: _updateImage,
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height:
                      MediaQuery.of(context).size.height - kToolbarHeight * 1.8,
                  child: CircularMenu(
                    toggleButtonAnimatedIconData: AnimatedIcons.add_event,
                    toggleButtonColor:
                        Theme.of(context).appBarTheme.backgroundColor ??
                            Colors.transparent,
                    animationDuration: const Duration(seconds: 1),
                    radius: MediaQuery.of(context).size.width / 5,
                    toggleButtonSize: 28,
                    items: [
                      CircularMenuItem(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ImageManager(
                                    imageKey: imageKey,
                                    isCamera: false,
                                    isLoad: false,
                                    updateImage: _updateImage,
                                  );
                                },
                              ),
                            );
                          },
                          icon: Icons.image_search,
                          color: Colors.purple,
                          boxShadow: const [
                            BoxShadow(blurRadius: 10, color: Colors.purple)
                          ]),
                      CircularMenuItem(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ImageManager(
                                    imageKey: imageKey,
                                    isCamera: true,
                                    isLoad: false,
                                    updateImage: _updateImage,
                                  );
                                },
                              ),
                            );
                          },
                          icon: Icons.camera,
                          color: Colors.lightBlueAccent.shade400,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.lightBlueAccent.shade400)
                          ]),
                      CircularMenuItem(
                        icon: Icons.emoji_emotions_outlined,
                        onTap: () {
                          _updateState();
                        },
                        color: Colors.greenAccent,
                        boxShadow: const [
                          BoxShadow(blurRadius: 10, color: Colors.greenAccent)
                        ],
                      ),
                    ],
                    alignment: Alignment.bottomLeft,
                  ),
                ),
        ],
      ),
    );
  }
}

class List extends StatelessWidget {
  const List({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MapPage();
                },
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).textTheme.headlineLarge?.color ??
                          Colors.black,
                      blurRadius: 5),
                ],
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).textTheme.displayMedium!.color),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 8,
            padding: const EdgeInsets.only(right: 8),
            margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  driverActions[index].name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 52),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Theme.of(context).textTheme.displayLarge!.color,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.color ??
                              Colors.black,
                          blurRadius: 5),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      driverActions[index].path,
                      height: 80,
                      width: 80,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: driverActions.length,
      scrollDirection: Axis.vertical,
    );
  }
}
