# "screen.py - Send UI captures to Waveshare e-paper display"
#
# Copyright (c) 2018 Imaginary Sense LLC <support@imaginary.tech>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documnetation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to  whom the Software is
# furished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS OR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

from __future__ import print_function
import sys, socket
import argparse
if(socket.gethostname() == "beaglebone"):
    import epd_beaglebone as ePaper
else:
    import epd_rpi as ePaper
from PIL import Image
from PIL import ImageDraw
if sys.version_info.major < 3:
    input = raw_input

def main():
    # Parse CLI Arguments
    parser = argparse.ArgumentParser(prog="img2epd",
        description='Send UI captures to Waveshare e-paper display',
        epilog="img2epd - Image to e-paper by Imaginary Sense LLC, licensed under the BSD 3-Clause Licennse",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter)

    parser.add_argument('code', metavar='refresh_code', type=int, help='specify type of screen refresh: [0=fast] | [1=partial] | [2=full]')
    parser.add_argument('image', metavar='image_path', type=argparse.FileType('rb', 0), help='path to image file')
    args = parser.parse_args()

    # Initialize display
    print("Initializing e-paper display")
    epd = ePaper.EPD()
    epd.init()  # Is this?

    # Get image
    frame = Image.open(args.image).rotate(90)
    # print(frame)
    
    # Send image to display
    if args.code < 2:
        epd.display_partial_frame(frame, 0, 0, epd.height, epd.width, fast=True)
    if args.code >= 2:
        epd.display_frame(frame)

if __name__ == "__main__":
    main()
