# 🎹 Aide-mémoire Clavier - Raccourcis Hyprland Multi-Moniteur

## 📋 **Disposition ergonomique optimisée :**

```
┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┐
│ESC  │ &/1 │ é/2 │ "/3 │ '/4 │ (/5 │ §/6 │ è/7 │ !/8 │ ç/9 │ à/0 │ -/_ │ =/+ │
│     │ WS1 │ WS2 │ WS3 │ WS4 │ WS5 │ WS6 │ WS7 │ WS8 │ WS9 │     │Vol- │Vol+ │
├─────┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴──┬──┴
│ TAB    │  A  │  Z  │  E  │  R  │  T  │  Y  │  U  │  I  │  O  │  P  │  ^  │  $
│ WS◀    │Brave│Docker│GitHub│Reload│Float│Notes│DevTool│Magic│Mon+ │Mon- │     │
├────────┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─────┤
│ CAPS     │  Q  │  S  │  D  │  F  │  G  │  H  │  J  │  K  │  L  │  M  │ ENTER   │
│          │Quit │VSCode│Files│Full │Color│Focus│Focus│Focus│Focus│Exit │         │
│          │     │     │     │     │Pick │  ◀  │  ▼  │  ▲  │  ▶  │     │         │
├──────────┴┬────┴┬────┴┬────┴┬────┴┬────┴┬────┴┬────┴┬────┴┬────┴┬────┴┬────────┤
│ SHIFT     │  W  │  X  │  C  │  V  │  B  │  N  │  ,  │  .  │  /  │     │ SHIFT  │
│           │Term │Figma│Color│Pseudo│Brave│Notes│WS◀  │WS▶  │Lock │     │        │
│           │Float│     │     │     │     │     │     │     │     │     │        │
├───────────┴─┬───┴─┬───┴─┬───┴─────┴─────┴─────┴─────┴─────┴─┬───┴─┬───┴─┬───────┤
│ CTRL        │ WIN │ ALT │             SPACE                 │ ALT │ WIN │ CTRL  │
│             │SUPER│     │             MENU                  │     │     │       │
└─────────────┴─────┴─────┴───────────────────────────────────┴─────┴─────┴───────┘
```

## 🎯 **Zones ergonomiques :**

### **🟢 Zone verte (main gauche) - Applications fréquentes**
- `Q` → Fermer fenêtre
- `A` → Brave (navigateur principal)
- `S` → VS Code (éditeur)
- `D` → Gestionnaire de fichiers (Dolphin)
- `F` → Plein écran (fullscreen)
- `W` → Terminal flottant

### **🔵 Zone bleue (centre) - Navigation**
- `H/J/K/L` → Focus fenêtres (style Vim)
- `Tab` → Workspace précédent
- `Space` → Menu applications (Rofi)
- `G` → Color picker (hex)
- `C` → Color picker (simple)

### **🟡 Zone jaune (main droite) - Outils & Multi-moniteur**
- `U` → DevTools workspace
- `I` → Magic workspace
- `O` → Déplacer fenêtre vers moniteur suivant (avec Shift)
- `P` → Déplacer fenêtre vers moniteur précédent (avec Shift)
- `B` → Brave
- `N` → Notes/Obsidian
- `M` → Quitter Hyprland

### **🔴 Zone rouge (touches numériques) - Workspaces**
- `&é"'(§è!çà` → Workspaces 1-10 (layout FR & keycodes 10-19)
- `Shift + touches` → Déplacer fenêtre vers le workspace
- `Alt + touches` → Déplacer silencieusement la fenêtre (sans changer de vue)

## ⚡ **Combinaisons les plus utiles :**

### **🎯 Workflow principal :**
1. **`SUPER + Space`** → Menu rapide (Rofi)
2. **`SUPER + Tab`** → Basculer workspace
3. **`SUPER + H/J/K/L`** → Navigation Vim
4. **`SUPER + A`** → Navigateur instantané
5. **`SUPER + S`** → VS Code rapide

### **🖥️ Multi-moniteur (NOUVEAU) :**
6. **`SUPER + Shift + O`** → Fenêtre vers moniteur suivant
7. **`SUPER + Shift + P`** → Fenêtre vers moniteur précédent
8. **`SUPER + Ctrl + O`** → Workspace vers moniteur suivant
9. **`SUPER + Ctrl + P`** → Workspace vers moniteur précédent

### **🛠️ Outils développement :**
10. **`SUPER + W`** → Terminal flottant
11. **`SUPER + G`** → Color picker (hex)
12. **`SUPER + R`** → Reload config
13. **`Print`** → Screenshot région
14. **`SUPER + =/-`** → Volume sans Fn
15. **`SUPER + Shift + =/-`** → Luminosité sans Fn

## 💡 **Tips d'ergonomie multi-moniteur :**

- **Main gauche** : Applications et actions principales
- **Main droite** : Outils et gestion multi-moniteur
- **HJKL** : Navigation comme dans Vim (familier pour dev)
- **O/P** : Gestion moniteurs (O = suivant, P = précédent)
- **Touches françaises** : Workspaces avec vrais caractères (&é"'(§è!ç)
- **Pas de Fn** : Volume/luminosité avec `=/−` + Shift
- **Vim-style** : `H/J/K/L` pour déplacement, `Shift+` pour déplacer fenêtre, `Ctrl+` pour redimensionner
- **Alternatives** : Flèches disponibles comme backup pour navigation
- **Scroll** : `SUPER + scroll` pour changer de workspace
- **Workflow optimal** : Développement sur écran principal, outils sur second écran
- **Auto-détection** : Script automatique configure les moniteurs au démarrage

## 🖥️ **Configuration multi-moniteur :**

### **Écran principal (eDP-1 - 1600x900) :**
- **Workspace 1** : VS Code, développement principal
- **Position** : Gauche (0x0)
- **Usage** : Concentration sur le code

### **Second écran (HDMI-A-1 - 1920x1080) :**
- **Workspaces 2-9** : Navigateurs, outils, communication
- **Position** : Droite (1600x0)
- **Usage** : Outils auxiliaires et multitâche

### **Débranchement/Rebranchement :**
- **Automatique** : Script détecte les changements
- **Redistribution** : Workspaces se repositionnent intelligemment
- **Fallback** : Tout revient sur l'écran principal si nécessaire