#!/bin/bash
# ─────────────────────────────────────────────────────────────
#  Lindsey R. English Jr. — GitHub Pages Deploy Script
#  Run this once from Terminal to push your site live.
# ─────────────────────────────────────────────────────────────

set -e

REPO="LindseyALA.github.io"
GITHUB_USER="LindseyALA"
REMOTE="https://github.com/${GITHUB_USER}/${REPO}.git"

# Move to the folder this script lives in
cd "$(dirname "$0")"

echo ""
echo "┌─────────────────────────────────────────┐"
echo "│   Lindsey.dev  →  GitHub Pages Deploy   │"
echo "└─────────────────────────────────────────┘"
echo ""

# Clean up any broken .git from previous attempt
if [ -d ".git" ]; then
  echo "🧹  Removing old git folder..."
  rm -rf .git
fi

# Initialize fresh repo
echo "⚙️   Initializing git repo..."
git init
git branch -M main
git config user.name "Lindsey R. English Jr."
git config user.email "Lindsey.English@outlook.com"

# Stage all files
echo "📁  Staging files..."
git add -A
git status

# Commit
echo ""
echo "💾  Creating first commit..."
git commit -m "🚀 Launch: Lindsey R. English Jr. personal portfolio"

# Set remote
echo ""
echo "🔗  Connecting to GitHub..."
git remote add origin "$REMOTE"

# Push
echo ""
echo "🚀  Pushing to GitHub Pages..."
echo "    (A browser window may open to log in — sign in with your GitHub account)"
echo ""
git push -u origin main

echo ""
echo "✅  Done! Your site will be live in ~60 seconds at:"
echo "    https://${GITHUB_USER}.github.io"
echo ""
echo "    If you see a 404 at first, wait 1–2 minutes and refresh."
echo ""
