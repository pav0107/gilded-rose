# Gilded rose tech test

This test was given on week 10 of Makers. The main task is to refactor highly nested code. Below are the specifications.

## Gilded Rose Requirements Specification

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city ran by a friendly innkeeper named Allison. We also buy and sell only the finest goods.

Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named
Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

    - All items have a SellIn value which denotes the number of days we have to sell the item
    - All items have a Quality value which denotes how valuable the item is
    - At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

    - Once the sell by date has passed, Quality degrades twice as fast
    - The Quality of an item is never negative
    - "Aged Brie" actually increases in Quality the older it gets
    - The Quality of an item is never more than 50
    - "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
    - "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches;
    Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
    Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

    - "Conjured" items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn't believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we'll cover
for you).

Just for clarification, an item can never have its Quality increase above 50, however "Sulfuras" is a legendary item and as such its Quality is 80 and it never alters.

## My approach

- Before refactoring the class or updating it to cater for "conjured" items, I first set up tests for all the conditions laid out in the specification above and made sure they all passed.
- The next step was to decide what to do first: refactor or cater for "conjured" items. I decided it was best to refactor first.
- I pulled out a method first for a normal item, then Brie, then Backstage.
- I then wrote tests for Conjured and used a similar method to the others.
- Next, instead of having separate methods within Gilded Rose class, I created separate classes for normal, Brie, Backstage and Sulfuras and moved those methods inside them. Within the Gilded Rose class I now create an instance of the relevant class and call the method on them.
- I also moved the new classes into their own files.

## Further work to do

- By creating new classes, my Guilded Rose spec is now more of a feature test, and I need to do unit tests on the individual classes.

## Running tests

First clone the repo onto your local machine:

```
git clone https://github.com/pav0107/gilded-rose.git
```

Next, install the required gems:

```
bundle install
```

If you get a message about your bundler, please update:

```
gem install bundler
bundle install
```

```
rspec
```

### Checking test coverage

100% test coverage

```
open coverage/index.html
```

### Running the linter

```
rubocop
```
