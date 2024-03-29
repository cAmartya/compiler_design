/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    IF = 258,
    ELSE = 259,
    FOR = 260,
    OPEN_BRACE = 261,
    CLOSE_BRACE = 262,
    OPEN_PAREN = 263,
    CLOSE_PAREN = 264,
    SEMICOLON = 265,
    PLUS = 266,
    MINUS = 267,
    TIMES = 268,
    DIVIDE = 269,
    ASSIGN = 270,
    LESS_THAN = 271,
    GREATER_THAN = 272,
    LESS_THAN_OR_EQUAL = 273,
    GREATER_THAN_OR_EQUAL = 274,
    EQUAL = 275,
    NOT_EQUAL = 276,
    NUMBER = 277,
    IDENTIFIER = 278,
    PRINT = 279,
    STRING = 280
  };
#endif
/* Tokens.  */
#define IF 258
#define ELSE 259
#define FOR 260
#define OPEN_BRACE 261
#define CLOSE_BRACE 262
#define OPEN_PAREN 263
#define CLOSE_PAREN 264
#define SEMICOLON 265
#define PLUS 266
#define MINUS 267
#define TIMES 268
#define DIVIDE 269
#define ASSIGN 270
#define LESS_THAN 271
#define GREATER_THAN 272
#define LESS_THAN_OR_EQUAL 273
#define GREATER_THAN_OR_EQUAL 274
#define EQUAL 275
#define NOT_EQUAL 276
#define NUMBER 277
#define IDENTIFIER 278
#define PRINT 279
#define STRING 280

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */