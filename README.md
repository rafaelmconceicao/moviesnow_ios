# Movies Now – iOS App (SwiftUI)

Aplicativo mobile funcional para iOS, desenvolvido como parte do **Desafio Técnico – Desenvolvedor Mobile (iOS e Android)**.  
A proposta consiste em exibir uma lista de filmes mockados via **API GraphQL simulada localmente (arquivo JSON)** e apresentar uma tela de detalhes com miniplayer de trailer.

---

## Funcionalidades obrigatórias

Tela de **listagem de filmes** com:
- Imagem
- Título
- Ano
- Nota

Tela de **detalhes do filme** com:
- Imagem de destaque
- Título
- Descrição
- Ano de lançamento
- Duração
- Nota
- **Miniplayer embutido com trailer (WebView YouTube)**

**Consumo via GraphQL simulado** (arquivo `filmes.json`)

---

## Arquitetura adotada

- 🔹 **MVVM** (Model-View-ViewModel)
- 🔹 Separação clara entre camadas:
  - `Models` → estrutura dos dados
  - `ViewModels` → lógica de carregamento dos filmes
  - `Views` → interface com SwiftUI
- 🔹 `MovieService.swift` faz a leitura do JSON local como simulação de requisição GraphQL

---

##  Como rodar o projeto

1. Clone este repositório:
   ```bash
   git clone https://github.com/rafaelmconceicao/moviesnow_ios.git
   ```

2. Abra o projeto no Xcode:
   ```bash
   open MoviesNow.xcodeproj
   ```

3. Certifique-se de que o arquivo `filmes.json` está dentro de:
   ```
   MoviesNow/Resources/filmes.json
   ```

4. Marque o arquivo no target do projeto (se necessário)

5. Selecione um simulador (ex: iPhone 15) e execute:
   ```
   Cmd + R
   ```

---

## Diferenciais implementados

- **SwiftUI** (interface moderna e declarativa)
- Miniplayer de trailer com `WebView`
- Estrelas de avaliação com `ForEach`
- Responsividade em qualquer iPhone

---

## Estrutura de pastas

```
MoviesNow/
├── Models/
│   └── Movie.swift
│   └── MovieService.swift
├── ViewModels/
│   └── MovieViewModel.swift
├── Views/
│   └── MovieListView.swift
│   └── MovieDetailView.swift
│   └── WebView.swift
├── Resources/
│   └── filmes.json
├── MoviesNowApp.swift
```

---

## Decisões técnicas

- Utilização de `@StateObject` para gerenciamento de estado
- Leitura do JSON mockado simula uma **query GraphQL**
- Interface 100% SwiftUI, sem UIKit
- Modularização para fácil extensão futura (ex: autenticação, favoritos)

---

## Observações

- O trailer é exibido via `WebView` direto do YouTube (link embutido).
- O `filmes.json` segue o formato fornecido no desafio e pode ser estendido.
- O app não faz chamadas de rede reais — tudo é simulado offline.

---

## Autor

Desenvolvido por [Rafael Conceição](mailto:rafael.conceicao.sp@outlook.com)