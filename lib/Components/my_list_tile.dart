import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {

   final image;
   final title;
   final subtitle;
   final date;
   final count;
   final icon;
   final onTap;
   final onImageTap;
   final border;

   const MyListTile(
       {super.key,
         this.image,
         this.title,
         this.subtitle,
         this.date,
         this.count,
         this.icon,
         this.onTap,
         this.onImageTap,
         this.border
       });




   @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
              children: [
                image!= null?
                GestureDetector(
                  onTap: () => onImageTap(),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xFFC10000),
                    child: CircleAvatar(
                      radius: border? 26:30,
                      backgroundImage: NetworkImage(image),
              ),
                  ),
                ):
                    Container(),
                 Padding(
                  padding:  const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                        title!= null?
                    Text(title, style: const TextStyle(fontSize: 17),)
                        :Container(),
                    subtitle!=null?
                    Text(subtitle, style: const TextStyle(fontSize: 11))
                    :Container(),],
                  ),
                )
              ]
          ),
            ),
            Row( children: [
            Column(children: [
              date!=null?
               Text(date, style: const TextStyle(fontSize: 12, color: Color(0xFFC10000)),
              ):Container(),
            count!=null?
            CircleAvatar(
              radius: 10,
              backgroundColor: const Color(0xFFC10000),
              child:
              Text(count, style: const TextStyle(fontSize: 17)),
                 )
                : Container(),
               ],
            ),
            Icon(CupertinoIcons.chevron_compact_right, color: Colors.grey.shade400,)
              ],
             )
           ],
        ),
      ),
    );
  }
}
