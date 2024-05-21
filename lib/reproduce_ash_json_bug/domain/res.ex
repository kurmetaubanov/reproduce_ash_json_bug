defmodule ReproduceAshJsonBug.Domain.Res do
  use Ash.Resource,
  domain: ReproduceAshJsonBug.Domain,
  data_layer: AshPostgres.DataLayer

  attributes do
    uuid_primary_key :id
    attribute :json, :map, allow_nil?: true
  end

  actions do
    read :read, primary?: true
    create :create do
      accept [:json]
    end

    update :update do
      accept [:json]
    end
    destroy :destroy
  end

  postgres do
    table "res"
    repo ReproduceAshJsonBug.Repo
  end


end
