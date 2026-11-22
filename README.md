# MNUC Exam Study Quiz

Static site (no build step). Works offline out of the box; add a free Supabase database to share progress between friends.

## 1. Run locally
Open a terminal in this folder and run `npx serve` (or `python3 -m http.server`), then open the shown address.
(Opening index.html by double-click won't work because it loads the JSON files.)

## 2. Add more quizzes
Questions live in `data/`.
- **Add questions to a subject:** open e.g. `data/dsa.json` and add to `"questions"`:
  `{"q":"Your question?","options":["A","B","C","D"],"answer":0,"explain":"Why."}`
  `answer` is the index (0 to 3) of the correct option. Options are shuffled when shown.
- **Add a new subject:** create `data/mysubject.json` like the others (`title`, `questions`, optional `flashcards`), then add `"mysubject"` to `data/subjects.json`.

Note: a question's save id comes from its text. If you edit a question's wording, people's saved answer to the old wording won't match it. To keep an id stable, add `"id":"dsa-001"` to the question.
Names are not passwords: anyone typing the same name shares that save slot.
