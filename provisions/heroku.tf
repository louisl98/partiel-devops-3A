# Create new app
resource "heroku_app" "staging" {
  name   = "stagingdevopspartiel"
  region = "eu"

  config_vars {
    FOOBAR = "baz"
  }

  buildpacks = [
    "heroku/go",
  ]
}

# Create new app
resource "heroku_app" "production" {
  name   = "productiondevopspartiel"
  region = "eu"

  config_vars {
    FOOBAR = "baz"
  }

  buildpacks = [
    "heroku/go",
  ]
}

# Create new app
resource "heroku_app" "development" {
  name   = "developmentdevopspartiel"
  region = "eu"

  config_vars {
    FOOBAR = "baz"
  }

  buildpacks = [
    "heroku/go",
  ]
}

# Create a Heroku pipeline
resource "heroku_pipeline" "ourapppipeline" {
  name = "apppipelinepartiel"
}

# Couple apps to different pipeline stages

resource "heroku_pipeline_coupling" "staging" {
  app      = "${heroku_app.staging.name}"
  pipeline = "${heroku_pipeline.ourapppipeline.id}"
  stage    = "staging"
}
resource "heroku_pipeline_coupling" "development" {
  app      = "${heroku_app.development.name}"
  pipeline = "${heroku_pipeline.ourapppipeline.id}"
  stage    = "development"
}

resource "heroku_pipeline_coupling" "production" {
  app      = "${heroku_app.production.name}"
  pipeline = "${heroku_pipeline.ourapppipeline.id}"
  stage    = "production"
}

# Create a database, and configure the app to use it
resource "heroku_addon" "database_staging" {
  app  = "${heroku_app.staging.name}"
  plan = "heroku-postgresql:hobby-dev"
}

resource "heroku_addon" "database_prod" {
  app  = "${heroku_app.production.name}"
  plan = "heroku-postgresql:hobby-dev"
}
