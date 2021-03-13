defmodule Facade.Attributes.Global do
  @moduledoc """
  Global attributes are attributes common to all HTML elements; they can be used
  on all elements, though they may have no effect on some elements.

  Global attributes may be specified on all HTML elements, even those not
  specified in the standard. That means that any non-standard elements must
  still permit these attributes, even though using those elements means that the
  document is no longer HTML5-compliant. For example, HTML5-compliant browsers
  hide content marked as <foo hidden>...</foo>, even though <foo> is not a valid
  HTML element.
  """

  defmacro __using__(_) do
    quote do
      @global_attributes [
        :accesskey,
        :aria,
        :autocapitalize,
        :class,
        :contenteditable,
        :data,
        :dir,
        :draggable,
        :enterkeyhint,
        :hidden,
        :id,
        :inputmode,
        :is,
        :itemid,
        :itemprop,
        :itemref,
        :itemscope,
        :itemtype,
        :lang,
        :nonce,
        :part,
        :slot,
        :spellcheck,
        :style,
        :tabindex,
        :title,
        :translate
      ]

      @doc """
      Provides a hint for generating a keyboard shortcut for the current element.
      This attribute consists of a space-separated list of characters. The browser
      should use the first one that exists on the computer keyboard layout.
      """
      prop accesskey, :string

      prop aria, :list

      @doc """
      Controls whether and how text input is automatically capitalized as it is
      entered/edited by the user. It can have the following values:

      - `off` or `none`, no autocapitalization is applied (all letters default to lowercase)
      - `on` or `sentences`, the first letter of each sentence defaults to a capital letter; all other letters default to lowercase
      - `words`, the first letter of each word defaults to a capital letter; all other letters default to lowercase
      - `characters`, all letters should default to uppercase
      """
      prop autocapitalize, :atom,
        values: ~w(off none on sentences words characters)a

      @doc """
      A space-separated list of the classes of the element. Classes allows CSS and
      JavaScript to select and access specific elements via the class selectors
      or functions like the method Document.getElementsByClassName().
      """
      prop class, :css_class, default: []

      @doc """
      An enumerated attribute indicating if the element should be editable by
      the user. If so, the browser modifies its widget to allow editing. The
      attribute must take one of the following values:

      - `true` or the _empty string_, which indicates that the element must be
      editable;

      - `false`, which indicates that the element must not be editable.
      """
      prop contenteditable, :boolean

      @doc """
      Forms a class of attributes, called custom data attributes, that allow
      proprietary information to be exchanged between the HTML and its DOM 
      representation that may be used by scripts. All such custom data are
      available via the `HTMLElementinterface` of the element the attribute is
      set on. The `HTMLOrForeignElement/dataset` property gives access to them.
      """
      prop data, :list

      prop dir, :atom, values: [:ltr, :rtl, :auto]
      prop draggable, :boolean
      prop enterkeyhint, :string
      prop hidden, :boolean
      prop id, :string

      prop inputmode, :atom,
        values: ~w(none text tel url email numeric decimal search)a

      prop is, :string
      prop itemid, :string
      prop itemprop, :string
      prop itemscope, :string
      prop itemtype, :string
      prop itemref, :string
      prop lang, :string
      prop nonce, :string
      prop part, :string
      prop slot, :string
      prop spellcheck, :boolean
      prop style, :string
      prop tabindex, :number
      prop title, :string

      @doc """
      An enumerated attribute that is used to specify whether an element's
      attribute values and the values of its Text node children are to be
      translated when the page is localized, or whether to leave them unchanged.
      It can have the following values:

      - empty string and `yes`, which indicates that the element will be translated.
      - `no`, which indicates that the element will not be translated.
      """
      prop translate, :atom, values: ~w(yes no)a
    end
  end
end
