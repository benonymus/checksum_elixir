# TestChecksum

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

The following endpoints are available:

- /api/add - POST
  It expects a list of numbers as json such as:
  {
  "numbers": [
  5,
  4,
  8,
  9,
  8,
  5,
  0,
  3,
  5,
  4
  ]
  }

- /api/clear - POST
  Clears the current set of numbers

- /api/checksum - GET
  Returns the calculated checksum

- /api/checksum/:timeout - get
  Just to make it easy to test the timeout for bonus points, you can pass a timeout amount which if is more than 15 then you will get a timeout error response.

  If you use Postman here is my collection for this api that you can import into Postman:
  https://www.getpostman.com/collections/2cee9c9eb4984cefa604
