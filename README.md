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
## Run the tests with specific PHP
nix-shell -A php82 --run make

## Run the tests with multiple versions of PHP
nix-shell -A php74 --run 'make clean run-unit-tests'
nix-shell -A php81 --run 'make clean run-unit-tests'
nix-shell -A php82 --run 'make clean run-unit-tests'
nix-shell -A php83 --run 'make clean run-unit-tests'
## (Each phpXX should be listed in shell.nix)
```
