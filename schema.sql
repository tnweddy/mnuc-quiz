create table if not exists answers (
  name text not null,          
  qid text not null,           
  subject text,
  choice text,                   
  correct boolean not null,
  created_at timestamptz default now(),
  primary key (name, qid)       
);
alter table answers enable row level security;
create policy "anyone can read"   on answers for select to anon using (true);
create policy "anyone can insert" on answers for insert to anon with check (true);
revoke update, delete on answers from anon;
