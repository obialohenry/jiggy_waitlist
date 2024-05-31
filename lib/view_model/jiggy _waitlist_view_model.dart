import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final jiggyWaitlistViewModel = ChangeNotifierProvider((ref) => JiggyWaitlistViewModel());

class JiggyWaitlistViewModel extends ChangeNotifier {}
