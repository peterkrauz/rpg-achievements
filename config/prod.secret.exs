use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :rpg_achievements, RpgAchievementsWeb.Endpoint,
  secret_key_base: "DsraP5rYVOpkja7WjZntSGwneydZtR7RmPJy3AWas6aTOFw6l5RnFaB13n9Ra3Fe"

# Configure your database
config :rpg_achievements, RpgAchievements.Repo,
  username: "postgres",
  password: "postgres",
  database: "rpg_achievements_prod",
  ssl: true,
  pool_size: 15
