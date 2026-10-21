import 'package:flutter/material.dart';

// ودجت مخصصة للهيدر تجمع الطبقات (Image + Gradient) لتجنب التكرار في الشاشات
class CustomHeader extends StatelessWidget {
  final String imagePath;
  final Widget? topTitle;
  final Widget? bottomTitle;
  final Widget? leading;
  final double height;

  const CustomHeader({
    super.key,
    required this.imagePath,
    this.topTitle,
    this.bottomTitle,
    this.leading,
    this.height = 220.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        children: [
          // 1. صورة الخلفية
          Positioned.fill(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          // 2. التدرج الداكن (Gradient Fill) لضمان وضوح النصوص فوق الصورة
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),
          // 3. زر العودة (إن وجد)
          if (leading != null)
            Positioned(
              top: 40,
              left: 16,
              child: leading!,
            ),
          // 4. العنوان العلوي في المنتصف
          if (topTitle != null)
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Center(child: topTitle!),
            ),
          // 5. العنوان السفلي في اليسار
          if (bottomTitle != null)
            Positioned(
              bottom: 20,
              left: 16,
              right: 16,
              child: bottomTitle!,
            ),
        ],
      ),
    );
  }
}