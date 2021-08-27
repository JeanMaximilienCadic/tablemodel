from setuptools import setup
from tablemodel import __version__
setup(
    name='tablemodel',
    version=__version__,
    long_description="",
    packages=[
        "tablemodel",
    ],
    include_package_data=True,
    url='https://github.com/JeanMaximilienCadic/tablemodel',
    license='MIT',
    author='Jean Maximilien Cadic',
    python_requires='>=3.6',
    install_requires=[r.rsplit()[0] for r in open("requirements.txt")],
    author_email='git@cadic.jp',
    description='GNU Tools for python',
    classifiers=[
        "Programming Language :: Python :: 3.6",
        "License :: OSI Approved :: MIT License",
    ]
)

