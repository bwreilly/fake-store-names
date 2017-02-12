## What is this

Many legal (i502 licensed) cannabis stores in Washington State have amusing names. This thing generates new ones based on the existing ones.

## What, why?

Oh just for fun - gave me a chance to mess around with Kubernetes, Google web services, Elm, etc. and make some ridiculous names:

'BREAKING BUD DEPOT'
'BIG BUDDAS COLLECTIVE STORE OF GREEN TOKEN CANNABIS, LLC.'
'IT IS LIT 2 LLC'
'MAGIC 420 HOLIDAY'
'CAPTAINZ GANJA GIRLS, LLC'
'BUY THE CROP'
'HOT SPOT FOR YOU LLC'
'GREEN LADY BUDS ARE US'

## This is absurd

It's a young industry.

## Usage

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

With docker, locally

```bash
$ docker build -t store_api core
$ docker run -d -p 5000:5000 store_api
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

Or with docker, locally

```bash
$ docker build -t store_web web
$ docker run -d -p 8000:8000 store_web
```

## Deployment Notes

At the time of this writing Kubernetes is both a bit elaborate for so simple a thing and is a quickly moving target so keep that in mind.

# Kubernetes

### Continuous Integration/Deployment

1. Run tests etc
2. Build the containers
3. Upload the containers somewhere
4. If the [configmaps](http://kubernetes.io/docs/user-guide/configmap/) need to be changed (`nginx.conf`), run

  ```
  kubectl replace configmap nginx-api-configmap --from-file=core/nginx.conf
  ```

  Note that this doesn't cause a deployment rollout, you need to either scale or see `Actually causing a rollout` below.

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
