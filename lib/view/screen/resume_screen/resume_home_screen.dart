import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_builder/core/model/resume_model.dart';
import 'package:resume_builder/utils/colors.dart';
import 'package:resume_builder/utils/icons.dart';
import 'package:resume_builder/utils/text_style.dart';
import 'package:resume_builder/view/widget/common_space_divider_widget.dart';
import 'package:resume_builder/view/widget/common_text_field.dart';

class ResumeHomeScreen extends StatefulWidget {
  const ResumeHomeScreen({Key? key}) : super(key: key);

  @override
  State<ResumeHomeScreen> createState() => _ResumeHomeScreenState();
}

class _ResumeHomeScreenState extends State<ResumeHomeScreen> {
  int i = 0;
  bool j = false;
  TextEditingController txtname = TextEditingController();
  TextEditingController txtlastname = TextEditingController();
  TextEditingController txtprofession = TextEditingController();
  TextEditingController txtadd = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtabout = TextEditingController();
  TextEditingController txtsy = TextEditingController();
  TextEditingController txtey = TextEditingController();
  TextEditingController txtcname = TextEditingController();
  TextEditingController txtcity = TextEditingController();
  TextEditingController txtecity = TextEditingController();
  TextEditingController txtpost = TextEditingController();
  TextEditingController txtskill = TextEditingController();
  TextEditingController txtuni = TextEditingController();
  TextEditingController txtdig = TextEditingController();
  TextEditingController txtpy = TextEditingController();
  var key1 = GlobalKey<FormState>();
  var key2 = GlobalKey<FormState>();
  var key3 = GlobalKey<FormState>();
  var key4 = GlobalKey<FormState>();
  var key5 = GlobalKey<FormState>();
  String? skill,
      uni,
      degree,
      ypass,
      ecity,
      fname,
      lname,
      profession,
      address,
      phone,
      email,
      about,
      syear,
      eyear,
      companyname,
      wcity,
      post;
  String path = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Resume Maker"),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: AppColor.cBrown,
                boxShadow: [
                  BoxShadow(color: AppColor.cBlack12, blurRadius: 3),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        i = 0;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(icnPerson),
                        Text("Info", style: pRegular10),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        i = 1;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(icnWork),
                        Text(
                          "Work",
                          style: pRegular10,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        i = 2;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(icnSchool),
                        Text(
                          "Education",
                          style: pRegular10,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        i = 3;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(icnSetting),
                        Text(
                          "Skills",
                          style: pRegular10,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        i = 4;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(icnAddBox),
                        Text(
                          "Templates",
                          style: pRegular10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IndexedStack(
              index: i,
              children: [
                Box1(),
                Box2(),
                Box3(),
                Box4(),
                Box5(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget Box1() {
    return Container(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: key1,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Personal Information",
                  style: pBold16,
                ),
                Text("Let's get started with personal information",
                    style: pRegular12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add picture to your Resume",
                      style: pRegular15,
                    ),
                    Switch(
                      value: j,
                      onChanged: (value) {
                        setState(() {
                          j = value;
                        });
                      },
                    ),
                  ],
                ),
                (j == true)
                    ? Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              ImagePicker imagePicker = ImagePicker();
                              XFile? xfile = await imagePicker.pickImage(
                                  source: ImageSource.gallery);
                              setState(() {
                                path = xfile!.path;
                              });
                            },
                            child: (path.isEmpty)
                                ? Container(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/profile.png",
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                        Text("Click to add image"),
                                      ],
                                    ),
                                  )
                                : Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.file(
                                      File(path),
                                      fit: BoxFit.cover,
                                    )),
                          ),
                        ],
                      )
                    : verticalSpace(20),
                CommonTextField(
                  controller: txtname,
                  labelText: 'First Name* :',
                  hintText: 'First Name',
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please Enter The Name";
                    }
                    return null;
                  },
                ),
                verticalSpace(10),
                CommonTextField(
                  controller: txtlastname,
                  labelText: 'Last Name* :',
                  hintText: 'Last Name',
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please Enter The Name";
                    }
                    return null;
                  },
                ),
                verticalSpace(10),
                CommonTextField(
                  controller: txtprofession,
                  labelText: 'Profession* :',
                  hintText: 'Profession',
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please Enter The Profession";
                    }
                    return null;
                  },
                ),
                verticalSpace(10),
                CommonTextField(
                  controller: txtadd,
                  labelText: 'Address* :',
                  hintText: 'Address',
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please Enter The Address";
                    }
                    return null;
                  },
                ),
                verticalSpace(10),
                CommonTextField(
                  controller: txtphone,
                  labelText: 'Phone No* :',
                  hintText: 'Phone No',
                  maxLength: 10,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please Enter The Phone Number";
                    }
                    return null;
                  },
                ),
                verticalSpace(10),
                CommonTextField(
                  controller: txtemail,
                  labelText: 'Email* :',
                  hintText: 'Email',
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please Enter The Email";
                    }
                    return null;
                  },
                ),
                verticalSpace(10),
                CommonTextField(
                  controller: txtabout,
                  labelText: 'About me* :',
                  hintText: 'About me',
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "Please Enter The Anout me";
                    }
                    return null;
                  },
                ),
                verticalSpace(15),
                Text(
                  "Social Links",
                  style: pSemiBold16,
                ),
                verticalSpace(10),
                Text(
                  "Twitter",
                  style: pRegular15.copyWith(color: AppColor.cBlack),
                ),
                verticalSpace(10),
                Text(
                  "Facebook",
                  style: pRegular15.copyWith(color: AppColor.cBlack),
                ),
                verticalSpace(10),
                Text(
                  "Instagram",
                  style: pRegular15.copyWith(color: AppColor.cBlack),
                ),
                verticalSpace(20),
                ElevatedButton(
                  onPressed: () {
                    fname = txtname.text;
                    lname = txtlastname.text;
                    profession = txtprofession.text;
                    address = txtadd.text;
                    phone = txtphone.text;
                    email = txtemail.text;
                    about = txtabout.text;
                    setState(() {
                      if (key1.currentState!.validate()) {
                        i = 1;
                      }
                    });
                  },
                  child: Text(
                    "Next",
                    style: pSemiBold14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Box2() {
    return Container(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: key2,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Work Experience",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                verticalSpace(10),
                CommonTextField(
                    controller: txtsy,
                    labelText: 'Starting Year* :',
                    hintText: 'Starting Year',
                    validator: (v) {
                      if (v!.length != 4) {
                        return "Please Enter The Starting Year";
                      }
                      return null;
                    }),
                verticalSpace(
                  10,
                ),
                CommonTextField(
                    controller: txtey,
                    labelText: 'Ending Year* :',
                    hintText: 'Ending Year',
                    validator: (v) {
                      if (v!.length != 4) {
                        return "Please Enter The Ending Year";
                      }
                      return null;
                    }),
                verticalSpace(
                  10,
                ),
                CommonTextField(
                    controller: txtcname,
                    labelText: 'Company Name* :',
                    hintText: 'Company Name',
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please Enter The Company Name";
                      }
                      return null;
                    }),
                verticalSpace(
                  10,
                ),
                CommonTextField(
                    controller: txtcity,
                    labelText: 'City* :',
                    hintText: 'City',
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please Enter The City Name";
                      }
                      return null;
                    }),
                verticalSpace(10),
                CommonTextField(
                    controller: txtpost,
                    labelText: 'Post* :',
                    hintText: 'Post',
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please Enter The Post";
                      }
                      return null;
                    }),
                verticalSpace(20),
                ElevatedButton(
                  onPressed: () {
                    syear = txtsy.text;
                    eyear = txtey.text;
                    companyname = txtcname.text;
                    wcity = txtcity.text;
                    post = txtpost.text;
                    setState(() {
                      if (key2.currentState!.validate()) {
                        i = 2;
                      }
                    });
                  },
                  child: Text(
                    "Next",
                    style: pSemiBold14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Box3() {
    return Container(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: key3,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Education", style: pSemiBold14),
                verticalSpace(15),
                CommonTextField(
                    controller: txtuni,
                    labelText: 'Name of University* :',
                    hintText: 'Name of University',
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please Enter The Name of University";
                      }
                      return null;
                    }),
                verticalSpace(20),
                CommonTextField(
                    controller: txtdig,
                    labelText: 'Degree* :',
                    hintText: ' Degree ',
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please Enter The Degree* ";
                      }
                      return null;
                    }),
                verticalSpace(20),
                CommonTextField(
                    controller: txtpy,
                    labelText: 'Year Of Passing* :',
                    hintText: ' Year Of Passing ',
                    validator: (v) {
                      if (v!.length != 4) {
                        return "Please Enter The Passing Year";
                      }
                      return null;
                    }),
                verticalSpace(20),
                CommonTextField(
                    controller: txtecity,
                    labelText: 'City* :',
                    hintText: 'City',
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please Enter The City Name";
                      }
                      return null;
                    }),
                verticalSpace(20),
                ElevatedButton(
                  onPressed: () {
                    uni = txtuni.text;
                    degree = txtdig.text;
                    ypass = txtpy.text;
                    ecity = txtecity.text;
                    setState(
                      () {
                        if (key3.currentState!.validate()) {
                          i = 3;
                        }
                      },
                    );
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Box4() {
    return Container(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: key4,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CommonTextField(
                    controller: txtskill,
                    labelText: 'Skill* :',
                    hintText: 'Skill',
                    maxLines: 2,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please Enter The Skill";
                      }
                      return null;
                    }),
                verticalSpace(20),
                ElevatedButton(
                  onPressed: () {
                    skill = txtskill.text;
                    setState(() {
                      if (key4.currentState!.validate()) {
                        i = 4;
                      }
                    });
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Box5() {
    return Container(
      width: 300,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: key5,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(color: Colors.black, blurRadius: 2)
                  ]),
                  child: InkWell(
                    onTap: () {
                      ResumeModel m1 = ResumeModel(
                        skill: skill,
                        firstname: fname,
                        lastname: lname,
                        profession: profession,
                        address: address,
                        phone: phone,
                        email: email,
                        about: about,
                        uni: uni,
                        degree: degree,
                        ypass: ypass,
                        ecity: ecity,
                        sy: syear,
                        ey: eyear,
                        cname: companyname,
                        wcity: wcity,
                        post: post,
                        path: path,
                        j: j,
                      );
                      Navigator.pushNamed(context, '1', arguments: m1);
                    },
                    child: Image.asset(
                      "assets/images/free-cv-template-7.jpg",
                      fit: BoxFit.cover,
                      height: 280,
                      width: 200,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(color: Colors.black, blurRadius: 2)
                  ]),
                  child: InkWell(
                    onTap: () {
                      ResumeModel m1 = ResumeModel(
                        skill: skill,
                        firstname: fname,
                        lastname: lname,
                        profession: profession,
                        address: address,
                        phone: phone,
                        email: email,
                        about: about,
                        uni: uni,
                        degree: degree,
                        ypass: ypass,
                        ecity: ecity,
                        sy: syear,
                        ey: eyear,
                        cname: companyname,
                        wcity: wcity,
                        post: post,
                        path: path,
                        j: j,
                      );
                      Navigator.pushNamed(context, '2', arguments: m1);
                    },
                    child: Image.asset(
                      "assets/images/clean-modern-resume-cv-template_237398-297.jpg",
                      fit: BoxFit.cover,
                      height: 280,
                      width: 200,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(color: Colors.black, blurRadius: 2)
                  ]),
                  child: InkWell(
                    onTap: () {
                      ResumeModel m1 = ResumeModel(
                        skill: skill,
                        firstname: fname,
                        lastname: lname,
                        profession: profession,
                        address: address,
                        phone: phone,
                        email: email,
                        about: about,
                        uni: uni,
                        degree: degree,
                        ypass: ypass,
                        ecity: ecity,
                        sy: syear,
                        ey: eyear,
                        cname: companyname,
                        wcity: wcity,
                        post: post,
                        path: path,
                        j: j,
                      );
                      Navigator.pushNamed(context, '3', arguments: m1);
                    },
                    child: Image.asset(
                      "assets/images/Pictorial-CV-template.jpg",
                      fit: BoxFit.cover,
                      height: 280,
                      width: 200,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(color: Colors.black, blurRadius: 2)
                  ]),
                  child: InkWell(
                    onTap: () {
                      ResumeModel m1 = ResumeModel(
                        skill: skill,
                        firstname: fname,
                        lastname: lname,
                        profession: profession,
                        address: address,
                        phone: phone,
                        email: email,
                        about: about,
                        uni: uni,
                        degree: degree,
                        ypass: ypass,
                        ecity: ecity,
                        sy: syear,
                        ey: eyear,
                        cname: companyname,
                        wcity: wcity,
                        post: post,
                        path: path,
                        j: j,
                      );
                      Navigator.pushNamed(context, '4', arguments: m1);
                    },
                    child: Image.asset(
                      "assets/images/outstanding_10.png",
                      fit: BoxFit.cover,
                      height: 280,
                      width: 200,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
