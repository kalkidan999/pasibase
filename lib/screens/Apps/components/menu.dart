import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pasibase_test/models/menus.dart';
import 'package:pasibase_test/utils/constants.dart';

class MenuComponent extends StatelessWidget {
  const MenuComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
    icon: SvgPicture.asset(ImagesAsset.menuIcon),
    itemBuilder:
    (BuildContext context) => <PopupMenuEntry<Menu>>[
      
      PopupMenuItem<Menu>(
        
        value:  Menu(svgPicture: SvgPicture.asset(ImagesAsset.menuPost), content: 'Post a Seequl'),
        child: MyLists.menuRows( SvgPicture.asset(ImagesAsset.menuPost), 'Post a Seequl'),
      ),
      PopupMenuItem<Menu>(
        value:  Menu(svgPicture: SvgPicture.asset(ImagesAsset.menuLovepost), content:'View your likes'  ),
        child:  MyLists.menuRows( SvgPicture.asset(ImagesAsset.menuLovepost), 'View your likes'),
      ),
      PopupMenuItem<Menu>(
        value:  Menu(svgPicture: SvgPicture.asset(ImagesAsset.menuSeequl), content:"" ),
        child:   MyLists.menuRows( SvgPicture.asset(ImagesAsset.menuSeequl), 'Your Seequl posts'),
      ),
      PopupMenuItem<Menu>(
        value: Menu(svgPicture: SvgPicture.asset(ImagesAsset.menuReference),content: ""),
        child:  MyLists.menuRows( SvgPicture.asset(ImagesAsset.menuReference), 'Reference contribution'),
      ),
      PopupMenuItem<Menu>(
        value: Menu(svgPicture: SvgPicture.asset(ImagesAsset.menuHashtag),content: ""),
        child: MyLists. menuRows( SvgPicture.asset(ImagesAsset.menuHashtag), 'Hashtag challenges'),
      ),
      PopupMenuItem<Menu>(
        value: Menu(svgPicture: SvgPicture.asset(ImagesAsset.menuNotifications), content: ""),
        child:  MyLists.menuRows( SvgPicture.asset(ImagesAsset.menuNotifications), 'Notifications'),
      ),
      PopupMenuItem<Menu>(
        value:  Menu(svgPicture: SvgPicture.asset(ImagesAsset.menuAbout), content: ""),
        child:   MyLists.menuRows( SvgPicture.asset(ImagesAsset.menuAbout), 'About SeeQul')
      ),
    ],
        );
  }
}