# Upgrading To Scrapy V1 from Scrapy V0.2x

I wrote this script during working for [Bkam.com](http://eg.bkam.com "Bkam") to update our scrapy project to Scrapy V1 and I wasn't going to modifiy all the spiders myself so I wrote this bash script to modifiy them all.
It's not the perfect but It will help you to save time.

### Upgrading Steps
        sudo apt-get update && sudo apt-get install scrapy
        sudo apt-get install build-essential libssl-dev libffi-dev python-dev
        sudo pip install service-identity
        sudo pip install pyasn1 --upgrade
        sudo pip install --upgrade w3lib
And please notice that you might not need to install/upgrade the last three packages and if you are using Scrapyd:

        sudo pip install scrapyd-client
And that's it now go to your spiders directory and run the bash script.
Then make the following changes:

        changes in settings.py file :
        scrapy.contrib.logstats.LogStats => scrapy.extensions.logstats.LogStats
        scrapy.contrib.corestats.CoreStats => scrapy.extensions.corestats.CoreStats
        scrapy.contrib.statsmailer.StatsMailer => scrapy.extensions.statsmailer.StatsMailer
        scrapy.contrib.downloadermiddleware.useragent.UserAgentMiddleware => scrapy.downloadermiddlewares.useragent.UserAgentMiddleware
        scrapy.contrib.downloadermiddleware.httpcompression.HttpCompressionMiddleware => scrapy.downloadermiddlewares.httpcompression.HttpCompressionMiddleware
        scrapy.contrib.pipeline.images.ImagesPipeline => scrapy.pipelines.images.ImagesPipeline
        
        changes in pipelines.py file :
        scrapy.contrib.pipeline.images => scrapy.pipelines.images
