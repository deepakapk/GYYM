import 'package:flutter/material.dart';
import 'package:gyym/Firebase_auth/firebase_auth.dart';
import 'package:gyym/model/user_model.dart';
import 'package:gyym/providers/user_provider.dart';
import 'package:provider/provider.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  void logout() async {
    await AuthMethods().signout();
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<UserProvider>(context, listen: false).refreshUser();s
    final UserModel? user = Provider.of<UserProvider>(context).getUser;

    return user == null
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 61, 57, 57),
              centerTitle: false,
              title: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.57,
                  ),
                  const Text(
                    "GYYM",
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'font1',
                        fontSize: 30),
                  ),
                ],
              ),
            ),
            drawer: Drawer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.shutterstock.com/image-photo/muscular-man-showing-muscles-on-600w-1686329977.jpg"),
                        radius: 100,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                        ),
                        child: const Text(
                          "Change Pic",
                          style: TextStyle(fontFamily: 'font1'),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        user!.Username,
                        style:
                            const TextStyle(fontSize: 25, fontFamily: 'font1'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      ListTile(
                        onTap: () {},
                        leading: const Icon(
                          Icons.people,
                          color: Colors.white,
                        ),
                        title: const Text(
                          "Community Center",
                          style: TextStyle(color: Colors.white),
                        ),
                        selected: true,
                        selectedTileColor: Colors.redAccent,
                        // tileColor: Colors.red,
                      ),
                      ListTile(
                        onTap: () {},
                        leading: const Icon(
                          Icons.sports_gymnastics,
                          color: Colors.white,
                        ),
                        title: const Text(
                          "Workout Plan",
                          style: TextStyle(color: Colors.white),
                        ),
                        selected: false,
                        selectedTileColor: Colors.redAccent,
                        // tileColor: Colors.red,
                      ),
                      ListTile(
                        onTap: () {},
                        leading: const Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                        ),
                        title: const Text(
                          "Tracker",
                          style: TextStyle(color: Colors.white),
                        ),
                        selected: false,
                        selectedTileColor: Colors.redAccent,
                        // tileColor: Colors.red,
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "LogOut!",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(child: Text(user.Username)),
                ElevatedButton(onPressed: logout, child: const Text("Log out"))
              ],
            )));
  }
}
