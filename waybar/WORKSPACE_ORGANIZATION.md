# 🚀 Organisation des Workspaces - Développeur Web Mobile

## 📋 **Plan des bureaux optimisés :**

### **1 💻 - Développement**
- **Applications :** VS Code, IntelliJ, Vim/Neovim
- **Usage :** Éditeur principal, IDE, coding
- **Raccourci suggéré :** `SUPER + 1`

### **2 🌐 - Navigateur Web/Desktop**
- **Applications :** Firefox, Chrome, Edge (tests cross-browser)
- **Usage :** Tests desktop, DevTools, preview web
- **Raccourci suggéré :** `SUPER + 2`

### **3 📱 - Mobile Testing/Simulators**
- **Applications :** Chrome DevTools Mobile, Responsively, simulateurs
- **Usage :** Tests mobiles, responsive design, PWA testing
- **Raccourci suggéré :** `SUPER + 3`

### **4 🖥️ - Terminal/Backend**
- **Applications :** Kitty, Alacritty, serveurs de développement
- **Usage :** CLI, npm/yarn, git, serveurs locaux, Docker
- **Raccourci suggéré :** `SUPER + 4`

### **5 🔧 - Outils DevOps/API**
- **Applications :** Docker Desktop, Postman, Insomnia, databases, Git GUI
- **Usage :** API testing, conteneurs, base de données, version control
- **Raccourci suggéré :** `SUPER + 5`

### **6 📊 - Analytics/Performance**
- **Applications :** Lighthouse, PageSpeed, analytics tools, monitoring
- **Usage :** Performance testing, SEO, web vitals, monitoring
- **Raccourci suggéré :** `SUPER + 6`

### **7 🎨 - Design/Prototyping**
- **Applications :** Figma, Adobe XD, Sketch, design tools
- **Usage :** UI/UX design, mockups, assets, design system
- **Raccourci suggéré :** `SUPER + 7`

### **8 💬 - Communication**
- **Applications :** Discord, Slack, Teams, emails
- **Usage :** Collaboration, meetings, support client
- **Raccourci suggéré :** `SUPER + 8`

### **9 🎵 - Média/Détente**
- **Applications :** Spotify, VLC, YouTube Music
- **Usage :** Musique de fond, pause, podcasts tech
- **Raccourci suggéré :** `SUPER + 9`

## 🎯 **Workflow développeur web mobile optimisé :**

### **Session de développement mobile typique :**
1. **💻 Workspace 1** - Ouvrir le projet dans VS Code
2. **🖥️ Workspace 4** - Lancer le serveur de dev (`npm run dev`)
3. **🌐 Workspace 2** - Tester la version desktop
4. **📱 Workspace 3** - Tests mobiles et responsive design
5. **📊 Workspace 6** - Vérifier les performances mobiles
6. **🔧 Workspace 5** - API testing et backend si nécessaire

### **Raccourcis Hyprland pour mobile dev :**
```conf
# Navigation rapide entre workspaces dev mobile
bind = SUPER, 1, workspace, 1  # Code
bind = SUPER, 2, workspace, 2  # Desktop Browser
bind = SUPER, 3, workspace, 3  # Mobile Testing
bind = SUPER, 4, workspace, 4  # Terminal

# Déplacement de fenêtres
bind = SUPER SHIFT, 1, movetoworkspace, 1
bind = SUPER SHIFT, 2, movetoworkspace, 2
bind = SUPER SHIFT, 3, movetoworkspace, 3
bind = SUPER SHIFT, 4, movetoworkspace, 4

# Ouverture directe d'applications optimisées mobile
bind = SUPER, C, exec, [workspace 1] code
bind = SUPER, F, exec, [workspace 2] firefox
bind = SUPER, M, exec, [workspace 3] firefox --new-window --args --device-scale-factor=2
bind = SUPER, T, exec, [workspace 4] kitty
```

### **Applications auto-assignées par workspace (mobile-first) :**
Ajoutez à votre `hyprland.conf` :
```conf
# Auto-assignment optimisée pour développement mobile
windowrulev2 = workspace 1, class:^(code|codium)$
windowrulev2 = workspace 2, class:^(firefox|chromium|chrome)$
windowrulev2 = workspace 3, class:^(responsively|mobile-simulator)$
windowrulev2 = workspace 4, class:^(kitty|alacritty|foot)$
windowrulev2 = workspace 5, class:^(postman|insomnia|dbeaver|gitui)$
windowrulev2 = workspace 6, class:^(lighthouse|pagespeed)$
windowrulev2 = workspace 7, class:^(figma|adobe-xd|sketch)$
windowrulev2 = workspace 8, class:^(discord|slack|teams)$
windowrulev2 = workspace 9, class:^(spotify|vlc)$
```

## 💡 **Tips productivité mobile dev :**

1. **Mobile-First** : Commencez toujours par le workspace 3 (📱) pour les tests
2. **Dual Testing** : Workspace 2 (🌐) et 3 (📱) côte à côte sur multi-monitor
3. **Performance Focus** : Workspace 6 (📊) pour Lighthouse après chaque feature
4. **Design System** : Workspace 7 (🎨) pour maintenir la cohérence UI
5. **API Testing** : Workspace 5 (🔧) pour tester les endpoints mobiles
6. **Live Reload** : Workspace 4 (🖥️) avec hot-reload actif

## 🎮 **Configuration Waybar actuelle :**

Votre Waybar affiche maintenant :
- **💻 1** - Développement (VS Code, IDE)
- **🌐 2** - Web Desktop (Firefox, Chrome)
- **📱 3** - Mobile Testing (Responsive, DevTools mobile)
- **🖥️ 4** - Terminal/Backend (CLI, serveurs)
- **🔧 5** - DevOps/API (Postman, Docker)
- **📊 6** - Analytics (Lighthouse, performance)
- **🎨 7** - Design (Figma, UI/UX)
- **💬 8** - Communication (Discord, Slack)
- **🎵 9** - Média (Spotify, détente)

Cette organisation maximise l'efficacité en séparant logiquement les tâches tout en permettant une navigation rapide ! 🚀
