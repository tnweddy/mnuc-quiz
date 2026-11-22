-- Run once in Supabase: SQL Editor > New query > paste > Run
create table if not exists answers (
  name text not null,            -- student name (lowercased)
  qid text not null,             -- question id
  subject text,
  choice text,                   -- the option they picked
  correct boolean not null,
  created_at timestamptz default now(),
  primary key (name, qid)        -- one answer per student per question
);
alter table answers enable row level security;
create policy "anyone can read"   on answers for select to anon using (true);
create policy "anyone can insert" on answers for insert to anon with check (true);
-- No update/delete policies, so a saved answer is permanent.
revoke update, delete on answers from anon;
