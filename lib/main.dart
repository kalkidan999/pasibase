import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pasibase_test/screens/Apps/apps.dart';
import 'package:pasibase_test/screens/organize.dart';
import 'package:pasibase_test/screens/profile.dart';
import 'package:pasibase_test/screens/qucon.dart';
import 'package:pasibase_test/screens/zaady.dart';
import 'package:pasibase_test/services/app_services.dart';
import 'package:pasibase_test/utils/constants.dart';
import 'package:pasibase_test/utils/styles.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
       create: (context) => AppServices(),
      child:  MaterialApp(
              title: 'PasiBase Demo',
               theme: AppTheme.themeData(context),
              home: const MyHomePage(),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
      const Apps(),
      const Qucon(),
      const Zaady(),
      const Organize(),
      const Profile()
    ];

  @override
  Widget build(BuildContext context) {
    Color selectedIconTheme = Theme.of(context).bottomNavigationBarTheme.selectedItemColor ?? const Color(0xFFFFDD5E);
     Color unselectedIconTheme = Theme.of(context).bottomNavigationBarTheme.unselectedItemColor ?? const Color(0xFFFFFFFF);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading:
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SvgPicture.asset(ImagesAsset.galleryIcon)
        ),
        title: Row(
          children: [
            Text(
                  'SeeQul',
                  textAlign: TextAlign.center,
                  style: AppTheme.customtitleSmall(context).copyWith(
                    color: const Color(0xFF5F6368),
                    fontWeight: FontWeight.w400)),
            const SizedBox(width: 10),
            SvgPicture.asset(
              ImagesAsset.arrowrightIcon)
          ]
        ),
        actions: [
          SvgPicture.asset(
              ImagesAsset.searchIcon),
            const SizedBox(width: 30),
            SvgPicture.asset(
              ImagesAsset.filterIcon),
            const SizedBox(width: 40),
        ],
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
           BottomNavigationBarItem(
            icon:  SvgPicture.asset(ImagesAsset.appsIcon, color: unselectedIconTheme),
            activeIcon:   SvgPicture.asset(ImagesAsset.appsIcon,color: selectedIconTheme,),
            label: "Apps",
          ),
          BottomNavigationBarItem(
            icon:  SvgPicture.asset(ImagesAsset.quconIcon,color: unselectedIconTheme),
            activeIcon:  SvgPicture.asset(ImagesAsset.quconIcon,color: selectedIconTheme),
            label: "Qucon",
          ),
          BottomNavigationBarItem(
            icon:  SvgPicture.asset(ImagesAsset.zaddyIcon, color: unselectedIconTheme),
            activeIcon:  SvgPicture.asset(ImagesAsset.zaddyIcon, color: selectedIconTheme),
            label: "Zaddy",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(ImagesAsset.organizeIcon, color: unselectedIconTheme),
            activeIcon:  SvgPicture.asset(ImagesAsset.organizeIcon, color: selectedIconTheme),
            label: "Organize",
          ),
           BottomNavigationBarItem(
            icon:  SvgPicture.asset(ImagesAsset.profileIcon, color: unselectedIconTheme,),
            activeIcon:  SvgPicture.asset(ImagesAsset.profileIcon, color: selectedIconTheme,),
            label: "Profile",
          ),
         ],
        // showSelectedLabels: true,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      )
    );
  }
  
}
