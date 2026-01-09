import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/customization_provider.dart';

class ColorsShowcase extends StatelessWidget {
  const ColorsShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomizationProvider>(
      builder: (context, provider, child) {
        final colors = provider.customizedColors;
        final config = provider.config;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle('Colors', colors, config),
              const SizedBox(height: 32),

              // Main Colors
              _buildSectionTitle('Main Theme Colors', colors, config),
              const SizedBox(height: 16),
              _buildColorGrid([
                _ColorInfo('Primary', colors.primary),
                _ColorInfo('Background', colors.background),
                _ColorInfo('Primary Accent', colors.primaryAccent),
              ]),
              const SizedBox(height: 32),

              // Card Colors
              _buildSectionTitle('Card Colors', colors, config),
              const SizedBox(height: 16),
              _buildColorGrid([
                _ColorInfo('Card', colors.card),
                _ColorInfo('Player Card', colors.playerCard),
                _ColorInfo('Device Card Selected', colors.deviceCardSelected),
                _ColorInfo('Play Card', colors.playCard),
              ]),
              const SizedBox(height: 32),

              // Text Colors
              _buildSectionTitle('Text Colors', colors, config),
              const SizedBox(height: 16),
              _buildColorGrid([
                _ColorInfo('Text Large', colors.textLarge),
                _ColorInfo('Text Medium', colors.textMedium),
                _ColorInfo('Text Small', colors.textSmall),
                _ColorInfo('Text Tiny', colors.textTiny),
                _ColorInfo('Text Muted', colors.textMuted),
              ]),
              const SizedBox(height: 32),

              // Button Colors
              _buildSectionTitle('Button Colors', colors, config),
              const SizedBox(height: 16),
              _buildColorGrid([
                _ColorInfo('Button Primary', colors.buttonPrimary),
                _ColorInfo('Button Secondary', colors.buttonSecondary),
                _ColorInfo('Button Enabled', colors.buttonEnabled),
                _ColorInfo('Button Pressed', colors.buttonPressed),
                _ColorInfo('Button Disabled', colors.buttonDisabled),
              ]),
              const SizedBox(height: 32),

              // Control Colors
              _buildSectionTitle('Control Colors', colors, config),
              const SizedBox(height: 16),
              _buildColorGrid([
                _ColorInfo('Control Icon', colors.controlIcon),
                _ColorInfo('Control Active', colors.controlActive),
                _ColorInfo('Control Inactive', colors.controlInactive),
                _ColorInfo('Control Background', colors.controlBackground),
              ]),
              const SizedBox(height: 32),

              // Status Colors
              _buildSectionTitle('Status Colors', colors, config),
              const SizedBox(height: 16),
              _buildColorGrid([
                _ColorInfo('Success', colors.statusSuccess),
                _ColorInfo('Error', colors.statusError),
                _ColorInfo('Warning', colors.statusWarning),
                _ColorInfo('Info', colors.statusInfo),
              ]),
              const SizedBox(height: 32),

              // Progress Colors
              _buildSectionTitle('Progress Colors', colors, config),
              const SizedBox(height: 16),
              _buildColorGrid([
                _ColorInfo('Progress Track', colors.progressTrack),
                _ColorInfo('Progress Thumb', colors.progressThumb),
                _ColorInfo('Progress Active', colors.progressActive),
                _ColorInfo('Progress Inactive', colors.progressInactive),
              ]),
              const SizedBox(height: 32),

              // Navigation Colors
              _buildSectionTitle('Navigation Colors', colors, config),
              const SizedBox(height: 16),
              _buildColorGrid([
                _ColorInfo('Nav Background', colors.navBackground),
                _ColorInfo('Nav Icon', colors.navIcon),
                _ColorInfo('Nav Icon Selected', colors.navIconSelected),
                _ColorInfo('Nav Title', colors.navTitle),
              ]),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTitle(String text, dynamic colors, dynamic config) {
    return Text(
      text,
      style: GoogleFonts.getFont(
        config.fontFamily,
        fontSize: (32 * config.fontSizeMultiplier).toDouble(),
        fontWeight: FontWeight.bold,
        color: colors.textLarge,
      ),
    );
  }

  Widget _buildSectionTitle(String text, dynamic colors, dynamic config) {
    return Text(
      text,
      style: GoogleFonts.getFont(
        config.fontFamily,
        fontSize: (20 * config.fontSizeMultiplier).toDouble(),
        fontWeight: FontWeight.w600,
        color: colors.textLarge,
      ),
    );
  }

  Widget _buildColorGrid(List<_ColorInfo> colorInfos) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: colorInfos.map((info) => _buildColorCard(info)).toList(),
    );
  }

  Widget _buildColorCard(_ColorInfo info) {
    final brightness = ThemeData.estimateBrightnessForColor(info.color);
    final textColor = brightness == Brightness.dark ? Colors.white : Colors.black;
    final hexColor = '#${info.color.value.toRadixString(16).substring(2).toUpperCase()}';

    return Container(
      width: 160,
      height: 120,
      decoration: BoxDecoration(
        color: info.color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            info.name,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            hexColor,
            style: TextStyle(
              fontSize: 10,
              color: textColor.withOpacity(0.8),
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }
}

class _ColorInfo {
  final String name;
  final Color color;

  _ColorInfo(this.name, this.color);
}
