/// Author: Insofan
/// Github: https://github.com/Insofan
/// Email: insofan3156@gmail.com
/// Created: 2019/04 

import 'package:flutter/material.dart';
import 'dart:ui' as ui show window;

class ScreenKit {

  double _designW;
  double _designH;
  bool _ableFontScale;

  static MediaQueryData _mediaQueryData;
  static double _pixelRatio;
  static double _textScaleFactor;
  static double _screenW;
  static double _screenH;
  static double _statusBarH;
  static double _bottomBarH;
  static double _appBarH;


  static ScreenKit _instance;

  static ScreenKit get instance => _instance;

  static MediaQueryData get mediaQueryData => _mediaQueryData;

  static double get textScaleFactor => _textScaleFactor;

  static double get pixelRatio => _pixelRatio;

  get scaleW => _screenW / instance._designW;

  get scaleH => _screenH / instance._designH;

  static double get screenW => _screenW;

  static double get screenH => _screenH;

  static double get screenWPx => _screenW * _pixelRatio;

  static double get screenHPx => _screenH * _pixelRatio;

  static double get statusBarH => _statusBarH;

  static double get bottomBarH => _bottomBarH;

  static double get appBarH => _appBarH;

  ScreenKit({
    double designW,
    double designH,
    bool ableFontScale
  }) {
    _designW = designW ?? 375;
    _designH = designH ?? 667;
    _ableFontScale = ableFontScale ?? false;

    _mediaQueryData = MediaQueryData.fromWindow(ui.window);
    _screenW = _mediaQueryData.size.width;
    _screenH = _mediaQueryData.size.height;
    _statusBarH = _mediaQueryData.padding.top;
    _bottomBarH = _mediaQueryData.padding.bottom;
    _pixelRatio = _mediaQueryData.devicePixelRatio;
    _textScaleFactor = _mediaQueryData.textScaleFactor;
    _appBarH = kToolbarHeight;

  }

  static void init({
    @required double designW,
    @required double designH,
    bool ableFontScale
  }) {
    if (_instance == null) {
      _instance = new ScreenKit(
          designW: designW,
          designH: designH,
          ableFontScale: ableFontScale
      );
    }
  }

  setWidth(double w) => w * scaleW;

  setHeight(double h) => h * scaleH;

  setFontSize(double fontSize) => _ableFontScale
          ? setWidth(fontSize)
          : setWidth(fontSize) / _textScaleFactor;

}

