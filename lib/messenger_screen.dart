import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/140464418?v=4',
              ),
            ),
            SizedBox(width: 10),
            Text('Chats', style: TextStyle(color: Colors.black)),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.blue,
              child: Icon(Icons.camera_alt, size: 16, color: Colors.white),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.blue,
              child: Icon(Icons.edit, size: 16, color: Colors.white),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsetsGeometry.only(left: 10),
                      child: Icon(Icons.search),
                    ),
                    SizedBox(width: 15),
                    Text('Ask Meta AI or Search'),
                  ],
                ),
              ),

              SizedBox(height: 20),
              // Stories
              SizedBox(
                height: 105,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 20),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStoryItem(),
                  itemCount: 5,
                ),
              ),
              SizedBox(height: 20),
              // Chats
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => buildChatItem(),
                separatorBuilder: (context, index) => SizedBox(height: 20),
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 1. build Chat Item
  // 2. build List
  // 3. Add Item To List

  Widget buildChatItem() => Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              'https://avatars.githubusercontent.com/u/140464418?v=4',
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 2, end: 2),
            child: CircleAvatar(radius: 7, backgroundColor: Colors.green),
          ),
        ],
      ),
      SizedBox(width: 20),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sami Abdlehaleem',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Hello My Name Is Sami Abdelhaleem Hello My Name Is Sami Abdelhaleem',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text('11:30 PM'),
              ],
            ),
          ],
        ),
      ),
    ],
  );

  Widget buildStoryItem() => SizedBox(
    width: 60,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/140464418?v=4',
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 2, end: 2),
              child: CircleAvatar(radius: 7, backgroundColor: Colors.green),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text('Sami\nAbdelhaleem', maxLines: 2, overflow: TextOverflow.ellipsis),
      ],
    ),
  );
}
