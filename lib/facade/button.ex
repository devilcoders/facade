defmodule Facade.Button do
  @moduledoc """
  The classic **button**, in different colors, sizes, and states
  """

  use Surface.Component
  use Facade.Attributes.Button

  alias Facade.Elements

  import Facade.Helpers

  @doc "The label of the button, when no content (default slot) is provided"
  prop label, :string

  @doc "The color of the button"
  prop color, :string,
    values: ~w(white black light dark primary link info success warning danger)

  @doc "The vertical size of button"
  prop size, :string, values: ~w(small normal medium large)

  @doc "Button is expanded (full-width)"
  prop expand, :boolean

  @doc "Outlined style"
  prop outlined, :boolean

  @doc "Rounded style"
  prop rounded, :boolean

  @doc "Hovered style"
  prop hovered, :boolean

  @doc "Focused style"
  prop focused, :boolean

  @doc "Active style"
  prop active, :boolean

  @doc "Selected style"
  prop selected, :boolean

  @doc "Loading state"
  prop loading, :boolean

  @doc "Triggered on click"
  prop click, :event

  @doc """
  The content of the generated `<button>` element. If no content is provided,
  the value of property `label` is used instead.
  """
  slot default

  def render(assigns) do
    ~H"""
    <Elements.Button
      :props={{ get_attrs(attributes(), assigns) }}
      on_click={{@click}}
      class={{
        [button: @class == [],
        "is-#{@color}": @color,
        "is-#{@size}": @size,
        "is-fullwidth": @expand,
        "is-outlined": @outlined,
        "is-rounded": @rounded,
        "is-hovered": @hovered,
        "is-focused": @focused,
        "is-active": @active,
        "is-loading": @loading,
        "is-selected": @selected
      ] ++ @class
      }}>
      <slot>{{ @label }}</slot>
    </Elements.Button>
    """
  end
end
