import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remember_about_pills/bloc/app_content_controller_bloc.dart';
import 'package:remember_about_pills/widgets/home_screen_widgets/custom_button.dart';

class BottomView extends StatelessWidget {
  final double deviceHeigth;
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  BottomView({
    Key key,
    this.deviceHeigth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _name;
    return Column(
      children: [
        Container(
          height: 250,
          width: 250,
          child: Image(
            image: AssetImage('assets/remember_about.png'),
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: deviceHeigth * 0.02,
        ),
        SizedBox(
          height: deviceHeigth * 0.05,
        ),
        Text('What is your name?'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 8.0),
          child: Form(
            key: _formKey,
            child: TextFormField(
              onSaved: (newValue) => _name = newValue,
              textCapitalization: TextCapitalization.words,
              controller: _name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: 'ex. Julian',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide(
                          color: Theme.of(context).accentColor, width: 1.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide(
                          color: Theme.of(context).accentColor, width: 1.0))),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        CustomButton(
            bgColor: Theme.of(context).accentColor,
            title: 'Submit!',
            textColor: Colors.white,
            onTap: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                BlocProvider.of<AppContentControllerBloc>(context)
                    .add(SaveLoginDataEvent()..saveLogin(_name));
              }
            })
      ],
    );
  }
}
