#========================================= Aliases =========================================#

# Blue:                         Directory
# Green:                        Executable or recognized data file
# Sky Blue:                     Linked file
# Yellow with black background: Device
# Pink:                         Graphic image file
# Red:                          Archive file

#---------- List (l) ----------#
# A: list all entries, including names beginning with a period (.), he current directory (".") and parent directory ("..") are not listed
# G: inhibit display of group information
# 1: forces single column output
alias l='ls -AG1'

#---------- List (ll) ----------#
# l: display long format information (owner, group, size, time filename, links, etc.) 
# G: inhibit display of group information
# h: print sizes in human readable format (e.g., 1K 234M 2G) 
# A: list all entries, including names beginning with a period (.), he current directory (".") and parent directory ("..") are not listed
# s: indicate file size in blocks 
# g: do not list owner
# o: do not display owner

alias ll='ls -lGhAsgo'

#---------- Refresh Profile ----------#
alias hokirefresh='source ~/.bash_profile'


