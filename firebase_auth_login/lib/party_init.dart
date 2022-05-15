import 'package:flutter/material.dart';
import 'location_select.dart';

class PartyInit extends StatefulWidget {
  State<PartyInit> createState() => PartyInItState();
}

class PartyInItState extends State<PartyInit> {
  late String _name;
  String category = 'One', level = 'One';
  late String _date, _time;
  late String _loaction;
  String _description = '';
  TextEditingController _dateEdit = TextEditingController();
  TextEditingController _timeEdit = TextEditingController();
  TextEditingController _locEdit = TextEditingController();

  @override
  Widget build (BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState> ();
    return Scaffold(
      appBar: AppBar (
        title: Text ('Party Init'),
        actions: <Widget> [
          TextButton (
            onPressed: () {
              //html connection add
              String id = DateTime.now().toString();
            },
            child: Text (
              'Submit',
              style: TextStyle (
                color: Colors.white
              ),
            ),
            style: TextButton.styleFrom(
              padding: EdgeInsets.only(right: 15.0, left: 15),
              primary: Colors.black
            ),
          )
        ]
      ),
      body: Padding (
        padding: EdgeInsets.all(15),
        child: Form (
          key: _formKey,
          child: ListView (
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                child: Text (
                  'name',
                  style: TextStyle (
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                )
              ),
              TextFormField (
                autovalidateMode: AutovalidateMode.always,
                onSaved: (value) {
                  _name = value as String;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Some text';
                  }
                  return null;
                },
                decoration: InputDecoration (
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                  border: OutlineInputBorder (
                    borderSide: const BorderSide(width: 0.5)
                  ),
                ),
              ),
              const Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
              const Divider(height: 0, color: Colors.black54, thickness: 0.5,),
              const Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
              Row (
                children: [
                  Flexible(
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                          child: Text (
                            'category',
                            style: TextStyle (
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          )
                        ),
                        DropdownButtonFormField<String> (
                          decoration: InputDecoration (
                            contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                            border: OutlineInputBorder (
                              borderSide: const BorderSide(width: 0.5)
                            ),
                          ),
                          value: category,
                          onChanged: (newValue) {
                            setState(() {
                              category = newValue!;
                            });
                          },
                          items: <String>['One', 'Two', 'Three', 'Four', 'Five']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    )
                  ),
                  Padding(padding: EdgeInsets.all(15.0)),
                  Flexible(
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                          child: Text (
                            'requirement level',
                            style: TextStyle (
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          )
                        ),
                        DropdownButtonFormField<String> (
                          decoration: InputDecoration (
                            contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                            border: OutlineInputBorder (
                              borderSide: const BorderSide(width: 0.5)
                            ),
                          ),
                          value: level,
                          onChanged: (newValue) {
                            setState(() {
                              level = newValue!;
                            });
                          },
                          items: <String>['One', 'Two', 'Three', 'Four', 'Five']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    )
                  ),
                ],
              ),
              const Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
              const Divider(height: 0, color: Colors.black54, thickness: 0.5,),
              const Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
              Row (
                children: [
                  Flexible(
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                          child: Text (
                            'date',
                            style: TextStyle (
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          )
                        ),
                        TextFormField (
                          autovalidateMode: AutovalidateMode.always,
                          controller: _dateEdit,
                          onSaved: (value) {
                            _date = value as String;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Select Date';
                            }
                            return null;
                          },
                          onTap: () async {
                            DateTime? date;
                            FocusScope.of(context).requestFocus(new FocusNode());
                            date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime (DateTime.now().year),
                              lastDate: DateTime (DateTime.now().year + 1)
                            );
                            if (date != null) {
                              _dateEdit.text = date.toIso8601String().substring(0, 10);
                            }
                          },
                          decoration: InputDecoration (
                            contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                            border: OutlineInputBorder (
                              borderSide: const BorderSide(width: 0.5)
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                  Padding(padding: EdgeInsets.all(15.0)),
                  Flexible(
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                          child: Text (
                            'time',
                            style: TextStyle (
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          )
                        ),
                        TextFormField (
                          autovalidateMode: AutovalidateMode.always,
                          controller: _timeEdit,
                          onSaved: (value) {
                            _time = value as String;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Select Time';
                            }
                            return null;
                          },
                          decoration: InputDecoration (
                            contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                            border: OutlineInputBorder (
                              borderSide: const BorderSide(width: 0.5)
                            ),
                          ),
                          onTap: () async {
                            TimeOfDay? time;
                            FocusScope.of(context).requestFocus(new FocusNode());
                            time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (time != null) {
                              _timeEdit.text = time.toString().substring(10, 15);
                            }
                          },
                        ),
                      ],
                    )
                  ),
                ],
              ),
              const Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
              const Divider(height: 0, color: Colors.black54, thickness: 0.5,),
              const Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                child: Text (
                  'location',
                  style: TextStyle (
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                )
              ),
              TextFormField (
                autovalidateMode: AutovalidateMode.always,
                controller: _locEdit,
                onSaved: (value) {
                  _loaction = value as String;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Select Location';
                  }
                  return null;
                },
                decoration: InputDecoration (
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  border: OutlineInputBorder (
                    borderSide: const BorderSide(width: 0.5),
                  ),
                ),
                onTap: () async {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  final lct = await Navigator.push (
                    context,
                    MaterialPageRoute(builder: (context) => LocationSelect ()),
                  );
                  _locEdit.text = lct.toString().substring(7, lct.toString().length - 1);
                },
              ),
              const Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
              const Divider(height: 0, color: Colors.black54, thickness: 0.5,),
              const Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                child: Text (
                  'description',
                  style: TextStyle (
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                )
              ),
              TextFormField (
                autovalidateMode: AutovalidateMode.always,
                onSaved: (value) {
                  _description = value as String;
                },
                decoration: InputDecoration (
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  border: OutlineInputBorder (
                    borderSide: const BorderSide(width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                ),
                maxLines: 3,
              ),
            ],
          )
        )
      )
    );
  }
}