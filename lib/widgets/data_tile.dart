import 'package:flutter/material.dart';

class DataTile extends StatelessWidget {
  final String header;
  final String content;
  final Color color;
  final Color darkColor;
  final Function onTap;
  final Icon icon;

  const DataTile({
    Key? key,
    required this.header,
    required this.color,
    required this.darkColor,
    required this.onTap,
    required this.content,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap.call();
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              color,
              darkColor,
            ],
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    color,
                    darkColor,
                  ],
                ),
              ),
              child: icon,
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  header,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(content),
              ],
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
      ),
    );
  }
}
