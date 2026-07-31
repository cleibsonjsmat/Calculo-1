#!/bin/bash

HTML_FILE="public/index.html"

# Escreve o início do HTML e CSS
echo '<!DOCTYPE html>' > "$HTML_FILE"
echo '<html lang="pt-BR">' >> "$HTML_FILE"
echo '<head>' >> "$HTML_FILE"
echo '    <meta charset="UTF-8">' >> "$HTML_FILE"
echo '    <meta name="viewport" content="width=device-width, initial-scale=1.0">' >> "$HTML_FILE"
echo '    <title>Prof. Cleibson Silva | IFPE Caruaru</title>' >> "$HTML_FILE"
echo '    <link rel="preconnect" href="https://fonts.googleapis.com">' >> "$HTML_FILE"
echo '    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>' >> "$HTML_FILE"
echo '    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">' >> "$HTML_FILE"
echo '    <style>' >> "$HTML_FILE"
echo '        :root { --primary-green: #1e3a8a; --primary-dark: #0f172a; --bg-gray: #f8fafc; --card-bg: #ffffff; --text-main: #1e293b; --text-muted: #64748b; --border-color: #e2e8f0; }' >> "$HTML_FILE"
echo '        * { box-sizing: border-box; margin: 0; padding: 0; }' >> "$HTML_FILE"
echo '        body { font-family: "Inter", system-ui, sans-serif; background-color: var(--bg-gray); color: var(--text-main); line-height: 1.6; min-height: 100vh; display: flex; flex-direction: column; }' >> "$HTML_FILE"
echo '        header { background: linear-gradient(135deg, var(--primary-dark) 0%, var(--primary-green) 100%); color: white; padding: 45px 20px 55px 20px; text-align: center; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08); }' >> "$HTML_FILE"
echo '        header h1 { font-size: 2.2rem; font-weight: 700; margin-bottom: 6px; }' >> "$HTML_FILE"
echo '        header p.subtitle { font-size: 1.1rem; font-weight: 300; opacity: 0.95; }' >> "$HTML_FILE"
echo '        header p.campus { display: inline-block; margin-top: 12px; background: rgba(255, 255, 255, 0.15); padding: 4px 14px; border-radius: 20px; font-size: 0.85rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.03em; }' >> "$HTML_FILE"
echo '        main.container { max-width: 900px; width: 100%; margin: -25px auto 40px auto; padding: 0 20px; flex: 1; }' >> "$HTML_FILE"
echo '        .card { background: var(--card-bg); border-radius: 12px; padding: 26px; margin-bottom: 24px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.03); border: 1px solid var(--border-color); }' >> "$HTML_FILE"
echo '        .card h2 { font-size: 1.3rem; color: var(--primary-dark); margin-bottom: 12px; border-bottom: 2px solid #f1f5f9; padding-bottom: 8px; }' >> "$HTML_FILE"
echo '        .card p { color: var(--text-muted); font-size: 0.98rem; }' >> "$HTML_FILE"
echo '        .tabs-nav { display: flex; gap: 8px; border-bottom: 2px solid var(--border-color); margin-bottom: 20px; overflow-x: auto; padding-bottom: 4px; }' >> "$HTML_FILE"
echo '        .tab-btn { background: none; border: none; padding: 10px 18px; font-family: inherit; font-size: 0.95rem; font-weight: 600; color: var(--text-muted); cursor: pointer; border-radius: 6px 6px 0 0; transition: all 0.2s; white-space: nowrap; }' >> "$HTML_FILE"
echo '        .tab-btn:hover { color: var(--primary-green); background: #f1f5f9; }' >> "$HTML_FILE"
echo '        .tab-btn.active { color: var(--primary-green); border-bottom: 3px solid var(--primary-green); background: #ffffff; }' >> "$HTML_FILE"
echo '        .subtabs-nav { display: flex; gap: 6px; margin-bottom: 18px; flex-wrap: wrap; }' >> "$HTML_FILE"
echo '        .subtab-btn { background: #f1f5f9; border: 1px solid var(--border-color); padding: 5px 14px; font-family: inherit; font-size: 0.82rem; font-weight: 600; color: var(--text-muted); cursor: pointer; border-radius: 20px; transition: all 0.2s; }' >> "$HTML_FILE"
echo '        .subtab-btn.active { background: var(--primary-green); color: white; border-color: var(--primary-green); }' >> "$HTML_FILE"
echo '        .tab-content { display: none; }' >> "$HTML_FILE"
echo '        .tab-content.active { display: block; }' >> "$HTML_FILE"
echo '        .pdf-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(260px, 1fr)); gap: 14px; }' >> "$HTML_FILE"
echo '        .pdf-card { display: flex; align-items: center; justify-content: space-between; background: #f8fafc; border: 1px solid var(--border-color); border-radius: 8px; padding: 14px 16px; text-decoration: none; color: var(--text-main); transition: all 0.2s ease; }' >> "$HTML_FILE"
echo '        .pdf-card:hover { border-color: var(--primary-green); background: #ffffff; transform: translateY(-2px); box-shadow: 0 4px 12px rgba(15, 139, 68, 0.08); }' >> "$HTML_FILE"
echo '        .pdf-info { display: flex; align-items: center; gap: 10px; overflow: hidden; }' >> "$HTML_FILE"
echo '        .pdf-name { font-weight: 600; font-size: 0.92rem; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }' >> "$HTML_FILE"
echo '        .btn-download { background-color: var(--primary-green); color: white; font-size: 0.72rem; font-weight: 700; padding: 5px 10px; border-radius: 4px; text-transform: uppercase; }' >> "$HTML_FILE"
echo '        footer { background: #ffffff; border-top: 1px solid var(--border-color); text-align: center; padding: 20px; color: var(--text-muted); font-size: 0.85rem; }' >> "$HTML_FILE"
echo '    </style>' >> "$HTML_FILE"
echo '</head>' >> "$HTML_FILE"
echo '<body>' >> "$HTML_FILE"
echo '    <header>' >> "$HTML_FILE"
echo '        <h1>Homepage Prof. Cleibson Silva</h1>' >> "$HTML_FILE"
echo '        <p class="subtitle">Engenharia Mecânica e Cursos Técnicos Integrados ao Ensino Médio</p>' >> "$HTML_FILE"
echo '        <p class="campus">IFPE — Campus Caruaru</p>' >> "$HTML_FILE"
echo '    </header>' >> "$HTML_FILE"
echo '    <main class="container">' >> "$HTML_FILE"
echo '        <div class="card">' >> "$HTML_FILE"
echo '            <h2>📌 Apresentação</h2>' >> "$HTML_FILE"
echo '            <p>Esta página foi criada para facilitar o seu acesso aos materiais didáticos das disciplinas que ministro no IFPE. Selecione uma disciplina no menu abaixo para consultar e baixar listas de exercícios, roteiros de aula, slides e demais conteúdos.</p>' >> "$HTML_FILE"
echo '        </div>' >> "$HTML_FILE"
echo '        <div class="card">' >> "$HTML_FILE"
echo '            <div class="tabs-nav" id="tabs-header">' >> "$HTML_FILE"

