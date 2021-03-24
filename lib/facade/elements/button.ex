defmodule Facade.Elements.Button do
  @moduledoc """
  The HTML <button> element represents a clickable button, used to submit forms
  or anywhere in a document for accessible, standard button functionality. By
  default, HTML buttons are presented in a style resembling the platform the
  user agent runs on, but you can change buttons’ appearance with CSS.
  """

  use Surface.Component
  use Facade.Attributes.Button

  import Phoenix.HTML.Tag
  import Facade.Helpers

  prop on_click, :event

  slot default

  def render(assigns) do
    children = ~H"<slot />"

    ~H"""
    {{ content_tag :button, get_attrs(attributes(), assigns) ++ prop_to_attr_opts(@class, :class), do: children }}
    """
  end
end
