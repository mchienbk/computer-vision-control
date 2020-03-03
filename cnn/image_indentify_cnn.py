# ---------------------------------------------------------------------
# Convolution Neural Network for Indetify Image
# Vesion 0.0
# Create: 2019/07/09 - Minh Chien
# ---------------------------------------------------------------------


# Import Keras libraries
from keras.preprocessing import image
from keras.models import Sequential
from keras.layers import Convolution2D
from keras.layers import MaxPooling2D
from keras.layers import Flatten
from keras.layers import Dense
from keras.models import load_model
import numpy as np
import cv2

# Installed the CNN
classifier = Sequential()

# # Step 1 - Convolution
# classifier.add(Convolution2D(32, 3, 3, input_shape=(64, 64, 3), activation='relu'))

# # Step 2 - Pooling
# classifier.add(MaxPooling2D(pool_size=(2, 2)))

# # Step 3 - Flatten
# classifier.add(Flatten())

# # Step 4 — Full Connection
# classifier.add(Dense(128, activation='relu'))
# classifier.add(Dense(1, activation='sigmoid'))


# # Step 4.5 - Compiling CNN
# classifier.compile(optimizer='adam',loss='binary_crossentropy',metrics=['accuracy'])

# # Step 5 — Data Augmentation
from keras.preprocessing.image import ImageDataGenerator

train_datagen = ImageDataGenerator(
    rescale=1./255,
    shear_range=0.2,
    zoom_range=0.2,
    horizontal_flip=True
)

test_datagen = ImageDataGenerator(rescale=1./255)

training_set=train_datagen.flow_from_directory(
    'dataset/training_set',
    target_size=(64, 64),
    batch_size=32,
    class_mode='categorical'
)

test_set=test_datagen.flow_from_directory(
    'dataset/test_set',
    target_size=(64, 64),
    batch_size=32,
    class_mode='categorical'
)

# # Step 6 — Training our Network
# from IPython.display import display
# from PIL import Image

# data = classifier.fit_generator(
#     training_set,
#     steps_per_epoch=5000,
#     epochs=10,
#     validation_data=test_set,
#     validation_steps=800
# )

# # # Data backup
# classifier.save('classifier.h5')  # creates a HDF5 file 'my_model.h5'


#############################################################################
# Testing
classifier = load_model('classifier0.h5')

test_img = ['test_img\\3.jpg', 'test_img\\13.jpg', 'test_img\\25.jpg',
            'test_img\\39.jpg', 'test_img\\65.jpg', 'test_img\\88.jpg', 'test_img\\145.jpg']

for i in range(7):
    # test_image = image.load_img(test_img[i], target_size=(64, 64))
    # image.
    # test_image = image.img_to_array(test_image)
    # test_image = np.expand_dims(test_image, axis=0)
    # result = classifier.predict(test_image)

    input_img = cv2.imread(test_img[i])
    input_img = cv2.resize(input_img,(64,64))
    result = classifier.predict(input_img.reshape(1, 64, 64,3))
    print(result)

    training_set.class_indices
    if result[0][0] >= 0.5:
        prediction = 'cat'
    else:
        prediction = 'dog'
    print(prediction)


# test_image=image.load_img('13.jpg', target_size=(64, 64))
# test_image=image.img_to_array(test_image)
# test_image=np.expand_dims(test_image, axis=0)
# result=classifier.predict(test_image)
# training_set.class_indices
# if result[0][0] >= 0.5:
#     prediction = 'cat'
# else:
#     prediction = 'dog'
# print(prediction)
