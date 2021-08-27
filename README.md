![image](imgs/tablemodel.png)

<p align="center">
    <em>This is a fork from SQLModel, SQL databases in Python, designed for simplicity, compatibility, and robustness.</em>
</p>
<p align="center">
<a href="https://github.com/tiangolo/sqlmodel/actions?query=workflow%3ATest" target="_blank">
    <img src="https://github.com/tiangolo/sqlmodel/workflows/Test/badge.svg" alt="Test">
</a>
<a href="https://github.com/tiangolo/sqlmodel/actions?query=workflow%3APublish" target="_blank">
    <img src="https://github.com/tiangolo/sqlmodel/workflows/Publish/badge.svg" alt="Publish">
</a>
<a href="https://codecov.io/gh/tiangolo/sqlmodel" target="_blank">
    <img src="https://img.shields.io/codecov/c/github/tiangolo/sqlmodel?color=%2334D058" alt="Coverage">
</a>
<a href="https://pypi.org/project/sqlmodel" target="_blank">
    <img src="https://img.shields.io/pypi/v/sqlmodel?color=%2334D058&label=pypi%20package" alt="Package version">
</a>
</p>

---

**Documentation**: <a href="https://sqlmodel.tiangolo.com" target="_blank">https://sqlmodel.tiangolo.com</a>

**Source Code**: <a href="https://github.com/tiangolo/sqlmodel" target="_blank">https://github.com/tiangolo/sqlmodel</a>

---

SQLModel is a library for interacting with <abbr title='Also called "Relational databases"'>SQL databases</abbr> from Python code, with Python objects. It is designed to be intuitive, easy to use, highly compatible, and robust.

**SQLModel** is based on Python type annotations, and powered by <a href="https://pydantic-docs.helpmanual.io/" class="external-link" target="_blank">Pydantic</a> and <a href="https://sqlalchemy.org/" class="external-link" target="_blank">SQLAlchemy</a>.

The key features are:

* **Intuitive to write**: Great editor support. <abbr title="also known as auto-complete, autocompletion, IntelliSense">Completion</abbr> everywhere. Less time debugging. Designed to be easy to use and learn. Less time reading docs.
* **Easy to use**: It has sensible defaults and does a lot of work underneath to simplify the code you write.
* **Compatible**: It is designed to be compatible with **FastAPI**, Pydantic, and SQLAlchemy.
* **Extensible**: You have all the power of SQLAlchemy and Pydantic underneath.
* **Short**: Minimize code duplication. A single type annotation does a lot of work. No need to duplicate models in SQLAlchemy and Pydantic.

## SQL Databases in FastAPI

<a href="https://fastapi.tiangolo.com" target="_blank"><img src="https://fastapi.tiangolo.com/img/logo-margin/logo-teal.png" style="width: 20%;"></a>

**SQLModel** is designed to simplify interacting with SQL databases in <a href="https://fastapi.tiangolo.com" class="external-link" target="_blank">FastAPI</a> applications, it was created by the same <a href="https://tiangolo.com/" class="external-link" target="_blank">author</a>. 😁

It combines SQLAlchemy and Pydantic and tries to simplify the code you write as much as possible, allowing you to reduce the **code duplication to a minimum**, but while getting the **best developer experience** possible.

**SQLModel** is, in fact, a thin layer on top of **Pydantic** and **SQLAlchemy**, carefully designed to be compatible with both.

## Requirements

A recent and currently supported version of Python (right now, <a href="https://www.python.org/downloads/" class="external-link" target="_blank">Python supports versions 3.6 and above</a>).

As **SQLModel** is based on **Pydantic** and **SQLAlchemy**, it requires them. They will be automatically installed when you install SQLModel.

## Installation

<div class="termy">

```console
$ pip install tablemodel
---> 100%
Successfully installed tablemodel
```

</div>

## Example

For an introduction to databases, SQL, and everything else, see the <a href="https://sqlmodel.tiangolo.com" target="_blank">SQLModel documentation</a>.

Here's a quick example. ✨

### A SQL Table

Imagine you have a SQL table called `hero` with:

* `id`
* `name`
* `secret_name`
* `age`

And you want it to have this data:

| id | name | secret_name | age |
-----|------|-------------|------|
| 1  | Deadpond | Dive Wilson | null |
| 2  | Spider-Boy | Pedro Parqueador | null |
| 3  | Rusty-Man | Tommy Sharp | 48 |


### SQLModel (legacy)

You can learn a lot more about **SQLModel** by quickly following the **tutorial**, but if you need a taste right now of how to put all that together and save to the database, you can do this:

```Python
from typing import Optional

from sqlmodel import Field, Session, SQLModel, create_engine


class Hero(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    name: str
    secret_name: str
    age: Optional[int] = None


hero_1 = Hero(name="Deadpond", secret_name="Dive Wilson")


engine = create_engine("sqlite:///database.db")


SQLModel.metadata.create_all(engine)

with Session(engine) as session:
    session.add(hero_1)
    session.commit()
```

### TableModel (current)
```Python
from tablemodel import TableModel
schema = [
    ("id", int, True, True),
    ("name", str),
    ("secret_name", str),
    ("age", int, True, None)
]

table = TableModel(table_name="main",
                   schema=schema,
                   engine_url="sqlite:///database.db")

record = table(name="Deadpond", secret_name="Dive Wilson")

table.insert_many([record])
```

That will save a **SQLite** database with the 1 hero.

## License

This project is licensed under the terms of the MIT license.
Please check the repository from `tiangolo` for more documentation https://github.com/tiangolo/sqlmodel 