


---
markdown:
  path: markdown_output.md
  image_dir: /images
---
# Markdown Preview Enhanced
markdown compilation test, modified from [remarkable demo](https://jonschlinkert.github.io/remarkable/demo/).

> Experience real-time editing with Markdown Preview Enhanced!

***

# h1 Heading
## h2 Heading
### h3 Heading
#### h4 Heading
##### h5 Heading
###### h6 Heading


## Horizontal Rules

___

***

***

## Math

$$
  f(x) = \int_{-\infty}^\infty
    \hat f(\xi)\,e^{2 \pi i \xi x}
    \,d\xi
$$

$
\left( \begin{array}{ccc}
a & b & c \\
d & e & f \\
g & h & i \end{array} \right)$
is given by the formula
$$ \chi(\lambda) = \left| \begin{array}{ccc}
\lambda - a & -b & -c \\
-d & \lambda - e & -f \\
-g & -h & \lambda - i \end{array} \right|
$$

## Graphs
```@mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
		D-->A
```

```@mermaid
sequenceDiagram
    participant Alice
    participant Bob
    Alice->John: Hello John, how are you?
    loop Healthcheck
        John->John: Fight against hypochondria
    end
    Note right of John: Rational thoughts <br/>prevail...
    John-->Alice: Great!
    John->Bob: How about you?
    Bob-->John: Jolly good!
```

```@puml
class A {
  + init();
}
```


**Note: some of the following Code Chunks require external linux programs which can be installed with the following commands**

`sudo apt-get install graphviz`
which installs /usr/bin/dot

`sudo apt-get install graphviz-doc`
not necessary to run, but helpful for later consulting man pages

`sudo apt-get install gnuplot`

`sudo apt-get install python-matplotlib`

```
sudo apt-get install haskell-platform
sudo cabal update
sudo cabal install erd
# erd-0.1.3.0 requires base=4.7.*
sudo cabal install --allow-newer erd
```
```
sudo cp ~/.cabal/bin/erd /usr/local/bin/
```
where ~/ was /home/mjackson
if you dont perform the `sudo cp ~/.cabal/bin/erd /usr/local/bin/`
you will have to include `{erd cmd:"/home/mjackson/.cabal/bin/erd",` instead of just `{erd }`



## Code Chunks

### Commands & Keyboard Shortcust
* `Markdown Preview Enhanced: Run Code Chunk` or <kbd>shift-enter</kbd>      
execute single code chunk where your cursor is at. (inside the code chunk)   

* `Markdown Preview Enhanced: Run All Code Chunks` or <kbd>ctrl-shift-enter</kbd>   
execute all code chunks.

### bash shell
```{bash id:"j0seq8rj"}
echo "This is Cool~~"
ls ./
```

### gnuplot
```{gnuplot output:"html", hide:true, id:"iurp4ovh"}
set term svg
set title
set key outside
set title "plot with filledcurve [options]"
plot [-10:10] [-5:3] \
	1.5+sin(x)/x with filledcurve x2, \
	sin(x)/x with filledcurve, \
	1+sin(x)/x with lines, \
	-1+sin(x)/x with filledcurve y1=-2, \
	-2.5+sin(x)/x with filledcurve xy=-5,-4., \
	-4.3+sin(x)/x with filledcurve x1, \
	(x>3.5 ? x/3-3 : 1/0) with filledcurve y2
```

### gnuplot
```{gnuplot output:"html", hide:true, id:"itgtulrs"}
#output svg
set term svg

set xlabel "x"
set xlabel "y"
set key top
set border 4095
set xrange [-15:15]
set yrange [-15:15]
set zrange [-0.25:1]

set samples 25
set isosamples 20
set title "pm3d demo. Radial sinc function. Default options."
set pm3d; set palette
#show pm3d#show palette
splot sin(sqrt(x**2+y**2))/sqrt(x**2+y**2)

```

### erd
```{erd hide:true, output:"html", args:["-i", "{input_file}", "-f", "svg"], id:"ithhv4z4"}

[Person]
*name
height
weight
+birth_location_id

[Location]
*id
city
state
country

Person *--1 Location
```

### erd
```{erd hide:true, output:"html", args:["-i", "{input_file}", "-f", "svg"], id:"second-erd"}

title {label: "Entity-Relationship diagram (condensed)", size: "20"}

# Nice colors from Erwiz:
# red #fcecec
# blue #ececfc
# green #d0e0d0
# yellow #fbfbdb
# orange #eee0a0

# Entities

[player] {bgcolor: "#d0e0d0"}
  *player_id
  full_name
  team
  position
  status

[team] {bgcolor: "#d0e0d0"}
  *team_id
  city
  name

[game] {bgcolor: "#ececfc"}
  *gsis_id
  start_time
  week
  season_year
  season_type
  finished
  home_team
  home_score
  away_team
  away_score

[drive] {bgcolor: "#ececfc"}
  *+gsis_id
  *drive_id
  start_field
  start_time
  end_field
  end_time
  pos_team
  pos_time

[play] {bgcolor: "#ececfc"}
  *+gsis_id
  *+drive_id
  *play_id
  time
  pos_team
  yardline
  down
  yards_to_go

[play_player] {bgcolor: "#ececfc"}
  *+gsis_id
  *+drive_id
  *+play_id
  *+player_id
  team

[meta] {bgcolor: "#fcecec"}
  version
  season_type
  season_year
  week

# Relationships

player      *--1 team
game        *--1 team {label: "home"}
game        *--1 team {label: "away"}
drive       *--1 team
play        *--1 team
play_player *--1 team

game        1--* drive
game        1--* play
game        1--* play_player

drive       1--* play
drive       1--* play_player

play        1--* play_player

player      1--* play_player

```

### python
```{python hide:true, matplotlib:true, output:"html", id:"izc8i56g"}
import matplotlib
import matplotlib.pyplot as plt
import numpy as np

from mpl_toolkits.mplot3d import Axes3D
def randrange(n, vmin, vmax):
    '''
    Helper function to make an array of random numbers having shape (n, )
    with each number distributed Uniform(vmin, vmax).
    '''
    return (vmax - vmin)*np.random.rand(n) + vmin

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

n = 100

# For each set of style and range settings, plot n random points in the box
# defined by x in [23, 32], y in [0, 100], z in [zlow, zhigh].
for c, m, zlow, zhigh in [('r', 'o', -50, -25), ('b', '^', -30, -5)]:
    xs = randrange(n, 23, 32)
    ys = randrange(n, 0, 100)
    zs = randrange(n, zlow, zhigh)
    ax.scatter(xs, ys, zs, c=c, marker=m)

ax.set_xlabel('X Label')
ax.set_ylabel('Y Label')
ax.set_zlabel('Z Label')

plt.show()
```


## Typographic replacements

Enable typographer option to see result.

(c) (C) (r) (R) (tm) (TM) (p) (P) +-

test.. test... test..... test?..... test!....

!!!!!! ???? ,,

Remarkable -- awesome

"Smartypants, double quotes"

'Smartypants, single quotes'


## Emphasis

**This is bold text**

__This is bold text__

*This is italic text*

_This is italic text_

~~Deleted text~~

Superscript: 19^th^

Subscript: H~2~O

++Inserted text++

==Marked text==


## Blockquotes

> Blockquotes can also be nested...
>> ...by using additional greater-than signs right next to each other...
> > > ...or with spaces between arrows.


## Lists

Unordered

+ Create a list by starting a line with `+`, `-`, or `*`
+ Sub-lists are made by indenting 2 spaces:
  - Marker character change forces new list start:
    * Ac tristique libero volutpat at
    + Facilisis in pretium nisl aliquet
    - Nulla volutpat aliquam velit
+ Very easy!

Ordered

1. Lorem ipsum dolor sit amet
2. Consectetur adipiscing elit
3. Integer molestie lorem at massa


1. You can use sequential numbers...
1. ...or keep all the numbers as `1.`

Start numbering with offset:

57. foo
1. bar


## Code

Inline `code`

Indented code

    // Some comments
    line 1 of code
    line 2 of code
    line 3 of code


Block code "fences"

```
Sample text here...
```

Syntax highlighting

``` js
var foo = function (bar) {
  return bar++;
};

console.log(foo(5));
```

## Tables

| Option | Description |
| ------ | ----------- |
| data   | path to data files to supply the data that will be passed into templates. |
| engine | engine to be used for processing templates. Handlebars is the default. |
| ext    | extension to be used for dest files. |

Right aligned columns

| Option | Description |
| ------:| -----------:|
| data   | path to data files to supply the data that will be passed into templates. |
| engine | engine to be used for processing templates. Handlebars is the default. |
| ext    | extension to be used for dest files. |


## Links

[link text](http://dev.nodeca.com)

[link with title](http://nodeca.github.io/pica/demo/ "title text!")

Autoconverted link https://github.com/nodeca/pica (enable linkify to see)


## Images

![Minion](https://octodex.github.com/images/minion.png)
![Stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg "The Stormtroopocat")

Like links, Images also have a footnote style syntax

![Alt text][id]

With a reference later in the document defining the URL location:

[id]: https://octodex.github.com/images/dojocat.jpg  "The Dojocat"


## Footnotes

Footnote 1 link[^first].

Footnote 2 link[^second].

Inline footnote^[Text of inline footnote] definition.

Duplicated footnote reference[^second].

[^first]: Footnote **can have markup**

    and multiple paragraphs.

[^second]: Footnote text.


## Definition lists

Term 1

:   Definition 1
with lazy continuation.

Term 2 with *inline markup*

:   Definition 2

        { some code, part of Definition 2 }

    Third paragraph of definition 2.

_Compact style:_

Term 1
  ~ Definition 1

Term 2
  ~ Definition 2a
  ~ Definition 2b


## Abbreviations

This is HTML abbreviation example.

It converts "HTML", but keep intact partial entries like "xxxHTMLyyy" and so on.

*[HTML]: Hyper Text Markup Language


***

__Advertisement :)__

- __[pica](https://nodeca.github.io/pica/demo/)__ - high quality and fast image
  resize in browser.
- __[babelfish](https://github.com/nodeca/babelfish/)__ - developer friendly
  i18n with plurals support and easy syntax.

You'll like those projects! :)
