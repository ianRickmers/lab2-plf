%{
#include <stdio.h>
%}

%option noyywrap

%%
"PI" { fprintf(yyout, "PI\n"); }
"MOD" { fprintf(yyout, "MOD\n"); }
"SQR" { fprintf(yyout, "SQR\n"); }
"CUR" { fprintf(yyout, "CUR\n"); }
"EXP" { fprintf(yyout, "EXP\n"); }
"LN" { fprintf(yyout, "LN\n"); }
"LOG" { fprintf(yyout, "LOG\n"); }
"SGN" { fprintf(yyout, "SGN\n"); }
"INT" { fprintf(yyout, "INT\n"); }
"FIX" { fprintf(yyout, "FIX\n"); }
"FRAC" { fprintf(yyout, "FRAC\n"); }
"ROUND" { fprintf(yyout, "ROUND\n"); }
\+ { fprintf(yyout, "+\n"); }
\- { fprintf(yyout, "-\n"); }
x { fprintf(yyout, "x\n"); }
\: { fprintf(yyout, ":\n"); }
\/ { fprintf(yyout, "/\n"); }
\^ { fprintf(yyout, "^\n"); }
\| { fprintf(yyout, "|\n"); }
\! { fprintf(yyout, "!\n"); }
\( { fprintf(yyout, "(\n"); }
\) { fprintf(yyout, ")\n"); }
\= { fprintf(yyout, "=\n"); }
[0-9]+(,[0-9]+)?E(\+|\-)?[0-9]+ { fprintf(yyout, "EXPONENCIAL\n"); }
([a-z]|[A-Z])([a-z]|[A-Z]|[0-9])* { fprintf(yyout, "IDENTIFICADOR\n"); }
[0-9]+,[0-9]+ { fprintf(yyout, "DECIMAL\n"); }
[0-9]+ { fprintf(yyout, "ENTERO\n"); }
[ \t\r\n]+ {}
. {}
%%

int main(int argc, char *argv[])
{
    FILE *archivo_entrada;
    FILE *archivo_salida;
    if(argc==1){
        printf("Error: Faltan par%cmetros.\nUso: lexico.exe archivo_entrada archivo_salida\n",160);
        return 0;
    }
    if(argc==2){
        printf("Error: Falta par%cmetro.\nUso: lexico.exe archivo_entrada archivo_salida\n",160);
        return 0;
    }
    if(argc > 3){
        printf("Error: Demasiados par%cmetros.\nUso: lexico.exe archivo_entrada archivo_salida\n",160);
        return 0;
    }
    if((archivo_salida=fopen(argv[2],"r"))){
            fclose(archivo_salida);
            printf("Error: El archivo de salida ya existe.\n");
            return 0;
    }
    if ((archivo_entrada = fopen(argv[1], "r")))
    {
        archivo_entrada = fopen(argv[1], "r");
        archivo_salida = fopen(argv[2], "w");
        yyin = archivo_entrada;
        yyout = archivo_salida;

        yylex();

        fclose(archivo_entrada);
        fclose(archivo_salida);
        return 0;
    }
    printf("Error: El archivo de entrada no existe.\n");
    return 0;
}

