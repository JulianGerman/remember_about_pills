import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:remember_about_pills/bloc/app_content_controller_bloc.dart';
import 'package:remember_about_pills/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _image;
  ImagePicker _imagePicker = ImagePicker();
  _imgFromCamera() async {
    var image = await _imagePicker.getImage(
        source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    var image = await _imagePicker.getImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var deviceHeigth =
        mediaQuery.height; // do zmiany bo trzeba dodać APP BAR i NOTCH
    var name;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(children: [
            SizedBox(height: deviceHeigth * 0.1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Poznajmy się!',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: deviceHeigth * 0.2,
            ),
          ]),
          Column(
            children: [
              _image == null
                  ? GestureDetector(
                      child: CircleAvatar(
                        child: Icon(Icons.add_a_photo),
                        radius: 80.0,
                        backgroundColor: Theme.of(context).accentColor,
                      ),
                      onTap: () {
                        _showPicker(context);
                      },
                    )
                  : CircleAvatar(
                      child: _image,
                      radius: 80.0,
                      backgroundColor: Theme.of(context).accentColor,
                    ),
              SizedBox(
                height: deviceHeigth * 0.02,
              ),
              Text('Dodaj swoje zdjęcie'),
              SizedBox(
                height: deviceHeigth * 0.1,
              ),
              Text('Jak się nazywasz?'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 8.0),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                      hintText: 'np. Julian',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                              width: 1.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                              width: 1.0))),
                  textAlign: TextAlign.center,
                ),
              ),
              CustomButton(
                  bgColor: Theme.of(context).accentColor,
                  title: 'Przejdź dalej!',
                  textColor: Colors.white,
                  onTap: () {
                    BlocProvider.of<AppContentControllerBloc>(context)
                        .add(SaveLoginDataEvent());
                  })
            ],
          )
        ],
      ),
    );
  }
}
