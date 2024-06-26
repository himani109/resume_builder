import 'dart:io';

import 'package:flutter/material.dart';
import 'package:resume_builder/core/model/resume_model.dart';
import 'package:resume_builder/view/screen/resume_screen/resume_screen3.dart';

class TemplateScreen3 extends StatefulWidget {
  const TemplateScreen3({Key? key}) : super(key: key);

  @override
  State<TemplateScreen3> createState() => _TemplateScreen3State();
}

class _TemplateScreen3State extends State<TemplateScreen3> {
  @override
  Widget build(BuildContext context) {
    ResumeModel data3=ModalRoute.of(context)!.settings.arguments as ResumeModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Your CV"),
          actions: [
            InkWell(
                onTap: (){
                  setState(() {
                    resumeScreen3(data3);
                  });
                },
                child: Icon(Icons.save)),
          ],
        ),
        body: Stack(
          children: [
            Row(
              children: [
                Container(
                  height: 773,
                  width: 140,
                  color: Color(0XFF2E75B7),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 120,
                        ),
                        Text(
                          "CONTACT",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Email",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${data3.email}",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Contact No.",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${data3.phone}",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "EDUCATION",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "University name",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${data3.uni}",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Passing Year",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${data3.ypass}",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "City",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${data3.ecity}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 773,
                  width: 220,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 120,
                        ),
                        Text(
                          "ABOUT ME",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "${data3.about}",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "EXPERIENCE",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Year",
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${data3.sy} - ${data3.ey}",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Company Name & Location",
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "I Work in ${data3.cname} , Which Located in ${data3.wcity}",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "SKILLS",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "${data3.skill}",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 100,
                width: 400,
                color: Color(0xffB4C7E7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data3.firstname} ${data3.lastname}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${data3.profession}",
                            style: TextStyle(
                                color: Colors.white70, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      color: Color(0xffB4C7E7),
                      child: (data3.j == true)
                          ? Image.file(File(data3.path!),height: 100,width: 100,fit: BoxFit.cover,)
                          : Image.asset(
                        "assets/images/profile.png",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}