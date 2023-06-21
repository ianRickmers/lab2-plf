%{
int caracteres = 0;
%}

%option noyywrap

%%
. {caracteres++;}
\n {return EOF;}
%%

void main()
{
yylex();
printf("\nCaracteres = %d\n", caracteres);
}
