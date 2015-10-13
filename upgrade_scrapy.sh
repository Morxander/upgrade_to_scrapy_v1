#!/bin/bash
# Run this file inside the spiders directory
# Then make the following changes
##############################
# changes in settings.py file
##############################
# scrapy.contrib.logstats.LogStats => scrapy.extensions.logstats.LogStats
# scrapy.contrib.corestats.CoreStats => scrapy.extensions.corestats.CoreStats
# scrapy.contrib.statsmailer.StatsMailer => scrapy.extensions.statsmailer.StatsMailer
# scrapy.contrib.downloadermiddleware.useragent.UserAgentMiddleware => scrapy.downloadermiddlewares.useragent.UserAgentMiddleware
# scrapy.contrib.downloadermiddleware.httpcompression.HttpCompressionMiddleware => scrapy.downloadermiddlewares.httpcompression.HttpCompressionMiddleware
# scrapy.contrib.pipeline.images.ImagesPipeline => scrapy.pipelines.images.ImagesPipeline
##############################
# changes in pipelines.py file
##############################
# scrapy.contrib.pipeline.images => scrapy.pipelines.images
##############################
# You might need to install those packages (Ubuntu)
##############################
# sudo apt-get install build-essential libssl-dev libffi-dev python-dev
# sudo pip install scrapyd-client
declare -A changes
changes=( ["(BaseSpider)"]="(scrapy.Spider)"
  ["from scrapy.spider import BaseSpider"]="import scrapy"
  ["sel = Selector(response)"]=""
  ["sel=Selector(response)"]=""
  ["sel.xpath"]="response.xpath"
  ["from scrapy import log"]="import logging"
  ["SgmlLinkExtractor("]="LinkExtractor("
  ["from scrapy.contrib.spiders import CSVFeedSpider"]="from scrapy.spiders import CSVFeedSpider"
  ["from scrapy.contrib.spiders import CrawlSpider, Rule"]="from scrapy.spiders import CrawlSpider, Rule"
  ["from scrapy.contrib.spiders import XMLFeedSpider"]="from scrapy.spiders import XMLFeedSpider"
  ["from scrapy.contrib.linkextractors.sgml import SgmlLinkExtractor"]="from scrapy.linkextractors import LinkExtractor"
  )
for change in "${!changes[@]}"; do sed -i "s/$change/${changes["$change"]}/g" *; done