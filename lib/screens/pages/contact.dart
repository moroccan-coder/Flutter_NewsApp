import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _messageController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _messageController = TextEditingController();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Contact Us"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (isLoading) ? _loading() : _ContactForm() ,
      ),
    );
  }

  Widget _loading()
  {
    return Center(
      child: Container(
         child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _ContactForm() {
    return  Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Your name',
            ),

            validator: (value) {
              if(value.isEmpty)
              {
                return 'Please enter your Name';
              }
              return null;
            },
          ),
          SizedBox(height: 8,),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Enter your email',
            ),

            validator: (value) {
              if(value.isEmpty)
              {
                return 'Please enter your email!';
              }
              return null;
            },
          ),
          SizedBox(height: 8,),
          TextFormField(
            controller: _messageController,
            maxLines: 3,
            decoration: InputDecoration(
                labelText: 'Write your Message'
            ),
            validator: (value) {
              if(value.isEmpty)
              {
                return 'Please write Your Message!';
              }
              return null;
            },
          ),
          SizedBox(height: 8,),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              color: Colors.blueAccent,
              child: Text('SEND MESSAGE',style: TextStyle(color: Colors.white),),
              onPressed: (){

                if(_formKey.currentState.validate())
                {


                  String name = _nameController.text;
                  String email = _emailController.text;
                  String message = _messageController.text;


                  setState(() {
                    isLoading =true;
                  });

                }
                else{
                  setState(() {
                    isLoading =false;
                  });
                }


              },
            ),
          )
        ],
      ),
    );
  }
}
