# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# Input Device Configuration File for the Atmel Maxtouch touch screen.
#
# These calibration values are derived from empirical measurements
# and may not be appropriate for use with other touch screens.
# Refer to the input device configuration documentation for more details.
#

device.internal = 1

# Basic Parameters
touch.deviceType = pointer
touch.orientation = 90
touch.orientationAware = 1

touch.gestureMode = pointer

# Touch Size
touch.touchSize.calibration = pressure

# Tool Size
# Driver reports tool size as an area measurement.
#
# Based on empirical measurements, we estimate the size of the tool
# using size = sqrt(22 * rawToolArea + 0) * 6 + 0.
touch.toolSize.calibration = area
touch.toolSize.areaScale = 22
touch.toolSize.areaBias = 0
touch.toolSize.linearScale = 6
touch.toolSize.linearBias = 0
touch.toolSize.isSummed = 0

# Force a wider logical surface to prevent wrapping
touch.deviceType = touchScreen
touch.surface.calibration = scaled
# Increase scale slightly more on X to account for the side area
touch.surface.scale = 1.25
touch.surface.bias = 0
touch.surface.scale.x = 1.25
touch.surface.scale.y = 1.2

# Size
touch.size.calibration = normalized

touch.distance.calibration = scaled
touch.distance.scale = 1.25

# Orientation
touch.orientation.calibration = vector
