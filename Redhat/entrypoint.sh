# Commands separated by single ampersands. 
# The commands to the left of the right-most ampersand are run in the background.
# If you are executing a series of commands simultaneously using single ampersands, 
# the command at the right-most position needs to be non-terminating
/var/opt/sqlconfiguration/inst-init.sh & /opt/mssql/bin/sqlservr

