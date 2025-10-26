document.addEventListener("DOMContentLoaded", () => {
  // Exemplo: alerta ao clicar no botão de busca
  const searchButton = document.querySelector('form input[type="submit"]');
  if(searchButton) {
    searchButton.addEventListener('click', () => {
      console.log("Buscando filmes...");
    });
  }

  // Exemplo: alerta ao enviar comentário sem nome
  const commentForm = document.querySelector('#new_comment');
  if(commentForm) {
    commentForm.addEventListener('submit', (e) => {
      const nameField = commentForm.querySelector('input[name="comment[name]"]');
      if(nameField && nameField.value.trim() === '') {
        e.preventDefault();
        alert("Por favor, preencha seu nome antes de comentar!");
      }
    });
  }
});
