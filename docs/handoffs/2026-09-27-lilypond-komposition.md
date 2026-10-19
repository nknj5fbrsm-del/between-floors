# Handoff: LilyPond / Score–Sound-Test

**Datum:** 2026-09-27  
**Thema:** Kann ein Cursor-Modell Stairwell-Light-artige Klavierkompositionen in LilyPond schreiben — und den Score→Sound-Pfad nachbauen?  
**Pfad:** `/Users/nilspocklitz/Desktop/Cursor Projekte/Lilypond Komposition`  
**Hinweis:** Inhalt aus `lilypond-test` hierher zusammengeführt; `lilypond-test` gelöscht (2026-09-27).  
**Chat:** [Grok Bot / LilyPond-Test](1879eaa1-3807-4928-a949-17d92651a96d)  
**Referenz-PDF:** `/Users/nilspocklitz/Downloads/Stairwell Light — Score : Sound.pdf`

---

## 1. Was gilt

**Ja — der Score-Teil ist machbar.** Ein starkes Reasoning-Modell (hier: **Opus 5 high Thinking**) hat aus einem offenen Prompt ein vollständiges, kompilierbares Solo-Klavierstück erzeugt. Der erste Lauf ohne Nachbesserung hat den Nutzer überzeugt.

Der **Sound-Teil** (Suno-Transformation) ist kein Cursor-Modell. Cursor liefert Score + MIDI + schlichtes Klavier-Audio als Input für Suno.

---

## 2. Referenz: Stairwell Light (aus dem PDF)

Album: acht kurze Klavierwerke, je zwei Formen — **Score** (symbolisch) und **Sound** (generativ transformiert).

Pipeline im Original:

1. Offener Prompt: `"Compose a short work for solo piano …"` plus kleine Variation
2. **CODEX** schreibt die komplette Komposition in LilyPond (Tonhöhen, Rhythmus, Stimmen, Harmonik, Textur, Dynamik, Form)
3. LilyPond → MIDI → schlichtes Klavier-Audio (nur Schnittstelle, kein Kunstwerk)
4. **SUNO** transformiert akustisch (Arpeggien auffächern, Tempo, Proportionen, Gesten) — bleibt erkennbar, ist nicht identisch
5. Mensch = **Systemautor**: Verfahren setzen, hören, auswählen, veröffentlichen

Typische Impuls-Sätze (keine Tonart/Form/Stil):

- `"Make all other musical decisions yourself."`
- `"Let later material retain a perceptible memory of earlier material."`
- `"Do not decide on the form in advance; let it emerge from the material."`
- `"Favor musical ideas that are likely to feel expressive and rewarding to human listeners."`
- `"Compose with the expectation that a human listener should want to hear the piece again."`

Kernfrage des Projekts: Was entsteht, wenn ein System strukturell komponiert, ohne menschliche Hörbiografie?

---

## 3. Test-Prompt (freigegeben)

```text
Compose a short work for solo piano.

Duration: about 90–120 seconds at a moderate tempo.
Make all other musical decisions yourself: key (or lack of key), meter, form, harmony, texture, register, dynamics, articulations, and pedaling.

Favor musical ideas that are likely to feel expressive and rewarding to human listeners. Compose with the expectation that a human listener should want to hear the piece again.

Do not decide on the form in advance; let it emerge from the material. Let later material retain a perceptible memory of earlier material.

Output requirements:
- Produce a complete, self-contained LilyPond score that compiles with LilyPond 2.24+.
- Solo piano only (one staff pair / PianoStaff).
- Include title, composer credit as "AI draft (test)", and a tempo marking.
- No explanatory prose before or after the code — LilyPond source only.
- Prefer clear, readable notation over extreme density.
```

Warum so: offene Sätze aus dem PDF, Test kurz (90–120 s), erzwingt kompilierbare LilyPond-Ausgabe ohne Stil-Korsett.

---

## 4. Modell-Empfehlung

| Rang | Modell | Rolle |
|------|--------|--------|
| 1 | **Claude Opus (Thinking) / Opus 5 high Thinking** | Getestet. Bester Kandidat für gültiges LilyPond + musikalischen Bogen. |
| 2 | GPT-5.6 | Starke Alternative, wenn Opus teuer/langsam. |
| 3 | Codex | Gleicher symbolischer Pfad wie im PDF. |
| — | Composer Fast, Gemini Flash, Grok Fast | Eher Syntax-/Form-Schwächen; nicht für den ersten Lauf. |

Zwei getrennte Schwierigkeiten:

- **LilyPond-Syntax** — leicht, modellunabhängig, Fehler gratis via `lilypond` erkennbar.
- **Musikalische Kohärenz** — teuer: Motiv über 30 Takte, Register/Dynamikbogen, Stimmführung, Höhepunkt. Skaliert mit Modellstärke.

Kosten-Hinweis: Output ist klein (~100 Zeilen). Teuer sind Denk-Tokens, nicht die Partitur. Fünf Läufe mit günstigerem Modell + Auswahl kann einen einzelnen Opus-Lauf schlagen — **nicht empirisch getestet**.

