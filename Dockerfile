#select image
FROM ubuntu:20.04

#set working directory
WORKDIR /jekyllsite

#copy all files to working directory
COPY . .

#expose port
EXPOSE 4000

#The run commands 
RUN apt-get update

RUN apt-get install -y ruby-full build-essential zlib1g-dev

#Set enviroment variables
ENV GEM_HOME $HOME/gems

ENV PATH $HOME/gems/bin:$PATH

#Install jekyll
RUN gem install jekyll bundler:2.1.2

#Run server
CMD jekyll serve --host 0.0.0.0
