#importar se os arquivos ja existem
#Gerenciador de Dados (Persistência em Arquivos .txt)

import  os

arquivo_usuarios = "usuarios.txt"
arquivo_videos = "videos.txt"
arquivo_curtidas = "curtidas.txt"
arquivo_favoritos = "favoritos.txt"

#funcao de caminho dos arquivos, para criar e escrever
def ler_linhas(caminho):
    if not os.path.exists(caminho):       
        open(caminho, "w").close()        
    with open(caminho, "r", encoding="utf-8") as f: 
        return [linha.strip() for linha in f if linha.strip()]  
    
def salvar_linhas(caminho, linhas):
    with open(caminho, "w", encoding="utf-8") as f: 
        for linha in linhas:
            f.write(linha + "\n")   

#cadastro de usuario
def cadastrar_usuario():
    nome = input("Digite seu nome: ")
    senha = input("Crie sua senha: ")
    
    if not nome:
        print("Nome não pode ser nulo!")
        return
    for linha in ler_linhas(arquivo_usuarios):
        if linha.split("|")[0] == nome:
           print("Já existe!")
           return
    
    with open(arquivo_usuarios, "a", encoding="utf-8") as f:
        f.write(f"{nome}|{senha}\n") 
    print("Usuário cadastrado com sucesso!")

#login do usuario
def login_usuario():
    nome = input("Digite seu nome: ")
    senha = input("Digite sua senha: ")

    for linha in ler_linhas(arquivo_usuarios):
        partes = linha.split("|")
        if partes[0] == nome and partes[1] == senha:
            print("Login realizado!")
            return nome
        
    print("Usuário ou senha incorretos.")
    return None

# Listar informações de vídeos buscados
def videos_popular():
    if not ler_linhas(arquivo_videos):
       with open(arquivo_videos, "a", encoding="utf-8") as f:
        f.write("1|Pretendente Surpresa|Romance|2024|Uma jovem se inscreve em um programa de TV para encontrar o amor verdadeiro.\n")
        f.write("2|Vincenzo|Suspense|2021|Um advogado mafioso italiano-coreano retorna à Coreia e enfrenta uma corporação corrupta.\n")
        f.write("3|Startup|Drama|2020|Jovens empreendedores lutam para construir suas empresas no mundo das startups sul-coreanas.\n")
        f.write("4|O Jogo da Imitação|Guerra|2015|Um matemático brilhante lidera uma equipe secreta para decifrar os códigos nazistas na Segunda Guerra.\n")
        f.write("5|Holo Meu Amor|Romance|2020|Uma jovem desenvolvedora se apaixona por um holograma de inteligência artificial.\n")

# Buscar vídeo por nome
def buscar_videos():
    nome = input("Digite o nome do vídeo: ")
    resultados = []

    for linha in ler_linhas(arquivo_videos):
        partes = linha.split("|")
        if nome.lower() in partes[1].lower():
            resultados.append(linha)

    if not resultados:
        print("Nenhum vídeo encontrado!")
        return

    for linha in resultados:
        partes = linha.split("|")
        print("Título: " + partes[1])
        print("Gênero: " + partes[2])
        print("Ano: " + partes[3])
        print("Sinopse: " + partes[4])
        print()

#Curtir e descurtir vídeos, mas a primeira parte é para encontrar o video digitado pelo user
def curtir_videos(usuario):
    nome = input("Digite o nome do vídeo: ")
    resultados = []

    for linha in ler_linhas(arquivo_videos):
        titulo = linha.split("|")[1]
        if nome.lower() in titulo.lower():
            resultados.append(linha)

    if not resultados:
        print("Nenhum vídeo encontrado")
        return

    for i, video in enumerate(resultados, 1):
        partes = video.split("|")
        print(f"[{i}] {partes[1]}")
    
    escolha = input("Digite o número do vídeo: ")
    video_escolhido = resultados[int(escolha) - 1]
    id_video = video_escolhido.split("|")[0]

    entrada = f"{usuario}|{id_video}"
    linhas = ler_linhas(arquivo_curtidas)

    if entrada in linhas:
        linhas.remove(entrada)
        salvar_linhas(arquivo_curtidas, linhas)
        print("Vídeo descurtido!")
 
    else:
        with open(arquivo_curtidas, "a", encoding="utf-8") as f:
          f.write(entrada + "\n")
        print("Vídeo curtido!")


#Gerenciar favoritos todo
#criar favoritos
def criar_lista(usuario):
    nome = input("Digite o nome da lista: ")

    for linha in ler_linhas(arquivo_favoritos):
        partes = linha.split("|")
        if partes[0] == usuario and partes[1] == nome:
            print("Lista já existe!")
            return
        
    with open(arquivo_favoritos, "a", encoding="utf-8") as f:
        f.write(f"{usuario}|{nome}|\n")
    print("Lista criada com sucesso!")

#ver as listas favoritos
def ver_listas(usuario):
   for linha in ler_linhas(arquivo_favoritos):
        partes = linha.split("|")
        if partes[0] == usuario:
            print(f"Lista: {partes[1]}")
            for id_video in partes[2].split(","):
                for v in ler_linhas(arquivo_videos):
                    if v.split("|")[0] == id_video:
                       print(f" - {v.split('|')[1]}")

