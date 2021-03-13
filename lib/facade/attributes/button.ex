defmodule Facade.Attributes.Button do
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
      use Facade.Attributes.{Global, Element}

      @button_attributes [
        :autofocus,
        :disabled,
        :form,
        :formaction,
        :formenctype,
        :formmethod,
        :formnovalidate,
        :formtarget,
        :name,
        :type,
        :value
      ]

      @doc """
      This Boolean attribute specifies that the button should have input focus when
      the page loads. Only one element in a document can have this attribute.
      """
      prop autofocus, :boolean

      @doc """
      This Boolean attribute prevents the user from interacting with the button: it
      cannot be pressed or focused.

      Firefox, unlike other browsers, persists the dynamic disabled state of a
      `<button>` across page loads. Use the autocomplete attribute to control this feature.
      """
      prop disabled, :boolean

      @doc """
      The <form> element to associate the button with (its form owner). The value of
      this attribute must be the id of a <form> in the same document. (If this
      attribute is not set, the <button> is associated with its ancestor <form>
      element, if any.)

      This attribute lets you associate <button> elements to <form>s anywhere in the
      document, not just inside a <form>. It can also override an ancestor <form>
      element.
      """
      prop form, :string

      @doc """
      The URL that processes the information submitted by the button. Overrides the
      action attribute of the button's form owner. Does nothing if there is no form owner.
      """
      prop formaction, :string

      @doc """
      If the button is a submit button (it's inside/associated with a <form> and
      doesn't have type="button"), specifies how to encode the form data that is
      submitted. Possible values:

      application/x-www-form-urlencoded: The default if the attribute is not used.
      multipart/form-data: Use to submit <input> elements with their type attributes set to file.
      text/plain: Specified as a debugging aid; shouldn’t be used for real form submission.

      If this attribute is specified, it overrides the enctype attribute of the
      button's form owner.
      """
      prop formenctype, :string,
        values:
          ~w(application/x-www-form-urlencoded multipart/form-data text/plain)

      @doc """
      If the button is a submit button (it's inside/associated with a <form> and
      doesn't have type="button"), this attribute specifies the HTTP method used
      to submit the form. Possible values:

      - `post`: The data from the form are included in the body of the HTTP
      request when sent to the server. Use when the form contains information
      that shouldn’t be public, like login credentials.

      - `get`: The form data are appended to the form's action URL, with a `?`
      as a separator, and the resulting URL is sent to the server. Use this
      method when the form has no side effects, like search forms.
      """
      prop formmethod, :atom, values: [:post, :get]

      @doc """
      If the button is a submit button, this Boolean attribute specifies that
      the form is not to be validated when it is submitted. If this attribute is
      specified, it overrides the novalidate attribute of the button's form
      owner.

      This attribute is also available on `<input type="image">` and
      `<input type="submit">` elements.
      """
      prop formnovalidate, :boolean

      @doc """
      If the button is a submit button, this attribute is a author-defined name
      or standardized, underscore-prefixed keyword indicating where to display
      the response from submitting the form. This is the name of, or keyword
      for, a browsing context (a tab, window, or <iframe>). If this attribute
      is specified, it overrides the target attribute of the button's form owner.

      The following keywords have special meanings:

      - `_self`: Load the response into the same browsing context as the current
      one. This is the default if the attribute is not specified.

      - `_blank`: Load the response into a new unnamed browsing context —
      usually a new tab or window, depending on the user’s browser settings.

      - `_parent`: Load the response into the parent browsing context of the
      current one. If there is no parent, this option behaves the same way as
      `_self`.

      `_top`: Load the response into the top-level browsing context (that is,
      the browsing context that is an ancestor of the current one, and has no
      parent). If there is no parent, this option behaves the same way as
      `_self`.
      """
      prop formtarget, :atom, values: ~w(_self _blank _parent _top)a

      @doc """
      The name of the button, submitted as a pair with the button’s value as
      part of the form data.
      """
      prop name, :string

      @doc """
      The default behavior of the button. Possible values are:

      - `submit`: The button submits the form data to the server. This is the
      default if the attribute is not specified for buttons associated with a
      `<form>`, or if the attribute is an empty or invalid value.

      - `reset`: The button resets all the controls to their initial values,
      like `<input type="reset">`. (This behavior tends to annoy users.)

      - `button`: The button has no default behavior, and does nothing when
      pressed by default. It can have client-side scripts listen to the
      element's events, which are triggered when the events occur.
      """
      prop type, :atom, default: :button, values: ~w(submit reset button)a

      @doc """
      Defines the value associated with the button’s `name` when it’s submitted
      with the form data. This value is passed to the server in params when
      the form is submitted.
      """
      prop value, :string

      defp attributes,
        do: @button_attributes ++ @global_attributes
    end
  end
end
