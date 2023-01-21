import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Liquid Swipe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<String> exampleList = [
    'Works',
    'fine',
    'with',
    'this',
    'horizontal',
    'list'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text('Liquid Swipe Test'),
        ),
      ),
      body: LiquidSwipe(
        allowDragOnlyFromRevealedArea: true,
        enableSideReveal: true,
        fullTransitionValue: 800,
        positionSlideIcon: 0.5,
        slideIconWidget: const Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.white,
          size: 20,
        ),

        pages: [
          //Page 1 with a draggable widget inside it
          //This page works fine
          Container(
            color: Colors.yellow,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: exampleList.length,
                itemBuilder: (context, index) => Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.white,
                          child: Center(
                            child: Text(exampleList[index]),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                      ],
                    )),
          ),

          //Page 2 without any draggable widget inside it
          //This page doesn't work
          Container(
            color: Colors.blue,
            child: const Center(child: Text('But this does not work')),
          )
        ],
      ),
    );
  }
}
