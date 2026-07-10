import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:finomi/utils/text_utils.dart';

enum FinomiTheme {
  indigo,
  burgundy,
  navy,
  emerald,
  sunset,
  ocean,
  rose,
  lavender,
  bw,
}

class FinomiCard extends StatefulWidget {
  final String cardHolder;
  final String cardNumber;
  final String expiry;
  final String cvv;
  final String balance;
  final bool showBalance;
  final VoidCallback onToggleBalance;
  final FinomiTheme theme;
  final double height;

  const FinomiCard({
    super.key,
    this.cardHolder = 'Emran Seid',
    this.cardNumber = '5484 3902 1784 4561',
    this.expiry = '09/29',
    this.cvv = '***',
    this.balance = 'ETB 45,280.50',
    required this.showBalance,
    required this.onToggleBalance,
    this.theme = FinomiTheme.indigo,
    this.height = 200,
  });

  @override
  State<FinomiCard> createState() => _FinomiCardState();
}

class _FinomiCardState extends State<FinomiCard> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final t = widget.theme;
    final grad = isDark ? _darkGradients[t]! : _lightGradients[t]!;
    final edgeColor = isDark ? Colors.white.withOpacity(0.06) : Colors.black.withOpacity(0.12);
    final textColor = isDark ? Colors.white : Colors.black;
    final mutedColor = isDark ? Colors.white.withOpacity(0.35) : Colors.black.withOpacity(0.3);
    final dimColor = isDark ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2);
    final veryDim = isDark ? Colors.white.withOpacity(0.06) : Colors.black.withOpacity(0.06);

    return SizedBox(
      height: widget.height,
      child: Material(
        borderRadius: BorderRadius.circular(18),
        elevation: isDark ? 8 : 4,
        shadowColor: isDark ? Colors.black.withOpacity(0.6) : Colors.black.withOpacity(0.08),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: grad,
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              _BackgroundArt(isDark: isDark, theme: t),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: edgeColor),
                  ),
                ),
              ),
              _CardContent(
                cardHolder: widget.cardHolder,
                cardNumber: widget.cardNumber,
                expiry: widget.expiry,
                cvv: widget.cvv,
                balance: widget.balance,
                showBalance: widget.showBalance,
                onToggleBalance: widget.onToggleBalance,
                isDark: isDark,
                textColor: textColor,
                mutedColor: mutedColor,
                dimColor: dimColor,
                veryDim: veryDim,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BackgroundArt extends StatelessWidget {
  final bool isDark;
  final FinomiTheme theme;
  const _BackgroundArt({required this.isDark, required this.theme});

  Color _accentColor(FinomiTheme t) {
    switch (t) {
      case FinomiTheme.indigo: return const Color(0xFF6366f1);
      case FinomiTheme.burgundy: return const Color(0xFFdc2626);
      case FinomiTheme.navy: return const Color(0xFF3b82f6);
      case FinomiTheme.emerald: return const Color(0xFF10b981);
      case FinomiTheme.sunset: return const Color(0xFFf59e0b);
      case FinomiTheme.ocean: return const Color(0xFF06b6d4);
      case FinomiTheme.rose: return const Color(0xFFf43f5e);
      case FinomiTheme.lavender: return const Color(0xFF8b5cf6);
      case FinomiTheme.bw: return isDark ? Colors.white : Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    final accent = _accentColor(theme);
    final shapeOpacity = isDark ? 0.14 : 0.08;
    final ringOpacity = isDark ? 0.04 : 0.04;
    final dotOpacity = isDark ? 0.2 : 0.15;
    final lineOpacity = isDark ? 0.03 : 0.03;
    final baseGlowOpacity = isDark ? 0.06 : 0.03;

    return Stack(
      children: [
        Positioned(right: -60, top: -60, child: Container(
          width: 240, height: 240,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                accent.withOpacity(shapeOpacity),
                accent.withOpacity(0),
              ],
            ),
          ),
        )),
        Positioned(left: -40, bottom: -40, child: Container(
          width: 160, height: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                (isDark ? Colors.white : Colors.black).withOpacity(baseGlowOpacity),
                (isDark ? Colors.white : Colors.black).withOpacity(0),
              ],
            ),
          ),
        )),
        Positioned(top: 40, left: 0, right: 0, child: Center(
          child: Container(
            width: 80, height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  (isDark ? Colors.white : Colors.black).withOpacity(baseGlowOpacity * 0.5),
                  (isDark ? Colors.white : Colors.black).withOpacity(0),
                ],
              ),
            ),
          ),
        )),
        Positioned(right: -100, top: -100, child: Container(
          width: 300, height: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: accent.withOpacity(ringOpacity)),
          ),
        )),
        Positioned(left: -60, bottom: -80, child: Container(
          width: 200, height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: accent.withOpacity(ringOpacity)),
          ),
        )),
        Positioned(
          top: 0, left: 0, right: 0, bottom: 0,
          child: CustomPaint(
            painter: _DotGridPainter(
              color: (isDark ? Colors.white : Colors.black).withOpacity(dotOpacity),
            ),
          ),
        ),
        Positioned(
          top: 0, left: 0, right: 0, bottom: 0,
          child: CustomPaint(
            painter: _DiagonalLinesPainter(
              color: (isDark ? Colors.white : Colors.black).withOpacity(lineOpacity),
            ),
          ),
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(isDark ? 0.035 : 0.012),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DotGridPainter extends CustomPainter {
  final Color color;
  _DotGridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    const spacing = 24.0;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DotGridPainter other) => other.color != color;
}

