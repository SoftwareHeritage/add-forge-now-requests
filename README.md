# Add Forge Now Requests

## Trigger pipeline manually

```bash
ᐅ PROJECT_ID=474
ᐅ GITLAB_URL=https://gitlab.softwareheritage.org
ᐅ INSTANCE_NAME="gitlab.softwareheritage.org"
ᐅ LISTER_TYPE=gitlab
ᐅ curl -X POST \
     --fail \
     -F "token=$TOKEN" \
     -F "ref=$REF_NAME" \
     -F "variables[LISTER_TYPE]=$LISTER_TYPE" \
     -F "variables[INSTANCE_NAME]=$INSTANCE_NAME" \
     -F "variables[REQUEST_ID]=$REQUEST_ID"
"$GITLAB_URL/api/v4/projects/$PROJECT_ID/trigger/pipeline"
```

## Requests processing history

| Instance Name    | Lister Type       | Last Visit Status | Visit Date     | Issue ID     |
|------------------|-------------------|-------------------|----------------|--------------|
