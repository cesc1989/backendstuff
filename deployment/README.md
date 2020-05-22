# Custom Deployment Scripts

Ideally, you want to deploy your application to Heroku. It's the simplest way to release a Ruby on Rails application. However, when you need something more customized or your app is hosted in a VPS, then you're going to need to code some scripts to deploy your app.

> NOTE: you can also use Capistrano. There's a [miniguide here](../configurators/capistrano) as well.

The scripts in this section are useful to have a Capistrano-like deployment but "less" complicated to setup. This scripts work best if you configure them alonside something like CircleCI that will take care of running them for you after pushing changes to a git branch.

> NOTE: Copy these scripts to a `scripts/` folder in your RoR application.

## Folder Structure

The scripts assume the following folder structure:

```
~/app
├── api
└── deployments
    ├── api-gems
    └── api-release
```

## Scripts

1. deploy_api.sh
2. pull_repo.sh
3. after_deploy.sh
4. application_start.sh

The first one, `deploy_api.sh` takes care of running the rest of the scripts.
