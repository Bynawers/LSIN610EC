%{
#include <stdio.h>
#include <stdlib.h>

#if YYBISON
int yylex();
int yyerror();
#endif

int tabSize = 0;

struct eleve {
    char* nom;
    int somme;
    int nb_note;
};

struct eleve liste_eleve[100];

void add_note(int value);
void add_eleve(char* nom);
void print_result();
%}

%union {
    char* chaine;
    int val;
};

%token <chaine> NOM
%token <val> NOTE
%token ADD
%token FDL

%%
programme:
    plusieursInstructions { print_result(); }
    ;
plusieursInstructions:
    plusieursInstructions instruction { ; }
    | instruction { ; }
    ;
instruction:
    NOM expression FDL { add_eleve($1); }
    ;
expression:
    NOTE ADD expression { add_note($1); }
    | NOTE { add_note($1); }
    ;
%%

void add_note(int value) {
    liste_eleve[tabSize].somme += value;
    liste_eleve[tabSize].nb_note++;
}

void add_eleve(char* nom) {
    liste_eleve[tabSize].nom = nom;
    tabSize++;
}

void print_result() {
    int moyenne = 0;
    int i = 0;
    while (i < tabSize) {
        moyenne = liste_eleve[i].somme / liste_eleve[i].nb_note;
        printf("%s %d\n", liste_eleve[i].nom, moyenne);
        i++;
    }
}