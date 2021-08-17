# rubyweekly

Get data from ruby news and create Weekly CRDs based on community-operator and push to git datastore

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square) [![made with Go](https://img.shields.io/badge/made%20with-Go-brightgreen)](http://golang.org) [![Github master branch build](https://img.shields.io/github/workflow/status/zufardhiyaulhaq/rubyweekly/Master)](https://github.com/zufardhiyaulhaq/rubyweekly/actions/workflows/master.yml) [![GitHub issues](https://img.shields.io/github/issues/zufardhiyaulhaq/rubyweekly)](https://github.com/zufardhiyaulhaq/rubyweekly/issues) [![GitHub pull requests](https://img.shields.io/github/issues-pr/zufardhiyaulhaq/rubyweekly)](https://github.com/zufardhiyaulhaq/rubyweekly/pulls)

[![Bugs](https://sonarqube.zufardhiyaulhaq.com/api/project_badges/measure?project=rubyweekly&metric=bugs)](https://sonarqube.zufardhiyaulhaq.com/dashboard?id=rubyweekly) [![Code Smells](https://sonarqube.zufardhiyaulhaq.com/api/project_badges/measure?project=rubyweekly&metric=code_smells)](https://sonarqube.zufardhiyaulhaq.com/dashboard?id=rubyweekly) [![Coverage](https://sonarqube.zufardhiyaulhaq.com/api/project_badges/measure?project=rubyweekly&metric=coverage)](https://sonarqube.zufardhiyaulhaq.com/dashboard?id=rubyweekly) [![Maintainability Rating](https://sonarqube.zufardhiyaulhaq.com/api/project_badges/measure?project=rubyweekly&metric=sqale_rating)](https://sonarqube.zufardhiyaulhaq.com/dashboard?id=rubyweekly) [![Quality Gate Status](https://sonarqube.zufardhiyaulhaq.com/api/project_badges/measure?project=rubyweekly&metric=alert_status)](https://sonarqube.zufardhiyaulhaq.com/dashboard?id=rubyweekly) [![Reliability Rating](https://sonarqube.zufardhiyaulhaq.com/api/project_badges/measure?project=rubyweekly&metric=reliability_rating)](https://sonarqube.zufardhiyaulhaq.com/dashboard?id=rubyweekly) [![Security Rating](https://sonarqube.zufardhiyaulhaq.com/api/project_badges/measure?project=rubyweekly&metric=security_rating)](https://sonarqube.zufardhiyaulhaq.com/dashboard?id=rubyweekly)

## Installing the Chart

To install the chart with the release name `my-release` and secret `foo`:

```console
kubectl apply -f secret.yaml

helm repo add zufardhiyaulhaq https://charts.zufardhiyaulhaq.com/
helm install rubyweekly zufardhiyaulhaq/rubyweekly --values values.yaml --set secret=foo
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cronSchedule | string | `"0 8 * * 0"` |  |
| image.repository | string | `"zufardhiyaulhaq/rubyweekly"` |  |
| image.tag | string | `"v1.0.0"` |  |
| secret | string | `""` |  |
| weekly.community | string | `"Ruby Indonesia Community"` |  |
| weekly.image_url | string | `"https://learnworthy.net/wp-content/uploads/2019/08/A-Complete-Guide-to-the-Ruby-Programming-World.png"` |  |
| weekly.namespace | string | `"ruby-community"` |  |
| weekly.tags | string | `"weekly,ruby"` |  |

