# 45-Minute Exercise: PDCA Your Way to a Skill-Ready Plan

**Purpose:** By minute 40, every participant holds a completed, confirmed plan — in the exact Confirmation Gate format from `Scaffold/Socratic Discovery.md` — ready to paste into a real Claude session and generate a custom skill for their task. Minutes 40-45 prove it: one finished plan gets fed live into **Prompt 2** of `claude-skill/prompt-sequence.md`, no skill installation required.

The Plan → Do → Check → Act loop is a Socratic Discovery process this repo runs before generating a skill — the exercise just runs it as a facilitated, timeboxed group session instead of a one-on-one conversation with Claude, and adds a peer pressure-test the solo version doesn't have.

**This is the second half of one continuous session.** `15-Minute Exercise.md` is the walkthrough that comes immediately before this: it narrates the same four phases on a worked example so the room knows what each question is asking before answering it for real here. Run them back to back — the bridge at the end of the walkthrough already has participants picking their task and writing it at the top of their capture sheet, so this document's clock starts at that point, not from zero.

**Format:** Facilitator-led, pairs for the peer review step. **Requires each participant's own real, repeatable task** — the whole point is a plan they can actually use afterward, so a toy task defeats the purpose. Have the fallback example (below) ready as a backup, and a pre-completed capture sheet for it in case no volunteer's plan is finished in time for the live demo.

**You need:** a visible timer, one capture sheet per person (below — same sheet continues from the walkthrough), pens, pairs seated together, and — for the closing demo — a laptop with a plain Claude session (claude.ai, the API, or Claude Code with no skill needed) projected, plus `claude-skill/prompt-sequence.md` open to Prompt 2.

---

## Picking Up from the Walkthrough

If the walkthrough's bridge already ran, participants have their real task written down and are ready for PLAN. If you're starting fresh (walkthrough skipped), ask the room first:

```
Think of a task you do over and over, one you'd actually want a custom AI-assisted
skill for. It needs to be real — you're about to build an actual plan for it.
```

