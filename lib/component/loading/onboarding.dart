import 'package:flutter/material.dart';
import 'package:desa/screens/login/loginscreens.dart';

class OnboardingScreens extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: OnboardingContent(),
    );
  }
}

class OnboardingContent extends StatefulWidget {
  @override
  _OnboardingContentState createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      'title': 'Welcome to Smart Village',
      'text': 'Smart Village Kedungmulyo: Connect, Engage, and Thrive Together! Experience seamless community services and stay informed with the heartbeat of Kedungmulyo, empowering residents for a brighter future.',
      'image': 'assets/images/screens/sammy-line-no-connection.gif',
    },
    {
      'title': 'Village Community Services',
      'text': 'Smart Village application empowers the community by providing assistance to local businesses, facilitating citizen reporting, and delivering timely news updates, fostering a more engaged and informed rural society.\nExperience enhanced community services through the Smart Village app, offering support for local businesses, enabling seamless reporting from residents, and delivering informative news, ensuring a well-connected and thriving rural environment.',
      'image': 'assets/images/screens/sammy-line-searching.gif',
    },
    {
      'title': 'Stay Connected',
      'text': 'Join the ranks of outstanding citizens by signing up on the Smart Village app; your registration isnt just a formality, its a statement of your commitment to a better and impressive community.',
      'image': 'assets/images/screens/sammy-line-delivery.gif',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              return OnboardingItem(
                title: onboardingData[index]['title']!,
                text: onboardingData[index]['text']!,
                image: onboardingData[index]['image']!,
              );
            },
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            onboardingData.length,
            (index) => buildDot(index),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, LoginScreens.routeName);
          },
          child: Text(_currentPage == onboardingData.length - 1
              ? 'Get Started'
              : 'Next'),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: _currentPage == index ? 30 : 10,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.green : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class OnboardingItem extends StatelessWidget {
  final String title;
  final String text;
  final String image;

  const OnboardingItem({
    Key? key,
    required this.title,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),
          Image.asset(
            image,
            height: 200,
          ),
        ],
      ),
    );
  }
}
