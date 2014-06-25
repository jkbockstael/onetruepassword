# One True Password

## Description

One True Password is a set of bash functions that I wrote to be able to
safely store sensitive data in a cross-platform standard way. You can
think of it as a very basic 1Password.

Outputs are done in clear text in your terminal, don't use it if people
are looking over your shoulder. At least it's safer than Post-It notes.

## Installation

Run this command in your terminal :

`curl https://raw.github.com/jkbockstael/onetruepassword/master/install.sh | sh`

Or copy or source the onetruepassword.sh file in your .bashrc file.

## Usage

```
# open the password storage in your editor
# you will be prompted for a password upon exiting the editor
$ otpe
# now your secrets are safely encrypted
```

```
# use otpl to search for an entry in your storage
$ optl some_keyword
```

## Licence

MIT, see LICENCE file.