**Fallback example** (only if someone truly can't name one in the moment):

> *Preparing and sending a weekly status update to your manager and stakeholders.*

Everyone writes their task's name at the top of the capture sheet. Move on immediately.

---

## Timing Box

| Time | Phase | Layer(s) | Deliverable |
|---|---|---|---|
| 0:00-2:00 | Frame | — | Task named |
| 2:00-7:00 | **PLAN** | Layer 1 — Task Essence | Q1-Q2 answered |
| 7:00-21:00 | **DO** | Layer 2 — Human-AI Role Division, Layer 4 — Process Shape | Q3-Q7 answered |
| 21:00-29:00 | **CHECK** | Layer 3 — Quality Contract | Q8-Q9 answered + peer vagueness pass |
| 29:00-36:00 | **ACT** | Layer 5 — Learning Loop | Q10-Q11 answered |
| 36:00-40:00 | Assemble | Confirmation Gate | Full summary written, ready to paste |
| 40:00-45:00 | Live demo | — | Summary fed into Prompt 2, no skill install needed |

Read each phase's questions aloud once, hold the stated time, move on even mid-answer — an unfinished but honest answer is more useful than a polished one that misses the window. Nobody leaves without a full, if rough, Confirmation Gate summary.

**Why DO carries five questions:** DO is where "the doing" actually gets shaped: not just who does it (Layer 2), but where its boundaries sit and when it has to stop (the parts of Layer 4 about execution, as opposed to Layer 4's learning-loop cousin, which moved to ACT). CHECK stays focused purely on quality signals, and ACT stays focused purely on what to learn and change next cycle — closer to what "Act" means in a textbook PDCA loop.

---

## PLAN — Layer 1: Task Essence (5 min)

Say:

```
Let's understand the task you want to systematize. Answer both, written.
```

**Q1:** *In one sentence: what is the task, and what does a completed cycle deliver?* (Example: "Weekly client status report — delivers a reviewed, sent report with metrics and risks.")

**Q2:** *How often is one full cycle performed?* (daily / weekly / monthly / quarterly / on-demand / event-triggered)

---

## DO — Layer 2 + Layer 4: Role Division and Process Shape (14 min)

Say:

```
Now let's map who owns what, and where the boundaries of "doing" actually sit. For Q4,
name the review gate explicitly: "AI drafts X, human reviews before Y" — not just "AI
drafts X." For Q6, phrase each trigger as "Stop if AI [behavior]." Both phrasings slot
straight into the generated skill without editing.
```

**Q3 (2.5 min):** *What parts of this task require human judgment that cannot be delegated to AI?* (Think: decisions that depend on relationships, context not in documents, ethical weight, or accountability.)

**Q4 (3.5 min):** *What parts can AI execute autonomously, with the human reviewing only at defined gates?* Name the gate explicitly, not just the task.

**Q5 (2.5 min):** *What are the irreversible or highest-stakes moments — decisions the human must own, where a mistake is costly or hard to undo?*

**Q6 (3 min):** *What behaviors by the AI should trigger an immediate STOP and human intervention?* Phrase each as "Stop if AI [specific behavior]." (Think: scope creep, skipping a step, making assumptions about stakeholders, producing output without a required review gate.)

**Q7 (2.5 min):** *What are the natural phases in this task? Describe what "analysis done" looks like (before execution begins) and what "execution done" looks like (before you verify quality).*

---

## CHECK — Layer 3: Quality Contract (8 min)

Say:

```
Now let's define what "done well" looks like — then pressure-test everything you've
written so far.
```

**Q8:** *How do you know when one cycle is successfully complete? Name 3-5 specific, observable signals.* Not "it feels right" — what would you point to?

**Q9:** *What are the most common failure modes you want this process to prevent?* (What goes wrong when the task is done badly or skipped?)

### Peer Vagueness Pass (folded into CHECK's 8 minutes — budget the last 3)

```
Swap capture sheets with your partner. Circle any answer that matches one of these
patterns — they're too vague for a real plan:

- "The human owns the important parts" — which parts, specifically?
- "It's done when it looks good" — what observable signal, specifically?
- "Stop if something seems wrong" — what concrete behavior, specifically?

Hand it back. If anything's circled, the owner has 60 seconds to rewrite it before ACT.
```

This is the same bar `Scaffold/Socratic Discovery.md` applies before a plan is allowed to drive generation — the peer pass just does it faster than one person catching their own vagueness alone.

---

## ACT — Layer 5: Learning Loop (7 min)

Say:

```
Last step: what gets better next cycle.
```

**Q10 (3.5 min):** *What process debt tends to accumulate when this task is done repeatedly?* (What shortcuts get taken, what steps get skipped "just this once"?)

**Q11 (3.5 min):** *What do you want to learn and improve from each cycle?* (What would make the next cycle faster, higher quality, or less stressful?)

---

## Assemble the Confirmation Gate Summary (4 min)

Say:

```
Copy your own answers into this exact template — this is the same confirmation format
a real Claude session will present back to you when you run Prompt 1 in
claude-skill/prompt-sequence.md. Filling it in yourself means you walk into that session
with a plan already confirmed, not a blank page.
```

```
**Task:** [Q1]
**Cycle frequency:** [Q2]

**Human owns:**
- [Q3 and Q5]

**AI executes (with review gates):**
- [Q4]

**Done looks like:**
- [Q8]

**Common failure modes to prevent:**
- [Q9]

**Phase boundaries:**
- Analysis done: [Q7]
- Execution done: [Q7]

**STOP triggers (immediate human intervention):**
- [Q6]

**Learning loop focus:**
- [Q10 and Q11]
```

This is the deliverable. By 40:00, everyone should have this filled in, even roughly.

---

## Live Demo: Real Plan → Real Generation (5 min)

```
Watch this happen once, live, with one volunteer's finished summary — and notice this
runs in a plain Claude session, no skill install required.
```

1. Pick one volunteer's completed summary (or use the prepared fallback if no one's ready).
2. Open a plain Claude session — claude.ai, the API, or Claude Code with nothing installed — projected for the room.
3. Paste **Prompt 2** from `claude-skill/prompt-sequence.md`, with the volunteer's confirmed summary included where the prompt says "I confirm the discovery summary above" — since this is a fresh conversation rather than a continuation of a live Prompt-1 discovery, paste the summary itself directly above Prompt 2's text.
4. Let the room watch Claude accept the plan and begin generating the skill files. You don't need to wait for a finished skill — the point is proving the plan the room just built in 40 minutes is immediately, literally usable, with nothing to install.

---

## Capture Sheet (print or copy per participant)

```
Task: ______________________________________________

PLAN — Layer 1: Task Essence
Q1 (task + what a completed cycle delivers):

Q2 (cycle frequency):

DO — Layer 2 + Layer 4: Role Division and Process Shape
Q3 (human judgment that can't be delegated):

Q4 (what AI can execute autonomously — name the review gate: "AI drafts X, human
reviews before Y"):

Q5 (irreversible / highest-stakes moments):

Q6 (STOP triggers — phrase each as "Stop if AI [behavior]"):

Q7 (phase boundaries — analysis done / execution done):

CHECK — Layer 3: Quality Contract
Q8 (3-5 observable signals of a successful cycle):
 1.
 2.
 3.

Q9 (common failure modes to prevent):

ACT — Layer 5: Learning Loop
Q10 (process debt that accumulates):

Q11 (what to learn/improve each cycle):

=== CONFIRMATION GATE SUMMARY (assembled from above) ===
[fill in the template from the Assemble step]
```

---

## Facilitator Notes

- **The peer vagueness pass is not optional filler.** A plan with "the human owns the important parts" written under Q3 will produce a generated skill with no real intervention points. This is the single highest-leverage 3 minutes in the exercise.
- **The Q4 and Q6 phrasing conventions matter as much as the content.** "AI drafts X, human reviews before Y" and "Stop if AI [behavior]" aren't style preferences; they're the literal phrasing Prompt 2 and the generated skill's templates expect. Answers written any other way still work, but need a translation step the room doesn't have time for; answers written in these forms paste in directly.
- **DO is the long phase (14 min) because it now carries five questions, not three.** Don't compress it to protect ACT — ACT only has two questions left and genuinely fits in 7 minutes.
- **Don't let Q1 turn into scope debate.** If someone's task is too big, tell them to scope it to one recurring cycle, not the whole area of responsibility.
- **Hold the line on "real task."** If someone insists on a toy example anyway, let them, but tell them plainly the plan they walk out with will only be as useful as the task was real — this exercise trades the felt-experience angle of the 15-minute version for a usable output, and that trade only pays off with a real task.
- **Prepare the fallback's completed capture sheet in advance** so the live demo never stalls waiting for a volunteer to finish.
- **If running virtually,** do the peer vagueness pass in breakout pairs with a shared doc, and pull the demo volunteer's summary from that doc directly.

---

## License & Attribution

Part of the Human-AI PDCA Collaboration Process framework.

**License:** [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/)

**Source:** [human-directed-ai-workflow-builder](https://github.com/kenjudy/human-directed-ai-workflow-builder)
