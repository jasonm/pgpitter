Pgpitter
========

Proof of concept: never sign in, instead sign text.

A Twitter-like app that uses PGP keys. API only for now.

_Create a new status_. This takes JSON where the content is a piece of
text that is signed using a PGP key.

    POST /statuses
    { status: { signed_body: PGP-signed-ASCII } }

    =>

    201

_View updates_. This shows all statuses for the people who have signed
your PGP key. Produces a JSON result.

    GET /followers/:keyid/statuses

    =>

    200
    { keyid: KEYID,
      page: 1,
      per_page: 50,
      signers_statuses: [
        { keyid: KEYID1, signed_body: PGP-signed-ASCII1, created_at: DATE },
        { keyid: KEYID2, signed_body: PGP-signed-ASCII2, created_at: DATE },
        { keyid: KEYID1, signed_body: PGP-signed-ASCII3, created_at: DATE },
        { keyid: KEYID3, signed_body: PGP-signed-ASCII4, created_at: DATE }
    ] }

_View a status_. Takes a status ID. This is mostly here just for sharing
URLs with others.

    GET /statuses/:id

Getting Started
---------------

This repository comes equipped with a self-setup script.

    % ./bin/setup

After setting up, you can run the application using [foreman]:

    % foreman start

[foreman]: http://ddollar.github.io/foreman/

Guidelines
----------

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)
