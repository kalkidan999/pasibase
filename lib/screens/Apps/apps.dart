import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pasibase_test/screens/Apps/components/comments.dart';
import 'package:pasibase_test/screens/Apps/components/menu.dart';
import 'package:pasibase_test/services/app_services.dart';
import 'package:pasibase_test/utils/constants.dart';
import 'package:pasibase_test/utils/helpers.dart';
import 'package:provider/provider.dart';


class Apps extends StatefulWidget {
  const Apps({super.key});

  @override
  State<Apps> createState() => _AppsState();
}

class _AppsState extends State<Apps> {
  
  
  @override
  Widget build(BuildContext context) {
    String screenContent = "Lorem ipsum dolor sit amet consectetur. Amet aenean et nunc enim ornare vulputate. Id blandit massa id dictum pellentesque. Nulla vitae aliquam massa lectus tincidunt tortor. Quisque diam.";
    int screenContentLength = screenContent.length;
    return  Consumer<AppServices>(
      builder: (context, appServices, child) {
      
        return Stack(
          children: [
            Container(
                  decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage(ImagesAsset.backgroundImage),
                  fit: BoxFit.cover
                  ))),
            Visibility(
              visible: appServices.isvisble.visibility,
              child: const Positioned(
               left: 20,
               top: 18,
                child: MenuComponent()),
            ),
           Visibility(
              visible: appServices.isvisble.visibility,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: textContent(screenContentLength, screenContent,appServices)
              ),
            ),
        Visibility(
          visible: !appServices.isvisble.visibility,
          child:InkWell(
          onTap: (){
            Provider.of<AppServices>(context, listen: false).show();
                },
            child: Align(
              alignment: Alignment.bottomLeft,child:  SvgPicture.asset(ImagesAsset.unhideIcon)),
          )),
             // Right-side menu
              Visibility(
              visible: appServices.isvisble.visibility,
                 child: Align(
                    alignment: Alignment.bottomRight,
                  child: Container(
                    width: deviceSize(context).width * 0.15,
                    height: deviceSize(context).height * 0.33,
                    color: Colors.transparent,
                    child: reactionIcons(appServices),
                  )),
               )
          ],
        );
      }
    );
    
  } 

  Widget reactionIcons(AppServices appServices) {
    return ListView.builder(
    physics:const NeverScrollableScrollPhysics(),
      itemCount: MyLists.reactionsList.length,
      itemBuilder:(context, index) {
        return InkWell(
          onTap: (){
            if(index == MyLists.reactionsList.length -1 ){
            final appservices = Provider.of<AppServices>(context, listen: false);
              if(appServices.isvisble.visibility){
                appservices.hide();
              }else{
                appservices.show();
              }
          }else if(index == 2){
            Helpers.customModalBottomSheet(context,
             height: deviceSize(context).height * 0.8,
             child: const Comments());
          }},
          child: Container(
            margin: const EdgeInsets.only(bottom:15),
            child: MyLists.reactionsList[index],
          ),
        );
    });
  }         

  Widget textContent(int screenContentLength, String screenContent, AppServices appServices){
     String screenContentLarge = 'Lorem ipsum dolor sit amet consectetur. Eget aenean integer amet sapien arcu urna turpis amet elementum. A nec euismod in quam venenatis. Consectetur et nunc amet mattis dui imperdiet tempus. Et aliquet gravida posuere pretium donec diam nibh sed. Pharetra non vitae urna aliquet egestas. Phasellus at id adipiscing eget. Lorem volutpat dolor lorem pharetra nunc duis lorem integer. Magna in pellentesque pretium elementum suspendisse tincidunt fermentum praesent.\n';
    return  Container(
                margin: EdgeInsets.only(right: deviceSize(context).width * 0.16, left: deviceSize(context).width * 0.04),
                height: appServices.ismoreVisible ?deviceSize(context).height * 0.4:  deviceSize(context).height * 0.17,
                decoration: ShapeDecoration(
                    color:const Color(0xA84C4243),
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 0.50, color: Color(0xFFC4C4C4)),
                        borderRadius: BorderRadius.circular(15),
                    ),
                ),
                child:  Padding(
                  padding: const EdgeInsets.only(top:10, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
              visible:  appServices.ismoreVisible,
               child: Align(
                alignment: Alignment.topRight,
                child: lessOrMoreWidget(appServices.ismoreVisible))
               ),
                      Text(
                           appServices.ismoreVisible ?
                          screenContentLarge:
                          screenContent,
                          style:const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 0,
                          ),
                      ),
                     const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                          '27 Oct. 2020 @5:23pm',
                          style: TextStyle(
                              color: Color(0xFFE5A5A5),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 0,
                ),
            ),
             Visibility(
              visible: screenContentLength > 150 && !appServices.ismoreVisible,
               child: lessOrMoreWidget(appServices.ismoreVisible)
               )
                        ],
                      )
                    ],
                  ),
                ),
                  );
  }

Widget lessOrMoreWidget(bool lessMore){
  return InkWell(
                onTap: (){
              final appservices = Provider.of<AppServices>(context, listen: false);
               lessMore ? appservices.hideMore(): appservices.showMore();
                },
                 child: Container(
                  width: 74,
                  height: 28,
                  decoration: ShapeDecoration(
                      color: const Color(0xCC2B2B2B),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      shadows: const [
                          BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 2,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                          )
                      ]
                  ),
                    child: Row(
                                children: [
                                   Text(
                                    lessMore ? '...Less': 
                                    '...More',
                                    style: const TextStyle(
                                        color: Color(0xFF2CCAA0),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                    ),
                            ),
                            Image(image: AssetImage(lessMore ? ImagesAsset.less: ImagesAsset.more))
                                ],
                              )),
               );
}

    
     
      
      
     
     


}