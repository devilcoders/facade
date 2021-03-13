defmodule Facade.Helpers do
  def get_attrs(attributes, assigns) do
    data = assigns[:data]
    aria = assigns[:aria]

    base_assigns = assigns |> Map.drop([:data, :aria, :class])

    attributes
    |> Enum.map(&Keyword.new([{&1, base_assigns[&1]}]))
    |> List.flatten()
    |> Enum.into([])
    |> Keyword.merge(data: data, aria: aria)
  end
end
