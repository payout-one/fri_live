# FriLive
Source code for online presentation Online Talks FRI UNIZA October 2020 


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Commands
```bash
mix phx.new fri_live --live --no-ecto
cd fri_live
npm install --save --prefix assets mdn-polyfills url-search-params-polyfill formdata-polyfill child-replace-with-polyfill classlist-polyfill @webcomponents/template shim-keyboard-event-key core-js
iex -S mix phx.server
```