class _DiagonalLinesPainter extends CustomPainter {
  final Color color;
  _DiagonalLinesPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    final path = Path()
      ..moveTo(-40, size.height * 0.5)
      ..lineTo(size.width - 40, size.height * 0.5 + math.tan(-12 * math.pi / 180) * (size.width));
    canvas.drawPath(path, paint);
    final path2 = Path()
      ..moveTo(size.width - 60, size.height * 0.3)
      ..lineTo(-60, size.height * 0.3 - math.tan(8 * math.pi / 180) * (size.width));
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant _DiagonalLinesPainter other) => other.color != color;
}

class _CardContent extends StatelessWidget {
  final String cardHolder, cardNumber, expiry, cvv, balance;
  final bool showBalance;
  final VoidCallback onToggleBalance;
  final bool isDark;
  final Color textColor, mutedColor, dimColor, veryDim;

  const _CardContent({
    required this.cardHolder,
    required this.cardNumber,
    required this.expiry,
    required this.cvv,
    required this.balance,
    required this.showBalance,
    required this.onToggleBalance,
    required this.isDark,
    required this.textColor,
    required this.mutedColor,
    required this.dimColor,
    required this.veryDim,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _FinomiLogo(color: textColor.withOpacity(0.85)),
                  const SizedBox(width: 8),
                  Text('Finomi', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, letterSpacing: 3, color: mutedColor)),
                ],
              ),
              _Crest(isDark: isDark, textColor: textColor, dimColor: dimColor, veryDim: veryDim),
            ],
          ),
          const SizedBox(height: 16),
          _Chip(isDark: isDark),
          const SizedBox(height: 14),
          _CardNumberDisplay(number: cardNumber, color: textColor.withOpacity(isDark ? 0.7 : 0.6)),
          const Spacer(),
          Row(
            children: [
              _InfoBlock(label: 'Card Holder', value: cardHolder, textColor: textColor, dimColor: dimColor),
              const SizedBox(width: 32),
              _InfoBlock(label: 'Expires', value: expiry, textColor: textColor, dimColor: dimColor, mono: true),
              const SizedBox(width: 32),
              _InfoBlock(label: 'CVV', value: cvv, textColor: textColor, dimColor: dimColor, mono: true),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Balance', style: TextStyle(fontSize: 7, letterSpacing: 1, color: dimColor.withOpacity(0.5))),
                  const SizedBox(width: 8),
                  Text(
                    showBalance ? balance : '******',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, letterSpacing: 0.3, color: dimColor),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: onToggleBalance,
                    child: Icon(
                      showBalance ? Icons.visibility : Icons.visibility_off,
                      size: 16,
                      color: dimColor.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Finomi', style: TextStyle(fontFamily: 'DM Sans', fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 3, color: veryDim)),
                  const SizedBox(width: 10),
                  _ContactlessIcon(color: veryDim),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FinomiLogo extends StatelessWidget {
  final Color color;
  const _FinomiLogo({required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 22, height: 22, child: CustomPaint(painter: _LogoPainter(color: color)));
  }
}

class _LogoPainter extends CustomPainter {
  final Color color;
  _LogoPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..color = color;
    final path = Path()
      ..moveTo(22.07, 17.06)
      ..lineTo(20.56, 14.63)
      ..lineTo(5.44, 14.63)
      ..lineTo(3.93, 17.06)
      ..close();
    canvas.drawPath(path, p);
    final path2 = Path()
      ..moveTo(19.72, 13.06)
      ..lineTo(18.27, 10.63)
      ..lineTo(7.73, 10.63)
      ..lineTo(6.28, 13.06)
      ..close();
    canvas.drawPath(path2, p);
    final path3 = Path()
      ..moveTo(17.27, 9.06)
      ..lineTo(13.68, 2.94)
      ..cubicTo(13.35, 2.44, 12.65, 2.44, 12.32, 2.94)
      ..lineTo(8.73, 9.06)
      ..close();
    canvas.drawPath(path3, p);
    final path4 = Path()
      ..moveTo(25.22, 22.44)
      ..lineTo(23.04, 18.84)
      ..lineTo(2.96, 18.84)
      ..lineTo(0.78, 22.44)
      ..cubicTo(0.61, 22.71, 0.61, 23.04, 0.78, 23.31)
      ..cubicTo(0.96, 23.58, 1.28, 23.75, 1.63, 23.75)
      ..lineTo(24.38, 23.75)
      ..cubicTo(24.73, 23.75, 25.04, 23.58, 25.22, 23.31)
      ..cubicTo(25.39, 23.04, 25.39, 22.71, 25.22, 22.44)
      ..close();
    canvas.drawPath(path4, p);
  }

  @override
  bool shouldRepaint(covariant _LogoPainter other) => other.color != color;
}

class _Crest extends StatelessWidget {
  final bool isDark;
  final Color textColor, dimColor, veryDim;
  const _Crest({required this.isDark, required this.textColor, required this.dimColor, required this.veryDim});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40, height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: isDark ? Colors.white.withOpacity(0.06) : Colors.black.withOpacity(0.03)),
      ),
      child: Center(
        child: Container(
          width: 34, height: 34,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: isDark ? Colors.white.withOpacity(0.12) : Colors.black.withOpacity(0.06)),
          ),
          child: Center(
            child: SizedBox(width: 18, height: 18, child: _FinomiLogo(color: dimColor.withOpacity(0.5))),
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final bool isDark;
  const _Chip({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36, height: 26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [const Color(0xFF8a7330), const Color(0xFFc4a84a), const Color(0xFFa68a38), const Color(0xFF7a6428)]
              : [const Color(0xFFc8c8ce), const Color(0xFFe0e0e4), const Color(0xFFc0c0c6), const Color(0xFFa8a8b0)],
        ),
        boxShadow: [
          if (isDark)
            BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (_) => Container(
            width: 1.5, height: 12,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: isDark ? Colors.black.withOpacity(0.15) : Colors.black.withOpacity(0.06),
              borderRadius: BorderRadius.circular(1),
            ),
          )),
        ),
      ),
    );
  }
}

