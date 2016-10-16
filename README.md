## What

Create your own cannabis store/processor/farm name based on existing ones.

### Api

Install:
Clone and

```bash
$ cd core
$ pip install -r requirements.txt
```

With the generate functions:

```python
from generate import new_store
new_store()  # -> "Some Fake Store Name"

```

As a `faker` factory, with `factory_boy`

```python
import factory
from providers import CannabisProvider

factory.Faker.add_provider(CannabisProvider)

class FirmFactory(factory.Factory):

    class Meta:
        model = Firm

    name = factory.Faker('store')
```

As a HTTP api

```bash
$ python server.py
```

### Frontend

Install Elm with `npm`

```bash
$ npm install -g elm
```

Then just run it with

```bash
$ cd web
$ elm reactor
```

## Deployment Notes

# Kubernetes

### Continuous Integration/Deployment

1. Run tests etc
2. Build the containers
3. Upload the containers somewhere
4. Apply the config/specs (yaml files) e.g.,
   ```
   kubectl apply -f core/core-deployment.yaml
   ```

### Modifying the kube configuration files

If we need to modify the configs, we can pull the existing ones down with `get -o yaml`

### Actually causing a rollout

See the docs for [Deployments](http://kubernetes.io/docs/user-guide/deployments/)

> Note: a Deployment’s rollout is triggered if and only if the Deployment’s pod template (i.e. .spec.template) is changed, e.g. updating labels or container images of the template. Other updates, such as scaling the Deployment, will not trigger a rollout.

I've done this with a dumb `version` label there might be a better way.
