from setuptools import setup, find_packages

setup(
    name="flask_app",  # Change this to your package name
    version="0.1.0",
    author="gitshash45",
    author_email="gitshash45@gmail.com",
    description="A Flask web application",
    long_description=open("README.Docker.md").read(),
    long_description_content_type="text/markdown",
    #https://github.com/githash1333/test_repo
    url="https://github.com/githash1333/test_repo",  # Change this to your repo
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        "Flask",  # Add your dependencies from requirements.txt
        "gunicorn"
    ],
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires=">=3.7",
    entry_points={
        "console_scripts": [
            "flask-app=flask_app.app:main",  # Adjust according to your structure
        ],
    },
)
