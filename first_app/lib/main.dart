import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BasicsPage(),
    );
  }
}

class BasicsPage extends StatelessWidget {
  const BasicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Facebook Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  "assets/images/cover.jpg",
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 125),
                  child: CircleAvatar(
                    radius: 75,
                    backgroundColor: Colors.white,
                    child: myProfilePic(72),
                  ),
                )
              ],
            ),
            Text(
              "Pavel Marin",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Bonjour je suis un petit paragraphe de lorem Ipsum Lorem Ipsum is simply dummy text of the printing",
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              children: [
                Expanded(child: buttonContainer(text: "Modifier le profil")),
                buttonContainer(icon: Icons.border_color)
              ],
            ),
            Divider(
              thickness: 2,
            ),
            sectionTitleText("A propos de moi"),
            aboutRow(
                icon: Icons.house,
                text: "13 Rue Saint-François de Paule, 06300 Nice"),
            aboutRow(icon: Icons.work, text: "Développer Junior"),
            aboutRow(icon: Icons.favorite, text: "Adore la programmation"),
            Divider(
              thickness: 2,
            ),
            sectionTitleText("Amis"),
            allFriends(width / 3.5),
            Divider(
              thickness: 2,
            ),
            sectionTitleText("Mes Posts"),
            post(
                time: "5 minute",
                image: "assets/images/carnaval.jpg",
                desc:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
            post(
                time: "2 jours",
                image: "assets/images/mountain.jpg",
                desc:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                likes: 37,
                comments: 4),
            post(
                time: "5 jours",
                image: "assets/images/work.jpg",
                desc:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                likes: 1239,
                comments: 89)
          ],
        ),
      ),
    );
  }

  CircleAvatar myProfilePic(double radius) {
    return CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage("assets/images/profile.jpg"));
  }

  Container buttonContainer({IconData? icon, String? text}) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.blue),
      child: (icon == null)
          ? Center(
              child: Text(
              text ?? "",
              style: TextStyle(color: Colors.white),
            ))
          : Icon(
              icon,
              color: Colors.white,
            ),
      height: 50,
    );
  }

  Widget sectionTitleText(String text) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Text(text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          )),
    );
  }

  Widget aboutRow({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon),
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(text),
        ),
      ],
    );
  }

  Column friendsImage(String name, String imagePath, double width) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          width: width,
          height: width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imagePath), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.grey)],
          ),
        ),
        Text(name),
        Padding(padding: EdgeInsets.only(bottom: 5))
      ],
    );
  }

  Row allFriends(double width) {
    Map<String, String> friends = {
      "Pierre": "assets/images/cat.jpg",
      "Paul": "assets/images/sunflower.jpg",
      "jack": "assets/images/duck.jpg"
    };
    List<Widget> children = [];
    friends.forEach((name, imagePath) {
      children.add(friendsImage(name, imagePath, width));
    });
    return Row(
      children: children,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  Container post(
      {required String time,
      required String image,
      required String desc,
      int likes = 0,
      int comments = 0}) {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 3, right: 3),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
      child: Column(
        children: [
          Row(
            children: [
              myProfilePic(20),
              Padding(padding: EdgeInsets.only(left: 8)),
              Text("Pavel Marin"),
              Spacer(),
              timeText(time)
            ],
          ),
          Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              )),
          Text(
            desc,
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          Divider(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              Text("$likes Likes"),
              Icon(Icons.message, color: Colors.blue),
              Text("$comments Commentaires")
            ],
          )
        ],
      ),
    );
  }

  Text timeText(String time) {
    return Text(
      "Il y a $time",
      style: TextStyle(color: Colors.blue),
    );
  }
}
