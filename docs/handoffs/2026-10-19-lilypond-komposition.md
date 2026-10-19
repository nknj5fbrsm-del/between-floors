# Handoff: LilyPond Komposition

**Datum:** 2026-10-19  
**Pfad:** `/Users/nilspocklitz/Desktop/Cursor Projekte/Lilypond Komposition`  
**Vorher:** `docs/handoffs/2026-09-27-lilypond-komposition.md` (Score→Sound-Test, *Between Floors*)

---

## 1. Was gilt

Score→Sound-Pipeline ist etabliert und zweimal durchgespielt:

1. **Between Floors** — Klavier → Solopiano-Suno → Bigband-Final  
2. **Horn and Reed Fugue** — Bach-artige Fuge (Score: *Fugue in D Minor*) → `fugue2` → Bigband-Final

Beide Alben sind als **Hör-HTML + PDF** dokumentiert und auf **GitHub Pages** live. Credits: **NilsP**. Suno steuert der Agent nicht — Mensch liefert Finals zurück.

---

## 2. Live-URLs

| Werk | Pages | Repo |
|------|-------|------|
| Between Floors | https://nknj5fbrsm-del.github.io/between-floors/ | https://github.com/nknj5fbrsm-del/between-floors |
| Horn and Reed Fugue | https://nknj5fbrsm-del.github.io/horn-and-reed-fugue/ | https://github.com/nknj5fbrsm-del/horn-and-reed-fugue |

Suno-Alben:

- Between Floors: https://suno.com/album/308283af-ca5b-4692-8414-55bc37e90f03  
- Horn and Reed Fugue: https://suno.com/album/08977bc9-f3ff-48ae-a48f-556f2e62fabf  
- Profil: https://suno.com/@cwzjtpwwwy  

Beide HTML-Seiten haben CTA **„Auf Suno liken“** (Cover, Finale, Impressum).

---

## 3. Projektstruktur

```
scores/<slug>/          # ein Stück = ein Ordner (.ly, .pdf, .midi, .mp3, preview*.png)
scripts/render-score.sh # ./scripts/render-score.sh <slug>
.cursor/skills/score-sound/  # @score-sound Workflow-Skill
docs/album/             # Between Floors Album (HTML/PDF/Typst/Audio)
docs/horn-and-reed-fugue/    # Fugen-Album (HTML/PDF/Typst/Audio)
docs/handoffs/
```

Render: LilyPond → FluidSynth (`~/.local/share/soundfonts/MuseScore_General.sf3`) → ffmpeg loudnorm (−16 LUFS).

---

## 4. Skill `@score-sound`

Projekt-Skill, Menü zuerst:

| Befehl | Wirkung |
|--------|---------|
| `neu` | Komponieren → Render bis MP3 → Stopp (Suno beim Nutzer) |
| `fertig` | Suno-MP3s → Album-PDF + HTML → GitHub Pages (neues Repo oder bestehendes) |
| `render` | Nur `.ly` neu rendern |

Defaults: Credits NilsP, Album-Look an `docs/album/` bzw. Fugen-Variante.

---

## 5. Stücke (Stand)

### Between Floors
- Score: `scores/between-floors/` — E-Moll, Andante, Solo-Klavier  
- Hörstufen: LilyPond-Render → Solopiano-Suno → Bigband-Final  
- Docs: `docs/album/`  

### Horn and Reed Fugue
- Score-Titel: *Fugue in D Minor* (`scores/fugue-in-d-minor/`) — d-Moll, Moderato ♩=76, 29 Takte, ca. 1:35  
- Final-Titel (Album/Repo): **Horn and Reed Fugue**  
- Hörstufen: LilyPond → `fugue2` (Zwischenstufe) → Final Bigband  
- Docs: `docs/horn-and-reed-fugue/`  
- Wording: „Bigband-Arrangement“ (nicht „Rohrblatt-Ensemble“)

### Verworfen
- *Tin Whiskers* (Brass Quintett / Hazell) — gelöscht, Ergebnis nicht überzeugend

---

## 6. Entscheidungen

- Ein Score-Projektordner pro Stück unter `scores/<slug>/`  
- Album-Docs: Deutsch, dunkler Album-Look, eigene Visuelle pro Werk (Etagen vs. Stimmen/Eintritte)  
- PDF = Druck; HTML = hörbar (Player); kein PDF-Audio-Player  
- GitHub: **ein öffentliches Repo pro Album** (nicht alles in eins)  
- Cover-Art: Prompts existieren (Chat), Bilder noch nicht eingebunden  
- UI-Idee (Cursor SDK + lokale App) besprochen, **nicht gestartet**

---

## 7. Offene Punkte

1. Cover-Art generieren und in HTML/Cover einbinden (Prompts liegen im Chat 2026-10-19)  
2. Optional: Skill/`fertig` um Like-CTA und Cover-Slot erweitern  
3. Optional: UI-Prototyp (Vite + Cursor SDK, local cwd)  
4. Lokales LilyPond-Repo vs. Pages-Repos: Seiten-Updates laufen oft über Clone unter `/tmp/…-site` + Push — Quelle der Wahrheit bleibt dieses Workspace-`docs/`  
5. Workspace-Git (`Lilypond Komposition`) und die beiden GitHub-Repos sind getrennt; Sync bei Bedarf manuell

---

## 8. Nächster sinnvoller Schritt

Cover-Art für beide Alben einbinden **oder** `@score-sound neu` für das nächste Stück.

---

## 9. Wichtige Dateien

| Thema | Ort |
|-------|-----|
| Dieser Handoff | `docs/handoffs/2026-10-19-lilypond-komposition.md` |
| Skill | `.cursor/skills/score-sound/SKILL.md` |
| Render | `scripts/render-score.sh` |
| Between Floors Score | `scores/between-floors/` |
| Fuge Score | `scores/fugue-in-d-minor/` |
| Album BF | `docs/album/between-floors-album.html` (+ `.typ`/`.pdf`) |
| Album Fugue | `docs/horn-and-reed-fugue/index.html` (+ `.typ`/`.pdf`) |
