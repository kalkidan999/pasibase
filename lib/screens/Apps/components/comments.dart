import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pasibase_test/models/users.dart';
import 'package:pasibase_test/utils/constants.dart';

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final TextEditingController _commentcontroller = TextEditingController();
  bool showEmojiPicker = false;

  _onBackspacePressed() {
    _commentcontroller
      ..text = _commentcontroller.text.characters.toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _commentcontroller.text.length));
  }

  
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 116,
                      height: 25,
                      decoration: const ShapeDecoration(
                      color: Color(0xFF5F6368),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                          ),
                      ),
                      ),
                      child: const Text(
                      '45k Comments',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.89,
                  fontWeight: FontWeight.w400,
                      ) ) ),          
                    SizedBox(
                      height: deviceSize(context).height * 0.67,
                      width: deviceSize(context).width *0.99,
                      child: ListView.builder(
                        itemCount: Users.commenters.length,
                        itemBuilder:(context, index) {
                          return 
                              ListTile(
                                  leading: CircleAvatar(
                                    maxRadius: 20,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: AssetImage(Users.commenters[index].profilePic)),
                                title: Row(
                                  children: [
                                    Text(
                                      Users.commenters[index].userName,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400)
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    Users.commenters[index].userId,
                                    style: const TextStyle(
                                        color: Color(0xFF5C8DFF),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400
                                    )),
                                  const SizedBox(width: 20),
                                    Text(
                                    "${Users.commenters[index].hoursbefore} hours ago",
                                    style: const TextStyle(
                                        color: Color(0xFFC4C4C4),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                    ))
                                  ],
                                ),
                                subtitle: Column(
                                  children: [
                                    Text(
                                        Users.commenters[index].commentContent,
                                        style: const TextStyle(
                                        color: Color(0xFF757575),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400
                                        )),
                                    const SizedBox(height: 5),
                                    likesandComments(Users.commenters[index].comments, Users.commenters[index].likes)
                                  ],
                                ),
                              );
                             
                           
                        },),),
                    Container(
              width: deviceSize(context).width * 0.99,
              height: deviceSize(context).height * 0.1,
              decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: Color(0xFFC4C4C4)),
                  ),
              ),
            child: Align(
              alignment: Alignment.center,
              child: ListTile(
                    leading: CircleAvatar(
                                    maxRadius: 20,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: AssetImage(ImagesAsset.user5)),
                  title: Container(
              width: deviceSize(context).width * 0.7,
              height: deviceSize(context).height * 0.05,
              decoration: ShapeDecoration(
                 
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 0.50, color: Color(0xFFC4C4C4)),
                      borderRadius: BorderRadius.circular(34),
                  ),
              ),
                child: TextFormField(
                  controller: _commentcontroller,
                  onTap: (){
                    if (showEmojiPicker) {
                          setState(() {
                            showEmojiPicker = false;
                          });
                   } },
                  style: const TextStyle(
                          color: Color(0xFF5F6368),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                  decoration:  InputDecoration(
                    enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    //enabledBorder: ,
                    
                    prefixIcon: IconButton(
                     onPressed: (){
                      setState(() {showEmojiPicker = !showEmojiPicker; });
                     },
                     icon: const Icon(Icons.emoji_emotions, color: Color(0xFF5F6368))),
                    hintText:  'Add comment',
                    suffixIcon: const Icon(Icons.send, color: Color(0xFF5C8DFF)),
                  
                  )
                )
                
            ),
              ),
            ),)
          ],
        )),
         showEmojiPicker
                      ? Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: deviceSize(context).height * 0.3,
                          child: EmojiPicker(
                              onEmojiSelected:(category, emoji) {
                                setState(() {
                                  _commentcontroller.text = _commentcontroller.text + emoji.emoji;
                                   showEmojiPicker = !showEmojiPicker;
                                });
                                
                              },
                              config: const Config(
                                columns: 7,
                                emojiSizeMax: 32.0,
                                verticalSpacing: 0,
                                horizontalSpacing: 0,
                                initCategory: Category.RECENT,
                              ),
                            ),
                        ),
                      )
                      : Container(),
      ],
    );
  }

  Row likesandComments(int? comments, int likes){
    return  Row(children: [
                            SvgPicture.asset(ImagesAsset.comment),
                            const SizedBox(width: 5),
                            comments == null ? const SizedBox.shrink():
                            Text(
                            comments.toString(),
                            style: const TextStyle(
                                color: Color(0xFFC4C4C4),
                                fontSize: 13,
                                fontWeight: FontWeight.w300
                            )),
                          const SizedBox(width: 20),
                          SvgPicture.asset(ImagesAsset.likeIcon),
                          const SizedBox(width: 5),
                          Text(
                            "${likes}K",
                            style: const TextStyle(
                                color: Color(0xFFC4C4C4),
                                fontSize: 13,
                                fontWeight: FontWeight.w300
                            )),
                          const SizedBox(width: 20),
                          SvgPicture.asset(ImagesAsset.flag),
                          ]);
  }

Widget buildSticker() {
  return EmojiPicker(
    config: Config(
    columns: 7,
    buttonMode: ButtonMode.MATERIAL
    ),
    
    onEmojiSelected: (emoji, category) {
      print(emoji);
    },
  );
}

@override
  void dispose() {
    _commentcontroller.dispose();
    super.dispose();
  }
}