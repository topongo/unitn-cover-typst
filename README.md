# Unofficial UniTN typst cover
Tired of using Latex? Try [typst](https://typst.app)! (if you hate staring at overleaf recompiling you _Will Just Love It®_)

Here you go, a very very simple module to generate an almost perfect UniTN thesis latex template cover.

## Preview

<p align="center">
  <img src="/example.svg" width=60%>
</p>

## Usage
```typ
#import "unitn_cover.typ": unitn_cover

#unitn_cover(
  "<department name>",
  "<degree name>",
  "<thesis title>",
  "<supervisor(s) name(s)", // accepts string, content or array
  "<student(s) name(s)", // accepts string, content or array
  examination_day: "",
  academic_year: 2025
)
```

You can include more than one supervisor and/or more than one student:
```typ
#unitn_cover(
  // ...
  ("Albus Dumbledore", "Severus Snape"),
  (
    ("Harry Potter", 54891),
    ("Perry Hotter", 84932),
  ),
  // ...
)
```

To include the student code (matricola) just pass a list of tuples to the function like so:
```typ
#unitn_cover(
  // ...
  (
    ("Jane Doe", 123456),
    ("John Souls", 654321),
  ),
  // ...
)
```
