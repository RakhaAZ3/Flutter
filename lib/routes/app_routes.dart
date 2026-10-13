import 'package:belajar_flutter/container/ContainerLatihan.dart';
import 'package:belajar_flutter/container/ContainerSatu.dart';
import 'package:belajar_flutter/grid_view/GridViewBuilder.dart';
import 'package:belajar_flutter/grid_view/GridViewCount.dart';
import 'package:belajar_flutter/grid_view/GridViewCustom.dart';
import 'package:belajar_flutter/list_view/ListViewSimple.dart';
import 'package:belajar_flutter/pages/about_page.dart';
import 'package:belajar_flutter/pages/home_page.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  static const home = '/';
  static const about = '/about';
  static const listbasic = '/list-basic';
  static const container1 = '/containersatu';
  static const containerlatihan = '/containerlatihan';
  static const gridviewbuilder = '/gridviewbuilder';
  static const gridviewcount = '/gridviewcount';
  static const gridviewcustom = '/gridviewcustom';

  static Map<String, WidgetBuilder> routes ={
    home:(context) => HomePage(),
    about:(context) => About(),
    listbasic:(context) => Listviewsederhana(),
    container1:(context) => ContainerSatu(),
    containerlatihan:(context) => ContainerLatihan(),
    gridviewbuilder:(context) => GridViewBuilder(),
    gridviewcount:(context) => GridViewCount(),
    gridviewcustom:(context) => GridViewCustom(),
  };
}