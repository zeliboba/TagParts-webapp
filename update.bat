copy db\development.sqlite3 db\development.%date:~6,4%%date:~0,2%%date:~3,2%_%time:~0,2%24%time:~3,2%%time:~6,2%
@echo database backed up 

rem use 'call git' since git is a batch file in Msysgit 
rem http://stackoverflow.com/questions/5077254/reading-git-commands-using-batch-bat-file
call git checkout -- .
call git pull                                            

call bundle install
call rake db:migrate
call rake reset:updated_at
