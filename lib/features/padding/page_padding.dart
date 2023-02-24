import 'package:flutter/material.dart';

class PagePadding extends EdgeInsets {
  const PagePadding.allHigh() : super.all(30);
  const PagePadding.allMiddle() : super.all(20);
  const PagePadding.allLow() : super.all(8);
  const PagePadding.onlyPadding() : super.only(top: 10, bottom: 8, left: 30);
  const PagePadding.onlyPaddingHome()
      : super.only(bottom: 5, left: 20, right: 20);
}
