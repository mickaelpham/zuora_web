Zuora Web
=========

A simple web interface for the [Zuora](https://www.zuora.com) SOAP API using
my [Zuora Ruby client](https://github.com/mickaelpham/zuora.git).

Preview
-------

![Preview](https://raw.githubusercontent.com/mickaelpham/zuora_web/master/preview.png)

Getting Started
---------------

### WSDL

You will need your Zuora WSDL. Download the file through your Zuora Settings and
save it in the `wsdl/` folder.

Don't forget to rename it either `apisandbox.wsdl` or `production.wsdl` based on
your environment!

### Starting the server

```
bundle install
bundle exec rackup
```

Then open your web browser at [http://localhost:9292](http://localhost:9292) to
get started.
