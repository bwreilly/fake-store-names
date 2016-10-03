from flask import Flask
from flask_restful import Resource, Api

from generate import new_store

FRONTEND = "http://0.0.0.0:8000"

app = Flask(__name__)
# app.config.from_object('config')
api = Api(app)

class StoreName(Resource):

    def get(self):
        name = new_store()
        return {'name': name}

@app.after_request
def after_request(response):
  response.headers.add('Access-Control-Allow-Origin', "*")
  response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
  response.headers.add('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE')
  return response

api.add_resource(StoreName, '/', '/store/new/')

if __name__ == '__main__':
    app.run(debug=False)
