vcl 4.0;

import directors;

probe basic {
  .url = "/";
  .timeout = 1s;
  .interval = 10s;
  .window = 5;
  .threshold = 3;
}

backend tile1 {
  .host = "tile1";
  .port = "8080";
  .probe = basic;
}

backend tile2 {
  .host = "tile2";
  .port = "8080";
  .probe = basic;
}

backend tile3 {
  .host = "tile3";
  .port = "8080";
  .probe = basic;
}

backend tile4 {
  .host = "tile4";
  .port = "8080";
  .probe = basic;
}

backend tile5 {
  .host = "tile5";
  .port = "8080";
  .probe = basic;
}

backend tile6 {
  .host = "tile6";
  .port = "8080";
  .probe = basic;
}

backend tile7 {
  .host = "tile7";
  .port = "8080";
  .probe = basic;
}

backend tile8 {
  .host = "tile8";
  .port = "8080";
  .probe = basic;
}

backend tile9 {
  .host = "tile9";
  .port = "8080";
  .probe = basic;
}

backend tile10 {
  .host = "tile10";
  .port = "8080";
  .probe = basic;
}

sub vcl_init {
  new bar = directors.round_robin();
  bar.add_backend(tile1);
  bar.add_backend(tile2);
  bar.add_backend(tile3);
  bar.add_backend(tile4);
  bar.add_backend(tile5);
  bar.add_backend(tile6);
  bar.add_backend(tile7);
  bar.add_backend(tile8);
  bar.add_backend(tile9);
  bar.add_backend(tile10);
}

sub vcl_recv {
  # send all traffic to the bar director:
  set req.backend_hint = bar.backend();
  return (hash);
}

sub vcl_deliver {
  return (deliver);
}

sub vcl_backend_response {
  set beresp.ttl = 2h;
}
