import pandas as pd
import os

from scipy import misc
from mpl_toolkits.mplot3d import Axes3D
import matplotlib
import matplotlib.pyplot as plt

# Look pretty...
matplotlib.style.use('ggplot')


#
# TODO: Start by creating a regular old, plain, "vanilla"
# python list. You can call it 'samples'.
#
# .. your code here .. 
samples = list()
colors = list()

#
# TODO: Write a for-loop that iterates over the images in the
# Module4/Datasets/ALOI/32/ folder, appending each of them to
# your list. Each .PNG image should first be loaded into a
# temporary NDArray, just as shown in the Feature
# Representation reading.
#
# Optional: Resample the image down by a factor of two if you
# have a slower computer. You can also convert the image from
# 0-255  to  0.0-1.0  if you'd like, but that will have no
# effect on the algorithm's results.
#
# .. your code here .. 
datadir = "./Datasets/ALOI/32/"
for f in os.listdir(datadir):
    if f.endswith('.png'):
        img = misc.imread(os.path.join(datadir, f))
        img = img.reshape(-1)
        samples.append(img)
        colors.append('b')

#
# TODO: Once you're done answering the first three questions,
# right before you converted your list to a dataframe, add in
# additional code which also appends to your list the images
# in the Module4/Datasets/ALOI/32_i directory. Re-run your
# assignment and answer the final question below.
#
# .. your code here .. 
datadir_i = "./Datasets/ALOI/32i/"
for f in os.listdir(datadir_i):
    if f.endswith('.png'):
        img = misc.imread(os.path.join(datadir_i, f))
        img = img.reshape(-1)
        samples.append(img)
        colors.append('r')

#
# TODO: Convert the list to a dataframe
#
# .. your code here .. 
df = pd.DataFrame(samples)

#
# TODO: Implement Isomap here. Reduce the dataframe df down
# to three components, using K=6 for your neighborhood size
#
# .. your code here .. 
from sklearn import manifold
iso = manifold.Isomap(n_neighbors=6, n_components=3)
iso.fit(df)
M = iso.transform(df)

#
# TODO: Create a 2D Scatter plot to graph your manifold. You
# can use either 'o' or '.' as your marker. Graph the first two
# isomap components
#
# .. your code here .. 

fig = plt.figure()
ax = fig.add_subplot(111)
ax.set_title("2D plot of manifold")
ax.set_xlabel('Component: 1')
ax.set_ylabel('Component: 2')
ax.scatter(M[:,0], M[:,1], c=colors, marker='o', alpha=0.7)

#
# TODO: Create a 3D Scatter plot to graph your manifold. You
# can use either 'o' or '.' as your marker:
#
# .. your code here .. 
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.set_title("3D plot of manifold")
ax.set_xlabel('Component: 1')
ax.set_ylabel('Component: 2')
ax.set_zlabel('Component: 3')
ax.scatter(M[:,0], M[:,1], M[:,2], c=colors, marker='.', alpha=0.7)

plt.show()

