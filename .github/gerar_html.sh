#!/bin/bash

# Varre todas as pastas no diretório public
find public -mindepth 1 -maxdepth 1 -type d | while read -r dir; do
    folder_name=$(basename "$dir")
    
    # Cria o index.html dentro de cada pasta de disciplina (ex: public/Calculo1/index.html)
    cat << 'EOF' > "$dir/index.html"
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Materiais didáticos</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin: 30px; line-height: 1.6; background-color: #f9f9f9; color: #333; }
        .container { max-width: 900px; margin: 0 auto; background: #fff; padding: 25px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        h1 { color: #1a365d; border-bottom: 2px solid #2b6cb0; padding-bottom: 10px; }
        h2 { color: #2b6cb0; margin-top: 30px; font-size: 1.2rem; }
        ul { list-style-type: none; padding-left: 0; }
        li { margin-bottom: 10px; padding: 8px 12px; background: #edf2f7; border-radius: 4px; display: flex; align-items: center; }
        a { text-decoration: none; color: #2b6cb0; font-weight: 600; }
        a:hover { text-decoration: underline; color: #2c5282; }
        .icon { margin-right: 10px; }
    </style>
</head>
<body>

<div class="container">
    <h1 id="titulo-disciplina">📚 Disciplina</h1>

    <h2>📂 Slides das Aulas</h2>
    <div id="container-slides"><p><i>Carregando...</i></p></div>

    <h2>📝 Listas de Exercícios</h2>
    <div id="container-listas"><p><i>Carregando...</i></p></div>

    <h2>🎥 Vídeo Aulas (YouTube)</h2>
    <div id="container-aulas"><p><i>Carregando...</i></p></div>

    <h2>📄 Provas e Avaliações</h2>
    <div id="container-provas"><p><i>Carregando...</i></p></div>
</div>

<script>
  // Ajusta o título com o nome da pasta atual
  const nomePasta = window.location.pathname.split('/').filter(Boolean).pop() || 'Cálculo 1';
  document.getElementById('titulo-disciplina').innerText = '📚 Disciplina: ' + nomePasta;

  function carregarLinks(nomeArquivo, idContainer) {
    fetch(nomeArquivo + '?v=' + new Date().getTime())
      .then(resposta => {
        if (!resposta.ok) throw new Error('Arquivo não encontrado');
        return resposta.text();
      })
      .then(texto => {
        const container = document.getElementById(idContainer);
        const linhas = texto.replace(/\r/g, '').trim().split('\n');
        
        let html = '<ul>';
        let temConteudo = false;

        linhas.forEach(linha => {
          const linhaLimpa = linha.trim();
          if (linhaLimpa !== '') {
            temConteudo = true;
            const indicePipe = linhaLimpa.indexOf('|');
            
            let titulo = 'Material';
            let url = linhaLimpa;

            if (indicePipe !== -1) {
              titulo = linhaLimpa.substring(0, indicePipe).trim();
              url = linhaLimpa.substring(indicePipe + 1).trim();
            }

            // Define ícone dependendo se é PDF local ou vídeo/drive
            let icone = '📄';
            if (url.includes('youtube.com') || url.includes('youtu.be')) icone = '🎥';
            if (url.includes('drive.google.com')) icone = '☁️';

            html += `<li><span class="icon">${icone}</span> <a href="${url}" target="_blank" rel="noopener noreferrer">${titulo}</a></li>`;
          }
        });

        html += '</ul>';
        container.innerHTML = temConteudo ? html : '<p><i>Nenhum material cadastrado nesta seção.</i></p>';
      })
      .catch(() => {
        document.getElementById(idContainer).innerHTML = '<p><i>Nenhum material cadastrado nesta seção.</i></p>';
      });
  }

  // Carrega os arquivos .txt das subpastas
  carregarLinks('Slides/links.txt', 'container-slides');
  carregarLinks('Listas/links.txt', 'container-listas');
  carregarLinks('Aulas/links.txt', 'container-aulas');
  carregarLinks('Provas/links.txt', 'container-provas');
</script>

</body>
</html>
EOF

done