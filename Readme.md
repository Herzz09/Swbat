# Senha-wifi.bat

Script em Batch que mostra, direto no terminal, o nome e a senha do Wi-Fi ao qual o computador está conectado agora, sem precisar de cabo.

![Batch](https://img.shields.io/badge/Batch-.bat-blue) ![Plataforma](https://img.shields.io/badge/Plataforma-Windows-lightgrey) ![Licença](https://img.shields.io/badge/Licença-MIT-green)

**Dev:** Herzz09 

**Data:** 27/05/2026 

**Nome:** Senha-wifi.bat


## Exemplo de saída

![Exemplo de saída](exemplo.png)

O nome da rede e a senha mudam conforme a rede conectada.

## Sobre

Ver a senha de um Wi-Fi já conectado exige abrir as propriedades do adaptador de rede e passar por várias telas do Windows. O `Senha-wifi.bat` faz isso em um único arquivo, sem instalar nada: basta um duplo clique.

## Como funciona

1. Descobre o nome da rede atual (SSID) com `netsh wlan show interface`.
2. Lê o perfil salvo da rede e grava o resultado em um arquivo temporário, `temp_wifi.txt`.
3. Procura a senha na linha `Conteúdo da Chave` (Windows em português) ou `Key Content` (Windows em inglês).
4. Exibe o resultado, apaga o arquivo temporário e espera uma tecla para fechar.

Se não encontrar senha (rede aberta, por exemplo), mostra `Nao encontrada`.

## Como usar

Requisitos: Windows com adaptador Wi-Fi, conectado a uma rede.

```
git clone https://github.com/Herzz09/Info-Senha-wifi.git
```

Depois, dê um duplo clique em `Senha-wifi.bat`.

**Observações**

- Só mostra senhas de redes salvas no próprio computador.
- Em alguns casos pode ser necessário executar como administrador.
- Use apenas em redes que você tem permissão para acessar.

## Próximos passos

- [ ] Listar a senha de todas as redes salvas.
- [ ] Opção de copiar a senha para a área de transferência.
- [ ] Adicionar a licença MIT ao repositório.

## Licença

Distribuído sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

Desenvolvido por [Herzz09](https://github.com/Herzz09).
