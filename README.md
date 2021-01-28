# Rubyweekly
Get data from rubyweekly.com and create Weekly CRDs based on community-operator & push to datastore

### Installing the charts
From root directory of rubyweekly. Please edit the values.yaml inside charts before applying.
```
helm repo add zufardhiyaulhaq https://charts.zufardhiyaulhaq.com/
helm install zufardhiyaulhaq/rubyweekly --name-template rubyweekly -f values.yaml
```

### Configuration

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| community | string | `"Ruby Indonesia Community"` |  |
| cronSchedule | string | `"0 8 * * 5"` |  |
| github.branch | string | `"master"` |  |
| github.organization | string | `"zufardhiyaulhaq"` |  |
| github.repository | string | `"community-ops"` |  |
| github.repository_path | string | `"./manifest/ruby-community/"` |  |
| github.token | string | `"your_token"` |  |
| image.name | string | `"rubyweekly"` |  |
| image.repository | string | `"zufardhiyaulhaq/rubyweekly"` |  |
| image.tag | string | `"0.0.1"` |  |
| image_url | string | `"https://img-a.udemycdn.com/course/750x422/1985744_8694_3.jpg"` |  |
| jobHistoryLimit | int | `1` |  |
| namespace | string | `"ruby-community"` |  |
| tags | string | `"weekly,ruby"` |  |
