# Quick Start Guide - Component Showcase

## Running Locally

### Option 1: Chrome (Recommended)
```bash
cd component_showcase
flutter run -d chrome
```

### Option 2: Any Web Browser
```bash
cd component_showcase
flutter run -d web-server --web-port 8080
```
Then open: http://localhost:8080

## Building for Production

```bash
flutter build web --release
```

Output will be in: `build/web/`

## Deployment Quick Reference

### GitHub Pages
```bash
flutter build web --release --base-href "/component_showcase/"
cd build/web
git init
git add .
git commit -m "Deploy"
git push -f origin main:gh-pages
```

### Netlify
1. Go to https://app.netlify.com/drop
2. Drag `build/web` folder
3. Done!

### Firebase
```bash
npm install -g firebase-tools
firebase login
firebase init hosting
firebase deploy
```

## Features Overview

### Navigation (Left Sidebar)
- **Buttons**: All button variations
- **Typography**: Text styles and fonts  
- **Colors**: Complete color palette
- **Cards**: Card components and layouts

### Control Panel (Right Sidebar)
- Toggle dark/light mode
- Change font family
- Adjust font sizes (70%-150%)
- Pick custom colors
- Modify button properties
- Export configuration
- Reset to defaults

### Toggle Panel
Click the **floating action button** (bottom-right) to show/hide the control panel.

## Sharing with Customers

1. **Deploy** to a hosting service (Netlify/GitHub Pages)
2. **Share URL** with clients
3. Clients can:
   - Browse all components
   - Test different colors/fonts
   - Export their preferred settings
   - Share screenshots of customizations

## Tips

- Use Chrome for best performance
- Test both light and dark themes
- Try different font combinations
- Export configs to share with dev team
- Take screenshots of custom configurations

## Troubleshooting

**Port already in use?**
```bash
flutter run -d web-server --web-port 8081
```

**Need to clear cache?**
```bash
flutter clean
flutter pub get
flutter build web --release
```

**Hot reload not working?**
Press `r` in the terminal or restart with `R`.
