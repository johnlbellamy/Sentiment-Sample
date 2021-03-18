import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="text_cleaner",
    version="0.0.1",
    author="John Bellamy",
    author_email="johnb3406@gmail.com",
    description="A text cleaning utility",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/john-bellamy/TextCleaner2000",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
)
