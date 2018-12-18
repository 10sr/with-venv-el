with-venv-el
============

Execute with Python virtual environment enabled


Usage
-----


Execute body inside of Python virtual environment with `with-venv-dir`:

``` emacs-lisp
(with-venv-dir (expand-file-name ".venv" default-directory)
    (executable-find "python"))
```


Alternatively, make library try to find venv dir automatically with `with-venv`:

``` emacs-lisp
(with-venv
    (executable-find "python"))
```


This macro uses `with-venv-find-venv-dir` to find suitable venv dir:
this function currently support `pipenv`, `poetry`, and any directory
named `.venv`.
Or, you can set buffer-local vairable `with-venv-venv-dir` to explicitly
specify which venv directory to use.


If you always enable `with-venv` for certain function, you can use
`with-venv-advice-add`:

``` emacs-lisp
(with-venv-advice-add 'blacken-buffer)
```

Adviced functions are always wrapped with `with-venv` macro when called.

To remove advices added with `with-venv-advice-add`, you can use
`with-venv-advice-remove`.


License
-------

This software is licensed under Apache License 2.0 . See `LICENSE` for details.
