import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {
    'name': '',
    'age': '',
    'email': '',
    'phone': '',
    'gender': 'Male',
    'hobbies': <String>[],
    'country': 'USA',
    'terms': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) {
                  _formData['name'] = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                onSaved: (value) {
                  _formData['age'] = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) {
                  _formData['email'] = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone'),
                onSaved: (value) {
                  _formData['phone'] = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _formData['gender'],
                decoration: InputDecoration(labelText: 'Gender'),
                onChanged: (value) {
                  setState(() {
                    _formData['gender'] = value!;
                  });
                },
                items: ['Male', 'Female', 'Other']
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
              ),
              CheckboxListTile(
                title: Text('Reading'),
                value: _formData['hobbies'].contains('Reading'),
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      _formData['hobbies'].add('Reading');
                    } else {
                      _formData['hobbies'].remove('Reading');
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Traveling'),
                value: _formData['hobbies'].contains('Traveling'),
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      _formData['hobbies'].add('Traveling');
                    } else {
                      _formData['hobbies'].remove('Traveling');
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Cooking'),
                value: _formData['hobbies'].contains('Cooking'),
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      _formData['hobbies'].add('Cooking');
                    } else {
                      _formData['hobbies'].remove('Cooking');
                    }
                  });
                },
              ),
              DropdownButtonFormField<String>(
                value: _formData['country'],
                decoration: InputDecoration(labelText: 'Country'),
                onChanged: (value) {
                  setState(() {
                    _formData['country'] = value!;
                  });
                },
                items: ['USA', 'Canada', 'UK', 'Australia', 'Other']
                    .map((country) => DropdownMenuItem(
                          value: country,
                          child: Text(country),
                        ))
                    .toList(),
              ),
              CheckboxListTile(
                title: Text('I accept the terms and conditions'),
                value: _formData['terms'],
                onChanged: (value) {
                  setState(() {
                    _formData['terms'] = value!;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayDataScreen(_formData),
                      ),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayDataScreen extends StatelessWidget {
  final Map<String, dynamic> formData;

  DisplayDataScreen(this.formData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Name'),
              subtitle: Text(formData['name']),
            ),
            ListTile(
              title: Text('Age'),
              subtitle: Text(formData['age']),
            ),
            ListTile(
              title: Text('Email'),
              subtitle: Text(formData['email']),
            ),
            ListTile(
              title: Text('Phone'),
              subtitle: Text(formData['phone']),
            ),
            ListTile(
              title: Text('Gender'),
              subtitle: Text(formData['gender']),
            ),
            ListTile(
              title: Text('Hobbies'),
              subtitle: Text(formData['hobbies'].join(', ')),
            ),
            ListTile(
              title: Text('Country'),
              subtitle: Text(formData['country']),
            ),
            ListTile(
              title: Text('Accepted Terms'),
              subtitle: Text(formData['terms'] ? 'Yes' : 'No'),
            ),
          ],
        ),
      ),
    );
  }
}
