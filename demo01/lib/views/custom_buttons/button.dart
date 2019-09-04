import 'package:flutter/material.dart';
import '../../utils/adapt.dart';

class CustomButton extends StatefulWidget {
  CustomButton(
      {Key key,
      this.name,
      this.id,
      this.src,
      this.bgsrc,
      this.width,
      this.btnClick,
      this.linkUrl})
      : super(key: key);
  String name;
  dynamic id;
  String src;
  String bgsrc;
  double width;
  final btnClick;
  String linkUrl;
  @override
  StateCustomButton createState() => new StateCustomButton();
}

class StateCustomButton extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          width: widget.width,
          height: 180 * Adapt.onepx(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.bgsrc), fit: BoxFit.fill)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Center(
                  child: Image(
                    image: AssetImage(widget.src),
                    width: 90 * Adapt.onepx(),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  widget.name,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          )),
      onTap: () => _onTap(),
    );
  }

  void _onTap() {
    print(widget.id);
    switch (widget.id) {
      case "1":
        break;
    }
  }
}
