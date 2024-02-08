#!/usr/bin/env python3

"List Noto CJK font file properties"

import argparse
from pathlib import Path

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

def to_size_tuple(file: Path):
    name, suffix = split_with_default(file.name, '.', 1)
    name, weight = split_with_default(name, '-', 1)
    style, pitch, locale = split_style_locale(name)
    return (
        file.name,
        file.stat().st_size,
        style,
        pitch,
        locale,
        weight,
        suffix,
        # file.parent,
    )

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('dir', default=('../noto-cjk',), nargs='*')
    args = parser.parse_args()
    for arg in args.dir:
        dir = Path(arg)
        for file in dir.glob('./**/*.[ot]t[cf]'):
            tuple = to_size_tuple(file)
            tuple = (('' if i is None else i) for i in tuple)
            tuple = (str(i) for i in tuple)
            print('\t'.join(tuple))


if __name__ == "__main__":
    main()
