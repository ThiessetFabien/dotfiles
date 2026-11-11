# 🖥️ Guide Multi-Moniteur - Workflow Développeur Web

## 📋 **Configuration actuelle :**

### **Écrans détectés :**
- **eDP-1** (Écran principal) : 1600x900@60Hz → Workspace 1
- **HDMI-A-1** (Second écran) : 1920x1080@60Hz → Workspaces 2-9

### **Positionnement :**
```
┌─────────────────┐  ┌───────────────────────┐
│   eDP-1         │  │     HDMI-A-1          │
│   1600x900      │  │     1920x1080         │
│   Workspace 1   │  │   Workspaces 2-9      │
│   (VS Code)     │  │   (Outils)            │
└─────────────────┘  └───────────────────────┘
     0x0                    1600x0
```

## 🚀 **Workflow optimisé :**

### **Écran principal (gauche) - FOCUS DEV :**
- **Workspace 1** : VS Code, développement principal
- **Usage** : Zone de concentration pure pour le code
- **Avantages** : Moins de distractions, focus optimal

### **Second écran (droite) - OUTILS & VEILLE :**
- **Workspace 2** : Navigateurs web (Brave, Firefox)
- **Workspace 4** : Terminaux (Kitty)
- **Workspace 6** : Documentation (Obsidian)
- **Workspace 7** : Design (Draw.io, Figma)
- **Workspace 8** : Communication (Discord)
- **Workspace 9** : Média (YouTube, Spotify)

## 🎯 **Nouveaux raccourcis multi-moniteur :**

### **Déplacement fenêtres entre écrans :**
- `SUPER + Shift + O` → Déplacer fenêtre vers moniteur suivant
- `SUPER + Shift + P` → Déplacer fenêtre vers moniteur précédent

### **Déplacement workspaces entre écrans :**
- `SUPER + Ctrl + O` → Déplacer workspace vers moniteur suivant
- `SUPER + Ctrl + P` → Déplacer workspace vers moniteur précédent
- `SUPER + Ctrl + M` → Basculer le workspace actif vers le second écran

## ⚙️ **Gestion automatique :**

### **Script de détection (`~/.config/hypr/monitor-setup.sh`) :**
```bash
# Détecte automatiquement les moniteurs
# Configure les workspaces selon le nombre d'écrans
# Exécuté au démarrage avec un délai de 2 secondes
```

### **Comportement intelligent :**
1. **Branchement** → Redistribution automatique des workspaces
2. **Débranchement** → Tout revient sur l'écran principal
3. **Rebranchement** → Restauration de la configuration multi-moniteur

## 💡 **Tips d'utilisation :**

### **Démarrage optimal :**
1. VS Code s'ouvre sur l'écran principal (WS1)
2. Brave, terminaux, Discord s'ouvrent sur le second écran
3. Navigation fluide entre les deux écrans avec Tab

### **Workflow type :**
1. **Code** sur écran principal (concentration)
2. **Navigateur** sur second écran (tests, documentation)
3. **Terminal** sur second écran (commandes)
4. **Communication** sur second écran (Discord, etc.)

### **Raccourcis essentiels :**
- `SUPER + Tab` → Basculer entre workspaces
- `SUPER + Shift + O/P` → Déplacer fenêtres entre écrans
- `SUPER + &é"'(§è!ç` → Accès direct aux workspaces 1-9

## 🔧 **Dépannage :**

### **Problèmes courants :**
- **Fenêtre sur mauvais écran** → `SUPER + Shift + O/P`
- **Workspace mal placé** → `SUPER + Ctrl + O/P`
- **Configuration non appliquée** → `SUPER + R` (reload)

### **Vérification de l'état :**
```bash
hyprctl monitors                    # Voir les moniteurs actifs
~/.config/hypr/monitor-setup.sh    # Réappliquer la config
hyprctl reload                     # Recharger Hyprland
```

## 🎨 **Avantages du workflow :**

### **Productivité :**
- **+50% d'espace écran** pour le multitâche
- **Séparation code/outils** pour moins de distractions
- **Navigation ergonomique** avec raccourcis optimisés

### **Ergonomie :**
- **Écran principal** : Zone de focus pur
- **Second écran** : Veille informationnelle et outils
- **Raccourcis intuitifs** : O/P pour la gestion multi-moniteur

### **Flexibilité :**
- **Portable** : Fonctionne avec un seul écran
- **Bureau** : Optimisé pour deux écrans
- **Adaptation automatique** selon la configuration détectée