# 1. Gerar Botões das Disciplinas (Considera PDFs e links.txt)
first=true
count=0
for folder in public/*/; do
    if [ -d "$folder" ]; then
        foldername=$(basename "$folder")
        if [[ "$foldername" == *"build"* ]] || [[ "$foldername" == .* ]]; then continue; fi

        pdf_count=$(find "$folder" -name "*.pdf" | wc -l)
        txt_count=$(find "$folder" -name "links.txt" | wc -l)
        
        # Se não tiver PDF nem links.txt, pula
        if [ "$pdf_count" -eq 0 ] && [ "$txt_count" -eq 0 ]; then continue; fi

        count=$((count + 1))
        tab_id="tab_${count}"

        case "$foldername" in
            "Cálculo 1"|"Cálculo 2"|"Calculo 1"|"Calculo 2") icon="📐" ;;
            "Matemática 6"|"Matematica 6") icon="🔢" ;;
            "Álgebra Linear"|"Algebra Linear") icon="🧮" ;;
            "Física") icon="⚡" ;;
            *) icon="📁" ;;
        esac
        
        if [ "$first" = true ]; then
            echo "                <button class=\"tab-btn active\" onclick=\"openTab(event, '$tab_id')\">$icon $foldername</button>" >> "$HTML_FILE"
            first=false
        else
            echo "                <button class=\"tab-btn\" onclick=\"openTab(event, '$tab_id')\">$icon $foldername</button>" >> "$HTML_FILE"
        fi
    fi
done

echo '            </div>' >> "$HTML_FILE"

# 2. Gerar Conteúdo das Abas com Filtros por Subpasta
first=true
count=0
for folder in public/*/; do
    if [ -d "$folder" ]; then
        foldername=$(basename "$folder")
        if [[ "$foldername" == *"build"* ]] || [[ "$foldername" == .* ]]; then continue; fi

        pdf_count=$(find "$folder" -name "*.pdf" | wc -l)
        txt_count=$(find "$folder" -name "links.txt" | wc -l)
        if [ "$pdf_count" -eq 0 ] && [ "$txt_count" -eq 0 ]; then continue; fi

        count=$((count + 1))
        tab_id="tab_${count}"
        
        display_style="display: none;"
        active_class=""
        if [ "$first" = true ]; then
            display_style="display: block;"
            active_class="active"
            first=false
        fi

        echo "            <div id=\"$tab_id\" class=\"tab-content $active_class\" style=\"$display_style\">" >> "$HTML_FILE"
        echo "                <div class=\"subtabs-nav\">" >> "$HTML_FILE"
        echo "                    <button class=\"subtab-btn active\" onclick=\"filterGroup(this, '$tab_id', 'all')\">Todos</button>" >> "$HTML_FILE"
        
        # Mapeia todas as subpastas que possuem PDFs OU arquivos links.txt
        find "$folder" -mindepth 1 -type d | while IFS= read -r subfolder; do
            sub_pdf_count=$(find "$subfolder" -maxdepth 1 -name "*.pdf" | wc -l)
            sub_txt_count=$(find "$subfolder" -maxdepth 1 -name "links.txt" | wc -l)
            
            if [ "$sub_pdf_count" -gt 0 ] || [ "$sub_txt_count" -gt 0 ]; then
                subname=$(basename "$subfolder")
                group_id=$(echo "$subname" | sed -e 's/[^a-zA-Z0-9]/_/g')
                echo "                    <button class=\"subtab-btn\" onclick=\"filterGroup(this, '$tab_id', 'grp_$group_id')\">$subname</button>" >> "$HTML_FILE"
            fi
        done
        echo "                </div>" >> "$HTML_FILE"

        echo "                <div class=\"pdf-grid\">" >> "$HTML_FILE"

        # A) Processa Arquivos PDF Locais
        find "$folder" -name "*.pdf" | while IFS= read -r pdf; do
            if [ -f "$pdf" ]; then
                relpath=$(echo "$pdf" | sed 's|^public/||')
                filename=$(basename "$pdf")
                
                parent_dir=$(basename "$(dirname "$pdf")")
                group_class="grp_root"
                if [ "$parent_dir" != "$foldername" ]; then
                    group_class="grp_$(echo "$parent_dir" | sed -e 's/[^a-zA-Z0-9]/_/g')"
                fi

                echo "                    <a href=\"$relpath\" target=\"_blank\" class=\"pdf-card $group_class\">" >> "$HTML_FILE"
                echo "                        <div class=\"pdf-info\"><span>📄</span><span class=\"pdf-name\">$filename</span></div>" >> "$HTML_FILE"
                echo "                        <span class=\"btn-download\">Abrir</span>" >> "$HTML_FILE"
                echo "                    </a>" >> "$HTML_FILE"
            fi
        done

        # B) Processa Arquivos links.txt (YouTube, Google Drive, Links extern)
        find "$folder" -name "links.txt" | while IFS= read -r txtfile; do
            if [ -f "$txtfile" ]; then
                parent_dir=$(basename "$(dirname "$txtfile")")
                group_class="grp_root"
                if [ "$parent_dir" != "$foldername" ]; then
                    group_class="grp_$(echo "$parent_dir" | sed -e 's/[^a-zA-Z0-9]/_/g')"
                fi

                # Lê cada linha do arquivo links.txt
                while IFS= read -r line || [ -n "$line" ]; do
                    line_clean=$(echo "$line" | tr -d '\r' | xargs)
                    if [ -n "$line_clean" ]; then
                        title=$(echo "$line_clean" | cut -d'|' -f1 | xargs)
                        url=$(echo "$line_clean" | cut -d'|' -f2- | xargs)

                        # Escolhe o ícone com base no tipo de link
                        icon="🔗"
                        if [[ "$url" == *"youtube.com"* ]] || [[ "$url" == *"youtu.be"* ]]; then
                            icon="🎥"
                        elif [[ "$url" == *"drive.google.com"* ]]; then
                            icon="☁️"
                        fi

                        echo "                    <a href=\"$url\" target=\"_blank\" class=\"pdf-card $group_class\">" >> "$HTML_FILE"
                        echo "                        <div class=\"pdf-info\"><span>$icon</span><span class=\"pdf-name\">$title</span></div>" >> "$HTML_FILE"
                        echo "                        <span class=\"btn-download\">Acessar</span>" >> "$HTML_FILE"
                        echo "                    </a>" >> "$HTML_FILE"
                    fi
                done < "$txtfile"
            fi
        done

        echo '                </div>' >> "$HTML_FILE"
        echo '            </div>' >> "$HTML_FILE"
    fi
