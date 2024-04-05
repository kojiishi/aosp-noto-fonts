#!/usr/bin/env python3

"List Noto CJK font file properties"

import argparse
from pathlib import Path
import re

def split_with_default(input: str, separator: str, max: int):
    result = input.split(separator, max)
    if len(result) <= max:
        result.append(None)
    return result

def split_prefix(name: str, prefix: str):
    if name.startswith(prefix):
        return (prefix, name[len(prefix):])
    return (None, name)

def split_style_locale(name: str):
    if not name.startswith('Noto'):
        return (None, None, None)
    name = name[4:]
    for prefix in ('Sans', 'Serif'):
        style, name = split_prefix(name, prefix)
        if style:
            break
    pitch, locale = split_prefix(name, 'Mono')
    return (style, pitch, locale)

class FontStat(object):

    def __init__(self, path: Path) -> None:
        self.path = path
        name, self.suffix = split_with_default(path.name, '.', 1)
        name, self.weight = split_with_default(name, '-', 1)
        variables = re.search(r'\[[^]]+\]$', name)
        if variables:
            self.weight = variables.group(0)
            name = name[0:-len(self.weight)]
        self.style, self.pitch, self.locale = split_style_locale(name)

    def to_tuple(self):
        return (
            self.path.name,
            self.path.stat().st_size,
            self.style,
            self.pitch,
            self.locale,
            self.weight,
            self.suffix,
            # self.path.parent,
        )

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('dir', default=('../noto-cjk',), nargs='*')
    args = parser.parse_args()
    for arg in args.dir:
        dir = Path(arg)
        for path in dir.glob('./**/*.[ot]t[cf]'):
            tuple = FontStat(path).to_tuple()
            tuple = (('' if i is None else i) for i in tuple)
            tuple = (str(i) for i in tuple)
            print('\t'.join(tuple))


if __name__ == "__main__":
    main()
