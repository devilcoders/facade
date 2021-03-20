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

      - `off` or `none`, no autocapitalization is applied (all letters default to
      lowercase)
      - `on` or `sentences`, the first letter of each sentence defaults to a
      capital letter; all other letters default to lowercase
      - `words`, the first letter of each word defaults to a capital letter; all
      other letters default to lowercase
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

      @doc """
      An enumerated attribute indicating the directionality of the element's
      text. It can have the following values:

      - `ltr`, which means left to right and is to be used for languages that
      are written from the left to the right (like English);
      - `rtl`, which means right to left and is to be used for languages that
      are written from the right to the left (like Arabic);
      - `auto`, which lets the user agent decide. It uses a basic algorithm as
      it parses the characters inside the element until it finds a character
      with a strong directionality, then it applies that directionality to the
      whole element.
      """
      prop dir, :atom, values: [:ltr, :rtl, :auto]

      @doc """
      An enumerated attribute indicating whether the element can be dragged,
      using the Drag and Drop API. It can have the following values:

      - `true`, which indicates that the element may be dragged
      - `false`, which indicates that the element may not be dragged.
      """
      prop draggable, :boolean

      @doc """
      Hints what action label (or icon) to present for the enter key on virtual
      keyboards.
      """
      prop enterkeyhint, :string

      @doc """
      A Boolean attribute indicates that the element is not yet, or is no
      longer, relevant. For example, it can be used to hide elements of the page
      that can't be used until the login process has been completed. The browser
      won't render such elements. This attribute must not be used to hide content
      that could legitimately be shown.
      """
      prop hidden, :boolean

      @doc """
      Defines a unique identifier (ID) which must be unique in the whole
      document. Its purpose is to identify the element when linking (using a
      fragment identifier), scripting, or styling (with CSS).
      """
      prop id, :string

      @doc """
      Provides a hint to browsers as to the type of virtual keyboard
      configuration to use when editing this element or its contents. Used
      primarily on `<input>` elements, but is usable on any element while in
      contenteditable mode.
      """
      prop inputmode, :atom,
        values: ~w(none text tel url email numeric decimal search)a

      @doc """
      Allows you to specify that a standard HTML element should behave like a
      registered custom built-in element (see Using custom elements for more
      details).
      """
      prop is, :string

      @doc """
      The unique, global identifier of an item.
      """
      prop itemid, :string

      @doc """
      Used to add properties to an item. Every HTML element may have an itemprop
      attribute specified, where an itemprop consists of a name and value pair.
      """
      prop itemprop, :string

      @doc """
      itemscope (usually) works along with itemtype to specify that the HTML
      contained in a block is about a particular item. itemscope creates the
      Item and defines the scope of the itemtype associated with it. itemtype
      is a valid URL of a vocabulary (such as schema.org) that describes the
      item and its properties context.
      """
      prop itemscope, :string

      @doc """
      Specifies the URL of the vocabulary that will be used to define itemprops
      (item properties) in the data structure. itemscope is used to set the
      scope of where in the data structure the vocabulary set by itemtype will
      be active.
      """
      prop itemtype, :string

      @doc """
      Properties that are not descendants of an element with the itemscope
      attribute can be associated with the item using an itemref. It provides a
      list of element ids (not itemids) with additional properties elsewhere in
      the document.
      """
      prop itemref, :string

      @doc """
      Helps define the language of an element: the language that non-editable
      elements are in, or the language that editable elements should be written
      in by the user. The attribute contains one “language tag” (made of
      hyphen-separated “language subtags”) in the format defined in Tags for
      Identifying Languages (BCP47). xml:lang has priority over it.
      """
      prop lang, :string

      @doc """
      A cryptographic nonce ("number used once") which can be used by Content
      Security Policy to determine whether or not a given fetch will be allowed
      to proceed.
      """
      prop nonce, :string

      @doc """
      A space-separated list of the part names of the element. Part names allows
      CSS to select and style specific elements in a shadow tree via the
      ::part pseudo-element.
      """
      prop part, :string

      @doc """
      Assigns a slot in a shadow DOM shadow tree to an element: An element with
      a slot attribute is assigned to the slot created by the <slot> element
      whose name attribute's value matches that slot attribute's value.
      """
      prop slot, :string

      @doc """
      An enumerated attribute defines whether the element may be checked for
      spelling errors. It may have the following values:

      - `true`, which indicates that the element should be, if possible, checked
      for spelling errors;
      - `false`, which indicates that the element should not be checked for
      spelling errors.
      """
      prop spellcheck, :boolean

      @doc """
      Contains CSS styling declarations to be applied to the element. Note that
      it is recommended for styles to be defined in a separate file or files.
      This attribute and the <style> element have mainly the purpose of allowing
      for quick styling, for example for testing purposes.
      """
      prop style, :string

      @doc """
      An integer attribute indicating if the element can take input focus (is
      focusable), if it should participate to sequential keyboard navigation,
      and if so, at what position. It can take several values:

      - a negative value means that the element should be focusable, but should
      not be reachable via sequential keyboard navigation;
      - `0` means that the element should be focusable and reachable via
      sequential keyboard navigation, but its relative order is defined by the
       platform convention;
      - a positive value means that the element should be focusable and
      reachable via sequential keyboard navigation; the order in which the
      elements are focused is the increasing value of the tabindex. If several
      elements share the same tabindex, their relative order follows their
      relative positions in the document.
      """
      prop tabindex, :number

      @doc """
      Contains a text representing advisory information related to the element
      it belongs to. Such information can typically, but not necessarily,
      be presented to the user as a tooltip.
      """
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
