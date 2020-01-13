import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventDetailScreen extends StatefulWidget {
  final _event;
  EventDetailScreen(this._event);

  @override
  State<StatefulWidget> createState() {
    return EventDetailScreenState();
  }
}

class EventDetailScreenState extends State<EventDetailScreen> {
  var _dimen;

  @override
  Widget build(BuildContext context) {
    _dimen = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        child: Stack(
          children: <Widget>[
            _poster,
            _header,
            _contentCard,
            _ticketsButton
          ],
        ),
      ),
    );
  }

  //event poster container
  get _poster =>
      SizedBox(
        width: _dimen,
        height: _dimen,
        child: Hero(
          tag: widget._event['title'],
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget._event['img'],),
                )),
          ),
        ),
      );

  //event organizer view
  get _header =>
      Positioned(
        top: _dimen-100,
        child: Container(
          height: 100,
          width: _dimen,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(top:Radius.circular(25)),
          ),
          padding: EdgeInsets.only(top: 10, left: 25, right: 25,),
          child: Column(
            children: <Widget>[
              Padding(
                padding:EdgeInsets.only(top: 20),
                child: Row(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5),),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage('https://images.unsplash.com/profile-fb-1495323378-348388c4fd13.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128',),
                            )),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text("Elizabeth Swann", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                            Padding(
                                padding:EdgeInsets.only(top: 6),
                                child: Text("Organizer", style: TextStyle(color: Colors.white38, fontSize: 14, ),)),
                          ],
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Text('Follow', style: TextStyle(color: Colors.white, fontSize: 12),),
                      color: Colors.white10,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  //Event content view
  get _contentCard => Positioned(
    top: _dimen,
    bottom: 0,
    child: Container(
      decoration: BoxDecoration(
        color: Color(0xff212121),
        borderRadius: BorderRadius.vertical(top:Radius.circular(25)),
      ),
      child: SizedBox(
        width: _dimen,
        height: double.maxFinite,
        child: Column(
          children: <Widget>[
            Padding(
              padding:EdgeInsets.only(left: 25, right: 25,top: 20, bottom: 30),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                  padding:EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(widget._event['duration'], style: TextStyle(color: Colors.indigo, fontSize: 14, ),),
                          SizedBox(height: 10,),
                          Text(widget._event['title'], style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                          SizedBox(height: 6,),
                          Text(widget._event['venue'], style: TextStyle(color: Colors.white38, fontSize: 14, ),),

                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Color(0xff2f2f2f),
                      borderRadius: BorderRadius.all(Radius.circular(27.5)),
                    ),
                    child: Icon(Icons.favorite, color: widget._event['isFav']?Colors.red:Colors.grey,),
                  )
                ],
              ),
            ),
            _mapView
          ],
        ),
      ),
    ),
  );

  get _mapView => Expanded(
    child: GoogleMap(
      initialCameraPosition:
      CameraPosition(target: LatLng(40.704026, -74.0655557), zoom: 12, tilt: 90),
      mapType: MapType.terrain,
    ),
  );

  get _ticketsButton => Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding:EdgeInsets.only(bottom: 15),
      child: RaisedButton(
        onPressed: () {},
        child: Text('Get Tickets', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
        color: Colors.blue,
      ),
    ),
  );

}