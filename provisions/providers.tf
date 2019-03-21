provider "github" {
    token ="${var.github_api_key}"
    organization ="${var.github_organization}"
}

provider "heroku" {
  email   = "${var.heroku_email}"
  api_key = "${var.heroku_api_key}"
}

