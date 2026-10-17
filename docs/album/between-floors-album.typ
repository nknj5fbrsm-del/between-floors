// Between Floors — Score → Sound → Bigband
// Album-Dokumentation (Deutsch)

#set document(
  title: "Between Floors — Score → Sound → Bigband",
  author: "NilsP",
  keywords: ("Between Floors", "LilyPond", "Suno", "Score Sound"),
)

#let ink = rgb("#E6E1D8")
#let muted = rgb("#8B939E")
#let slate = rgb("#1A222C")
#let deep = rgb("#0C1016")
#let rule = rgb("#2A3542")
#let cool = rgb("#7A9BB0")
#let brass = rgb("#C9A66B")
#let paper = rgb("#121820")

#set page(
  width: 210mm,
  height: 280mm,
  margin: (x: 18mm, y: 18mm),
  fill: paper,
  numbering: none,
  footer: context {
    if counter(page).get().first() > 1 {
      set text(
        font: ("Helvetica Neue", "Helvetica", "Arial"),
        size: 8pt,
        fill: muted,
        tracking: 1pt,
      )
      align(center)[
        Between Floors · NilsP · #counter(page).display("1")
      ]
    }
  },
)

#set text(
  font: ("Didot", "Baskerville", "Georgia", "Times New Roman"),
  size: 11pt,
  fill: ink,
  lang: "de",
)

#set par(leading: 0.85em, justify: true)
#show heading.where(level: 1): it => {
  set text(size: 22pt, fill: ink, weight: "regular", tracking: 0.5pt)
  block(above: 0pt, below: 14pt)[#it.body]
}
#show heading.where(level: 2): it => {
  set text(
    font: ("Helvetica Neue", "Helvetica", "Arial"),
    size: 9pt,
    fill: cool,
    weight: "regular",
    tracking: 2.2pt,
  )
  block(above: 18pt, below: 8pt)[#upper(it.body)]
}
#show link: it => text(fill: brass, it)

#let sans(body) = text(
  font: ("Helvetica Neue", "Helvetica", "Arial"),
  size: 9pt,
  fill: muted,
  tracking: 0.4pt,
  body,
)

#let floor-rule(accent: cool) = {
  block(below: 12pt)[
    #stack(
      dir: ttb,
      spacing: 3.5pt,
      line(length: 100%, stroke: 0.35pt + rule),
      line(length: 36mm, stroke: 1.6pt + accent),
    )
  ]
}

#let meta-row(label, value) = {
  grid(
    columns: (32mm, 1fr),
    gutter: 6mm,
    align: (left, horizon),
    sans[#upper(label)],
    text(size: 10.5pt)[#value],
  )
}

#let suno-album = "https://suno.com/album/308283af-ca5b-4692-8414-55bc37e90f03"
#let suno-profile = "https://suno.com/@cwzjtpwwwy"

#let wave-card(title, subtitle, path, accent) = {
  block(
    width: 100%,
    inset: (x: 10pt, y: 12pt),
    fill: slate,
    stroke: 0.4pt + rule,
    radius: 0pt,
  )[
    #grid(
      columns: (1fr, auto),
      text(size: 12pt)[#title],
      sans[#subtitle],
    )
    #v(8pt)
    #line(length: 100%, stroke: 0.3pt + accent.lighten(20%))
    #v(8pt)
    #image(path, width: 100%)
  ]
}

#let stage(n, title, body) = {
  block(below: 14pt)[
    #grid(
      columns: (14mm, 1fr),
      gutter: 4mm,
      align(top)[
        #text(size: 20pt, fill: cool)[#n]
      ],
      [
        #text(size: 13pt)[#title]
        #v(4pt)
        #text(size: 10pt, fill: muted)[#body]
      ],
    )
  ]
}

