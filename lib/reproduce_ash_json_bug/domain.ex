defmodule ReproduceAshJsonBug.Domain do
  use Ash.Domain

  resources do
    resource ReproduceAshJsonBug.Domain.Res do
      define :read_res, action: :read
      define :create_res, action: :create
      define :update_res, action: :update
      define :destroy_res, action: :destroy
    end
  end
end
