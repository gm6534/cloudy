import 'dart:io';

import 'package:cloudy/Pages/LogInScreen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'RangeSelector.dart';





class BrowseScreen extends StatefulWidget {
  const BrowseScreen({Key? key}) : super(key: key);

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  List<File> selectedFile = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Constants.prefs?.setBool("loggedIn", true);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal.shade800),
              padding: EdgeInsets.zero,
                child: Center(
                  child: Text("Drawer Header"),
                )
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RangeSelectorScreen()));
              },
              title: Text("Date Range"),
            ),
            Spacer(),
            ListTile(
              onTap: (){
                // Constants.prefs?.setBool("loggedIn", false);
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LogInScreen()), (route) => false);
              },
              tileColor: Colors.red,
              leading: Icon(Icons.logout, color: Colors.white, size: 25,),
              title: Text("Log Out", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal.shade800,
        title: Text("Pick Files"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              tooltip: "Clear All",
              onPressed: () {
                setState(() {
                  selectedFile.clear();
                });
              },
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: selectedFile.length > 0
                    ? SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Wrap(
                              spacing: 6,
                              children: List.generate(
                                selectedFile.length,
                                (index) => Chip(
                                  label: Text(
                                    selectedFile[index].toString(),
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  onDeleted: () {
                                    setState(() {
                                      selectedFile.removeAt(index);
                                    });
                                  },
                                ),
                              )),
                        ),
                      )
                    : Center(
                        child: Text("Select File First"),
                      )),
            SizedBox(
              height: 30,
            ),

            ///Select Files Button
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey)),
                onPressed: () async {
                  print("syncing");
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(allowMultiple: true);

                  if (result != null) {
                    List<File> files =
                        result.names.map((name) => File(name!)).toList();
                    if (selectedFile.isEmpty) {
                      setState(() {
                        selectedFile = files;
                      });
                    } else {
                      setState(() {
                        selectedFile.addAll(files);
                      });
                    }
                  } else {
                    // User canceled the picker
                  }
                },
                child: Text("Select Files")),
            SizedBox(
              height: 10,
            ),

            ///Upload Files Button
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.teal.shade700)),
                onPressed: () {},
                child: Text("Upload Files")),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
