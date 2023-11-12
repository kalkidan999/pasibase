import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Size deviceSize(BuildContext context) => MediaQuery.of(context).size;


class SizeConfig {
  static double textXXXXLarge(BuildContext context) =>
      deviceSize(context).height * 0.05;
  static double textXXXLarge(BuildContext context) =>
      deviceSize(context).height * 0.032;
  static double textXXLarge(BuildContext context) =>
      deviceSize(context).height * 0.027;
  static double textXLarge(BuildContext context) =>
      deviceSize(context).height * 0.023;
  static double textLarge(BuildContext context) =>
      deviceSize(context).height * 0.021;
  static double textBig(BuildContext context) =>
      deviceSize(context).height * 0.02;
  static double textMedium(BuildContext context) =>
      deviceSize(context).height * 0.02;
  static double textSmall(BuildContext context) =>
      deviceSize(context).height * 0.016;
  static double textTiny(BuildContext context) =>
      deviceSize(context).height * 0.014;
  static double formInputWidth(BuildContext context) =>
      deviceSize(context).width * 0.6;
  static double formBtnWidth(BuildContext context) =>
      deviceSize(context).width * 0.5;
  static double formInputLabel(BuildContext context) => textMedium(context);
  static double formInputIcon(BuildContext context) =>
      formInputLabel(context) + 2;
  static double backIcon(BuildContext context) =>
      deviceSize(context).height * 0.12;
}

class ImagesAsset {
  static String appsIcon = 'assets/icons/apps.svg';
  static String arrowrightIcon = 'assets/icons/arrow_right.svg';
  static String filterIcon = 'assets/icons/filter.svg';
  static String galleryIcon = 'assets/icons/gallery.svg';
  static String hideIcon = 'assets/icons/hide.svg';
  static String loveIcon = 'assets/icons/love.svg';
  static String likeIcon = 'assets/icons/like.svg';
  static String menuIcon = 'assets/icons/menu.svg';
  static String menuContentIcon = 'assets/icons/menu_content.svg';
  static String commentIcon = 'assets/icons/comment.svg';
  static String comment = 'assets/icons/commentHere.svg';
  static String flag = 'assets/icons/flag.svg';
  static String organizeIcon = 'assets/icons/organize.svg';
  static String profileIcon = 'assets/icons/profile.svg';
  static String quconIcon = 'assets/icons/qucon.svg';
  static String searchIcon = 'assets/icons/search.svg';
  static String shareIcon = 'assets/icons/share.svg';
  static String unhideIcon = 'assets/icons/unhide.svg';
  static String userIcon = 'assets/images/user.png';
  static String zaddyIcon = 'assets/icons/zaddy.svg';
  static String backgroundImage = 'assets/images/background.png';
  static String more = 'assets/images/more.png';
  static String less = 'assets/images/less.png';
  static String menuAbout = 'assets/icons/menuIcons/about.svg';
  static String menuHashtag = 'assets/icons/menuIcons/hashtag.svg';
  static String menuLovepost = 'assets/icons/menuIcons/lovepost.svg';
  static String menuNotifications = 'assets/icons/menuIcons/notifications.svg';
  static String menuPost = 'assets/icons/menuIcons/post.svg';
  static String menuReference = 'assets/icons/menuIcons/reference.svg';
  static String menuSeequl = 'assets/icons/menuIcons/seequl.svg';
  static String user1 = 'assets/images/user1.png';
  static String user2 = 'assets/images/user2.png';
  static String user3 = 'assets/images/user3.png';
  static String user4 = 'assets/images/user4.png';
  static String user5 = 'assets/images/user5.png';
  static String emoji = 'assets/icons/emoji.svg';
  static String send = 'assets/icons/send.svg';
}

class MyLists {
  static List<dynamic> reactionsList =[
     CircleAvatar(
      maxRadius: 20,
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage(ImagesAsset.userIcon)),
      SvgPicture.asset(ImagesAsset.menuContentIcon),
      SvgPicture.asset(ImagesAsset.commentIcon),
      SvgPicture.asset(ImagesAsset.loveIcon),
      SvgPicture.asset(ImagesAsset.shareIcon),
      SvgPicture.asset(ImagesAsset.hideIcon),
  ];

  static Row menuRows(SvgPicture svgPicture, String content){
   return Row(
      children: [
        svgPicture,
        const SizedBox(width: 15),
       Text(
    content,
    style: const TextStyle(
        color: Color(0xFF524C4C),
        fontSize: 15,
        fontWeight: FontWeight.w400,
    ),
)
      ],
    );
  }
}