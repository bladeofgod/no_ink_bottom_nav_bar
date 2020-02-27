

import 'package:flutter/material.dart';


import 'bottom_nav_bar_no_ink.dart';
import 'community_page.dart';
import 'find_page.dart';
import 'home_page.dart';
import 'mine_page.dart';



class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainPageState();
  }

}

class MainPageState extends State<MainPage> {


  var pageController = PageController();
  int selectIndex = 0;
  List<Widget> pages = [
    HomePage(),
    FindPage(),
    CommunityPage(),
    MinePage()
  ];

  DateTime lastPress;

  List<BottomNavigationBarItem> itemList ;

  @override
  void initState() {
    super.initState();
    itemList = [
      BottomNavigationBarItem(
        icon: Icon(Icons.home,),
        activeIcon: Icon(Icons.home,color: Colors.red,),
        title: Text("首页",style: TextStyle(fontSize: 20),),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_balance,),
        activeIcon: Icon(Icons.account_balance,color: Colors.red,),
        title: Text("找房",style: TextStyle(fontSize: 20),),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings_input_component,),
        activeIcon: Icon(Icons.settings_input_component,color: Colors.red,),
        title: Text("社区",style: TextStyle(fontSize:20),),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home,),
        activeIcon: Icon(Icons.home,color: Colors.red,),
        title: Text("我的",style: TextStyle(fontSize: 20),),
      ),
    ];
  }

  jumpPageByIndex(int index){
    pageController.jumpToPage(index);
  }







  @override
  Widget build(BuildContext context) {

    return Material(
      //theme: ThemeData(splashFactory: NoInkWellFactory()),
      child:Scaffold(
        body: WillPopScope(
          onWillPop: ()async{
            if(lastPress  == null
                || DateTime.now().difference(lastPress) > Duration(seconds: 1)){
              lastPress = DateTime.now();
              return false;
            }
            return true;
          },
          child: Column(
            children: <Widget>[
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: pages,
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (index){
                    setState(() {
                      selectIndex = index;
                    });
                  },
                ),
              ),
              ///bottom bar
              Container(
                height: 100,
                child: BottomNavBarNoInk(width: double.infinity,
                    height: 60,
                    items: itemList,
                    currentIndex: selectIndex,
                onTap: (index){
                  jumpPageByIndex(index);
                },),
              )
            ],
          )
        ),
//        bottomNavigationBar: BottomNavigationBar(
//          type: BottomNavigationBarType.fixed,
//          selectedFontSize: getSp(12),
//          unselectedFontSize: getSp(12),
//          items: <BottomNavigationBarItem>[
//
//          ],
//          currentIndex: selectIndex,
//          onTap: (index){
//            jumpPageByIndex(index);
//          },
//        ),
      ) ,
    );
  }

//  Widget generateBarItem({@required Widget icon,@required Widget activeIcon,@required Widget title}){
//    return Container
//  }








}





















