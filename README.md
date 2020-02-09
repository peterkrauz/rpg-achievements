# Rpg Achievements 

This is a toy project that serves as a REST api for an Android App to talk to. Having lack of a better and **quicker** alternative, i decided to give [Phoenix](https://www.phoenixframework.org/) a try. Marvelous tools and documentation regarding [Ecto](https://hexdocs.pm/ecto/Ecto.html) and Phoenix made this project possible for an Android Developer to develop. This whole thing was made in about three hours, from scratch.

## What does it do?

Rpg Achievements is an Elixir backend to deal with information regarding a few on-going tabletop games that me and a couple of friends play on rare weekends. We started creating our own achievements - silly things made out of title and description - to use as guidance on how far our gameplay can go. 
Eventually, came the idea of doing an app that reads all achievements, but i wasn't feeling like persisting all the data locally, hence this project!

## How to run it

<<<<<<< HEAD
*Be sure to have Elixir and Phoenix installed.*   
=======
*Be sure to have Elixir and Phoenix installed.*
>>>>>>> 04e180b38a89e1cec11c76be66cd401abcafb89d

Clone the repo, enter the directory, type `mix deps.get` to fetch dependencies. 
Then, create and migrate your database by running `mix ecto.create && mix ecto.migrate`.
After that, run `mix phx.server` to execute the application. The result can be found on `localhost:4000`.
