# Helm Github repository plugin

Private Helm repository hosted on github


## Installation

```
$ helm plugin install https://github.com/MilosMosovsky/helm-repo-on-github
```

## Usage

```
helm create example-chart
helm github release example-chart
``

## Using as public repository

```
$ helm repo add github https://raw.githubusercontent.com/MilosMosovskyhelm-repo-on-github/master/charts
```

## Using as private repository