Nächster Vergleich (vorgeschlagen, nicht gemacht): denselben Prompt über 3–4 Modelle, rendern, **blind hören**. Kandidaten zuerst: GPT-5.6, Gemini Flash high.

---

## 5. Was entstanden ist

**Stück:** *Between Floors* — Solo-Klavier, E-Moll / E-Aeolisch mit G-Dur-Färbung, Andante con calma ♩=63, 30 Takte, ~1:57 / ~115 s.

Form (aus dem Material, nicht vorgeplant):

- T. 1–2: Intro, nur linke Hand (Arpeggio)
- T. 3–8: Kopfmotiv h–d–e leise
- T. 9–14: Sequenzierung, Crescendo
- T. 15/17: *forte*, zweimal hohes h''
- T. 21–26: Motiv verkürzt zurück
- T. 27–30: Coda, liegende Töne, *ppp* + Fermate

Linke Hand: durchgehende Achtel-Arpeggien, Pedalwechsel pro Harmonie (`sustainOn`/`sustainOff`).

**Quelle:** `scores/between-floors/between-floors.ly`  
**Erwartete Artefakte** (beim Test erzeugt; ggf. erneut rendern):

| Datei | Inhalt |
|-------|--------|
| `scores/between-floors/between-floors.ly` | LilyPond-Quelle (bleibt) |
| `scores/between-floors/between-floors.pdf` | Notensatz, 1 Seite |
| `scores/between-floors/preview.png` | Vorschau |
| `scores/between-floors/between-floors.midi` | Symbolische Zwischenstufe |
| `scores/between-floors/between-floors.mp3` | Klavier-Audio, −16 LUFS, Peak −1.5 dB, Suno-tauglich |

Kompilat: LilyPond **2.26.0**, keine Warnungen.

---

## 6. Lokale Toolchain (installiert)

Beim Test neu auf dem Rechner:

| Tool | Quelle | Zweck |
|------|--------|--------|
| LilyPond 2.26 | `brew install lilypond` | Score + MIDI |
| fluid-synth 2.6.1 | `brew install fluid-synth` | MIDI → WAV |
| MuseScore General SF3 | `~/.local/share/soundfonts/MuseScore_General.sf3` | Klavier-Soundfont (~38 MB, osuosl.org) |
| ffmpeg | bereits unter `~/.local/bin/ffmpeg` | WAV → MP3, Loudnorm |

Render-Befehle (aus `scores/between-floors/` oder via `./scripts/render-score.sh between-floors`):

```bash
lilypond between-floors.ly
lilypond --png -dresolution=110 -o preview between-floors.ly
fluidsynth -ni -F between-floors.wav -r 44100 -g 0.9 \
  ~/.local/share/soundfonts/MuseScore_General.sf3 between-floors.midi
ffmpeg -y -i between-floors.wav \
  -af loudnorm=I=-16:TP=-1.5:LRA=11 -ar 44100 \
  -codec:a libmp3lame -q:a 2 between-floors.mp3
```

WAV nach Normalisierung gelöscht. `preview.midi` (Duplikat) ebenfalls entfernt.

---

## 7. Grenzen / Lessons

- Machbar: 2–4-Minuten-Solo-Klavier, 1–2 Stimmen, Dynamik, einfacher Bogen.
- Braucht Iteration bei anderen Läufen: generieren → `lilypond` → Fehler fixen → MIDI/MP3 hören.
- Grenzen: lange Polyphonie, feines Pedaling/Articulation, „Meisterwerk“ ohne Auswahl. Qualität schwankt.
- Systemautorschaft bleibt: hören, vergleichen, wählen — wie im PDF.
- Dieser Lauf war **ein** Versuch ohne Nachbesserung. Seriell (3–5× gleicher Prompt) ist der eigentliche Stairwell-Light-Prozess und noch nicht gemacht.
- Grok Bot ersetzt diesen Pfad nicht (andere Aufgabe: Cloud-Teammates in Apps).

---

## 8. Offene nächste Schritte (besprochen, nicht gemacht)

1. MP3 in **Suno** laden — Score gegen Sound stellen (kompletter Original-Pfad).
2. **Seriell:** gleichen Prompt 3–5×, auswählen.
3. **Impuls variieren:** je einen PDF-Satz austauschen, Möglichkeitsraum vergleichen.
4. **Modellvergleich** tokenschonend: GPT-5.6 / Gemini Flash high vs. Opus, blind hören.
5. `.ly` nachhören und gezielt nacharbeiten (Form, Register, Dichte), dann neu rendern.

---

## 9. Wichtige Dateien

| Thema | Ort |
|-------|-----|
| Handoff | `docs/handoffs/2026-09-27-lilypond-komposition.md` |
| Partitur | `scores/between-floors/between-floors.ly` |
| Referenz | `~/Downloads/Stairwell Light — Score : Sound.pdf` |
| Soundfont | `~/.local/share/soundfonts/MuseScore_General.sf3` |
