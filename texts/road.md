Haskell Road To Logic, Maths and Programming: First Impressions
===============================================================

To start my journey into studying Maths and Haskell I've chosen two resources. Firstly I am going to work through the lectures for MIT's course *Mathematics for Computer Science* which are publically available (and seem to be the most accessible discrete maths introduction online. Secondly, to supplement some more Maths and learning the basics of Haskell I am using [**The Haskell Road to Logic, Maths and Programming - Doets & van Eijck**](https://homepages.cwi.nl/~jve/HR/#Solutions).

I've just worked through the first chapter, which is a kind of getting-to-grips introduction to Haskell syntax and workflow. I found it very informative and well laid out (with only one exception) - it also had me thinking about my time in Scheme.

### First Tasks

The book begins with you implementing some processes that determine the primality of a number, introducing types and guards. First of all I loved the guards syntax, and find it a touch more readable than Scheme's cond statements (and a *hell* of a lot more readable than nested if's).

For comparison:

``` Haskell
Haskell

abs n | n >= 0 =  n
      | n <0   = -n

Scheme

(define (abs x)
  (cond ((< x 0) (- x))
	((>= x 0) 0))))

```

This isn't a huge difference, however cond statements were maybe the thing that most often had me stumbling over parentheses. If that sounds amateur-ish, I should point out now that I am not going to pretend to be good at programming and will point out all of the ameteur-ish problems I have. 

On the topic of my amateur-ness, one of the earliest functions the book has you write checks whether x % y = 0. It says:

```Haskell

divides d n = rem n d == 0

```

I am **awful** for unnecessarily writing things like:

```
if (someFunc x == 0):
	return True
```

And it is a habit I need to get out of. That's the level I am starting from in this blog, so if anyone thought they were reading the musings of some rockstar developer think again.

### Types and Sing-Song Programming

One of the things I most enjoy about writing Scheme is that after working through the MIT SICP course I found myself thinking out loud about what I was writing in a way that helped organize my thoughts between the parentheses. Defining a new function meant running through the jingle "I want to *define* the name *blah* to be the *process* (lambda) that takes an argument *x* and an argument *y* and gives me back ...

This was something new for me when I learned Scheme, perhaps because it was the first language in which I followed along with any serious kind of learning materials and so had heard a teacher work through declarations like that - however I think there is something to be said for this *"and gives me back..."* way of thinking through a function. It keeps your thinking more clear and connected to think "and gives me back the list whose first object is \*some thing\* and whose second object is \*some other thing\* - rather than the imperative style which thinks  "take arguments x and y - do **this** to x and **that** to y - and then return these in a list". Something small, that I just prefer. Maybe you think this is nonsense, if so, tell me.

In Haskell I've got what I like about writing Scheme, plus this extra bit at the start which even more clearly defines my thinking going in. Now, someFunction is "the function that takes an Integer and an Integer and gives back a Boolean in which someFunction x y is the process that gives me back...". This feels very agreeable to me.

### (x:xs) vs car and cdr

Something I was already ok with which I assume is a problem for lots of people coming to Haskell is that we are essentially dealing with tail-recursion all the time. In general terms you are defining processes which say "do this to the first item, and then carry on doing it to the rest".

In Scheme you can grab the first item of a list using (car list), and everything else in the list as (cdr list). I'm not sure whether I prefer the (x:xs) notation yet but I feel like I might well do in the future. To compare the two let's look at another example from The Haskell Road's first chapter, that checks whether a string is the prefix of another string. In Haskell it looks like this:

```Haskell

prefix [] ys         = True
prefix (x:xs) []     = False
prefix (x:xs) (y:ys) = (x==y) && prefix xs ys
```

That last line would look something like this written in Scheme:

```Scheme

prefix xs ys = (and (eq (car x) (car y))
	                (prefix (cdr xs) (cdr ys)))
					
```

If you are used to reading Scheme this isn't difficult to read, but I'd argue the Haskell is easier on the eye for most people. Perhaps moreso once you are cons'ing things.

i.e.

```Haskell

map f (x:xs) = (f x) : (map f xs)

```

vs.

```Scheme

(define map
  (lambda (f xs)
    (cons (f (car xs)) (map f (cdr xs)))))
	
```

### Going Forward

The type system is clearly the newest thing here for someone coming from Scheme, and it is something I'm really interested to get in to. Some naive things I'm interested in is making objects of essentially the same type incompatible with each other, so I can check whether I'm really getting the values I think into functions. For example I use a whole bunch of 2D vectors when working on my generative artwork - and they might hold a Position, Acceleration, Velocity, say. Obviously I don't want to add Accelerations to my Positions, I only want to add Veclocities. All of them would have the type (a, a) though, so could I check that the tuple I have is a Velocity or Acceleration? I hope so, and I'm excited to find out more about how types are used in practice.


