### Sätta upp utvecklingsmiljön

1. Se till att du har RVM (<http://rvm.io>) och Bundler (`gem install bundler`) installerat.
2. `cd beergame` (Eller `rvm rvmrc trust .rvmrc` för att låsa Ruby och gemset)
3. `bundle` (För att installera dependencies)
4. `rake db:migrate` (För att skapa sqlite databasen och skapa upp tabeller)
5. `rails s` (Starta servern)
6. På <http://localhost:3000/> startar man ett nytt spel
