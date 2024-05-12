$(document).ready(() => {
  $('button').on('click', (e) => {
    e.preventDefault()
    // alert('hello')

    let dados = $('form').serialize();
    console.log(dados);

    $.ajax({
        typeof: 'GET',
        url: 'cadastro.php',
        data: dados,
        //dataType: 'json',
        success: dados => {
            dados.nome,
            dados.email
         },
        error: erro => { console.log(erro) }
    })
  })
})