defmodule Contacts.ContactControllerTest do
  use Contacts.ConnCase

  alias Contacts.Contact
  @valid_params contact: %{name: "some content", phone: "some content"}
  @invalid_params contact: %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "GET /contacts", %{conn: conn} do
    conn = get conn, contact_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing contacts"
  end

  test "GET /contacts/new", %{conn: conn} do
    conn = get conn, contact_path(conn, :new)
    assert html_response(conn, 200) =~ "New contact"
  end

  test "POST /contacts with valid data", %{conn: conn} do
    conn = post conn, contact_path(conn, :create), @valid_params
    assert redirected_to(conn) == contact_path(conn, :index)
  end

  test "POST /contacts with invalid data", %{conn: conn} do
    conn = post conn, contact_path(conn, :create), @invalid_params
    assert html_response(conn, 200) =~ "New contact"
  end

  test "GET /contacts/:id", %{conn: conn} do
    contact = Repo.insert %Contact{}
    conn = get conn, contact_path(conn, :show, contact)
    assert html_response(conn, 200) =~ "Show contact"
  end

  test "GET /contacts/:id/edit", %{conn: conn} do
    contact = Repo.insert %Contact{}
    conn = get conn, contact_path(conn, :edit, contact)
    assert html_response(conn, 200) =~ "Edit contact"
  end

  test "PUT /contacts/:id with valid data", %{conn: conn} do
    contact = Repo.insert %Contact{}
    conn = put conn, contact_path(conn, :update, contact), @valid_params
    assert redirected_to(conn) == contact_path(conn, :index)
  end

  test "PUT /contacts/:id with invalid data", %{conn: conn} do
    contact = Repo.insert %Contact{}
    conn = put conn, contact_path(conn, :update, contact), @invalid_params
    assert html_response(conn, 200) =~ "Edit contact"
  end

  test "DELETE /contacts/:id", %{conn: conn} do
    contact = Repo.insert %Contact{}
    conn = delete conn, contact_path(conn, :delete, contact)
    assert redirected_to(conn) == contact_path(conn, :index)
    refute Repo.get(Contact, contact.id)
  end
end
