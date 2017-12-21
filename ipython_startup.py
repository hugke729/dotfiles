import matplotlib.pyplot as plt
from collections import OrderedDict
import warnings
import pickle
import numpy as np
from numpy import pi, sin, cos
import numpy.ma as ma
import matplotlib
from matplotlib.pyplot import figure
from matplotlib.animation import FuncAnimation
from numpy.core.numeric import array_repr
from IPython.terminal.embed import InteractiveShellEmbed
from IPython.core.oinspect import Inspector
from docrepr import sphinxify
from subprocess import Popen, PIPE
from MyFigureUtils import splay_figures
sf = splay_figures
from MyPlotFunctions import flipy
from MyNumpyTools import minmax
from matplotlib.pyplot import clf
from MyInteractive import disp_latlon, click_dist, click_km
from MyMITgcmUtils import open_simulation, get_xgrid
from MyColormaps import red_yellow_grey_cyan_blue as rygcb

# Work-around for warnings that keeps coming up but aren't problematic
warnings.filterwarnings('ignore', '.*assigned to before global declaration*.')
warnings.filterwarnings('ignore', '.*get_axis_bgcolor function was deprecated*.')
warnings.filterwarnings('ignore', '.*ishold function was deprecated*.')
warnings.filterwarnings('ignore', '.*axes.hold is deprecated*.')
warnings.filterwarnings('ignore','elementwise comparison')
warnings.filterwarnings('ignore','.*requires a non-empty pattern match*.')
warnings.filterwarnings('ignore',".*Couldn't find available_diagnostics.log*.")
warnings.filterwarnings('ignore',".*Not sure what to do with rlev = L*.")

matplotlib.font_manager.X11FontDirectories.append('/home/hugke729/.local/share/fonts/')



# Make background grey, not white
def grey():
    plt.gca().set_facecolor('grey')
    plt.draw()


def grey_all():
    fig = plt.gcf()
    for ax in fig.get_axes():
        fig.sca(ax)
        grey()


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
    return orig_str + '\n\nShape: ' + str(arr.shape) + '\n\n\n'


np.set_string_function(my_array_repr)


def fromfile(filename):
    return np.fromfile(filename, '>d')


def equal(ax=None):
    ax = plt.gca() if ax is None else ax
    ax.set_aspect('equal', 'box-forced')


def doc(fn):
    oinfo = Inspector().info(fn)
    oinfo['name'] = fn.__name__
    url = sphinxify.rich_repr(oinfo)
    Popen(['python -m webbrowser \'' + url + '\''],
           stderr=PIPE, stdout=PIPE, shell=True)  
