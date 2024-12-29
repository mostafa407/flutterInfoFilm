import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfilm/views/screens/audio_player.dart';
import 'package:flutterfilm/views/screens/homePage.dart';

import '../../controller/form/form_cubit.dart';

class Loginpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FormCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Form'),
        ),
        body: FormBody(),
      ),
    );
  }
}

class FormBody extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final formCubit = context.read<FormCubit>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Name Field
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) => formCubit.updateField('name', value),
                validator: formCubit.validateName,
              ),
              const SizedBox(height: 10),
          
              // Email Field
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) => formCubit.updateField('email', value),
                validator: formCubit.validateEmail,
              ),
              const SizedBox(height: 10),
              // Phone Field
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
                onChanged: (value) => formCubit.updateField('phone', value),
                validator: formCubit.validatePhone,
              ),
              const SizedBox(height: 10),
              // Gender Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Gender'),
                items: ['Male', 'Female', 'Other']
                    .map((gender) => DropdownMenuItem(
                  value: gender,
                  child: Text(gender),
                ))
                    .toList(),
                onChanged: (value) => formCubit.updateField('gender', value ?? ''),
                validator: (value) => value == null || value.isEmpty
                    ? 'Gender is required'
                    : null,
              ),
              const SizedBox(height: 10),
          
              // Country Field
              TextFormField(
                decoration: InputDecoration(labelText: 'Country'),
                onChanged: (value) => formCubit.updateField('country', value),
                validator: (value) =>
                value == null || value.isEmpty ? 'Country is required' : null,
              ),
              const SizedBox(height: 10),
          
              // State Field
              TextFormField(
                decoration: InputDecoration(labelText: 'State'),
                onChanged: (value) => formCubit.updateField('state', value),
                validator: (value) =>
                value == null || value.isEmpty ? 'State is required' : null,
              ),
              const SizedBox(height: 10),
          
              // City Field
              TextFormField(
                decoration: InputDecoration(labelText: 'City'),
                onChanged: (value) => formCubit.updateField('city', value),
                validator: (value) =>
                value == null || value.isEmpty ? 'City is required' : null,
              ),
              const SizedBox(height: 20),
          
              // Submit Button
              BlocBuilder<FormCubit, Map<String, String>>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        if (formCubit.isFormValid()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Form is valid!')),
                          );
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return Homepage();
                          },));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please fix the errors.')),
                        );
                      }
                    },
                    child: Text('Submit'),
                  );
                },
              ),
              ElevatedButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return AudioPlayerScreen();
                },));
              }, child: Text("Audio"))
            ],
          ),
        ),
      ),
    );
  }
}
