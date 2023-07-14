# Procedures

This file contains instructions on how to publish a post properly. This is an
entirely static site, which means that there isn't any automated system that
will make shore everyfin is linked together and we have to do it manually.

## Making A New Post

Make a copy of the file `post.html` in the `templates` folder. Name the copy
`YEAR-MONTH-DAY_HOUR-MINUTE-SECOND.html`. Replace each of those capital letter
parts with the actual year, month, day, hour, minute, and second of the post,
in UTC time. Use the [UTC Time](https://www.utctime.net) website to tell you the
current UTC time if you aren't shore, okay?

Place the copied file in `docs/posts/`. Inside it, replace `POST-NAME` with the
name of the post, `CLOCK` with what the clock says in the room you're in (and
the (AM/PM) with either AM or PM, depending on what the clock says), and the
UTC-TIME part with the RFC 3339 time string listed on the UTC Time website above
under "RFC 3339" in the Date Time Format table you see when you scroll down on
it.

Replace the AUTHOR text with your actual member name, or Bellatrix Hadar if you
are writing for the entire system. The AUTHOR-PAGE part right before it has to
be set to the correct author page that matches who is writing. Check in
`docs/archives/authors` to see the list of authors who already have a page and
choose the correct one to put as AUTHOR-PAGE. If the correct one does not exist,
make up a new name for the author page and we'll fix it later, in the form of
'your-name.html'. The link won't work at first, but we can always fix it later.

At the bottom of the post area, where it says "YOUR-NAME" right after the part
that says `<p class="signing">` in it, replace YOUR-NAME with your actual name.
You should put your actual name even if you are writing for all of ThickAether.

In the tags section below the post, put all applicable tags and link to their
tag page. Look in `docs/archives/tags/` to see a list of existing tags, but it's
okay to make a new one. Just let someone know so we can fix the link later. The
ones already there are completely fake, so just put your tags in the same format
but completely remove all of the stuff between `<ul>` and `</ul>` except the
ones you added.

Now you're ready to start writing your post. Replace `WRITE THE POST HERE IN
HTML` with your actual post.

### Hyperlinking

Okay, now that that's done, be shore to link to the new post in the post archive
in `docs/archive/index.html`, in each of the tag pages, and in the author page.

Finally, take the first 100 words and add a new post to top of the front page
with a link to the full post. Remove the last post if there are more than 10.

### Publishing

First, open up index.html locally in a web browser and test out the new post and
any links you have modified. Make shore they work!

Then, in the terminal, do `git add .`. Then do `git commit -m 'added new post'`.
Do `git push`, then do `git checkout main`, then `git merge wip`, and another
`git push`. This will publish the changes to [headmate.party](https://headmate.party).
Do `git checkout wip` to get back to the normal editing branch mode.
