#!/bin/bash

# 1. Cria o index.html na RAIZ do site (evita o erro 404 da home principal)
cat << 'EOF_ROOT' > public/index.html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Materiais Didáticos - Portal</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; line-height: 1.6; background-color: #f8f9fa; color: #333; }
        .container { max-width: 800px; margin: 0 auto; background: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        h1 { color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px; }
        ul { list-style-type: none; padding-left: 0; }
        li { margin-bottom: 12px; }
        a { text-decoration: none; color: #2b6cb0; font-weight: bold; font-size: 1.1rem; padding: 10px 15px; background: #edf2f7; display: block; border-radius: 5px; border-left: 4px solid #3498db; }
        a:hover { background: #e2e8f0; color: #2c5282; }
    </style>
</head>
<body>

<div class="container">
    <h1>📚 Portal de Disciplinas</h1>
    <p>Selecione uma disciplina abaixo para acessar os materiais:</p>
    <ul id="lista-disciplinas">
EOF_ROOT

# Adiciona cada disciplina na lista da home principal
find public -mindepth 1 -maxdepth 1 -type d | while read -r dir; do
    folder_name=$(basename "$dir")
    echo "        <li><a href=\"$folder_name/\">📂 $folder_name</a></li>" >> public/index.html
done

cat << 'EOF_ROOT_END' >> public/index.html
    </ul>
</div>

</body>
</html>
EOF_ROOT_END


# 2. Varre cada disciplina dentro de public/ e gera o index.html da disciplina
find public -mindepth 1 -maxdepth 1 -type d | while read -r dir; do
    folder_name=$(basename "$dir")
    
    cat << 'EOF' > "$dir/index.html"
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Materiais Didáticos</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; line-height: 1.6; background-color: #f8f9fa; color: #333; }
        .container { max-width: 900px; margin: 0 auto; background: #fff; padding: 25px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        h1 { color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px; }
        h2 { color: #2980b9; margin-top: 30px; font-size: 1.2rem; }
        ul { list-style-type: none; padding-left: 0; }
        li { margin-bottom: 10px; padding: 10px; background: #edf2f7; border-left: 4px solid #3498db; border-radius: 4px; }
        a { text-decoration: none; color: #2b6cb0; font-weight: bold; }
        a:hover { text-decoration: underline; color: #2c5282; }
        .icon { margin-right: 8px; font-size: 1.1rem; }
        .voltar { display: inline-block; margin-bottom: 15px; color: #718096; text-decoration: none; font-size: 0.9rem; }
    </style>
</head>
<body>

<div class="container">
    <a href="../" class="voltar">⬅ Voltar para o Portal de Disciplinas</a>
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
  var caminho = window.location.pathname.split('/').filter(Boolean);
  var nomePasta = caminho.length > 0 ? caminho[caminho.length - 1] : 'Cálculo 1';
  document.getElementById('titulo-disciplina').innerText = '📚 Disciplina: ' + nomePasta;

  function carregarLinks(nomeArquivo, idContainer) {
    fetch(nomeArquivo + '?v=' + new Date().getTime())
      .then(function(resposta) {
        if (!resposta.ok) return null;
        return resposta.text();
      })
      .then(function(texto) {
        var container = document.getElementById(idContainer);
        if (!texto) {
          container.innerHTML = '<p><i>Nenhum material cadastrado nesta seção.</i></p>';
          return;
        }

        var linhas = texto.replace(/\r/g, '').trim().split('\n');
        var html = '<ul>';
        var temConteudo = false;

        linhas.forEach(function(linha) {
          var linhaLimpa = linha.trim();
          if (linhaLimpa !== '') {
            temConteudo = true;
            var indicePipe = linhaLimpa.indexOf('|');
            
            var titulo = 'Material';
            var url = linhaLimpa;

            if (indicePipe !== -1) {
              titulo = linhaLimpa.substring(0, indicePipe).trim();
              url = linhaLimpa.substring(indicePipe + 1).trim();
            }

            var icone = '📄';
            if (url.indexOf('youtube.com') !== -1 || url.indexOf('youtu.be') !== -1) {
              icone = '🎥';
            } else if (url.indexOf('drive.google.com') !== -1) {
              icone = '☁️';
            }

            html += '<li><span class="icon">' + icone + '</span> <a href="' + url + '" target="_blank" rel="noopener noreferrer">' + titulo + '</a></li>';
          }
        });

        html += '</ul>';
        container.innerHTML = temConteudo ? html : '<p><i>Nenhum material cadastrado nesta seção.</i></p>';
      })
      .catch(function() {
        document.getElementById(idContainer).innerHTML = '<p><i>Nenhum material cadastrado nesta seção.</i></p>';
      });
  }

  carregarLinks('Slides/links.txt', 'container-slides');
  carregarLinks('Listas/links.txt', 'container-listas');
  carregarLinks('Aulas/links.txt', 'container-aulas');
  carregarLinks('Provas/links.txt', 'container-provas');
</script>

</body>
</html>
EOF

    # 3. Varre as SUBPASTAS (ex: Slides, Listas, etc.) e garante um index.html em cada uma
    find "$dir" -mindepth 1 -type d | while read -r subpasta; do
        if [ ! -f "$subpasta/index.html" ]; then
            sub_name=$(basename "$subpasta")
            cat << 'EOF_SUB' > "$subpasta/index.html"
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Materiais</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; line-height: 1.6; background-color: #f8f9fa; color: #333; }
        .container { max-width: 800px; margin: 0 auto; background: #fff; padding: 25px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        h1 { color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px; }
        ul { list-style-type: none; padding-left: 0; }
        li { margin-bottom: 10px; padding: 10px; background: #edf2f7; border-left: 4px solid #3498db; border-radius: 4px; }
        a { text-decoration: none; color: #2b6cb0; font-weight: bold; }
        a:hover { text-decoration: underline; color: #2c5282; }
        .voltar { display: inline-block; margin-bottom: 15px; color: #718096; text-decoration: none; font-size: 0.9rem; }
    </style>
</head>
<body>

<div class="container">
    <a href="../" class="voltar">⬅ Voltar para a disciplina</a>
    <h1 id="titulo-subpasta">📂 Conteúdo</h1>
    <div id="container-conteudo"><p><i>Carregando...</i></p></div>
</div>

<script>
  var caminho = window.location.pathname.split('/').filter(Boolean);
  var nomeSub = caminho.length > 0 ? caminho[caminho.length - 1] : 'Conteúdo';
  document.getElementById('titulo-subpasta').innerText = '📂 ' + nomeSub;

  fetch('links.txt?v=' + new Date().getTime())
    .then(function(res) { return res.ok ? res.text() : null; })
    .then(function(texto) {
      var container = document.getElementById('container-conteudo');
      if (!texto) {
        container.innerHTML = '<p><i>Nenhum arquivo cadastrado nesta pasta.</i></p>';
        return;
      }
      var linhas = texto.replace(/\r/g, '').trim().split('\n');
      var html = '<ul>';
      var temConteudo = false;

      linhas.forEach(function(linha) {
        var l = linha.trim();
        if (l !== '') {
          temConteudo = true;
          var idx = l.indexOf('|');
          var tit = 'Material', url = l;
          if (idx !== -1) {
            tit = l.substring(0, idx).trim();
            url = l.substring(idx + 1).trim();
          }
          var icone = '📄';
          if (url.indexOf('youtube.com') !== -1 || url.indexOf('youtu.be') !== -1) icone = '🎥';
          else if (url.indexOf('drive.google.com') !== -1) icone = '☁️';

          html += '<li>' + icone + ' <a href="' + url + '" target="_blank" rel="noopener noreferrer">' + tit + '</a></li>';
        }
      });
      html += '</ul>';
      container.innerHTML = temConteudo ? html : '<p><i>Nenhum arquivo cadastrado nesta pasta.</i></p>';
    })
    .catch(function() {
      document.getElementById('container-conteudo').innerHTML = '<p><i>Nenhum arquivo cadastrado nesta pasta.</i></p>';
    });
</script>

</body>
</html>
EOF_SUB
        fi
    done
done