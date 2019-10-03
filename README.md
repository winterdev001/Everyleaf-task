# README

#Model name
> Name : Task

#Tables
>User > Columns :
                 > Id : Integer
                 > Name : String
>Task > Columns :
                 > Id : Integer
                 > User_id : Bigint
                 > Label_name : String
                 > Start_date : Datetime
                 > End_date : Datetime
                 > Status : String
>Labels > Columns:
                 > Id : Integer
                 >Label_name : String

#Schema        

@User
-----
Id   | Name     |
-----|----------|
  1  | John Doe |
-----------------

@Task
------
id  | user_id |   label_name          | start_date  | end_date   |status    |
----|---------|-----------------------|-------------|------------|----------|
 1  |  1      | Doctors' appointment  | 1/1/2020    |10/1/2020   | pending  |
-----------------------------------------------------------------------------

@Labels
-------
id  | label_name   |
----|--------------|
  1 | Chores       |
--------------------

#Deployment of app on heroku and connect it to github

@Requirements:
>ruby
>ruby on rails
>Git
    >Git installed locally
>Github
>Heroku
       >Heroku account
       >Heroku installed locally

@Deployment:
>Log into your Heroku Account and Create a New App
>Use Heroku (Web) UI to Deploy the Application
>Deploy
       >Click on the "Connect to GitHub" button
       >Search for the repository 
       >Click on "Connect" button.
       >Enable Automatic Deploys
