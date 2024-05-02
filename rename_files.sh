#!/bin/bash

# Diretório onde os arquivos serão renomeados
DIRECTORY=$1

# Verifique se o diretório existe
if [ ! -d "$DIRECTORY" ]; then
    echo "O diretório $DIRECTORY não existe."
    exit 1
fi

# Mude para o diretório
cd "$DIRECTORY"

# Itere sobre todos os arquivos no diretório
for file in *; do
    # Verifique se o arquivo contém um traço
    if [[ "$file" == *-* ]]; then
        # Novo nome com traços substituídos por sublinhados
        new_name=$(echo "$file" | tr '-' '_')
        
        # Verifique se o novo nome já existe para evitar conflitos
        if [ -e "$new_name" ]; then
            echo "O arquivo $new_name já existe. Pulando a renomeação de $file."
        else
            # Renomeie o arquivo
            mv "$file" "$new_name"
            echo "Renomeado $file para $new_name."
        fi
    fi
done

echo "Renomeação concluída."
