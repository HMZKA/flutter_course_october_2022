import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              backgroundImage: AssetImage('images/cat.jfif'),
            ),
            SizedBox(
              width: 7,
            ),
            Text('Chats')
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 16,
            child: Icon(
              Icons.camera_alt,
              size: 18,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          CircleAvatar(
            radius: 16,
            child: Icon(
              Icons.edit,
              size: 18,
            ),
          ),
          SizedBox(
            width: 12,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.5),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [Icon(Icons.search), Text('search')],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStoryItem(),
                  itemCount: 15,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => buildChatItem(),
                  separatorBuilder: (context, index) => Divider(
                        thickness: 3,
                      ),
                  itemCount: 20)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatItem() => ListTile(
        trailing: Text('2:00 PM'),
        subtitle: Text(
          'Hello my name is Ahmad ya 3omri',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Text(
            'Ahmad Ahmad Ahmad Ahmad Ahmad Ahmad Ahmad Ahmad ',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        onTap: () {},
        leading: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 27.5,
              backgroundImage: AssetImage('images/cat.jfif'),
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 9,
            ),
            CircleAvatar(
              radius: 8,
              backgroundColor: Colors.green,
            )
          ],
        ),
      );
  Widget buildStoryItem() => SizedBox(
        width: 60,
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                    radius: 27.5,
                    backgroundImage: AssetImage('images/cat.jfif'),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 9,
                  ),
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.green,
                  )
                ],
              ),
              Text(
                'Ahmad Ahmad Ahmad AhmadAhmad AhmadAhmad AhmadAhmad Ahmad',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      );
}
