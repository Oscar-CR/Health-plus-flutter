import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key, required this.title});

  final String title;

  @override
  State<CommunityPage> createState() => CommunityPageState();
}

class CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Brandon es gay',
            ),
          ],
        ),
      ),
    );
  }
}
