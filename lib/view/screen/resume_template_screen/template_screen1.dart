import 'dart:io';

import 'package:flutter/material.dart';
import 'package:resume_builder/core/model/resume_model.dart';
import 'package:resume_builder/view/screen/resume_screen/resume_screen1.dart';


class TemplateScreen1 extends StatefulWidget {
  const TemplateScreen1({Key? key}) : super(key: key);

  @override
  State<TemplateScreen1> createState() => _TemplateScreen1State();
}

class _TemplateScreen1State extends State<TemplateScreen1> {
  @override
  Widget build(BuildContext context) {
    ResumeModel data = ModalRoute.of(context)!.settings.arguments as ResumeModel;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Your CV"),
          actions: [
            InkWell(
                onTap: (){
                  setState(() {
                    resumeScreen1(data);
                  });
                },
                child: Icon(Icons.save)),
          ],
        ),
        body: Row(
          children: [
            Container(
              height: 710,
              width: 140,
              color: Color(0xff283548),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: (data.j == true)
                            ? CircleAvatar(
                          radius: 200,
                          backgroundImage: FileImage(File(data.path!)),
                        )
                            : CircleAvatar(
                          backgroundImage: AssetImage("assets/images/profile.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "CONTACT",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      height: 1.5,
                      width: 150,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Phone",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${data.phone}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.mail,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Mail",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${data.email}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Address",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${data.address}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "SKILLS",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      height: 1.5,
                      width: 150,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "${data.skill}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 773,
              width: 220,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${data.firstname} ${data.lastname}",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${data.profession}",
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Hello,I'm ${data.firstname}",
                      style: TextStyle(
                          color: Color(0xff283548),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${data.about}",
                      style: TextStyle(
                        color: Color(0xff283548),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "EXPERIENCE",
                      style: TextStyle(
                          color: Color(0xff283548),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Container(
                      height: 1.5,
                      width: 150,
                      color: Color(0xff283548),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Starting Year",
                          style: TextStyle(
                              color: Color(0xff283548),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${data.sy}",
                          style: TextStyle(color: Color(0xff283548)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Ending Year",
                          style: TextStyle(
                              color: Color(0xff283548),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${data.ey}",
                          style: TextStyle(color: Color(0xff283548)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Company Name | Location",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff283548),
                          ),
                        ),
                        Text(
                          "${data.cname}",
                          style: TextStyle(color: Color(0xff283548)),
                        ),
                        Text(
                          "${data.ecity}",
                          style: TextStyle(color: Color(0xff283548)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Post",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff283548),
                          ),
                        ),
                        Text(
                          "${data.post}",
                          style: TextStyle(color: Color(0xff283548)),
                        ),
                      ],
                    ),
                    Text(
                      "EDUCATION",
                      style: TextStyle(
                          color: Color(0xff283548),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Container(
                      height: 1.5,
                      width: 150,
                      color: Color(0xff283548),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Passing Year",
                          style: TextStyle(
                              color: Color(0xff283548),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${data.ypass}",
                          style: TextStyle(color: Color(0xff283548)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "University Name | Location",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff283548),
                          ),
                        ),
                        Text(
                          "${data.uni}",
                          style: TextStyle(color: Color(0xff283548)),
                        ),
                        Text(
                          "${data.ecity}",
                          style: TextStyle(color: Color(0xff283548)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Degree",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff283548),
                          ),
                        ),
                        Text(
                          "${data.degree}",
                          style: TextStyle(color: Color(0xff283548)),
                        ),
                      ],
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