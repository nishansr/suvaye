import 'package:flutter/material.dart';
import 'package:suvaye/view/screens/home/widgets/grid_item.dart';
import 'package:suvaye/view/screens/home/widgets/see_more.dart';

import '../../../util/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;

  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      //!  AppBar
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/images/logo.png'),
              SizedBox(width: 10.0),
              Text('Suvaye')
            ],
          ),
          Row(
            children: [
              Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      print('buton clicked');
                    },
                    icon: Icon(Icons.notifications_none, size: 35),
                  ),
                  Positioned(
                    top: 14,
                    right: 13,
                    child: CircleAvatar(
                      backgroundColor: const Color.fromRGBO(255, 0, 0, 1),
                      radius: 5,
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      )),
      //! AppBar Completed

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0),
              Text(
                'Hello, Suvaye Tech',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Services',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SeeMore(),
                ],
              ),

              SizedBox(height: 15.0),

              //! PageView.builder
              Container(
                height: h / 4.5,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: 3,
                  itemBuilder: (context, position) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        padding: const EdgeInsets.all(40.0),
                        decoration: BoxDecoration(
                          color: position % 2 == 0
                              ? Color(0xffecfdf3)
                              : Color(0xFFD8C9D7),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'App Development',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Color(0xff344054)),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Develop beautiful fast mobile applications',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ]),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                    width: currentPage == index ? 8 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentPage == index
                          ? Color(0xff98A2B3)
                          : Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              //! Grid Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Outline',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SeeMore(),
                ],
              ),
              SizedBox(height: 20.0),
              const Wrap(
                spacing: 30,
                runSpacing: 20,
                children: [
                  GridItem(index: 0),
                  GridItem(index: 1),
                  GridItem(index: 2),
                  GridItem(index: 3),
                ],
              )
            ],
          ),
        ),
      ),

      //! Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          unselectedFontSize: 13,
          selectedFontSize: 13,
          elevation: 0.0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), label: 'Today'),
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_rounded), label: 'Services'),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
          ]),
    );
  }
}
