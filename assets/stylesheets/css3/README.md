CSS3 Mixins
===========

These mixins take care of vendor prefixes and in some cases differences in syntax.

Use them as descibed in specifications only as mixin syntax, i.e. `@include tranform(rotate(45deg))` instead of `transform: rotate(45deg)`.

Usage
-----

### animation & keyframes

CSS3 animations a quite well supported. Many browsers have been supporting it for a while now and IE10 has also added support, so there is no reason to not use it. As long as it not an integral part of user interaction or has now reasonable fallback.

**Usage**

Define the animation sequence through `keyframes(name)` mixin:

```scss
@include keyframes(reveal) {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}
```

Then apply that animation on an element with `animation(name)` mixin:

```scss
.notice {
  @include animation(reveal 1.2s ease-in);
}
```

`animation` is a shorthand for `animation-name`, `animation-duration`, `animation-timing-function`, `animation-delay`, `animation-iteration-count` and `animation-direction`. Each of which can be also used separately as a mixin, e.g. `@include animation-duration(200ms)`.

The order is important and as follows:

*single-animation-name* || *duration-time* || *timing-function* || *delay-time* || *animation-iteration-count* || *animation-direction* || *animation-fill-mode*

Individual properties of single animation are separated by space and multiple animations can be defined separated by comma.

```scss
@include animation(reveal 3s, bounce 1s 3s infinite)
```

Plays "reveal" animation for 3 seconds, and then 1 second "bounce" animation, delayed by 3 seconds and played infinitely.


### border-radius

Border radius is well supported in modern browsers and in fact does not need a mixin for most use cases. To use two radii value (i.e. 10px/20px) the value should be wrapped in quotes, otherwise Sass will try to calculate the values before passing as one.

```scss
@include border-radius("10px/20px")
```

This mixin also takes second parameter `clip`. If specified will clip the background around padding area. Which is useful when border colour with opacity needs to not mix with background colour.

```scss
@include border-radius(10px, clip)
```


### box-sizing

Used to apply alternative CSS box model on element. `border-box` calculates dimensions inwards from it's border edge when padding and border size are applied. In contrast, default `content-box` 200px box will grow outwards if padding/border-size are added. There is also an experimental `padding-box` which includes padding but excludes border when calculating box dimensions.

Margins are always added outside of the box.

```scss
@include box-sizing(border-box)
```

### calc

Experimental CSS3 function which allows to calculate the size or shape of objects. It can be used to calculate dimensions with mixed units. Expression can contain `+`, `-`, `/`, `*` operators.

Mixin takes three arguments: `property`, `expression` and optional `fallback` value.

The first two are fed into `calc()` function and the third is used to fall back for browsers that don't support it. The expression has to be wrapped in quotes to prevent Sass from processing it.

Usage:

```scss
@include calc(width, "100% - 40px", 90%)
```


### columns

Shorthand mixin for `column-width` and `column-count` mixin which have the same syntax as CSS3 columns property.

Additionally there are the following mixins (all map to their standard CSS3 syntax):

 - `column-fill`
 - `column-gap`
 - `column-rule` (`border`-like shorthand syntax)
 - `column-rule-width`
 - `column-rule-style` 
 - `column-rule-color`
 - `column-span` span a number of columns. `all` to span all columns (Not supported in Firefox)
 
There are also the following column-break mixing, not supported in IE or Firefox:
 - `break-before`
 - `break-after`
 
Usage:

```scss
@include columns(3);
@include column-gap(40px);
@include column-rule(1px solid #ddd);
```

### flex

### transform

### transition

### user-select


