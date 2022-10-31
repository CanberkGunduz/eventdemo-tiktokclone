import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:socialappdemo2/controllers/userController.dart';

class ProfilePage extends GetView<UserController> {
  final myController = Get.put(UserController());
  GetStorage storageBox = GetStorage();
  RxBool readOnly = true.obs;
  GlobalKey textFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope?.unfocus();
        readOnly.value = true;
        storageBox.write("userBio", myController.personalInfoText.string);
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        // drawer: ,
        appBar: AppBar(
          backgroundColor: Color(0xDBD3D3D3),
          elevation: 8,
          title: Text(
            "Profile Page",
            style: TextStyle(
              color: Color(0xAFE00B0B),
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(children: [
          Center(
              child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Container(
              child: Stack(children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  foregroundImage:
                      Image.asset("assets/empty-profile-picture.png").image,
                ),
                Positioned(
                  child: CircleAvatar(
                    child: IconButton(
                      splashRadius: 24,
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt,
                        size: 24,
                        color: Color(0xAFE00B0B).withOpacity(0.6),
                      ),
                    ),
                    backgroundColor: Colors.grey.shade100,
                    radius: 24,
                  ),
                  bottom: 0,
                  right: 0,
                ),
              ]),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Name Surname Age",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xDBD3D3D3),
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8, 8, 8),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Bio",
                          style: TextStyle(
                              fontSize: 22,
                              color: Color(0xAFE00B0B),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          // SizedBox(width: 6,),
                          Expanded(
                              child: Obx(() {
                                return  !readOnly.value ? TextField(
                                  onEditingComplete:() {
                                    readOnly.toggle();
                                    storageBox.write("userBio", myController.personalInfoText.string);
                                  },
                                  key: textFormKey,
                                  readOnly: readOnly.value,
                                  onChanged: (text) {
                                    myController.personalInfoText.value = text;
                                    print(myController.personalInfoText.string);
                                  },
                                  textInputAction: TextInputAction.done,
                                  controller: myController
                                      .userBiographyController,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text("Personality Info"),
                                      hintText: "Write about who you are",
                                      suffixIcon: readOnly.value
                                          ? Container(
                                        width: 0,
                                      )
                                          : IconButton(
                                          onPressed: () {
                                            myController.userBiographyController
                                                .clear();
                                            myController.personalInfoText
                                                .value =
                                            "";
                                            storageBox.write(
                                                "userBio",
                                                myController
                                                    .personalInfoText.string);
                                          },
                                          icon: Icon(Icons.clear))),
                                ) :  Text(myController.personalInfoText.value);

                                //   Obx((){
                                //     if(myController.personalInfoText.isEmpty || editMode){
                                //     return TextField(
                                //     onChanged: (text) {
                                //       myController.personalInfoText.value = text;
                                //       print(myController.personalInfoText.string);
                                //     },
                                //     textInputAction: TextInputAction.done,
                                //     controller: myController.userBiographyController,
                                //     maxLines: null,
                                //     decoration: InputDecoration(
                                //         border: OutlineInputBorder(),
                                //         label: Text("Personality Info"),
                                //         hintText: "Write about who you are",
                                //         suffixIcon: myController.personalInfoText.string.isEmpty
                                //             ? Container(
                                //           width: 0,
                                //         )
                                //             : IconButton(
                                //             onPressed: () {
                                //             myController.userBiographyController.clear();
                                //                 myController.personalInfoText.value="";
                                //             storageBox.write("userBio", myController.personalInfoText.string);},
                                //             icon: Icon(Icons.clear))),
                                //   );}else{ return
                                //   Text(myController.personalInfoText.value);}})
                                //   // child: Text(
                                //   //     "Lorem ipsum dolor sit amet, consectetur adipiscing "
                                //   //     "elit, sed do eiusmod tempor incididunt ut labore "
                                //   //     "et dolore magna aliqua. Ut enim ad minim veniam"),
                                // ),
                                // IconButton(onPressed: (){editMode = true;}, icon: Icon(Icons.edit))
                              })),
                          IconButton(onPressed: (){readOnly.toggle();}, icon: Icon(Icons.edit))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: TextField(
            //     onChanged: (text){
            //       personalInfoText = text;
            //     },
            //     maxLines: null,
            //     controller: profileTextController,
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(),
            //         label: Text("Personality Info"),
            //         hintText: "Write about who you are",
            //         suffixIcon: profileTextController.text.isEmpty
            //             ? Container(
            //                 width: 0,
            //               )
            //             : IconButton(
            //                 onPressed: () => profileTextController.clear(),
            //                 icon: Icon(Icons.clear))),
            //   ),
            // )
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xDBD3D3D3),
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Previous Events",
                          style: TextStyle(
                              fontSize: 22,
                              color: Color(0xAFE00B0B),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image(
                              image:
                                  Image.asset("assets/tabletennis.jpg").image)),
                      SizedBox(
                        height: 8,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image(
                              image: Image.asset("assets/music.jpg").image)),
                      SizedBox(
                        height: 8,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image(
                              image: Image.asset("assets/tennis.jpg").image)),
                    ],
                  ),
                ),
              ),
            ),
          ])),
        ]),
      ),
    );
  }
}