class _CardNumberDisplay extends StatelessWidget {
  final String number;
  final Color color;
  const _CardNumberDisplay({required this.number, required this.color});

  @override
  Widget build(BuildContext context) {
    final groups = number.split(' ');
    return Row(
      children: groups.map((g) => Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Text(g, style: TextStyle(fontSize: 18, letterSpacing: 4, fontWeight: FontWeight.w500, fontFamily: 'monospace', color: color)),
      )).toList(),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  final String label, value;
  final Color textColor, dimColor;
  final bool mono;
  const _InfoBlock({required this.label, required this.value, required this.textColor, required this.dimColor, this.mono = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 6.5, letterSpacing: 1.5, color: dimColor.withOpacity(0.5))),
        const SizedBox(height: 2),
        Text(value, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: mono ? 1.5 : 0.5, fontFamily: mono ? 'monospace' : null, color: dimColor)),
      ],
    );
  }
}

class _ContactlessIcon extends StatelessWidget {
  final Color color;
  const _ContactlessIcon({required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 16, height: 16, child: CustomPaint(painter: _ContactlessPainter(color: color)));
  }
}

class _ContactlessPainter extends CustomPainter {
  final Color color;
  _ContactlessPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..color = color;
    final path = Path()
      ..moveTo(13.73, 3.53)
      ..cubicTo(13.39, 3.19, 12.84, 3.19, 12.5, 3.53)
      ..cubicTo(12.16, 3.87, 12.16, 4.42, 12.5, 4.76)
      ..cubicTo(14.02, 6.28, 14.43, 8.35, 13.85, 10.22)
      ..cubicTo(13.69, 10.85, 13.37, 11.42, 12.97, 11.92)
      ..cubicTo(12.64, 12.35, 12.73, 12.96, 13.07, 13.3)
      ..cubicTo(13.48, 13.71, 14.05, 13.54, 14.38, 13.18)
      ..cubicTo(14.95, 12.52, 15.36, 11.69, 15.62, 10.82)
      ..cubicTo(16.37, 8.2, 15.86, 5.35, 13.73, 3.53)
      ..close();
    canvas.drawPath(path, p);
    final path2 = Path()
      ..moveTo(5.97, 12.62)
      ..cubicTo(6.31, 12.28, 6.4, 11.67, 6.07, 11.24)
      ..cubicTo(5.67, 10.74, 5.35, 10.17, 5.19, 9.54)
      ..cubicTo(4.61, 7.67, 5.02, 5.6, 6.53, 4.08)
      ..cubicTo(6.87, 3.74, 6.87, 3.19, 6.53, 2.85)
      ..cubicTo(6.19, 2.51, 5.64, 2.51, 5.3, 2.85)
      ..cubicTo(3.17, 4.67, 2.66, 7.52, 3.41, 10.14)
      ..cubicTo(3.67, 11.01, 4.08, 11.84, 4.65, 12.5)
      ..cubicTo(4.98, 12.86, 5.55, 13.03, 5.97, 12.62)
      ..close();
    canvas.drawPath(path2, p);
    final path3 = Path()
      ..moveTo(4.01, 10.14)
      ..cubicTo(3.26, 7.52, 3.77, 4.67, 5.9, 2.85)
      ..cubicTo(6.24, 2.51, 6.24, 1.96, 5.9, 1.62)
      ..cubicTo(5.56, 1.28, 5.01, 1.28, 4.67, 1.62)
      ..cubicTo(2.54, 3.44, 2.03, 6.29, 2.78, 8.91)
      ..cubicTo(3.04, 9.78, 3.45, 10.61, 4.02, 11.28)
      ..cubicTo(4.35, 11.64, 4.92, 11.81, 5.34, 11.4)
      ..cubicTo(5.68, 11.06, 5.77, 10.45, 5.44, 10.02)
      ..cubicTo(5.04, 9.52, 4.72, 8.95, 4.56, 8.32)
      ..close();
    canvas.drawPath(path3, p);
  }

  @override
  bool shouldRepaint(covariant _ContactlessPainter other) => other.color != color;
}

