# Hospedagem local automática
O script simplifica o processo de instalação do servidor Apache, clonagem de repositórios Git e a preparação do ambiente para hospedar páginas da web.

## Pré-requisitos
- Sistema operacional Linux (Debian, Ubuntu ou derivados)
- Acesso de administrador (sudo)
- Conexão com a internet

## Funcionalidades
As seguintes funcionalidades são executadas de forma automática.

- Instalação do Apache
- Instalação do Git
- Configuração do ambiente
- Hospedagem local
- Geração de QR code

## Uso
Na interface de linha de comando do seu Linux, utilizar uma das opções a seguir.

Execução remota:
```bash
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/fgomesx/AutoHost-Script/main/autohost.sh)"
```

Execução local:
```bash 
wget -O autohost.sh  https://raw.githubusercontent.com/fgomesx/AutoHost-Script/main/autohost.sh
sudo bash ./autohost.sh
```