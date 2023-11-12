import 'package:pasibase_test/utils/constants.dart';

class Users{
  String userName;
  String userId;
  String profilePic;
  String commentContent;
  int? comments;
  int likes;
  int? flags;
  int replies;
  int hoursbefore;

  Users({
    required this.userName,
    required this.userId,
    required this.profilePic,
    required this.commentContent,
    this.comments,
    required this.likes,
    this.flags,
    required this.replies,
    required this.hoursbefore
  });

  static List<Users> commenters = <Users>[
    Users(
      userName: "Kerry Johns", 
      userId: "@Kerryjo", 
      profilePic: ImagesAsset.user1,
      commentContent: 'Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper amet justo quisque ullamcorper volutpat. Donec feugiat diam et tellus in habitant viverra duis. ',
      comments: 15, likes: 7, replies: 15, hoursbefore: 3),
      Users(
      userName: "Kerry Johns", 
      userId: "@Kerryjo", 
      profilePic:  ImagesAsset.user2,
      commentContent: 'Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper amet justo duis. ',
       likes: 7, replies: 15, hoursbefore: 8),
       Users(
      userName: "Kerry Johns", 
      userId: "@Kerryjo", 
      profilePic:  ImagesAsset.user3,
      commentContent: 'Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper amet justo quisque ullamcorper volutpat. Donec feugiat diam et tellus in habitant viverra duis. ',
      comments: 15,
      likes: 7, replies: 15, hoursbefore: 3),
      Users(
      userName: "Kerry Johns", 
      userId: "@Kerryjo", 
      profilePic: ImagesAsset.user4,
      commentContent: 'Lorem ipsum dolor sit amet consectetur. Aliquam sagittis ullamcorper amet justo duis. ',
      likes: 0, replies: 0, hoursbefore: 8),
  ];
  
}