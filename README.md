# MNUC Exam Study Quiz

Static site (no build step). Works offline out of the box; add a free Supabase database to share progress between friends.

## 1. Run locally
Open a terminal in this folder and run `npx serve` (or `python3 -m http.server`), then open the shown address.
(Opening index.html by double-click won't work because it loads the JSON files.)

## 2. Link a database (Supabase, free)
1. Go to supabase.com, create a project.
2. SQL Editor > New query > paste `schema.sql` > Run.
3. Project Settings > API: copy the **Project URL** and the **anon public key**.
4. Paste them into `config.js`:
   `window.QUIZ_CONFIG = { supabaseUrl: "https://xxxx.supabase.co", supabaseKey: "eyJ..." };`
   (The anon key is meant to be public. The table's rules only allow reading and adding answers, never editing or deleting, so saved answers are permanent.)

## 3. Deploy on Vercel
Push this folder to a GitHub repo, then vercel.com > Add New > Project > import it.
Framework preset: **Other**. Leave build command and output directory empty. Deploy.
(Or from this folder: `npx vercel --prod`.)

## 4. Add more quizzes
Questions live in `data/`.
- **Add questions to a subject:** open e.g. `data/dsa.json` and add to `"questions"`:
  `{"q":"Your question?","options":["A","B","C","D"],"answer":0,"explain":"Why."}`
  `answer` is the index (0 to 3) of the correct option. Options are shuffled when shown.
- **Add a new subject:** create `data/mysubject.json` like the others (`title`, `questions`, optional `flashcards`), then add `"mysubject"` to `data/subjects.json`.
- Redeploy (push to GitHub and Vercel updates itself).

Note: a question's save id comes from its text. If you edit a question's wording, people's saved answer to the old wording won't match it. To keep an id stable, add `"id":"dsa-001"` to the question.
Names are not passwords: anyone typing the same name shares that save slot.