#editar favoritos (adicionar videos)
def adicionar_video(usuario):
    ver_listas(usuario)
    nome_lista = input("Digite o nome da lista: ")

    for linha in ler_linhas(arquivo_favoritos):
        partes = linha.split("|")
        if partes[0] == usuario and partes[1] == nome_lista:
            termo = input("Digite o nome do vídeo: ")
            resultados = []
            for v in ler_linhas(arquivo_videos):
                titulo = v.split("|")[1]
                if termo.lower() in titulo.lower():
                    resultados.append(v)
            
            if not resultados:
                print("Nenhum vídeo encontrado!")
                return
            
            for i, video in enumerate(resultados, 1):
                print(f"[{i}] {video.split('|')[1]}")
            
            escolha = input("Número do vídeo: ")
            id_video = resultados[int(escolha) - 1].split("|")[0]
            
            ids = partes[2].split(",") if partes[2] else []
            if id_video in ids:
                print("Vídeo já está na lista!")
                return
            
            ids.append(id_video)
            partes[2] = ",".join(ids)
            todas = ler_linhas(arquivo_favoritos)
            todas[todas.index(linha)] = "|".join(partes)
            salvar_linhas(arquivo_favoritos, todas)
            print("Vídeo adicionado!")
            return
        
    print("Lista não encontrada!")

#editar favoritos (remover video)
def remover_video(usuario):
    ver_listas(usuario)
    nome_lista = input("Digite o nome da lista: ")

    for linha in ler_linhas(arquivo_favoritos):
        partes = linha.split("|")
        if partes[0] == usuario and partes[1] == nome_lista:
            ids = partes[2].split(",") if partes[2] else []
            if not ids:
                print("Lista vazia!")
                return
            for i, id_video in enumerate(ids, 1):
                for v in ler_linhas(arquivo_videos):
                    if v.split("|")[0] == id_video:
                        print(f"[{i}] {v.split('|')[1]}")
            escolha = input("Número do vídeo para remover: ")
            if not escolha.isdigit() or int(escolha) < 1 or int(escolha) > len(ids):
                print("Opção inválida!")
                return
            ids.pop(int(escolha) - 1)
            partes[2] = ",".join(ids)
            todas = ler_linhas(arquivo_favoritos)
            todas[todas.index(linha)] = "|".join(partes)
            salvar_linhas(arquivo_favoritos, todas)
            print("Vídeo removido!")
            return
    
    print("Lista não encontrada!")

#editar favoritos (renomear um titulo da lista)
def editar_lista(usuario):
    ver_listas(usuario)
    nome_antigo = input("Digite o nome da lista para renomear: ")
    nome_novo = input("Digite o novo nome: ")

    todas = ler_linhas(arquivo_favoritos)
    for i, linha in enumerate(todas):
        partes = linha.split("|")
        if partes[0] == usuario and partes[1] == nome_antigo:
            partes[1] = nome_novo
            todas[i] = "|".join(partes)
            salvar_linhas(arquivo_favoritos, todas)
            print("Lista renomeada!")
            return
    
    print("Lista não encontrada!")

#editar favoritos (excluir lista)
def excluir_lista(usuario): 
    ver_listas(usuario)
    nome = input("Digite o nome da lista para excluir: ")

    todas = ler_linhas(arquivo_favoritos)
    for linha in todas:
        partes = linha.split("|")
        if partes[0] == usuario and partes[1] == nome:
            todas.remove(linha)
            salvar_linhas(arquivo_favoritos, todas)
            print("Lista excluída!")
            return
    
    print("Lista não encontrada!")

#menu principal do usuario com servidor para aba "Favoritos"
def menu_favoritos(usuario):
    while True:
        print("\n--- FAVORITOS ---")
        print("1. Criar lista")
        print("2. Ver listas")
        print("3. Adicionar vídeo")
        print("4. Remover vídeo")
        print("5. Renomear lista")
        print("6. Excluir lista")
        print("0. Voltar")
        opcao = input("Escolha: ")

        if opcao == "1":
            criar_lista(usuario)
        elif opcao == "2":
            ver_listas(usuario)
        elif opcao == "3":
            adicionar_video(usuario)
        elif opcao == "4":
            remover_video(usuario)
        elif opcao == "5":
            editar_lista(usuario)
        elif opcao == "6":
            excluir_lista(usuario)
        elif opcao == "0":
            break
        else:
            print("Opção inválida!")

#menu do usuario logado para o menu principal
def menu_usuario(usuario):
    while True:
        print(f"\n FEItv | Seja bem vindo (a), {usuario}! O que deseja fazer?")
        print("1. Buscar vídeo")
        print("2. Curtir/Descurtir vídeo")
        print("3. Favoritos")
        print("0. Sair")
        opcao = input("Escolha: ")

        if opcao == "1":
            buscar_videos() 
        elif opcao == "2":
            curtir_videos(usuario)
        elif opcao == "3":
            menu_favoritos(usuario)
        elif opcao == "0":
            break
        else:
            print("Opção inválida!")

#menu principal ANTES DE LOGAR
def menu_principal():
    videos_popular()
    while True:
        print("\n=== FEItv ===")
        print("1. Cadastrar usuário")
        print("2. Login")
        print("0. Sair")
        opcao = input("Escolha: ")

        if opcao == "1":
            cadastrar_usuario()
        elif opcao == "2":
            usuario = login_usuario()
            if usuario:
                menu_usuario(usuario)
        elif opcao == "0":
            print("Até mais!")
            break
        else:
            print("Opção inválida!")

menu_principal()