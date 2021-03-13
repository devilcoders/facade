defmodule Facade.Attributes.Element do
  defmacro __using__(_) do
    quote do
      @spacing [
        0,
        0.5,
        1,
        1.5,
        2,
        2.5,
        3,
        3.5,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        14,
        16,
        20,
        24,
        28,
        32,
        36,
        40,
        44,
        48,
        52,
        56,
        60,
        64,
        72,
        80,
        96
      ]

      @breakpoints [
        :xs,
        :sm,
        :md,
        :xl
      ]

      @element_attributes [
        :p,
        :pt,
        :pr,
        :pb,
        :pl,
        :px,
        :py,
        :m,
        :mt,
        :mr,
        :mb,
        :ml,
        :mx,
        :my
      ]

      prop p, :number, values: @spacing
      prop pt, :number, values: @spacing
      prop pr, :number, values: @spacing
      prop pb, :number, values: @spacing
      prop pl, :number, values: @spacing
      prop px, :number, values: @spacing
      prop py, :number, values: @spacing

      prop m, :number, values: @spacing
      prop mt, :number, values: @spacing
      prop mr, :number, values: @spacing
      prop mb, :number, values: @spacing
      prop ml, :number, values: @spacing
      prop mx, :number, values: @spacing
      prop my, :number, values: @spacing

      defp composed_classes(assigns) do
        @element_attributes
        |> Enum.filter(&(assigns[&1] != nil))
        |> Enum.map(&compose_classes(&1, assigns))
      end

      defp compose_classes(prop, assigns) when prop in @element_attributes,
        do: "#{prop}-#{assigns[prop]}"
    end
  end
end
