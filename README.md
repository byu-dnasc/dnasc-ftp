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

## Test server

This repository includes a containerized SFTP server for testing out 
commands without any consequences. The server runs in the background
and behaves the same as a normal SFTP site, although it cannot
accommodate large file uploads since any file writes within the container
are stored in memory. Only the user's home directory is writable, i.e. 
files should only be added to the user's home directory.

### Usage

The test server is designed to be run using singularity, which is
available on [BYU ORC](https://rc.byu.edu)'s system (marylou).

1. Load singularity with `module load singularity`
2. Run `source sftp_test_env`
3. Build the container image with `./build.sh`
4. Start the container with `./start.sh`

The SFTP server is now reachable. `./connect.sh` can be used 
to connect to the SFTP server. When you are done, stop the container
using `singularity instance stop sftp_server`.

### Troubleshooting

If the default port is already in use, then the SFTP server
will exit. To solve this conflict, pick a new port and change 
the port used by `start.sh` and `connect.sh` to run the server
by executing `export SFTP_PORT=[new port]`.

If `sftp` fails to connect to the SFTP server, then `connect.sh` 
will notify you if the container is not running, or if it is, if 
`sshd` is not running within the container. This info will help 
to direct further investigation.