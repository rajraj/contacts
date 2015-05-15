defmodule Contacts.ContactController do
  use Contacts.Web, :controller

  alias Contacts.Contact

  plug :scrub_params, "contact" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    contacts = Repo.all(Contact)
    render(conn, contacts: contacts)
  end

  def new(conn, _params) do
    changeset = Contact.changeset(%Contact{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"contact" => contact_params}) do
    changeset = Contact.changeset(%Contact{}, contact_params)

    if changeset.valid? do
      Repo.insert(changeset)

      conn
      |> put_flash(:info, "Contact created successfully.")
      |> redirect(to: contact_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    contact = Repo.get(Contact, id)
    render(conn, "show.html", contact: contact)
  end

  def edit(conn, %{"id" => id}) do
    contact = Repo.get(Contact, id)
    changeset = Contact.changeset(contact)
    render(conn, "edit.html", contact: contact, changeset: changeset)
  end

  def update(conn, %{"id" => id, "contact" => contact_params}) do
    contact = Repo.get(Contact, id)
    changeset = Contact.changeset(contact, contact_params)

    if changeset.valid? do
      Repo.update(changeset)

      conn
      |> put_flash(:info, "Contact updated successfully.")
      |> redirect(to: contact_path(conn, :index))
    else
      render(conn, "edit.html", contact: contact, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    contact = Repo.get(Contact, id)
    Repo.delete(contact)

    conn
    |> put_flash(:info, "Contact deleted successfully.")
    |> redirect(to: contact_path(conn, :index))
  end
end
