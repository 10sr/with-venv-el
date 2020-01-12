[![Build Status](https://travis-ci.org/10sr/with-venv-el.svg?branch=master)](https://travis-ci.org/10sr/with-venv-el)
[![MELPA](https://melpa.org/packages/with-venv-badge.svg)](https://melpa.org/#/with-venv)
[![MELPA Stable](https://stable.melpa.org/packages/with-venv-badge.svg)](https://stable.melpa.org/#/with-venv)


with-venv.el
============

Execute with Python virtual environment activated


Usage
-----


`with-venv` macro executes BODY with Python virtual environment activated:

``` emacs-lisp
(with-venv
  (executable-find "python"))
```

This macro uses `with-venv-find-venv-dir-functions` to find suitable venv
directory: by default it supports `pipenv`, `poetry`, and directories named
`".venv"` and `"venv"`.

The automatic search result will be cached as a buffer-local variable, so
`with-venv` try to find venv dir only at the first time it is used after
visiting file.
To explicitly update this cache (without re-visiting file) after you created
a virtual environment newly, run `M-x with-venv-find-venv-dir` manually.

You can also set buffer-local vairable `with-venv-venv-dir` explicitly
to specify venv directory for `with-venv` macro.
In this case, the automatic search will be totally disabled for that buffer.


If you want to always enable `with-venv` for certain functions,
`with-venv-advice-add` can be used for this purpose:

``` emacs-lisp
(with-venv-advice-add 'blacken-buffer)
```

Adviced functions are always wrapped with `with-venv` macro when called.

Call `with-venv-advice-remove` to remove these advices.


License
-------

This software is licensed under Apache License 2.0 . See `LICENSE` for details.

