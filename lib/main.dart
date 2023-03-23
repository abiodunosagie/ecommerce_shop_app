import 'package:ecommerce_shop_app/constants/app_style.dart';
import 'package:ecommerce_shop_app/screens/account_screen.dart';
import 'package:ecommerce_shop_app/screens/favourite.dart';
import 'package:ecommerce_shop_app/screens/homescreen.dart';
import 'package:ecommerce_shop_app/screens/login_page.dart';
import 'package:ecommerce_shop_app/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatefulWidget {
  const EcommerceApp({Key? key}) : super(key: key);

  @override
  State<EcommerceApp> createState() => _EcommerceAppState();
}

class _EcommerceAppState extends State<EcommerceApp> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const LoginPage(),
    const FavoriteScreen(),
    const AccountScreen(),
  ];
  final ScrollController _scrollController = ScrollController();
  bool _showBackToTopButton = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _showBackToTopButton = _scrollController.offset >= 500;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //routes
      routes: {
        '/home': (context) => _pages[0],
        '/loginpage': (context) => _pages[1],
        '/favorites': (context) => _pages[2],
        '/account': (context) => _pages[3],
      },

      home: Scaffold(
        body: _pages[_currentIndex],

        //bottom navigation bar
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: 64,
          child: CustomNavigationBar(
            isFloating: true,
            borderRadius: const Radius.circular(40),
            selectedColor: kWhite,
            unSelectedColor: kGrey,
            backgroundColor: kBrown,
            strokeColor: Colors.transparent,
            scaleFactor: 0.1,
            iconSize: 40,
            items: [
              CustomNavigationBarItem(
                icon: _currentIndex == 0
                    ? SvgPicture.asset('assets/home_icon_selected.svg')
                    : SvgPicture.asset('assets/home_icon_unselected.svg'),
              ),
              CustomNavigationBarItem(
                icon: _currentIndex == 1
                    ? SvgPicture.asset('assets/cart_icon_selected.svg')
                    : SvgPicture.asset('assets/cart_icon_unselected.svg'),
              ),
              CustomNavigationBarItem(
                icon: _currentIndex == 2
                    ? SvgPicture.asset('assets/favorite_icon_selected.svg')
                    : SvgPicture.asset('assets/favorite_icon_unselected.svg'),
              ),
              CustomNavigationBarItem(
                icon: _currentIndex == 3
                    ? SvgPicture.asset('assets/account_icon_selected.svg')
                    : SvgPicture.asset('assets/account_icon_unselected.svg'),
              ),
            ],
            blurEffect: true,
            opacity: 0.9,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(
                () {
                  _currentIndex = index;
                },
              );
            },
            elevation: 5,
          ),
        ),
      ),
    );
  }
}
