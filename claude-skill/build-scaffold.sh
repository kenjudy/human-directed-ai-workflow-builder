#!/bin/bash
# Build script for AI Workflow Builder skill
# Generates ONE skill package: human-directed-ai-workflow-builder.skill
# Reads master source files from Scaffold/, writes references/, zips to human-directed-ai-workflow-builder.skill

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}   Building AI Workflow Builder Skill${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}\n"

# Paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SKILL_DIR="$SCRIPT_DIR/human-directed-ai-workflow-builder"

# Master source files (Scaffold/ — source of truth for prompt content)
MASTER_DISCOVERY="$REPO_ROOT/Scaffold/Socratic Discovery.md"
MASTER_TEMPLATES="$REPO_ROOT/Scaffold/Generation Templates.md"
MASTER_REFINEMENT="$REPO_ROOT/Scaffold/Refinement Protocol.md"

# Verify master files exist
echo -e "${BLUE}Verifying master source files...${NC}"
for file in "$MASTER_DISCOVERY" "$MASTER_TEMPLATES" "$MASTER_REFINEMENT"; do
    if [ ! -f "$file" ]; then
        echo -e "${RED}Error: Master file not found: $file${NC}"
        exit 1
    fi
done
echo -e "${GREEN}✓ All master files found${NC}\n"

# Verify SKILL.md exists (manually maintained, not generated)
if [ ! -f "$SKILL_DIR/SKILL.md" ]; then
    echo -e "${RED}Error: $SKILL_DIR/SKILL.md not found${NC}"
    exit 1
fi

# Create references directory
mkdir -p "$SKILL_DIR/references"

# Strip license block — removes "## License & Attribution" to EOF.
# Source files retain the block for GitHub; built files omit it
# since attribution text has no value to Claude in-context.
strip_license() {
    sed '/^## License & Attribution/,$ d' "$1"
}

# ═══════════════════════════════════════════════════════
# BUILD REFERENCE FILES (from masters)
# ═══════════════════════════════════════════════════════

echo -e "${YELLOW}┌─────────────────────────────────────────────────────┐${NC}"
echo -e "${YELLOW}│  Building reference files from masters              │${NC}"
echo -e "${YELLOW}└─────────────────────────────────────────────────────┘${NC}\n"

echo -e "${BLUE}Building discovery-guide.md...${NC}"
strip_license "$MASTER_DISCOVERY" > "$SKILL_DIR/references/discovery-guide.md"
echo -e "${GREEN}✓ Built discovery-guide.md${NC}"

echo -e "${BLUE}Building generation-templates.md...${NC}"
strip_license "$MASTER_TEMPLATES" > "$SKILL_DIR/references/generation-templates.md"
echo -e "${GREEN}✓ Built generation-templates.md${NC}"

echo -e "${BLUE}Building refinement-protocol.md...${NC}"
strip_license "$MASTER_REFINEMENT" > "$SKILL_DIR/references/refinement-protocol.md"
echo -e "${GREEN}✓ Built refinement-protocol.md${NC}\n"

# ═══════════════════════════════════════════════════════
# PACKAGE SKILL
# ═══════════════════════════════════════════════════════

echo -e "${BLUE}Creating human-directed-ai-workflow-builder.skill package...${NC}"
SKILL_FILE="$SCRIPT_DIR/human-directed-ai-workflow-builder.skill"
[ -f "$SKILL_FILE" ] && rm "$SKILL_FILE"

cd "$SCRIPT_DIR"
zip -r "$SKILL_FILE" \
    human-directed-ai-workflow-builder/SKILL.md \
    human-directed-ai-workflow-builder/references/discovery-guide.md \
    human-directed-ai-workflow-builder/references/generation-templates.md \
    human-directed-ai-workflow-builder/references/refinement-protocol.md \
    -x "*.DS_Store" \
    -q

if [ ! -f "$SKILL_FILE" ]; then
    echo -e "${RED}Error: Failed to create human-directed-ai-workflow-builder.skill${NC}"
    exit 1
fi

SKILL_SIZE=$(du -h "$SKILL_FILE" | cut -f1)
echo -e "${GREEN}✓ Created human-directed-ai-workflow-builder.skill ($SKILL_SIZE)${NC}\n"

# ═══════════════════════════════════════════════════════
# BUILD SUMMARY
# ═══════════════════════════════════════════════════════

echo -e "${GREEN}═══════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}   Build Complete!${NC}"
echo -e "${GREEN}═══════════════════════════════════════════════════════${NC}\n"

echo -e "${BLUE}Package:${NC}"
echo -e "  File: human-directed-ai-workflow-builder.skill"
echo -e "  Size: $SKILL_SIZE"
unzip -l "$SKILL_FILE"
echo ""

echo -e "${BLUE}Next steps:${NC}"
echo "1. Review generated files in human-directed-ai-workflow-builder/references/"
echo "2. Install: unzip -o human-directed-ai-workflow-builder.skill -d ~/.claude/skills/"
echo "3. Commit changes if everything looks good"
echo ""
