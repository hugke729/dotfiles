import matplotlib.pyplot as plt
import warnings
import pickle
import numpy as np
import numpy.ma as ma
import matplotlib
from matplotlib.pyplot import figure
from numpy.core.numeric import array_repr
from IPython.terminal.embed import InteractiveShellEmbed
from MyFigureUtils import splay_figures
from MyPlotFunctions import flipy
from MyNumpyTools import minmax

# Work-around for warnings that keeps coming up but aren't problematic
warnings.filterwarnings('ignore', '.*assigned to before global declaration*.')
warnings.filterwarnings('ignore', '.*get_axis_bgcolor function was deprecated*.')
warnings.filterwarnings('ignore', '.*ishold function was deprecated*.')
warnings.filterwarnings('ignore','elementwise comparison')
warnings.filterwarnings('ignore','.*requires a non-empty pattern match*.')
warnings.filterwarnings('ignore',".*Couldn't find available_diagnostics.log*.")
warnings.filterwarnings('ignore',".*Not sure what to do with rlev = L*.")

matplotlib.font_manager.X11FontDirectories.append('/home/hugke729/.local/share/fonts/')


# Make background grey, not white
def grey():
    plt.gca().set_facecolor('grey')
    plt.draw()


# Define functions to load or dump pickle files
def pil(filename):
    """alias for pickle.load(open(filename, 'rb'))"""
    return pickle.load(open(filename, 'rb'))


def unpack_dict(D):
    for key, value in D.items():
        exec("globals()['" + key + "'] = value")


def pid(obj, filename):
    """alias for pickle.dump(obj, open(filename, 'wb'))"""
    return pickle.dump(obj, open(filename, 'wb'))


def dbg(obj_name, obj):
    """Hacky function to evaluate obj in base workspace

    Useful because then I can play around with it more
    """
    exec("globals()['" + obj_name + "'] = obj")


class AD(dict):
    """Attribute dictionary"""

    def __init__(self, *args, **kwargs):
        super(AD, self).__init__(*args, **kwargs)
        self.__dict__ = self

ipshell = InteractiveShellEmbed()
ipshell.magic('%load_ext autoreload')
ipshell.magic('%autoreload 2')

# Add array shape to Numpy's repr


def my_array_repr(arr):
    orig_str = array_repr(arr)
    return orig_str + '\n\nShape: ' + str(arr.shape)


np.set_string_function(my_array_repr)
