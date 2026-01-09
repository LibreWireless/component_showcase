import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/customization_provider.dart';

class CardsShowcase extends StatelessWidget {
  const CardsShowcase({Key? key}) : super(key: key);

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
              _buildTitle('Cards & Containers', colors, config),
              const SizedBox(height: 32),

              // Basic Cards
              _buildSectionTitle('Basic Cards', colors, config),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _buildCard(
                    'Standard Card',
                    'This is a standard card with default styling',
                    colors.card,
                    colors,
                    config,
                  ),
                  _buildCard(
                    'Player Card',
                    'Card designed for media player interface',
                    colors.playerCard,
                    colors,
                    config,
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Device Cards
              _buildSectionTitle('Device Cards', colors, config),
              const SizedBox(height: 16),
              _buildDeviceCard('Living Room Speaker', 'Connected', true, colors, config),
              const SizedBox(height: 12),
              _buildDeviceCard('Bedroom Speaker', 'Not Connected', false, colors, config),
              const SizedBox(height: 32),

              // Music Player Card
              _buildSectionTitle('Music Player Card', colors, config),
              const SizedBox(height: 16),
              _buildMusicPlayerCard(colors, config),
              const SizedBox(height: 32),

              // Info Cards
              _buildSectionTitle('Info Cards', colors, config),
              const SizedBox(height: 16),
              _buildInfoCard(
                Icons.check_circle,
                'Success',
                'Operation completed successfully',
                colors.statusSuccess,
                colors,
                config,
              ),
              const SizedBox(height: 12),
              _buildInfoCard(
                Icons.error,
                'Error',
                'An error occurred during the operation',
                colors.statusError,
                colors,
                config,
              ),
              const SizedBox(height: 12),
              _buildInfoCard(
                Icons.warning,
                'Warning',
                'Please check your settings',
                colors.statusWarning,
                colors,
                config,
              ),
              const SizedBox(height: 12),
              _buildInfoCard(
                Icons.info,
                'Info',
                'Additional information available',
                colors.statusInfo,
                colors,
                config,
              ),
              const SizedBox(height: 32),

              // List Items
              _buildSectionTitle('List Items', colors, config),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: colors.card,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildListItem(Icons.music_note, 'Track 1', 'Artist Name', colors, config),
                    Divider(height: 1, color: colors.divider),
                    _buildListItem(Icons.music_note, 'Track 2', 'Artist Name', colors, config),
                    Divider(height: 1, color: colors.divider),
                    _buildListItem(Icons.music_note, 'Track 3', 'Artist Name', colors, config),
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

  Widget _buildCard(
    String title,
    String description,
    Color backgroundColor,
    dynamic colors,
    dynamic config,
  ) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colors.cardShadowPrimary,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.getFont(
              config.fontFamily,
              fontSize: (18 * config.fontSizeMultiplier).toDouble(),
              fontWeight: FontWeight.w600,
              color: colors.textLarge,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.getFont(
              config.fontFamily,
              fontSize: (14 * config.fontSizeMultiplier).toDouble(),
              color: colors.textSmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceCard(
    String name,
    String status,
    bool isConnected,
    dynamic colors,
    dynamic config,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isConnected ? colors.deviceCardSelected : colors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isConnected ? colors.primary : colors.divider,
          width: isConnected ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: isConnected ? colors.primary : colors.controlBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.speaker,
              color: isConnected ? Colors.white : colors.controlIcon,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.getFont(
                    config.fontFamily,
                    fontSize: (16 * config.fontSizeMultiplier).toDouble(),
                    fontWeight: FontWeight.w500,
                    color: colors.textLarge,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  status,
                  style: GoogleFonts.getFont(
                    config.fontFamily,
                    fontSize: (14 * config.fontSizeMultiplier).toDouble(),
                    color: isConnected ? colors.statusSuccess : colors.textSmall,
                  ),
                ),
              ],
            ),
          ),
          if (isConnected)
            Icon(
              Icons.check_circle,
              color: colors.statusSuccess,
              size: 24,
            ),
        ],
      ),
    );
  }

  Widget _buildMusicPlayerCard(dynamic colors, dynamic config) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.playerCard,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colors.cardShadowPrimary,
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // Album Art Placeholder
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: colors.card,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.album,
              size: 80,
              color: colors.controlIcon,
            ),
          ),
          const SizedBox(height: 20),
          // Song Info
          Text(
            'Song Title',
            style: GoogleFonts.getFont(
              config.fontFamily,
              fontSize: (20 * config.fontSizeMultiplier).toDouble(),
              fontWeight: FontWeight.w600,
              color: colors.playerTitle,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Artist Name',
            style: GoogleFonts.getFont(
              config.fontFamily,
              fontSize: (16 * config.fontSizeMultiplier).toDouble(),
              color: colors.playerSubtitle,
            ),
          ),
          const SizedBox(height: 20),
          // Progress Bar
          Container(
            height: 4,
            decoration: BoxDecoration(
              color: colors.progressInactive,
              borderRadius: BorderRadius.circular(2),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.6,
              child: Container(
                decoration: BoxDecoration(
                  color: colors.progressActive,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Controls
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPlayerButton(Icons.skip_previous, colors, config),
              const SizedBox(width: 16),
              _buildPlayerButton(Icons.play_arrow, colors, config, isPrimary: true),
              const SizedBox(width: 16),
              _buildPlayerButton(Icons.skip_next, colors, config),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerButton(
    IconData icon,
    dynamic colors,
    dynamic config, {
    bool isPrimary = false,
  }) {
    return Container(
      width: isPrimary ? 56 : 48,
      height: isPrimary ? 56 : 48,
      decoration: BoxDecoration(
        color: isPrimary ? colors.buttonPrimary : colors.controlBackground,
        borderRadius: BorderRadius.circular(isPrimary ? 28 : 24),
      ),
      child: Icon(
        icon,
        color: isPrimary ? Colors.white : colors.controlIcon,
        size: isPrimary ? 32 : 24,
      ),
    );
  }

  Widget _buildInfoCard(
    IconData icon,
    String title,
    String message,
    Color accentColor,
    dynamic colors,
    dynamic config,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accentColor, width: 2),
      ),
      child: Row(
        children: [
          Icon(icon, color: accentColor, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.getFont(
                    config.fontFamily,
                    fontSize: (16 * config.fontSizeMultiplier).toDouble(),
                    fontWeight: FontWeight.w600,
                    color: colors.textLarge,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: GoogleFonts.getFont(
                    config.fontFamily,
                    fontSize: (14 * config.fontSizeMultiplier).toDouble(),
                    color: colors.textSmall,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(
    IconData icon,
    String title,
    String subtitle,
    dynamic colors,
    dynamic config,
  ) {
    return ListTile(
      leading: Icon(icon, color: colors.controlIcon),
      title: Text(
        title,
        style: GoogleFonts.getFont(
          config.fontFamily,
          fontSize: (16 * config.fontSizeMultiplier).toDouble(),
          color: colors.textLarge,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.getFont(
          config.fontFamily,
          fontSize: (14 * config.fontSizeMultiplier).toDouble(),
          color: colors.textSmall,
        ),
      ),
      trailing: Icon(Icons.more_vert, color: colors.controlIcon),
    );
  }
}
