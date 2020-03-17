import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;


class Magic{
    static final db = "db";
       Magic(){
          //writeData("lol","LOL.txt",type: "db");
       }
    static Future<Directory> get localDbDir async {
        final path = await localPath;
        return Directory('$path/$db');
    }
    static Future<String> get localPath async {
      final dir = await getApplicationDocumentsDirectory();
      return dir.path;
    }
    static Future<File> getLocalFile(String fileNameWithFolderPath) async{
         final path = await localPath;
          if(fileNameWithFolderPath.contains("$path")){
            return File(fileNameWithFolderPath);
          }else{
             return File('$path/$fileNameWithFolderPath');
          }
        
    }
    static Future<String> loadAsset(String assetFileFullPath) async {
    return await rootBundle.loadString(assetFileFullPath);
    }

    static Future<File> writeData(String data, String filePath,{String type}) async{
         File file; 
        if(type == null){
          file = await getLocalFile("$filePath");
          
        }
        else if (type == "db"){
         // print(filePath);
            file = await getLocalFile("$db/$filePath");
        }else{
          return null;
        }   
        return file.writeAsString("$data");
    }

    static Future<String> readData(String fileName,{String type}) async{
            File file;
            try{
              if(type == null){
                print(fileName);
                file = await getLocalFile(fileName);
              }
              else if(type == "db"){
                //print(fileName);
                file = await getLocalFile("$db/$fileName");
              }else{
                return null;
              }
              //return null;
               return file.readAsString(); 
          }catch(e){
            print(e.toString());
            return null;
          }
    }
    static Future<void> deleteDbList() async{
    var dir = await localDbDir;
    var lister = dir.list(recursive: false);
    await for (var file in lister) {
      await file.delete();
    }
    }
    static Future<List<String>> dbFileList() async {
    var myList = new List<String>();
    var dir = await localDbDir;
    if(await dir.exists()) return null;
    var lister = dir.list(recursive: false);
    await for (var file in lister) {
      myList.add(file.path);
    }
    return myList;
  }

    static Future<void> createDbFolder() async{
         // String path = await localPath;
          print("1 hi");
          var dir = await localDbDir;
          bool myDirReal = await dir.exists();
          if(myDirReal){
            //
            print("db exist");
          }else{
            dir = await dir.create();
            print("db created");
          }
          print("bye");
    }

} 