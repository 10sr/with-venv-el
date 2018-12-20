[![Build Status](https://travis-ci.org/10sr/with-venv-el.svg?branch=master)](https://travis-ci.org/10sr/with-venv-el)


with-venv.el
============

Execute with Python virtual environment activated


Usage
-----


Execute BODY with Python virtual environment activated with `with-venv-dir` macro:

``` emacs-lisp
(with-venv-dir (expand-file-name ".venv" default-directory)
    (executable-find "python"))
```


Alternatively, make this package try to find venv directory automatically
with `with-venv`:

``` emacs-lisp
(with-venv
    (executable-find "python"))
```


This macro uses `with-venv-find-venv-dir` to find suitable venv directory:
this function currently support `pipenv`, `poetry`, and can find directories
named `.venv`.
Or, you can set buffer-local vairable `with-venv-venv-dir` to explicitly
specify which venv directory to use.


If you want to always enable `with-venv` for certain functions, you can use
`with-venv-advice-add`:

``` emacs-lisp
(with-venv-advice-add 'blacken-buffer)
```

Adviced functions are always wrapped with `with-venv` macro when called.

To remove these advices, you can use `with-venv-advice-remove`.


License
-------

This software is licensed under Apache License 2.0 . See `LICENSE` for details.

