import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventsListItem extends StatefulWidget {
  final event;
final onEventClicked;
  EventsListItem(this.event, this.onEventClicked);

  @override
  State<StatefulWidget> createState() {
    return EventsListItemState();
  }
}

class EventsListItemState extends State<EventsListItem> {
  @override
  Widget build(BuildContext context) {
    var _dimen = MediaQuery.of(context).size.width * 0.7;

    return GestureDetector(
      onTap: widget.onEventClicked,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: widget.event['title'],
                  child: Container(
                    width: _dimen,
                    height: _dimen,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.event['img'], ),
                        )),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 20,
                  child:Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Color(0xff2f2f2f),
                    borderRadius: BorderRadius.all(Radius.circular(27.5)),
                  ),
                  child: Icon(Icons.favorite, color: widget.event['isFav']?Colors.red:Colors.grey,),
                  ),
                )
              ],
            ),
            Text(widget.event['duration'], style: TextStyle(color: Colors.indigo, fontSize: 14, ),),
            SizedBox(height: 6,),
            Text(widget.event['title'], style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 2,),
            Text(widget.event['venue'], style: TextStyle(color: Colors.white38, fontSize: 14, ),),
          ],
        ),
      ),
    );
  }
}
