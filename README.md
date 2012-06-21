# WiFriend API

**A RESTful API implementation in Rails.**

## Overview
This is a demonstration of design patterns and architectural decisions for one approach of implementing a RESTful API in Rails.

## Discussion
This is an unfinished project that I'm publishing at the request of colleagues to see how I'm designing a RESTful API for my side iOS projects. Over time, I intend this repo to morph into a fully complete, open-source backend for my iOS app, WiFriend (which will also be open-source).

I settled on [Rabl](http://github.com/nesquena/rabl) for JSON templating and [Koala](http://github.com/arsduo/koala) for Facebook Graph API interactions.

To version the API, I created a namespace for the Api and then a version-specific namespace, inside of that (i.e. `Api::V1::FooController`).

The URI design of the API was designed as: `http://api.domain.com/v1/endpoint`

To handle various exceptions consistently across endpoints, I created a `BaseController` that all controllers inherit from. This controller implements `rescue_from` and handles both general and Facebook-specific exceptions (i.e. [`OAuthException`](http://developers.facebook.com/docs/authentication/access-token-expiration/)) and dispatches error responses.

My error response behavior is responding with an appropriate HTTP status code (so networking frameworks can observe and handle errors with failure-specific behavior, accordingly). I also return a JSON object with the HTTP status code and a descriptive error message.

## Created By
Josh Avant

## License
This is licensed under a MIT/Beerware License:

    Copyright (c) 2012 Josh Avant

    Permission is hereby granted, free of charge, to any person obtaining a
    copy of this software and associated documentation files (the "Software"),
    to deal in the Software without restriction, including without limitation
    the rights to use, copy, modify, merge, publish, distribute, sublicense,
    and/or sell copies of the Software, and to permit persons to whom the
    Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
    FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
    DEALINGS IN THE SOFTWARE.

    If we meet some day, and you think this stuff is worth it, you can buy me a
    beer in return.