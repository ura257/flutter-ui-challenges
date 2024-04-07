import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HoverTextLink extends StatefulWidget {
  final String text;
  final String url;
  final Color underlineColor; // 색상 필터 사용시 색상
  final FontWeight? fontWeight;
  final double? fontSize;

  const HoverTextLink({
    super.key,
    required this.text,
    required this.url,
    required this.underlineColor,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 14,
  });

  @override
  State<HoverTextLink> createState() => _HoverTextLinkState();
}

class _HoverTextLinkState extends State<HoverTextLink> {
  bool _isHovering = false;

  get underlineColor => null;
  get fontWeight => null;
  get fontSize => null;

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(widget.url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch ${widget.url}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovering = true),
      onExit: (event) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: _launchUrl,
        child: Text(
          widget.text,
          style: TextStyle(
            decoration:
                _isHovering ? TextDecoration.underline : TextDecoration.none,
            color: _isHovering ? underlineColor : null,
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
