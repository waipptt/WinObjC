//******************************************************************************
//
// Copyright (c) 2016 Microsoft Corporation. All rights reserved.
//
// This code is licensed under the MIT License (MIT).
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
//******************************************************************************
#import <CoreMotion/CoreMotionExport.h>
#import <Foundation/NSCopying.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSSecureCoding.h>
#import <Foundation/NSObject.h>
#import <CoreMotion/CMLogItem.h>
#import <objc\runtime.h>

typedef enum {
    CMMagneticFieldCalibrationAccuracyUncalibrated = -1,
    CMMagneticFieldCalibrationAccuracyLow,
    CMMagneticFieldCalibrationAccuracyMedium,
    CMMagneticFieldCalibrationAccuracyHigh
} CMMagneticFieldCalibrationAccuracy;

typedef struct CMMagneticField { double x, y, z; };

typedef struct CMCalibratedMagneticField {
    CMMagneticField field;
    CMMagneticFieldCalibrationAccuracy accuracy;
};

COREMOTION_EXPORT_CLASS
@interface CMMagnetometerData : CMLogItem <NSCopying, NSObject, NSSecureCoding>
@property (readonly, nonatomic) CMMagneticField magneticField STUB_PROPERTY;
@end