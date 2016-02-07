# Copy w/ progress
cp_p () {
  rsync -WavP --human-readable --progress $1 $2
}


#Search recursiv
qt() {
    grep -ir --color=always "$*" . | less -RX
    #     │└─ search all files under each directory, recursively
    #     └─ ignore case
}
