# Guidelines

We are in the process of verifying the reproducibility of notebooks with [`nbval`](https://nbval.readthedocs.io/en/stable/).


## New notebooks

All new notebooks must pass when tested with `pytest --nbval`.


## Existing notebooks

Eventually all notebooks should be converted to pass with `pytest --nbval`.
Currently some are untested, and some only pass with `pytest --nbval-lax`.

If significant changes are made to an existing notebook the notebook should be converted to pass `pytest --nbval`.
Other notebooks should be converted where possible.
