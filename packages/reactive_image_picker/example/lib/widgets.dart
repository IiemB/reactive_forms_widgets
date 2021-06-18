import 'package:example/sample_screen.dart';
import 'package:flutter/material.dart' hide ProgressIndicator;
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_image_picker/image_file.dart';
import 'package:reactive_image_picker/reactive_image_picker.dart';

class Widgets extends StatelessWidget {
  FormGroup buildForm() => fb.group({
        'image': FormControl<ImageFile>(),
      });

  @override
  Widget build(BuildContext context) {
    return SampleScreen(
      body: ReactiveFormBuilder(
        form: buildForm,
        builder: (context, form, child) {
          return Column(
            children: [
              ReactiveImagePicker(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    labelText: 'Image',
                    filled: false,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    helperText: ''),
                inputBuilder: (onPressed) => TextButton.icon(
                  onPressed: onPressed,
                  icon: Icon(Icons.add),
                  label: Text('Add an image'),
                ),
                formControlName: 'image',
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text('Sign Up'),
                onPressed: () {
                  if (form.valid) {
                    print(form.value);
                  } else {
                    form.markAllAsTouched();
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}