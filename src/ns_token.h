// quest_token.h

enum token_type {
        WORD = 1,
        Q_WORD,
        FILEIN, // <
        FILEOUT, // >
        PIPE, // |
        SETENV,
        PRINTENV,
        UNSETENV,
        CD,
        ALIAS,
        UNALIAS,
        BYE
};
