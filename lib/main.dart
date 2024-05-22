
import 'package:flutter/material.dart';
import 'package:resume_builder/view/screen/resume_template_screen/template_screen1.dart';
import 'package:resume_builder/view/screen/resume_template_screen/template_screen2.dart';
import 'package:resume_builder/view/screen/resume_template_screen/template_screen3.dart';
import 'package:resume_builder/view/screen/resume_template_screen/template_screen4.dart';
import 'package:sizer/sizer.dart';
import 'view/screen/resume_screen/resume_home_screen.dart';

void main()
{
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/':(context) => ResumeHomeScreen(),
            '1':(context) => TemplateScreen1(),
            '2':(context) => TemplateScreen2(),
            '3':(context) => TemplateScreen3(),
            '4':(context) => TemplateScreen4(),
          },
        );


      },
    ),
  );
}
