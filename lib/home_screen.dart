import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobilebgs/addsub_page.dart';
import 'package:mobilebgs/evenodd_page.dart';
import 'package:mobilebgs/group_page.dart';
import 'package:mobilebgs/login_screen.dart';

class HomeScreen extends StatelessWidget {
  var height, width;

  List imgData = [
    "assets/images/dadu.png",
    "assets/images/plusmin.png",
    "assets/images/tim.png",
  ];

  List dataTitle = [
    "Even / Odd",
    "Add & Subtract",
    "Group Data"
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.indigo,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(),
                height: height * 0.20,
                width: width,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 70,
                        left: 15,
                        right: 15,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Dashboard',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    ),
                  ),
                  // height: height,
                  width: width,
                  padding: EdgeInsets.only(bottom: 20),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 25,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: imgData.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          if(index == 0){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return EvenOddPage();
                            }));
                          }
                          else if(index == 1){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return AddSubPage();
                            }));
                          }
                          else if(index == 2){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return GroupPage();
                            }));
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                  imgData[index],
                                  width: 200,
                              ),
                              Text(
                                  dataTitle[index],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
