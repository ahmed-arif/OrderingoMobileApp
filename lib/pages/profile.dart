import 'package:com_unrealprogrammer_orderingo/controllers/user_controller.dart';
import 'package:com_unrealprogrammer_orderingo/widgets/custom_dialog.dart';
import 'package:com_unrealprogrammer_orderingo/widgets/user_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../repositories/user_repo.dart' as user_repo;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final UserController _con = Get.put(UserController());

  void updateUserImage(File _imageFile) {
    // _con.updateUser(context, user_repo.currentUser.value,
    //     imageFile: _imageFile);
  }

  // void updateUser(User _user) {
  //   _con.updateUser(context, _user);
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        actions: [
          _logoutButton(),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Get.dialog(
      //     //   EditProfileDialog(
      //     //     user_repo.currentUser.value,
      //     //     updateUser,
      //     //   ),
      //     // );
      //   },
      //   backgroundColor: Theme.of(context).primaryColor,
      //   child: const Icon(
      //     Icons.edit_outlined,
      //     color: Colors.white,
      //   ),
      // ),
      body: RefreshIndicator(
        onRefresh: () async {
          //  updateUser(user_repo.currentUser.value);
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: size.height * 0.063,
                // ),
                Obx(() {
                  return UserData(
                    user: user_repo.currentUser.value,
                    updateImage: updateUserImage,
                  );
                }),
                SizedBox(
                  height: size.height * 0.025,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: _userAttributes(),
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _logoutButton() {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => CustomDialog(
            title: "Are you sure?",
            description: "You want to logout?",
            actionButtonList: <Widget>[
              CustomDialogActionButton(
                buttonText: 'Yes',
                onPressed: () {
                  Navigator.of(context).pop();
                  _con.logoutUser();
                },
              ),
              CustomDialogActionButton(
                buttonText: 'Cancel',
                isRed: true,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      },
      icon: const Icon(Icons.logout),
    );
  }

  Text _userProfileTextWidget(
    String text, {
    double size = 15,
    double wordSpacing = 1,
    double height = 1,
    Color color = Colors.white,
    FontWeight fontWeight = FontWeight.bold,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        fontSize: size,
        wordSpacing: wordSpacing,
        height: height,
      ),
    );
  }

  Widget _userAttributeListTile({
    required IconData icon,
    required String text,
  }) {
    return ListTile(
      tileColor: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      leading: Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
      title: _userProfileTextWidget(
        text == "" ? "Not Added Yet" : text,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _userAttributes() {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _userProfileTextWidget(
            "Name",
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          _userAttributeListTile(
            icon: Icons.person,
            text: user_repo.currentUser.value.fname! +
                " " +
                user_repo.currentUser.value.lname!,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.037,
          ),
          _userProfileTextWidget(
            "Email",
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          _userAttributeListTile(
            icon: Icons.email,
            text: user_repo.currentUser.value.email!,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.037,
          ),
          _userProfileTextWidget(
            "Phone",
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          _userAttributeListTile(
            icon: Icons.phone,
            text: "",
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.037,
          ),
          _userProfileTextWidget(
            "Shop Address",
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          _userAttributeListTile(
            icon: Icons.location_on,
            text: "",
          ),
        ],
      );
    });
  }
}
