// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:flutter_web/material.dart';

class App extends StatefulWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      //theme: ,
      title: 'Flutter Web Gallery',
      color: Colors.grey,
//      showPerformanceOverlay: _options.showPerformanceOverlay,
//      checkerboardOffscreenLayers: _options.showOffscreenLayersCheckerboard,
//      checkerboardRasterCacheImages: _options.showRasterCacheImagesCheckerboard,
//      routes: _buildRoutes(),
//      builder: (BuildContext context, Widget child) {
//        return Directionality(
//          textDirection: _options.textDirection,
//          child: _applyTextScaleFactor(child),
//        );
//      },
      home: Container(
      width: 34.0,
      height: 34.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'logos/paimaiLogo.png',
            //'logos/paimaiLogo.png',
            //package: _kGalleryAssetsPackage,
          ),
        ),
      ),
    ),
    );
  }
}
