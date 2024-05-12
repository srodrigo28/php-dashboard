/*** Opção 1 pegando os dados via javascript
    const clicar = () => {
        // alert('link documentação clicado USANDO');
        console.log('link documentação clicado');
    }
*/

/*** Opção 2 pegando os dados via javascript
    function clicar() {
        // alert('link documentação clicado USANDO');
        console.log('link documentação clicado');
    }
*/

/** Opção 3 pegando os dados via jQuery
    $(document).ready(() => {
        $('#documentacao').on('click', () => {
            console.log('link documentação clicado')
        })

        $('#suporte').on('click', () => {
            console.log('link suporte clicado')
        })
    })
*/

/** Opção 4 Colocando um html dentro de um outro html */
$(document).ready(() => {
    $('#documentacao').on('click', () => {
        $('#pagina').load('documentacao.html')
        console.log('link documentação clicado')
    })

    $('#suporte').on('click', () => {
        $('#pagina').load('suporte.html')
        console.log('link suporte clicado')
    })

    $('#cadastro').on('click', () => {
        $('#pagina').load('cadastro.html')
        console.log('link suporte clicado')
    })

    $('#btn-cadastrar').on('click', () => {
        alert('Cadastrado com sucesso');
    })
    // Ajax
    $('#compentencia').on('change', e => {
        /** testando seleção */
        let competencia = $(e.target).val()
        // console.log(competencia);

        $.ajax({
            type: 'GET',
            url: 'app.php',
            data: `competencia=${competencia}`,
            dataType: 'json',
            success: dados => { 
                $('#numeroVendas').html(dados.numeroVendas)
                $('#totalVendas').html(dados.totalVendas)
                console.log(dados.numeroVendas, dados.totalVendas) 
            },
            error: erro => { console.log(erro)}
        })
        
    })
})