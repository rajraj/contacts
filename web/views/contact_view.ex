defmodule Contacts.ContactView do
  use Contacts.Web, :view

  def render("index.json", %{contacts: contacts}) do
    contacts
  end
end
