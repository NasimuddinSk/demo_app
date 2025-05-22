import 'package:demo_app/const/image_url.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var indexValue = 0;
  var currentValue = 0;

  List<String> item = ["Home", "Electronic", "Fashion", "Homedecor", "Books"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: Colors.amber.shade50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 40),
              width: double.infinity,
              height: 100,
              color: Colors.amber.shade100,
              child: Row(
                spacing: 20,
                children: [
                  SizedBox(width: 20),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/avatar.jpg"),
                  ),
                  Text(
                    "Adhayan Digital",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "Home",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_filled),
              title: Text(
                "Home",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text(
                "Cart",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Setting",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentValue = index;
          });
        },
        selectedItemColor: Colors.black87,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        unselectedItemColor: Colors.black45,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        currentIndex: currentValue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout_rounded),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "Profile",
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 5),
          search(),
          SizedBox(height: 5),
          catrgory(),
          SizedBox(height: 5),
          offer(),
          SizedBox(height: 15),
          GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 12),
            itemCount: ImageUrl.imageList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .7,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withValues(alpha: .1),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Image.network(
                            ImageUrl.imageList[index]["uri"]!,
                            filterQuality: FilterQuality.medium,
                            width: 120,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 5,
                          child: Icon(Icons.favorite_border_outlined),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 0, 73, 133),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: Text(
                              "\$ ${(index + 16.5 * 3)}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      ImageUrl.imageList[index]["title"]!,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: const Color.fromARGB(
                            255,
                            3,
                            168,
                            28,
                          ),
                          foregroundColor: Colors.white,
                        ),
                        icon: Icon(Icons.shopping_cart),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: const Color.fromARGB(
                            255,
                            3,
                            94,
                            168,
                          ),
                          foregroundColor: Colors.white,
                        ),
                        child: Text("Buy now"),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Container search() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withValues(alpha: .15),
      ),
      child: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.search, color: Colors.black.withValues(alpha: .5)),

          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.black.withValues(alpha: .5)),
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.mic),
            color: Colors.black.withValues(alpha: .5),
          ),
        ],
      ),
    );
  }

  Container catrgory() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: 45,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: item.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color:
                  indexValue == index
                      ? const Color.fromARGB(
                        255,
                        58,
                        0,
                        247,
                      ).withValues(alpha: .4)
                      : Colors.black.withValues(alpha: .2),
            ),
            child: Center(
              child: Text(
                item[index],
                style: TextStyle(
                  color:
                      indexValue == index
                          ? const Color.fromARGB(255, 25, 0, 105)
                          : Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class offer extends StatelessWidget {
  const offer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, const Color.fromARGB(255, 0, 93, 170)],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Spring Sale",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
                color: Colors.white.withValues(alpha: 0.9),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Up to 50% off",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white.withValues(alpha: 0.9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
