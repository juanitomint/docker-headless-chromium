#  
# Headless Chrome docker

This Docker image is intended to be included in automation pipelines continuous integrations tests and devops workflows

## Getting Started

you can see the pre-built images in 
[DockerHub](https://hub.docker.com/r/juanitomint/docker-headless-chromium)

or build your own with this repo 

### Prerequisites

you only need docker installed



## Running the tests

```
docker run -it --rm -v $(pwd):/usr/src/app -w /usr/src/app juanitomint/headless:erbuim npm run test
```


## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use chrome and node version form tagging

## Authors

Juan Ignacio Borda 2020

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the Apache2.0 - see the [LICENSE.md](LICENSE.md) file for details

