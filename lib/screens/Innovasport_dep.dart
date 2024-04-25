// ignore: file_names
import 'package:flutter/material.dart';
import 'package:Jurado1079/Data/product_data.dart';
import 'package:Jurado1079/screens/auth_screen.dart';

void main(List<String> args) {
  runApp(const Innovasport());
}

class Innovasport extends StatefulWidget {
  const Innovasport({Key? key}) : super(key: key);

  @override
  State<Innovasport> createState() => _InnovasportState();
}

class _InnovasportState extends State<Innovasport> {
  int currentPage = 0;

  get bold => null;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Container(
      height: height * 0.95,
      width: width * 0.95,
      color: Color(0xffcf1608),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
                    onPageChanged: (page) {
                      setState(() {
                        currentPage = page;
                      });
                    },
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            height: 180,
                            width: 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(products[index].img),
                              ),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AuthScreen()));
                                },
                                child: Text(
                                  "Skip",
                                  style: TextStyle(color: Color(0xff0712ab)),
                                )),
                          ),
                          Text(
                            products[index].title,
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: bold,
                                color: Color(0xff000000)),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            products[index].description,
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white),
                          )
                        ],
                      );
                    })),
            SizedBox(
              height: 10,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: 10,
                      width: currentPage == index ? 25 : 10,
                      color: currentPage == index
                          ? Color(0xff0c2886)
                          : Colors.white,
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  currentPage == 2
                      ? ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AuthScreen()));
                          },
                          child: Icon(Icons.arrow_forward_ios))
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    ))));
  }
}
