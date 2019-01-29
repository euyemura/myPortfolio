## Null Object Pattern

A concept that protects us from errors. A perfect example would be current user, if there's a current_user then we can call its information and display it.  However, if someone is coming to our page and not logged in, then we must write some work arounds to make sure there is no error thrown, because it can't retrieve the `current_user` if there is no `current_user`.

Whenever a user goes to a site, whether they are logged in or out, we can give custom behavior that is error proof, and not being handled by the view with some if else statements.

The way we greeted users from our home page before hand was an insecure way to do it, greet them if there is a current user.

```ruby
<h1>Hi <%= ", #{current_user.first_name}" if current_user%></h1>
```

This is a defensive way to code, because we have to defend against someone not being logged in.  See above with the conditional.  

Now we move into the `application_controller.rb`...


The reason we start there, and probably won't end there is because any method put in there will definitely be inherited by all other controllers, you don't necessarily start with putting it in a concern because it leaves more room for errors, take one step, make sure it works, then move onto best practices.

We're going to override the `current_user` method.

```ruby
def current_user
  super
end
```

`super` says, don't change anything, I want everything as it was from the parent method this is going to change, or override.  except for the stuff that you are overriding of course.

```ruby
false || true
#return true
false || false
#return false
false && true
#returns false
```

You can treat super like a conditional. We want our current_user to act like that first conditional, where it's an or statement where one is always true.  

```ruby
def current_user
  super ||
end
```

To get the next part we will be using a tool in ruby called Open struct.

`require 'ostruct'`

OpenStruct basically allows you to create a mini data object that mimics a real user in your database, so in pry.

```ruby
guest = OpenStruct.new(name: "eric uyemura", email: "ea@gmail.com")

guest.name
guest.email
```

SO this is pretty interesting, it's coming full circle now.

```ruby
def current_user
  super || OpenStruct.new(name: "Guest User", first_name: "Guest", last_name: "User", email: "guest@example.com")
end
```

This basically means that well, if super is true and there is a current user, it'll return that value, and if not, then it'll return this OpenStruct user.  

This allows us to remove defensive code and we now have

```ruby
<h1>Hi, <%= current_user.first_name%></h1>
```
But we come up with another issue, in our `application_controller.rb` it shows that our user is always logged in because its either returning super or its returning our OpenStruct

So what we have to ask ourselves, is what differentiates a devise current user from our openstruct user.

When you create an OpenStruct.new, it'll have a class of openstruct, so you can do one of two things.

```ruby
user.class
=>OpenStruct
or
user.is_a?(OpenStruct)
=> true
```
However, the class of current_user is actually just `User` which is part of our model. so you can use that to differentiate the output from the redefined current_user function.  You can either say

```
if current_user.class == User
# remember that User is not a string, so no quotations, it is a class, and classes aren't strings.
if current_user.is_a?(User)
```

Finally, we move all of this into a new concern, since we know it works in the application controller it's time to respect best practices.

```ruby
module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :current_user
  end

  def current_user
    super || OpenStruct.new(name: "Guest User", first_name: "Guest", last_name: "User", email: "guest@example.com")
  end
end
```