const Map<FinomiTheme, LinearGradient> _darkGradients = {
  FinomiTheme.indigo: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    Color(0xFF3d2d8a), Color(0xFF30226a), Color(0xFF241858), Color(0xFF1a1048),
  ]),
  FinomiTheme.burgundy: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    Color(0xFF4e1a1a), Color(0xFF3e1212), Color(0xFF2e0a0a), Color(0xFF1e0404),
  ]),
  FinomiTheme.navy: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    Color(0xFF1a3a5e), Color(0xFF142e4e), Color(0xFF0e223e), Color(0xFF08182e),
  ]),
  FinomiTheme.emerald: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    Color(0xFF123a22), Color(0xFF0e2e1a), Color(0xFF0a2212), Color(0xFF06180c),
  ]),
  FinomiTheme.sunset: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    Color(0xFF3d200a), Color(0xFF2e1604), Color(0xFF220e02), Color(0xFF160800),
  ]),
  FinomiTheme.ocean: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    Color(0xFF123842), Color(0xFF0e2e36), Color(0xFF0a222a), Color(0xFF061820),
  ]),
  FinomiTheme.rose: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    Color(0xFF3e1422), Color(0xFF2e0e18), Color(0xFF220a12), Color(0xFF16040a),
  ]),
  FinomiTheme.lavender: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    Color(0xFF2e1444), Color(0xFF240e36), Color(0xFF180a28), Color(0xFF10061a),
  ]),
  FinomiTheme.bw: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    Color(0xFF1a1a1a), Color(0xFF141414), Color(0xFF0e0e0e), Color(0xFF080808),
  ]),
};

const Map<FinomiTheme, LinearGradient> _lightGradients = {
  FinomiTheme.indigo: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    Color(0xFFdde0ff), Color(0xFFc8cdff), Color(0xFFb0b8ff), Color(0xFF9aa3ff),
  ]),
  FinomiTheme.burgundy: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    Color(0xFFfdd), Color(0xFFfcb), Color(0xFFfaa), Color(0xFFf99),
  ]),
  FinomiTheme.navy: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    Color(0xFFd6e6ff), Color(0xFFbfd8ff), Color(0xFFa6c9ff), Color(0xFF90bbff),
  ]),
  FinomiTheme.emerald: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    Color(0xFFd1fae5), Color(0xFFb8f0d4), Color(0xFF9ce6c0), Color(0xFF80dcae),
  ]),
  FinomiTheme.sunset: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    Color(0xFFfef3c7), Color(0xFFfde68a), Color(0xFFfcd34d), Color(0xFFfbbf24),
  ]),
  FinomiTheme.ocean: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    Color(0xFFcffafe), Color(0xFFa5f3fc), Color(0xFF67e8f9), Color(0xFF22d3ee),
  ]),
  FinomiTheme.rose: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    Color(0xFFffe4e6), Color(0xFFfecdd3), Color(0xFFfda4af), Color(0xFFfb7185),
  ]),
  FinomiTheme.lavender: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    Color(0xFFede9fe), Color(0xFFddd6fe), Color(0xFFc4b5fd), Color(0xFFa78bfa),
  ]),
  FinomiTheme.bw: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
    Color(0xFFf0f0f0), Color(0xFFe4e4e4), Color(0xFFd8d8d8), Color(0xFFcccccc),
  ]),
};
