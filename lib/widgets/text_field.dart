import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final bool isPassword;
  final IconData prefixIcon;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final bool isNameField;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    required this.prefixIcon,
    this.validator,
    this.focusNode,
    this.nextFocusNode,
    this.isNameField = false,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword && _obscureText,
      textInputAction: widget.nextFocusNode != null ? TextInputAction.next : TextInputAction.done,
      onFieldSubmitted: (_) {
        if (widget.nextFocusNode != null) {
          widget.nextFocusNode!.requestFocus();
        }
      },
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: widget.validator ?? (value) {
        // Базовая валидация - поле не пустое
        if (value == null || value.isEmpty) {
          return 'Это поле обязательно для заполнения';
        }

        // Валидация для имени
        if (widget.isNameField) {
          if (!RegExp(r'^[a-zA-Zа-яА-ЯёЁ\s]+$').hasMatch(value)) {
            return 'Имя может содержать только буквы и пробелы';
          }
        }

        // Валидация для email
        if (widget.labelText.toLowerCase().contains('email')) {
          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'Введите корректный email';
          }
        }

        // Валидация для пароля
        if (widget.isPassword) {
          if (value.length < 6) {
            return 'Пароль должен содержать не менее 6 символов';
          }
          if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[+\-_]).+$').hasMatch(value)) {
            return 'Пароль должен содержать буквы, цифры и символы (+, _, -)';
          }
        }

        return null;
      },
    );
  }
}