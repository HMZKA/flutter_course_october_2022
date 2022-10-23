import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercourse/cubit.dart';
import 'package:fluttercourse/states.dart';
import 'package:fluttercourse/users.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
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
            GestureDetector(
              onTap: () {
                AppCubit().get(context).changeTheme();
              },
              child: CircleAvatar(
                radius: 16,
                child: Icon(
                  Icons.brightness_4_outlined,
                  size: 18,
                ),
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
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(
                      width: 7,
                    ),
                    itemBuilder: (context, index) =>
                        buildStoryItem(users[index], context),
                    itemCount: users.length,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        buildChatItem(users[index], context),
                    separatorBuilder: (context, index) => Divider(
                          thickness: 3,
                        ),
                    itemCount: users.length)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildChatItem(model, context) => ListTile(
        trailing: Text('2:00 PM'),
        subtitle: Text(
          'Hello my name is Ahmad ya 3omri',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Text(
            '${model['name']} ',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        onTap: () {},
        leading: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 27.5,
              backgroundImage: AssetImage('${model['image']}'),
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
  Widget buildStoryItem(model, context) => SizedBox(
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
                    backgroundImage: AssetImage('${model['image']}'),
                  ),
                  CircleAvatar(
                    // backgroundColor: Colors.white,
                    radius: 9,
                  ),
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.green,
                  )
                ],
              ),
              Text(
                '${model['name']}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
        ),
      );
}
