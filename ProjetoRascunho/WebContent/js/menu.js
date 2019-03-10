// Barra lateral
var mySidebar = document.getElementById("mySidebar");

// Div com efeito de sobreposição
var overlayBg = document.getElementById("myOverlay");

// Alternar entre mostrar e ocultar a barra lateral e adicionar efeito de sobreposição
function w3_open() {
    if (mySidebar.style.display === 'block') {
        mySidebar.style.display = 'none';
        overlayBg.style.display = "none";
    } else {
        mySidebar.style.display = 'block';
        overlayBg.style.display = "block";
    }
}

// Fecha a barra lateral com o botão fechar
function w3_close() {
    mySidebar.style.display = "none";
    overlayBg.style.display = "none";
}