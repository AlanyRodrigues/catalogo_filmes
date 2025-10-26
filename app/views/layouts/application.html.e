<% if user_signed_in? %>
  <div class="greeting">
    <p>Olá, <%= current_user.name %>!</p>
  </div>
<% else %>
  <%= link_to "Entrar", new_user_session_path %> |
  <%= link_to "Cadastrar", new_user_registration_path %>
<% end %>
