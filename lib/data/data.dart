import 'package:flutter/material.dart';

class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc(
      "Evolve is a beautifully simple way to to visualize your breathing \n Use Evolve for daily relaxation,mediation or breath training. \n Thank you for downloading Evolve and taking the first step to control+visualize your breathing");
  sliderModel.setTitle("Tutorial,");
  sliderModel.setImageAssetPath("assets/orange.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc(
      "This area is for your breath cycle settings. \n\n Breathe In | Hold | Breathe Out | Hold \n\n The number values represent seconds and breath holds are optional");
  sliderModel.setTitle("Breath Cycles");
  sliderModel.setImageAssetPath("assets/illustration2.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc(
      "Once you select your settings,press start and your session begins immediately \n Return to the menu anytime by pressing STOP.  \n");
  sliderModel.setTitle("Enjoy !!");
  sliderModel.setImageAssetPath("assets/illustration3.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
