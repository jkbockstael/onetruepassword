#!/bin/bash

# One True Password - Basic encrypted password storage and retrieval
#
# These bash functions allow a quick and easy way to store and retrieve
# passwords from a safe encrypted storage, making it a basic 1Password.
#
# 2014 Jean-Karim Bockstael <jkb@jkbockstael.be>

# Encrypted password storage file
ONETRUEPASSWORD_STORE=~/.onetruepassword_store.enc

# Encrypt function, can be used either as a filter or a command
# $ cat cleartext_file | encrypt > encrypted_file
# $ encrypt cleartext_file > encrypted_file
# $ encrypt cleartext_file encrypted_file
encrypt () {
	if [ $# -eq 0 ] ; then
		openssl des3 -salt
	elif [ $# -eq 1 ] ; then
		openssl des3 -salt -in "$1"
	else
		openssl des3 -salt -in "$1" -out "$2"
	fi
}

# Decrypt function, can be used either as a filter or a command
# $ cat encrypted_file | decrypt | vim -
# $ decrypt encrypted_file > cleartext_file
# $ decrypt encrypted_file cleartext_file
decrypt () {
	if [ $# -eq 0 ] ; then
		openssl des3 -salt -d
	elif [ $# -eq 1 ] ; then
		openssl des3 -salt -d -in "$1"
	else
		openssl des3 -salt -d -in "$1" -out "$2"
	fi
}

# One True Password - lookup, search for a term in the encrypted storage
# $ onetruepassword-look search_term
onetruepassword-look () {
	if [ $# -eq 0 ] ; then
		echo "1TP: provide a lookup term"
	else
		decrypt ${ONETRUEPASSWORD_STORE} | grep -i --color=auto $1
	fi
}

# One True Password - edit, edit the encrypted storage
# $ onetruepassword-edit
onetruepassword-edit () {
	TEMP=$(mktemp -t otp)
	decrypt ${ONETRUEPASSWORD_STORE} ${TEMP} \
	&& ${EDITOR} ${TEMP} \
	&& clear \
	&& encrypt ${TEMP} ${ONETRUEPASSWORD_STORE} \
	&& rm ${TEMP}
}

# Lazyness is a virtue
alias otpl="onetruepassword-look"
alias otpe="onetruepassword-edit"