// ─────────────────────────────────────────
// COVER
// ─────────────────────────────────────────
#page(numbering: none, footer: none)[
  #place(top + left, dx: -18mm, dy: -18mm)[
    #rect(width: 210mm, height: 280mm, fill: deep)
  ]

  // vertical floor motif
  #place(left, dx: 14mm, dy: 36mm)[
    #for i in range(8) {
      place(dy: i * 26mm)[
        #rect(width: 2.2mm, height: 18mm, fill: if i < 5 { cool.darken(35%) } else { brass.darken(25%) })
      ]
    }
  ]

  #v(42mm)
  #align(center)[
    #sans[SCORE  ·  SOUND  ·  BIGBAND]
    #v(10mm)
    #text(size: 42pt, tracking: 1pt)[Between Floors]
    #v(6mm)
    #text(size: 13pt, fill: muted)[Vom symbolischen Satz zur Bigband-Ballade]
    #v(14mm)
    #line(length: 42mm, stroke: 0.6pt + brass)
    #v(14mm)
    #sans[EIN ALBUM-DOKUMENT]
    #v(3mm)
    #text(size: 11pt)[NilsP]
  ]

  #place(bottom + center, dy: -22mm)[
    #sans[2026  ·  LILYPOND  ·  SUNO V6]
    #v(3mm)
    #sans[HÖRVERSION · between-floors-album.html]
  ]
]

// ─────────────────────────────────────────
// 1 IMPULS
// ─────────────────────────────────────────
= Zwischen den Etagen

#floor-rule()

Was entsteht, wenn ein System strukturell komponiert — ohne menschliche Hörbiografie — und ein Mensch danach nur noch Verfahren setzt, hört, auswählt und weiterführt?

_Between Floors_ beginnt als offener Prompt an ein Reasoning-Modell. Es endet als Bigband-Ballade auf Suno. Dazwischen liegen Notensatz, MIDI, schlichtes Klavier-Audio, generative Transformation und eine Kaskade von Covers.

#v(8pt)
#meta-row("Titel", [Between Floors])
#v(3pt)
#meta-row("Systemautor", [NilsP])
#v(3pt)
#meta-row("Score", [Cursor · Claude Opus (Thinking)])
#v(3pt)
#meta-row("Sound", [Suno V6])
#v(3pt)
#meta-row("Album", link(suno-album)[suno.com/album/…308283af])
#v(3pt)
#meta-row("Profil", link(suno-profile)[suno.com/\@cwzjtpwwwy])

== Der Impuls

Kein Stilkorsett. Keine vorgegebene Tonart, Form oder Genre-Maske — nur Dauer, Solo-Klavier und der Auftrag, musikalische Entscheidungen selbst zu treffen:

#block(
  width: 100%,
  inset: 12pt,
  fill: slate,
  stroke: (left: 2pt + cool),
)[
  #set text(
    font: ("Helvetica Neue", "Helvetica", "Arial"),
    size: 8.4pt,
    fill: ink.darken(8%),
  )
  #set par(leading: 0.7em)
  Compose a short work for solo piano.\
  Duration: about 90–120 seconds at a moderate tempo.\
  Make all other musical decisions yourself…\
  Favor musical ideas that are likely to feel expressive and rewarding to human listeners.\
  Do not decide on the form in advance; let it emerge from the material.\
  Let later material retain a perceptible memory of earlier material.
]

#v(6pt)
#sans[Der Mensch bleibt Systemautor: Verfahren setzen · hören · auswählen · veröffentlichen.]

// ─────────────────────────────────────────
// 2 SCORE
// ─────────────────────────────────────────
#pagebreak()
= Etage 1 — Score

#floor-rule()

Das Modell liefert ein vollständiges, kompilierbares Solo-Klavierstück in LilyPond. Erster Lauf ohne Nachbesserung.

#v(4pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 8mm,
  [
    #meta-row("Werk", [Between Floors])
    #v(2pt)
    #meta-row("Besetzung", [Solo-Klavier])
    #v(2pt)
    #meta-row("Tonart", [e-Moll / e-Äolisch])
    #v(2pt)
    #meta-row("Tempo", [Andante con calma ♩=63])
  ],
  [
    #meta-row("Umfang", [30 Takte · ca. 1:57])
    #v(2pt)
    #meta-row("Komponist", [AI draft (test)])
    #v(2pt)
    #meta-row("Engine", [LilyPond 2.26])
    #v(2pt)
    #meta-row("Form", [aus dem Material])
  ],
)

#v(10pt)
== Formskizze

