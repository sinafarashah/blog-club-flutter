import 'dart:ffi';
import 'dart:math';

import 'package:blog_club/article.dart';
import 'package:blog_club/carousel/carousel_slider.dart';
import 'package:blog_club/data.dart';
import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/home.dart';
import 'package:blog_club/profile.dart';
import 'package:blog_club/splash.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defualtFontFamily = 'avenir';
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);
    const primaryColor = Color(0xff376AED);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          onSurface: primaryTextColor,
          onBackground: primaryTextColor,
          background: Color(0xffFBFCFF),
          surface: Colors.white,
        ),
        useMaterial3: true,
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all(const TextStyle(
          fontFamily: defualtFontFamily,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        )))),
        appBarTheme: const AppBarTheme(
          titleSpacing: 32,
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: primaryColor,
        ),
        textTheme: const TextTheme(
            titleSmall: TextStyle(
                fontFamily: defualtFontFamily,
                fontWeight: FontWeight.w400,
                color: primaryTextColor,
                fontSize: 14),
            titleMedium: TextStyle(
                fontFamily: defualtFontFamily,
                fontWeight: FontWeight.w200,
                color: secondaryTextColor,
                fontSize: 18),
            titleLarge: TextStyle(
                fontFamily: defualtFontFamily,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryTextColor),
            headlineMedium: TextStyle(
                fontFamily: defualtFontFamily,
                fontWeight: FontWeight.w700,
                color: primaryTextColor,
                fontSize: 24),
            bodySmall: TextStyle(
                fontFamily: defualtFontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 10,
                color: Color(0xff7B8BB2)),
            headlineSmall: TextStyle(
              fontFamily: defualtFontFamily,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            bodyLarge: TextStyle(
              fontFamily: defualtFontFamily,
              color: primaryTextColor,
              fontSize: 14,
            ),
            bodyMedium: TextStyle(
              fontFamily: defualtFontFamily,
              color: secondaryTextColor,
              fontSize: 12,
            )),
      ),
      // home: Stack(
      //   children: [
      //     const Positioned.fill(child: HomeScreen()),
      //     Positioned(bottom: 0, right: 0, left: 0, child: BottomNavigation())
      //   ],
      // ),
      home: const SplashScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int menuIndex = 3;
const double bottomNavigationHeight = 65;

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;
  final List<int> _history = [];

  GlobalKey<NavigatorState> _homeKey = GlobalKey();
  GlobalKey<NavigatorState> _articleKey = GlobalKey();
  GlobalKey<NavigatorState> _searchKey = GlobalKey();
  GlobalKey<NavigatorState> _menuKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    searchIndex: _searchKey,
    menuIndex: _menuKey,
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: bottomNavigationHeight,
              child: IndexedStack(
                index: selectedScreenIndex,
                children: [
                  _navigator(_homeKey, homeIndex, const HomeScreen()),
                  _navigator(_articleKey, articleIndex, const ArticleScreen()),
                  _navigator(_searchKey, searchIndex, const SimpleScreen(tabName: 'Search',)),
                  _navigator(_menuKey, menuIndex, const ProfileScreen()),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: _BottomNavigation(
                selectedIndex: selectedScreenIndex,
                onTap: (int index) {
                  setState(() {
                    _history.remove(selectedScreenIndex);
                    _history.add(selectedScreenIndex);
                    selectedScreenIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedScreenIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => Offstage(
                    offstage: selectedScreenIndex != index, child: child)));
  }
}

class SimpleScreen extends StatelessWidget {
  const SimpleScreen({super.key, required this.tabName, this.screenNumber = 1});
  final String tabName;
  final int screenNumber;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tab: $tabName, Screen #$screenNumber',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SimpleScreen(tabName: tabName,screenNumber: screenNumber+1,),
                ));
              },
              child: const Text('Click Me')),
        ],
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;
  const _BottomNavigation(
      {super.key, required this.onTap, required this.selectedIndex});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: const Color(0xff9b8487).withOpacity(0.3),
                ),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _BottomNavigationItem(
                      iconFileName: 'Home.png',
                      activeIconFileName: 'Home.png',
                      onTap: () {
                        onTap(homeIndex);
                      },
                      isActive: selectedIndex == homeIndex,
                      title: 'Home'),
                  _BottomNavigationItem(
                      iconFileName: 'Articles.png',
                      activeIconFileName: 'Articles.png',
                      onTap: () {
                        onTap(articleIndex);
                      },
                      isActive: selectedIndex == articleIndex,
                      title: 'Articles'),
                  const Expanded(
                    child: SizedBox(
                      width: 8,
                    ),
                  ),
                  _BottomNavigationItem(
                      iconFileName: 'Search.png',
                      activeIconFileName: 'Search.png',
                      onTap: () {
                        onTap(searchIndex);
                      },
                      isActive: selectedIndex == searchIndex,
                      title: 'Search'),
                  _BottomNavigationItem(
                      iconFileName: 'Menu.png',
                      activeIconFileName: 'Menu.png',
                      onTap: () {
                        onTap(menuIndex);
                      },
                      isActive: selectedIndex == menuIndex,
                      title: 'Menu'),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                  height: bottomNavigationHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.5),
                    color: const Color(0xff376AED),
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: Image.asset('assets/img/icons/plus.png')),
            ),
          )
        ],
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;
  final Function() onTap;
  final bool isActive;

  const _BottomNavigationItem(
      {super.key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title,
      required this.onTap,
      required this.isActive});
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/icons/$iconFileName'),
            const SizedBox(
              height: 4,
            ),
            Text(title,
                style: themeData.textTheme.bodySmall!.apply(
                    color: isActive
                        ? themeData.colorScheme.primary
                        : themeData.textTheme.bodySmall!.color))
          ],
        ),
      ),
    );
  }
}
