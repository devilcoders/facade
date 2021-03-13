defmodule Facade.Elements.Button do
  use Surface.Component
  use Facade.Attributes.Button

  import Phoenix.HTML.Tag
  import Facade.Helpers

  prop on_click, :event

  slot default

  def render(assigns) do
    children = ~H"<slot />"

    ~H"""
    {{ content_tag :button,
      get_attrs(attributes(), assigns)
      ++
        prop_to_attr_opts(
          @class
          ++ composed_classes(assigns), :class
        ),
      do: children
    }}
    """
  end
end