#sans[
  T. 1–2 Intro (nur linke Hand) · T. 3–8 Kopfmotiv · T. 9–14 Sequenzierung ·
  T. 15/17 Höhepunkt · T. 21–26 Erinnerung · T. 27–30 Coda
]

#v(8pt)
#sans[Vollständiger Notensatz auf der folgenden Seite.]

// ─────────────────────────────────────────
// SCORE PLATE
// ─────────────────────────────────────────
#pagebreak()
#align(center)[
  #block(
    fill: rgb("#F7F5F0"),
    inset: 6pt,
    stroke: 0.4pt + rule,
  )[
    #image("assets/score-preview.png", width: 88%)
  ]
]
#v(6pt)
#align(center)[#sans[Notensatz · LilyPond-Ausgabe · Between Floors]]

// ─────────────────────────────────────────
// 3 RENDER
// ─────────────────────────────────────────
#pagebreak()
= Etage 2 — Schnittstelle

#floor-rule()

Der Score ist Symbol. Für Suno braucht es Klang — aber noch kein Kunstwerk. LilyPond schreibt MIDI; FluidSynth und ein General-Soundfont erzeugen schlichtes Klavier-Audio; ffmpeg normalisiert lautheitsgerecht.

#v(8pt)
#stage("01", [LilyPond], [Partitur → PDF + MIDI. Syntax prüfbar, Form lesbar.])
#stage("02", [FluidSynth], [MIDI → WAV mit MuseScore General Soundfont. Nur Schnittstelle.])
#stage("03", [ffmpeg], [WAV → MP3, Loudnorm −16 LUFS / Peak −1.5 dB. Suno-tauglich.])

#v(6pt)
#wave-card(
  [Ausgangs-MP3],
  [ca. 1:57 · LilyPond-Render],
  "assets/wave-01-lilypond-render.png",
  cool,
)

#v(10pt)
#sans[Diese Stufe ist bewusst nüchtern: sie trägt Motiv und Harmonie weiter — nicht die Aura.]

// ─────────────────────────────────────────
// 4 SUNO SOLO
// ─────────────────────────────────────────
#pagebreak()
= Etage 3 — Suno Solo

#floor-rule(accent: cool.lighten(10%))

Das Ausgangs-MP3 wird in Suno V6 geladen. Daraus entsteht ein Solopiano-Stück: erkennbar verwandt, akustisch transformiert — Arpeggien, Tempo, Proportionen, Gesten dürfen sich verschieben.

#v(8pt)
#wave-card(
  [Solopiano — Suno Cover],
  [ca. 3:08 · Suno V6],
  "assets/wave-02-solopiano-suno.png",
  cool.lighten(15%),
)

#v(12pt)
== Was sich ändert

#grid(
  columns: (1fr, 1fr),
  gutter: 8mm,
  [
    #text(size: 12pt)[Bleibt]
    #v(4pt)
    #sans[Melodische Erinnerung · harmonische Farbe · ruhiger Grundimpuls · Solo-Klavier als Träger]
  ],
  [
    #text(size: 12pt, fill: brass)[Wandelt sich]
    #v(4pt)
    #sans[Gestik und Atem · zeitliche Proportion · klangliche Dichte · performative Aura]
  ],
)

#v(14pt)
#block(
  width: 100%,
  inset: 12pt,
  fill: slate,
)[
  #sans[SCORE bleibt lesbar als Struktur. SOUND macht hörbar, was die Struktur tragen kann — ohne sie zu kopieren.]
]

// ─────────────────────────────────────────
// 5 KASKADE
// ─────────────────────────────────────────
#pagebreak()
= Etage 4 — Kaskade

#floor-rule(accent: brass.darken(10%))

Vom Solopiano aus folgt die eigentliche Arbeit der Auswahl: Covers, Mashups, Varianten. Kein einzelner Klick — eine Kette von Hörentscheidungen, bis die Bigband-Ballade trägt.

#v(10pt)

#let floor-bar(label, sub, fill, width-pct) = {
  block(below: 6pt)[
    #rect(
      width: width-pct,
      height: 11mm,
      fill: fill,
      inset: (x: 10pt, y: 0pt),
    )[
      #align(horizon)[
        #text(size: 10pt, fill: ink)[#label]
        #h(1fr)
        #sans[#sub]
      ]
    ]
  ]
}

