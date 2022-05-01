import 'package:flutter/material.dart';

class App_Bar extends StatelessWidget implements PreferredSizeWidget{
  final AppBar appBar;
  final IconData icon;
  final Function() function;

  App_Bar({Key? key, required this.appBar, this.icon = Icons.menu_rounded, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.black,
      leading:
      IconButton(
        onPressed: function,
        icon:Icon(
          icon,
          color: Colors.grey,
        ),
      ),
      actions:
      [
        IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.notifications_outlined,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
