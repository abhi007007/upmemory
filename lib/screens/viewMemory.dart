import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upmemory/screens/addmemory/voicerecord/recoredlist.dart';
import 'package:upmemory/themeColorIcons/colors.dart';

import '../themeColorIcons/theme.dart';

class ViewMemory extends StatelessWidget {
  final DocumentSnapshot doc;
  ViewMemory({Key? key, required this.doc}) : super(key: key);

  Widget build(BuildContext context) {
    var _screensize = MediaQuery.of(context).size;
    List<dynamic> text = doc.get('memoryText');
    List<dynamic> images = doc.get('memoryImages');
    List<dynamic> voices = doc.get('memoryVoice');
    bool isUpdated = doc.get('isUpdated') as bool;
    var updatetime = doc.get('memoryDateupdated');
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: ColorsS.primaryGradient,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(150, 7),
              bottomRight: Radius.elliptical(150, 7)),
        ),
        title: Text(
          "view memory",
          style: TextStyle(color: foregroundColor),
        ),
        actions: [],
      ),
      body: Column(
        children: [
          isUpdated
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "last updated time  " + updatetime,
                    style: TextStyle(fontSize: 16),
                  ),
                )
              : SizedBox(),
          Expanded(
              child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    text[index].toString(),
                  ));
            },
            itemCount: text.length,
          )),
          Container(
            height: _screensize.height * 0.5,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Image.network(
                    images[index],
                    fit: BoxFit.fill,
                  ),
                );
              },
              itemCount: images.length,
            ),
          ),
          Expanded(
            child: RecordListView(
              records: voices,
              isNetwork: true,
            ),
          ),
        ],
      ),
    );
  }
}
