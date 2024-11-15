import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class NotebookPage extends StatefulWidget {
  const NotebookPage({super.key});

  @override
  _NotebookPageState createState() => _NotebookPageState();
}

class _NotebookPageState extends State<NotebookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cẩm nang cho bạn'),
      ),
      body: ListView(
        children: [
          InstaImageViewer(
              child: Image.asset('assets/notebook/notebook_bia.png')),
          for (int i = 1; i <= 14; i++)
            InstaImageViewer(
                child: Image.asset('assets/notebook/notebook_$i.jpg')),
        ],
      ),
    );
  }
}
