import 'package:flutter/material.dart';
// StateProvider is moved to legacy in Riverpod 3.x
// ignore: deprecated_member_use
import 'package:flutter_riverpod/legacy.dart';

final themeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.dark);