#floor-bar([Score · LilyPond], [symbolisch], rgb("#243040"), 100%)
#floor-bar([Render · Klavier-MP3], [Schnittstelle], rgb("#2A3A4A"), 92%)
#floor-bar([Suno · Solopiano], [erste Transformation], rgb("#355064"), 84%)
#floor-bar([Cover- & Mashup-Kaskade], [Auswahl · Iteration], rgb("#4A5A48"), 76%)
#floor-bar([Bigband-Ballade · Final], [veröffentlicht], rgb("#5C4A2E"), 68%)

#v(12pt)
#text(size: 12pt)[Prinzip]

#v(4pt)
Jede Stufe erbt Erinnerung an die vorige — und darf sie neu artikulieren. Der Mensch entscheidet nicht die Noten der ersten Seite neu, sondern welche Transformation weiterleben darf.

#v(8pt)
#sans[Etliche Versionen Covers und Mashup-Kaskaden · nur das Finale bleibt im Dokument hörbar markiert.]

// ─────────────────────────────────────────
// 6 FINALE
// ─────────────────────────────────────────
#pagebreak()
= Etage 5 — Bigband

#floor-rule(accent: brass)

Finale Form: eine Bigband-Ballade. Weit entfernt vom schlichten LilyPond-Render — und doch vom gleichen Motiv getragen, das zwischen den Etagen wandert.

#v(8pt)
#wave-card(
  [Bigband Version — Suno Final],
  [ca. 4:14 · Album-Track],
  "assets/wave-03-bigband-final.png",
  brass,
)

#v(12pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 8mm,
  [
    #meta-row("Credits", [NilsP])
    #v(3pt)
    #meta-row("Profil", link(suno-profile)[\@cwzjtpwwwy])
  ],
  [
    #meta-row("Album", link(suno-album)[Between Floors auf Suno])
    #v(3pt)
    #meta-row("Pfad", [Score → Sound → Bigband])
  ],
)

#v(14pt)
== Drei Hörstufen

#table(
  columns: (28mm, 1fr, 22mm),
  stroke: none,
  inset: (x: 0pt, y: 6pt),
  align: (left, left, right),
  [#sans[STUFE]], [#sans[ROLLE]], [#sans[DAUER]],
  table.hline(stroke: 0.4pt + rule),
  [Render], [Schnittstelle · symbolischer Klang], [1:57],
  table.hline(stroke: 0.3pt + rule),
  [Solopiano], [Suno-Cover · erste Aura], [3:08],
  table.hline(stroke: 0.3pt + rule),
  [#text(fill: brass)[Bigband]], [#text(fill: brass)[Finale Ballade · Album]], [#text(fill: brass)[4:14]],
)

// ─────────────────────────────────────────
// COLOPHON
// ─────────────────────────────────────────
#pagebreak()
= Impressum der Etagen

#floor-rule(accent: brass)

#v(4pt)
Dieses Dokument hält den Workflow fest — nicht jede verworfene Version. Der Wert liegt in der Kette: offener Prompt, gültiger Score, hörbare Schnittstelle, generative Transformation, menschliche Auswahl.

#v(10pt)
#meta-row("Werk", [Between Floors])
#v(3pt)
#meta-row("Systemautor", [NilsP])
#v(3pt)
#meta-row("Score-Engine", [LilyPond 2.26 · FluidSynth · ffmpeg])
#v(3pt)
#meta-row("Sound-Engine", [Suno V6])
#v(3pt)
#meta-row("Profil", link(suno-profile)[suno.com/\@cwzjtpwwwy])
#v(3pt)
#meta-row("Album", link(suno-album)[suno.com/album/308283af-…])

#v(16mm)
#align(center)[
  #line(length: 36mm, stroke: 0.5pt + brass)
  #v(8mm)
  #text(size: 16pt)[Between Floors]
  #v(4mm)
  #sans[NILSP  ·  2026]
  #v(10mm)
  #sans[SCORE BLEIBT. SOUND WANDERT. DIE BALLADE TRÄGT.]
]
