/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2019/6/9
 * Time: 10:15 AM
 * email: zhu.yan@alibaba-inc.com
 * tartget:
 */
import 'dart:async';
import 'dart:io';
import 'dart:convert';

void main() {
  //printFiles("/Users/ryan/work/ali/github/flutter-study/flutter_web/examples/@ali-flutter-go/lib/widgets/elements");
  //handleFile("/Users/ryan/work/ali/github/flutter-study/flutter_web/examples/@ali-flutter-go/lib/widgets/elements");
  printFilesAync("/Users/ryan/work/ali/github/flutter-study/flutter_web/examples/@ali-flutter-go/lib/widgets/elements");
}

void printFiles(String path){
  try{
    var  directory  =   new Directory(path);
    List<FileSystemEntity> files = directory.listSync();
    if(files.length == 0) {
      print("目录为空！");
      return;
    }
    for(var f in files){
      var bool = FileSystemEntity.isFileSync(f.path);
      print('1::${bool}::${f.path}::${files.length}');
      if(!bool){
        //printFiles(f.path);
      }else{
        File file = new File(f.path+'11111');
        file.createSync();
//        List<String> lines = new File(f.path).readAsLinesSync();
//
//        lines.forEach((l)=>{
//            if(l.trim().indexOf("import 'package:flutter/material.dart'") >=0){
//                print('line: ${f.path}')
//              //file.writeAsBytesSync(utf8.encode('-=-=-=-=-=-=-=-=-=-=-'))
//            }else {
//              //file.writeAsBytesSync(utf8.encode(l))
//            }
//          }
//        );



//        new File(f.path)
//            .openRead()
//            .transform(utf8.decoder)
//            .transform(new LineSplitter())
//            .forEach((l) => {
//              //print('3::${l.trim().indexOf("import 'package:flutter/material.dart'") >=0}')
//                if(l.trim().indexOf("import 'package:flutter/material.dart'") >=0){
//                  print('line: ${f.path}');
//                }else {
//
//                }
//            });


      }
    }
  }catch(e){
    print("目录不存在！");
  }
}

void printFilesAync(String path) async{
  try{
    var  directory  =   new Directory(path);
    List<FileSystemEntity> files = directory.listSync();
    if(files.length == 0) {
      print("目录为空！");
      return;
    }
    //print('2::${files}');
    for(var f in files){
      var bool = FileSystemEntity.isFileSync(f.path);
      if(!bool){
        //print('1::${bool}::${f.path}::${files.length}');
        await printFilesAync(f.path);
      }else if(f.path.indexOf('.dart')!=-1){
        print('2::${bool}::${f.path}::${files.length}');
        var newPath = (f.path).replaceAll(new RegExp(r'.dart'), '-copy.dart');
        File newfile = new File(newPath);
        File oldfile = new File(f.path);

        List<String> lines = oldfile.readAsLinesSync();

        var result = '';
        lines.forEach((l)=>{
          if(l.trim().indexOf('package:flutter/material.dart') >=0){
              result += "import 'package:flutter_web/material.dart';\n"
          }else if(l.trim().indexOf('package:flutter/widgets.dart') >=0){
              result += "import 'package:flutter_web/widgets.dart';\n"
          }else if(l.trim().indexOf('package:flutter/cupertino.dart') >=0){
              result += "import 'package:flutter_web/cupertino.dart';\n"
          }else if(l.trim().indexOf('package:flutter/services.dart') >=0){
              result += "import 'package:flutter_web/services.dart';\n"
          }else if(l.trim().indexOf('package:flutter/rendering.dart') >=0){
              result += "import 'package:flutter_web/rendering.dart';\n"
          }else {
              result += '${l}\n'
          }
        }
        );
        oldfile.writeAsStringSync(result);
        //newfile.writeAsStringSync(result);
        ///await newfile.create();
        //await newfile.create();
        ///file.createSync();
        ///await oldfile.delete();
      }
    }
  }catch(e){
    print("目录不存在！");
  }
}

handleFile(String path) async {
  var  directory  =  await new Directory(path);
  //List<FileSystemEntity> files = directory.listSync();
  //列出所有文件，不包括链接和子文件夹
  Stream<FileSystemEntity> files = directory.list(recursive: false, followLinks: false);

  if(files.length == 0) {
    print("目录为空！");
    return;
  }
  await for(var f in files) {
//    var bool = FileSystemEntity.isFileSync(f.path);
//    print('1::${bool}::${f.path}::${files.length}');
//    if (!bool) {
//      //printFiles(f.path);
//    } else {
//      File file = new File(f.path + '11111');
//      await file.create();
//    }
  }
}