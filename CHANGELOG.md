# human-directed-ai-workflow-builder Changelog

## v1.2.0 (2026-06-19)

### Breaking Change
- **Repository split and rename**: skill formerly known as `pdca-scaffold` moved from `kenjudy/pdca-framework` into its own repository `kenjudy/human-directed-ai-workflow-builder`, and renamed to `human-directed-ai-workflow-builder`. No changes to the skill content itself.

---

## v1.1.0 (2026-05-28)

### New Skill (initial release as part of pdca-framework)
- **pdca-scaffold**: First-class skill using 5-layer Socratic discovery to generate a domain-specific PDCA skill for any complex repeatable human task. Includes an active learning loop: after each ACT phase, proposes specific diffs back to the skill's own reference files; the human approves and commits; the skill sharpens over cycles without growing longer (anti-drift rule: +/- 10 net lines per refinement). Added `5. Scaffold/` master source files, `build-scaffold.sh`, and `pdca-scaffold/SKILL.md`.
- **daily-retro-pdca**: Scaffolded example skill for structured daily and weekly retrospection. Added to `scaffolded-skills/`.
