start:
  go run ./main.go

test:
  cd handler && go test && cd ..

build: test
  rm -rf ./build
  go build

infra:
  terraform apply

publish: build
  heroku push origin master
