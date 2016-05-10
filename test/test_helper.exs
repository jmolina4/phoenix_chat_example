ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ChatExample.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ChatExample.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ChatExample.Repo)