done

# Rodapé e Scripts
echo '        </div>' >> "$HTML_FILE"
echo '    </main>' >> "$HTML_FILE"
echo '    <footer>' >> "$HTML_FILE"
echo '        <p><strong>"A matemática não é sobre números, equações ou algoritmos: é sobre compreender o mundo. Bons estudos e excelente jornada!"</strong></p>' >> "$HTML_FILE"
echo '    </footer>' >> "$HTML_FILE"
echo '    <script>' >> "$HTML_FILE"
echo '        function openTab(evt, tabName) {' >> "$HTML_FILE"
echo '            var i, tabcontent, tablinks;' >> "$HTML_FILE"
echo '            tabcontent = document.getElementsByClassName("tab-content");' >> "$HTML_FILE"
echo '            for (i = 0; i < tabcontent.length; i++) {' >> "$HTML_FILE"
echo '                tabcontent[i].style.display = "none";' >> "$HTML_FILE"
echo '                tabcontent[i].classList.remove("active");' >> "$HTML_FILE"
echo '            }' >> "$HTML_FILE"
echo '            tablinks = document.getElementsByClassName("tab-btn");' >> "$HTML_FILE"
echo '            for (i = 0; i < tablinks.length; i++) {' >> "$HTML_FILE"
echo '                tablinks[i].classList.remove("active");' >> "$HTML_FILE"
echo '            }' >> "$HTML_FILE"
echo '            document.getElementById(tabName).style.display = "block";' >> "$HTML_FILE"
echo '            document.getElementById(tabName).classList.add("active");' >> "$HTML_FILE"
echo '            evt.currentTarget.classList.add("active");' >> "$HTML_FILE"
echo '        }' >> "$HTML_FILE"
echo '        function filterGroup(btn, containerId, groupClass) {' >> "$HTML_FILE"
echo '            var container = document.getElementById(containerId);' >> "$HTML_FILE"
echo '            var subbtns = container.getElementsByClassName("subtab-btn");' >> "$HTML_FILE"
echo '            for (var i = 0; i < subbtns.length; i++) subbtns[i].classList.remove("active");' >> "$HTML_FILE"
echo '            btn.classList.add("active");' >> "$HTML_FILE"
echo '            var cards = container.getElementsByClassName("pdf-card");' >> "$HTML_FILE"
echo '            for (var i = 0; i < cards.length; i++) {' >> "$HTML_FILE"
echo '                if (groupClass === "all" || cards[i].classList.contains(groupClass)) {' >> "$HTML_FILE"
echo '                    cards[i].style.display = "flex";' >> "$HTML_FILE"
echo '                } else {' >> "$HTML_FILE"
echo '                    cards[i].style.display = "none";' >> "$HTML_FILE"
echo '                }' >> "$HTML_FILE"
echo '            }' >> "$HTML_FILE"
echo '        }' >> "$HTML_FILE"
echo '    </script>' >> "$HTML_FILE"
echo '</body>' >> "$HTML_FILE"
echo '</html>' >> "$HTML_FILE"