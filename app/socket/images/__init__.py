from flask_socketio import emit

def connect_images(app):

    @app.on("post_image")
    def post_image():

        pass

    @app.on("get_image")
    def get_image():

        pass
