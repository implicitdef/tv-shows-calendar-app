
# how to run

Should be in theory :


    bundle install
    bin/rails server
    
    
In dev, will also need a postgres database (see databse.yml)
And Mailcatcher running in the background to receive the mails.


# deploy to heroku

    git push heroku master
    heroku run rails:migrate (pour run les migrations si besoin)


