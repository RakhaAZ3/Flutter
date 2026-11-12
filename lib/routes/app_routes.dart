import 'package:belajar_flutter/Toko/daftar.dart';
import 'package:belajar_flutter/container/ContainerLatihan.dart';
import 'package:belajar_flutter/container/ContainerSatu.dart';
import 'package:belajar_flutter/form/form.dart';
import 'package:belajar_flutter/form1/input-form.dart';
import 'package:belajar_flutter/form1/latihan-input.dart';
import 'package:belajar_flutter/grid_view/GridViewBuilder.dart';
import 'package:belajar_flutter/grid_view/GridViewCount.dart';
import 'package:belajar_flutter/grid_view/GridViewCustom.dart';
import 'package:belajar_flutter/list_view/ListViewSimple.dart';
import 'package:belajar_flutter/pages/about_page.dart';
import 'package:belajar_flutter/pages/comment_page.dart';
import 'package:belajar_flutter/pages/fetch_api_page.dart';
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
  static const form = '/form';
  static const form1 = '/form1';
  static const latihan = '/latihan';
  static const toko = '/toko';
  static const album = '/album';
  static const comment = '/comment';

  static Map<String, WidgetBuilder> routes ={
    home:(context) => HomePage(),
    about:(context) => About(),
    listbasic:(context) => Listviewsederhana(),
    container1:(context) => ContainerSatu(),
    containerlatihan:(context) => ContainerLatihan(),
    gridviewbuilder:(context) => GridViewBuilder(),
    gridviewcount:(context) => GridViewCount(),
    gridviewcustom:(context) => GridViewCustom(),
    form:(context) => formulir(),
    form1:(context) => BelajarForm(),
    latihan:(context) => latihan_input(),
    toko:(context) => DaftarItemPage(),
    album:(context) => AlbumPage(),
    comment:(context) => CommentPage(),
  };
}