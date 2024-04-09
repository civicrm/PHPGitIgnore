# PHP Git Ignore

This is a maintenance fork of https://github.com/TOGoS/PHPGitIgnore to
provide compatibility with newer versions of PHP.

## Testing

The `Makefile` defines targets for building and testing. If you have GNU Make and PHP, then just run:

```bash
make
```

If you don't have GNU Make and PHP, then you can use `nix-shell`, eg

```bash
nix-shell --run make
```
