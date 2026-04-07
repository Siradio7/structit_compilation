strucit-compiler/
│
├── frontend/                  # Compilateur principal
│   ├── lexer.l               # Analyse lexicale (flex)
│   ├── parser.y              # Analyse syntaxique (bison)
│   ├── ast.c                 # (optionnel) arbre syntaxique
│   ├── ast.h
│   ├── symbol_table.c        # table des symboles
│   ├── symbol_table.h
│   ├── semantic.c            # vérifications sémantiques
│   ├── semantic.h
│   ├── codegen.c             # génération de code
│   ├── codegen.h
│   └── main.c                # point d’entrée
│
├── backend/                  # Parseur du backend
│   ├── lexer.l
│   ├── parser.y
│   └── main.c
│
├── include/                  # headers communs
│   └── utils.h
│
├── tests/                    # fichiers de test
│   ├── valid/
│   │   ├── test1.c
│   │   └── test2.c
│   └── invalid/
│       ├── error1.c
│       └── error2.c
│
├── output/                   # code généré
│   └── output.c
│
├── Makefile                  # compilation
└── README.md