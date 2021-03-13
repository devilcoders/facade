defmodule Facade.Catalogue do
  @moduledoc """
  Catalogue implementation for Facade.

  Allows calalogue tools to properly run examples and playgrounds provided
  by this lib.
  """

  use Surface.Catalogue

  @impl true
  def config() do
    [
      playground: [
        body: [
          class: "antialiased"
        ]
      ]
    ]
  end
end
