import 'package:app_structure/app_export.dart';

// Different Border radius
BorderRadius br10 = BorderRadius.circular(10);

// Different radius
Radius r10 = const Radius.circular(10);

// App Padding
EdgeInsets all16 = const EdgeInsets.all(16);

// Different SizedBox Height
SizedBox sbh10 = const SizedBox(height: 10);

// Different SizedBox Width
SizedBox sbw10 = const SizedBox(width: 10);

// Common Styles
class AppStyles {
  static TextStyle? textRoboto = const TextStyle(
    fontFamily: 'Roboto',
    decoration: TextDecoration.none,
  );
}

// Common Box Decoration
Decoration? boxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: br10,
  boxShadow: [textBoxShadow],
);
// Common Box Shadow
BoxShadow textBoxShadow = const BoxShadow(
  color: Colors.black12,
  offset: Offset(-1, 1),
  blurRadius: 6,
);
