defmodule Facade.System.Spacing do
  use Norm

  defstruct [
    :p,
    :px,
    :py,
    :pt,
    :pr,
    :pb,
    :pl,
    :m,
    :mx,
    :my,
    :mt,
    :mr,
    :mb,
    :ml
  ]

  @breakpoints [
    :xs,
    :sm,
    :md,
    :lg,
    :xl
  ]

  # def space(), do: spec(is_list() and (&(elem(&1, 1) in @spacing)))

  # def classes_list, do: spec(is_list() and (&String.valid?(&1)))

  # @contract to_classes(attrs :: space()) :: classes_list()
  def to_classes(attrs) do
    attrs
    |> Enum.filter(&(elem(&1, 0) in Map.keys(%__MODULE__{})))
    |> Keyword.keys()
    |> Enum.map(&to_class(&1, attrs[&1]))
    |> List.flatten()
  end

  def to_class(prop, value) when is_list(value) do
    value
    |> Enum.with_index()
    |> Enum.map(fn {v, idx} ->
      if idx == 0 do
        "#{prop}-#{v}"
      else
        "#{Enum.at(@breakpoints, idx)}:#{prop}-#{v}"
      end
    end)
  end

  def to_class(prop, value) do
    "#{prop}-#{value}"
  end

  def find_breakpoint_by_value(value, values) do
    index = Enum.find_index(values, &(&1 == value))

    to_string(Enum.at(@breakpoints, index))
  end
end
