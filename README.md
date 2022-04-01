# AIPoS backend APIs
This is the backend APIs for a point of sale application build by react.
The front is deployed [here]: https://github.com/njmwasmoringa/aipos-with-backend-api 

The application has sample a single user - Administrator - and sample products populated by in seeds.rb

## How it works
At first you need to populate sample data by running
```
bundle exec rake db:seed
```
after the data has been populated

- Run the server using
```
bundle exec rake server
```
- Then access the API through http://localhost:9292

