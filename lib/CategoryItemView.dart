import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryItemView extends StatefulWidget {
  final Function onItemClick;
  final category;
  final bool isSelected;

  CategoryItemView(this.category, this.isSelected, this.onItemClick);

  @override
  State<StatefulWidget> createState() {
    return CategoryItemViewState();
  }
}

class CategoryItemViewState extends State<CategoryItemView> {
  var category;

  final _gradientUnselected = [
    Colors.white10.withOpacity(0.15),
    Colors.white10
  ];
  final _gradientSelected = [Colors.lightBlue, Colors.lightBlue];
  final _imgGradientChecked = [Colors.lightBlue, Colors.blue];
  final _imgGradientUnchecked = [
    Color(0xff010101),
    Color(0xff101010),
  ];

  @override
  void initState() {
    category = widget.category;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        onTap: widget.onItemClick,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: widget.isSelected
                    ? _gradientSelected
                    : _gradientUnselected),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(27.5)),
//                        color: Colors.white10,
                  gradient: RadialGradient(
                    colors: widget.isSelected
                        ? _imgGradientChecked
                        : _imgGradientUnchecked,
                  ),
                ),
                child: Center(
                  child: Icon(
                    category['icon'],
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Text(category['title'],
                      style: TextStyle(color: Colors.white, fontSize: 12)))
            ],
          ),
        ),
      ),
    );
  }
}
