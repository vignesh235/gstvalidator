# GST Validator Flutter Package

![Pub Version](https://img.shields.io/pub/v/gstvalidator)

A Flutter package for validating Goods and Services Tax (GST) numbers. The package provides a customizable `GSTvalidator` widget that can be easily integrated into Flutter forms for GST number validation.

## Installation

To use this package, add `gstvalidator` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  gstvalidator: ^0.0.1
```


## Features

### 1. GST Number Validation

Easily validate GST numbers using the customizable widget within your Flutter application.

### 2. Customization Options

Tailor the widget to your needs with the following customization features:

- **Maximum Length:** Specify the maximum length for GST numbers.
- **Keyboard Type:** Define the keyboard type to enhance the user experience.

### 3. Seamless Integration

Integrate the GST number validation widget effortlessly into your Flutter forms. It works seamlessly, providing a user-friendly experience without compromising on validation accuracy.

## Usage

To use the GST Number Validation Widget in your Flutter project, follow these steps:

1. Import the necessary package.
   ```dart
   import 'package:flutter_gst_validator/flutter_gst_validator.dart';
   ```
2. Use the Widget
  ```dart
   GSTvalidator(
            labelText: 'GST',
            suffixIcon: Icons.abc,
            controller: _controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
```










