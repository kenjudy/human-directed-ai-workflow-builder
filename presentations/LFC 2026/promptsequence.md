# Prompt Sequence: Running human-directed-ai-workflow-builder Without Installing a Skill

**What this is:** The same 3-phase process as the installable
`human-directed-ai-workflow-builder` Claude Skill — Discovery → Generation → Refinement —
expressed as copy-paste prompts instead of a skill file. Use these when you don't have
(or don't want) the skill installed: a plain claude.ai conversation, the API, Claude Code
without the skill loaded, or a live demo where installing something first would slow the
room down.

**When to use the installed skill instead:** If you have Claude Code and can install
skills, install the real thing — `claude-skill/human-directed-ai-workflow-builder.skill`.
It triggers automatically on the right phrases and doesn't require you to paste a large
prompt. These prompts exist for everywhere the installed skill isn't an option.

**How the three prompts relate:** Prompt 1 and Prompt 2 run in the *same* conversation —
Prompt 2 depends on the confirmed discovery summary Prompt 1 produces. Prompt 3 runs
later, in a *different* context — after the generated skill has been used for at least
one real PLAN→DO→CHECK→ACT cycle, typically pasted at the end of that cycle's ACT phase.

**Keeping this in sync:** This file is a manually maintained mirror of
`Scaffold/Socratic Discovery.md`, `Scaffold/Generation Templates.md`, and
`Scaffold/Refinement Protocol.md`. If you edit any of those masters, update the matching
prompt below in the same change — `build-scaffold.sh` does not regenerate this file.

---

## Prompt 1 — Start Discovery

Paste this as your first message. Answer each layer's questions as they come; do not
answer future layers early even if you already know what you'll say.

```
You are going to guide me through a 5-layer Socratic Discovery process to define a
custom PDCA (Plan-Do-Check-Act) skill for a complex, repeatable task I do. Ask the
questions in each layer, wait for my answer, and do not combine or skip layers.

## Layer 1 — Task Essence

Ask both questions together:

1. In one sentence: what is the task, and what does a completed cycle deliver?
   (For example: "Weekly client status report — delivers a reviewed, sent report with
   metrics and risks.")
2. How often is one full cycle performed?
   (daily / weekly / monthly / quarterly / on-demand / event-triggered)

## Layer 2 — Human-AI Role Division

After Layer 1 is answered, ask:

3. What parts of this task require human judgment that cannot be delegated to AI?
   (Think: decisions that depend on relationships, context not in documents, ethical
   weight, or accountability.)
4. What parts can AI execute autonomously, with the human reviewing only at defined
   gates? (Think: research, drafting, formatting, data gathering, summarizing.)
5. What are the irreversible or highest-stakes moments — decisions the human must own,
   where a mistake is costly or hard to undo?

## Layer 3 — Quality Contract

After Layer 2 is answered, ask:

6. How do you know when one cycle is successfully complete? Name 3-5 specific,
   observable signals. Not "it feels right" — what would you point to?
7. What are the most common failure modes you want this process to prevent?
   (What goes wrong when the task is done badly or skipped?)

## Layer 4 — Process Shape

After Layer 3 is answered, ask:

8. What are the natural phases in this task? Describe what "analysis done" looks like
   (before execution begins) and what "execution done" looks like (before you verify
   quality).
9. What behaviors by the AI should trigger an immediate STOP and human intervention?
   (Think: scope creep, skipping a step, making assumptions about stakeholders,
   producing output without a required review gate.)

## Layer 5 — Learning Loop

After Layer 4 is answered, ask:

10. What process debt tends to accumulate when this task is done repeatedly?
    (What shortcuts get taken, what steps get skipped "just this once"?)
11. What do you want to learn and improve from each cycle?
    (What would make the next cycle faster, higher quality, or less stressful?)

## Confirmation Gate

After all five layers, present this exact structured summary and require my explicit
confirmation before treating discovery as complete:

Here is my understanding of the task. Please confirm before I generate the skill.

**Task:** [one-sentence description]
**Cycle frequency:** [answer from Layer 1]

**Human owns:**
- [list from Layer 2, Q3 and Q5]

**AI executes (with review gates):**
- [list from Layer 2, Q4]

**Done looks like:**
- [signals from Layer 3, Q6]

**Common failure modes to prevent:**
- [list from Layer 3, Q7]

**Phase boundaries:**
- Analysis done: [from Layer 4, Q8]
- Execution done: [from Layer 4, Q8]

**STOP triggers (immediate human intervention):**
- [list from Layer 4, Q9]

**Learning loop focus:**
- [from Layer 5, Q10 and Q11]

Does this accurately capture what you want to systematize?

If any answer is vague — "the human owns the important parts," "it's done when it looks
good," "stop if something seems wrong" — ask me one clarifying follow-up before including
it in the summary. Do not proceed past the confirmation gate until I explicitly confirm
or correct the summary.

Start with Layer 1 now.
```

---

## Prompt 2 — Generate the Skill

Paste this in the **same conversation**, right after you've confirmed the Layer 1-5
summary from Prompt 1.

```
I confirm the discovery summary above. Now generate a domain-specific PDCA skill from
it.

First ask: "Where would you like the skill generated? The skill directory will be named
`[domain]-pdca/`. Provide a path relative to the current directory, or press Enter to
use the current directory." Wait for my answer. Before generating any files, restate
the resolved path and confirm: "I'll generate the skill at `[resolved-path]/[domain]-pdca/`.
Confirm?" Do not proceed until I confirm.

Then generate these files at `[base-path]/[domain]-pdca/` (domain name from the task
description, slugified, lowercase, hyphens):

[domain]-pdca/
├── SKILL.md
└── references/
    ├── working-agreements.md
    ├── phase-prompts.md
    └── quality-gates.md

Fill in every bracketed placeholder from the confirmed discovery summary — do not leave
any placeholder unfilled.

SKILL.md must start with a line containing exactly `---` (opening YAML frontmatter), then:

---
name: [domain]-pdca
description: Guides [one-sentence task description from Layer 1]. Applies structured
  analysis, disciplined execution, and quality verification under human supervision.
  Use this skill whenever working on [task domain] tasks, [domain] cycles, or any
  request to [verb from task description]. Triggers on phrases like "[domain keyword]",
  "[action verb] [output]", or "let's work on [domain]".
---

# [Domain] PDCA Framework

A structured human-AI collaboration process for [task description].
Cycle frequency: [Layer 1 answer].

## How to Use This Skill

Work through phases in order. Each phase has a STOP condition before proceeding.

**PLAN** — Understand the context and define the approach before executing.
See references/phase-prompts.md → PLAN phase.

**DO** — Execute with discipline. Human intervention is mandatory at defined gates.
See references/phase-prompts.md → DO phase.

**CHECK** — Verify quality against the agreed criteria before declaring done.
See references/phase-prompts.md → CHECK phase.

**ACT** — Retrospect. Propose refinements to this skill. Human approves changes.
See references/phase-prompts.md → ACT phase.
See references/working-agreements.md for the current version and process discipline rules.

## STOP Triggers — Intervene Immediately

If any of these occur, stop the AI and restate the relevant phase prompt:
[list each STOP trigger from Layer 4, Q9]

## Human Ownership — Non-Negotiable

The human owns these decisions. AI must not proceed past them without explicit approval:
[list each human-owned element from Layer 2, Q3 and Q5]

references/working-agreements.md must contain: a version block (Version 1, today's
date, "See git log for this file"), Human Owns (Layer 2 Q3+Q5, verbatim where possible),
AI Executes With Review Gates (Layer 2 Q4, naming the review gate explicitly — "AI
drafts, human reviews before sending," not just "AI drafts"), Intervention Triggers
(Layer 4 Q9, as imperative statements: "Stop if AI [behavior]"), Process Debt to Watch
For (Layer 5 Q10), an Implementation Approach section (understand before executing, one
phase at a time, minimal scope, respond to feedback), and a Definition of Done checklist
(Layer 3 Q6).

references/phase-prompts.md must contain PLAN, DO, CHECK, and ACT sections. PLAN ends
with a mandatory human review gate before execution begins. DO lists 3-5 domain-specific
execution steps and the mandatory human gates from Layer 2 Q5, each phrased "GATE:
Before [action], present [output] to human for approval." CHECK is a verification
checklist built from Layer 3 Q6 and a failure-mode check built from Layer 3 Q7. ACT is a
retrospective template (cycle overview, critical moments, process insights, top 3
actionable insights) plus a mandatory pointer to the refinement protocol.

references/quality-gates.md must contain a numbered Definition of Done (Layer 3 Q6, each
item specific enough to be checkable by someone who wasn't in the session), a Common
Failure Modes list (Layer 3 Q7, each with a concrete detection indicator), and a Gate
Escalation section (identify the gap, return to DO, never lower the bar to pass).

After generating all files, tell me:
1. To review references/working-agreements.md especially — the STOP triggers and human
   ownership lines are the enforcement mechanism.
2. The exact git commands to add and commit the new skill directory.
3. The exact command to install it locally (copy the directory into ~/.claude/skills/).
4. That I should validate it with /skill-creator before production use — it verifies
   the SKILL.md format and description triggering, and runs with-skill vs. without-skill
   comparisons to confirm the skill actually helps.
5. That refinements happen at the end of each ACT phase using Prompts 3 and 4 in this sequence — Prompt 3 runs the retrospective, Prompt 4 refines the skill from it.
6. To install the skill-creator needed for step 4, if not already installed: download SKILL.md from https://github.com/anthropics/skills/blob/main/skills/skill-creator/SKILL.md into ~/.claude/skills/skill-creator/ and restart Claude Code, then run /skill-creator to initiate a full eval of the generated skill against the confirmed discovery summary.
```

---

## Prompt 3 — Retrospective (After a Cycle)

Use this **in the same context** where you ran the generated skill's cycle, at the end of the ACT phase. Paste it after the cycle's work is complete but before closing the session.

```
We just completed a [domain]-pdca cycle. Run a retrospective.

Analyze this session for:
- The main goal and whether it was achieved
- 2-3 specific moments where the approach most impacted success or failure — concrete decisions or interventions, not generic observations
- Patterns in the collaboration: what accelerated progress, what created friction, any wasted effort
- Whether the phase discipline held (PLAN gate respected before DO, CHECK gate respected before closing), and where it didn't

Present that analysis summary. Then facilitate reflection in four stages:

Stage 1 — Gather data
Present your summary. Ask: "What stands out to you? What surprised you?"

Stage 2 — Generate insights
Listen to the response. You may offer observations framed as hypotheses ("I noticed X happening — could that be the pattern?"). Do not answer for them. Ask: "Why do you think that happened? What does it tell you about how you're collaborating?"

Stage 3 — Decide what to do
Ask: "Of everything we've discussed, what ONE thing — in your prompts, your context, or your behavior — would reduce the chance of this happening next cycle?"
If the human is stuck, offer 2-3 candidate hypotheses. They choose and commit. One thing only.

Stage 4 — Close
Ask: "How should we capture that?" If it's a process change, name it explicitly — it becomes the input for Prompt 4 if you choose to refine the skill this cycle. If the cycle was routine with no friction or surprises, say so plainly and skip Prompt 4.
```

---

## Prompt 4 — Refine After a Cycle

Use this **after Prompt 3**, in the same context where you ran the retrospective. Paste it once the retrospective has surfaced at least one concrete process insight worth acting on. This is a fresh use of the prompt, not a continuation of the Prompt 1/2 conversation.

```
We just finished an ACT retrospective for the [domain]-pdca skill, cycle [N]. Propose
refinements to the skill's reference files following this protocol.

Anti-drift rule: net line change across all references/ files must be ≤ +10 lines this
cycle. For every addition, identify one existing rule to narrow, consolidate, or remove.
Check current line count first: wc -l [domain]-pdca/references/*.md

Step 1 — From the retrospective, extract only insights with a clear implication for
specific skill content. "The cycle went well overall" is not a candidate. "We skipped
the Layer 3 gate twice because it felt redundant" is.

Step 2 — For each candidate, identify the exact file (working-agreements.md,
phase-prompts.md, or quality-gates.md) and section. Do not propose SKILL.md changes
unless the trigger description itself needs updating.

Step 3 — Draft each change as a concrete before/after, not a description:

File: references/[file]
Section: [section]
Change type: [add | narrow | remove | consolidate]
BEFORE: [exact current text, or "nothing" if adding]
AFTER: [exact proposed text, or "remove" if deleting]
Reason: [one sentence from the retrospective that motivates this specific change]

Limit to 3-5 proposed changes. If there are more candidates, prioritize the ones
addressing the most significant discipline breakdown or quality gap.

Step 4 — Present all proposed diffs together with the current and proposed net line
count, and ask me accept / modify / reject for each one individually. Do not apply
anything until I've responded to each.

Step 5 — For each change I accept or modify, edit the file directly and note it in the
version block at the top of working-agreements.md.

Step 6 — Update the version block (Version N+1, today's date) and give me the exact git
commit command, with one bullet per accepted change in the commit message body.

If the cycle was routine with no discipline issues, all retrospective insights are "keep
doing," or the last refinement was under 2 cycles ago and untested — tell me plainly
"No refinements proposed this cycle" instead of manufacturing changes.

Do not propose a rewrite. If a change touches more than 30% of a section, break it into
smaller targeted diffs instead.
```

---

## License & Attribution

Part of the human-directed-ai-workflow-builder.

**License:** [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/)

**Source:** [human-directed-ai-workflow-builder](https://github.com/kenjudy/human-directed-ai-workflow-builder)
