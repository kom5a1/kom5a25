#!/bin/bash

# Spartacus KOM5A - Script unique, complet et autonome
# Ce script gère l'intégralité du projet KOM5A en un seul point, avec automatisation complète

# Couleurs pour l'affichage
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Fonctions d'affichage
info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}
success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}
error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Bannière de démarrage
info "Lancement de Spartacus KOM5A - Le cœur du projet, tout-en-un, complet et autonome"

# Vérification des prérequis
info "Vérification des outils nécessaires..."
if ! command -v npm &> /dev/null; then
    error "npm n'est pas installé. Veuillez l'installer."
    exit 1
fi
if ! command -v git &> /dev/null; then
    error "git n'est pas installé. Veuillez l'installer."
    exit 1
fi
if ! command -v supabase &> /dev/null; then
    info "Installation de Supabase CLI..."
    npm install -g supabase
    success "Supabase CLI installé avec succès."
fi

# Initialisation du projet KOM5A
info "Création du projet Next.js avec TypeScript..."
npx create-next-app@latest kom5a --typescript
cd kom5a

# Installation des dépendances
info "Installation des packages nécessaires..."
npm install @supabase/supabase-js @clerk/nextjs stripe axios dotenv openai tailwindcss

# Configuration des clés API et de l'environnement
info "Création du fichier .env.local..."
echo "NEXT_PUBLIC_CLERK_FRONTEND_API=clerk.fremde26.lld.com" > .env.local
echo "STRIPE_PUBLIC_KEY=pk_live_51QvRa1GxJD1Fd0tLVZfgjeg8tnUYw4Gtw3yXbKIeCxDY8RLdMsLORO1bcjqIdISGK4N75N6yhVGV9VftIAB9KaI500HmoLSBSI" >> .env.local
echo "SUPABASE_URL=https://mtbuxdktqvbfdfxrucdb.supabase.co" >> .env.local
echo "SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im10YnV4ZGt0cXZiZmRmeHJ1Y2RiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM0MzQwNzksImV4cCI6MjA1OTAxMDA3OX0.WFTFBPdDWUISuFbxeohqFmQ_KX3F8DzaR5EikW-s0xI" >> .env.local
echo "TELEGRAM_BOT_TOKEN=7043243496:AAH9_S6GrA3Svsf12yuEqltXVwAb1IDIIg8" >> .env.local
echo "TELEGRAM_BOT_ID=1449201144" >> .env.local
echo "OPENAI_API_KEY=sk-proj-G4MhjypWPhifV__4uZyHmPMErCueJJHpyK7Zat4_Lr2SuhUdKApRe4TlAEYmGhcm8Z77D809VMT3BlbkFJL-iC3" >> .env.local

# Configuration de GitHub et du déploiement
info "Initialisation de GitHub..."
git init  
git remote add origin git@github.com:kom5a1/KOM5A1.git
git add .
git commit -m "Initial commit for kom5a1"
git push -u origin main
  
# Lancement du projet
info "Démarrage du serveur..."
npm run dev
    
# Suivi des logs et surveillance
info "Surveillance avec Spartacus en cours..."
tail -f logs/spartacus.log

# Fin du script
success "Spartacus KOM5A est prêt à l'emploi !"

