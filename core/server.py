from flask import Flask
from flask_restful import Resource, Api

from generate import new_store

app = Flask(__name__)
api = Api(app)

class StoreName(Resource):

    def get(self):
        name = new_store()
        return {'name': name}

api.add_resource(StoreName, '/', '/store/new/')

if __name__ == '__main__':
    app.run(debug=False)
