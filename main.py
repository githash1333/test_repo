import webview
from kivy.app import App
from kivy.uix.boxlayout import BoxLayout

class MyApp(App):
    def build(self):
        # Open the web view directly when the app starts
        self.open_webview()
        return BoxLayout()  # Return an empty layout since we don't need any Kivy widgets

    def open_webview(self):
        # Open the specified URL in a new web view window
        webview.create_window('Firstbytebox', 'http://192.168.86.1:8501/')  # Replace with your desired URL
        webview.start()

if __name__ == '__main__':
    MyApp().run()

#http://192.168.86.1:8501/
#pip install git+https://github.com/kivy-garden/garden.webview.git
# !pip install kivy
# !pip install kivymd
# !pip install kivy_garden
# !pip install kivy-garden.xcamera==2020.613