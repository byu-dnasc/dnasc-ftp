# DNASC FTP

For those who don't want to use Globus, the DNASC is prepared
to release data via FTP or SFTP. To accomplish this, a technician
must log in to marylou and run some of the scripts found in this
repository.

## `ftp` vs. `sftp`

`ftp` and `sftp` are linux commands which send files to an FTP or
SFTP server. While they perform practically all the same functions,
it is important to note that they are not the same. The primary
difference is that SFTP is more secure. Other differences include
which subcommands are available (e.g. put vs. mput, etc.) and the
respective user authentication methods (or lack thereof).

## Batch transfer

While `ftp` and `sftp` provide an interactive mode to explore the files
on a file server or transfer specific files, they also offer a batch mode
for performing multiple transfers in a single command.
The main purpose of this repository is to provide scripts which utilize
batch mode for automating the process of sending files. This is 
particularily useful when more than just one or two files must be sent, 
which, in the course of DNASC operations, is usually the case.