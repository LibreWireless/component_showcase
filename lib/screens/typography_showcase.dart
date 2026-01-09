import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/customization_provider.dart';

class TypographyShowcase extends StatelessWidget {
  const TypographyShowcase({Key? key}) : super(key: key);

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
              _buildTitle('Typography', colors, config),
              const SizedBox(height: 32),

              // Display Styles
              _buildSectionTitle('Display Styles', colors, config),
              const SizedBox(height: 16),
              _buildTextSample(
                'Display Large',
                20,
                FontWeight.w600,
                colors.textLarge,
                config,
              ),
              const SizedBox(height: 12),
              _buildTextSample(
                'Display Medium',
                18,
                FontWeight.w600,
                colors.textLarge,
                config,
              ),
              const SizedBox(height: 32),

              // Title Styles
              _buildSectionTitle('Title Styles', colors, config),
              const SizedBox(height: 16),
              _buildTextSample(
                'Title Large',
                18,
                FontWeight.w600,
                colors.textLarge,
                config,
              ),
              const SizedBox(height: 12),
              _buildTextSample(
                'Title Medium',
                16,
                FontWeight.w500,
                colors.textMedium,
                config,
              ),
              const SizedBox(height: 32),

              // Body Styles
              _buildSectionTitle('Body Text', colors, config),
              const SizedBox(height: 16),
              _buildTextSample(
                'Body Large - Perfect for primary content and main paragraphs',
                16,
                FontWeight.normal,
                colors.textLarge,
                config,
              ),
              const SizedBox(height: 12),
              _buildTextSample(
                'Body Medium - Great for secondary content and descriptions',
                14,
                FontWeight.normal,
                colors.textSmall,
                config,
              ),
              const SizedBox(height: 12),
              _buildTextSample(
                'Body Small - Ideal for captions and additional information',
                12,
                FontWeight.normal,
                colors.textSmall,
                config,
              ),
              const SizedBox(height: 32),

              // Player Text Styles
              _buildSectionTitle('Player Text', colors, config),
              const SizedBox(height: 16),
              _buildTextSample(
                'Song Title - Now Playing',
                18,
                FontWeight.w600,
                colors.playerTitle,
                config,
              ),
              const SizedBox(height: 12),
              _buildTextSample(
                'Artist Name - Album Info',
                14,
                FontWeight.normal,
                colors.playerSubtitle,
                config,
              ),
              const SizedBox(height: 12),
              _buildTextSample(
                'Player Controls Text',
                12,
                FontWeight.normal,
                colors.playerControls,
                config,
              ),
              const SizedBox(height: 32),

              // Text Colors
              _buildSectionTitle('Text Color Variations', colors, config),
              const SizedBox(height: 16),
              _buildColoredText('Primary Text', colors.textLarge, config),
              _buildColoredText('Secondary Text', colors.textMedium, config),
              _buildColoredText('Small Text', colors.textSmall, config),
              _buildColoredText('Tiny Text', colors.textTiny, config),
              _buildColoredText('Muted Text', colors.textMuted, config),
              const SizedBox(height: 32),

              // Font Weights
              _buildSectionTitle('Font Weights', colors, config),
              const SizedBox(height: 16),
              _buildWeightSample('Light', FontWeight.w300, colors, config),
              _buildWeightSample('Regular', FontWeight.w400, colors, config),
              _buildWeightSample('Medium', FontWeight.w500, colors, config),
              _buildWeightSample('Semi-Bold', FontWeight.w600, colors, config),
              _buildWeightSample('Bold', FontWeight.w700, colors, config),
              const SizedBox(height: 32),

              // Example Paragraph
              _buildSectionTitle('Paragraph Example', colors, config),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colors.card,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to Libre Audio',
                      style: GoogleFonts.getFont(
                        config.fontFamily,
                        fontSize: (20 * config.fontSizeMultiplier).toDouble(),
                        fontWeight: FontWeight.w600,
                        color: colors.textLarge,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Experience premium audio quality with our state-of-the-art streaming technology. '
                      'Enjoy your favorite music with crystal-clear sound and seamless playback across all your devices. '
                      'With support for high-resolution audio formats, you can hear every detail as the artist intended.',
                      style: GoogleFonts.getFont(
                        config.fontFamily,
                        fontSize: (14 * config.fontSizeMultiplier).toDouble(),
                        height: 1.6,
                        color: colors.textMedium,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Last updated: Jan 9, 2026',
                      style: GoogleFonts.getFont(
                        config.fontFamily,
                        fontSize: (12 * config.fontSizeMultiplier).toDouble(),
                        color: colors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
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

  Widget _buildTextSample(
    String text,
    double baseFontSize,
    FontWeight weight,
    Color color,
    dynamic config,
  ) {
    return Text(
      text,
      style: GoogleFonts.getFont(
        config.fontFamily,
        fontSize: baseFontSize * config.fontSizeMultiplier,
        fontWeight: weight,
        color: color,
      ),
    );
  }

  Widget _buildColoredText(String text, Color color, dynamic config) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: GoogleFonts.getFont(
              config.fontFamily,
              fontSize: (14 * config.fontSizeMultiplier).toDouble(),
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeightSample(
    String label,
    FontWeight weight,
    dynamic colors,
    dynamic config,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        '$label - The quick brown fox jumps over the lazy dog',
        style: GoogleFonts.getFont(
          config.fontFamily,
          fontSize: (16 * config.fontSizeMultiplier).toDouble(),
          fontWeight: weight,
          color: colors.textLarge,
        ),
      ),
    );
  }
}
