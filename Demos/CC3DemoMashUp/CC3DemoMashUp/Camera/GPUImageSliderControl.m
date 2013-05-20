//
//  GPUImageSlider.m
//  TomoAnime_HK
//
//  Created by Matt.Choi on 8/5/13.
//  Copyright (c) 2013 Next Media Interactive. All rights reserved.
//

#import "GPUImageSliderControl.h"

@implementation GPUImageSliderControl

+ (void)updateFilterFromSliderValue:(CGFloat)adjustValue CameraFilter:(GPUImageCameraFilter*)cameraFilter
{
    
    id filter = cameraFilter.filter;
    GPUImageShowcaseFilterType filterType = cameraFilter.filterType;
    UIView *view = cameraFilter.cameraView;
    
    switch(filterType)
    {
        case GPUIMAGE_SEPIA: [(GPUImageSepiaFilter *)filter setIntensity:adjustValue]; break;
        case GPUIMAGE_PIXELLATE: [(GPUImagePixellateFilter *)filter setFractionalWidthOfAPixel:adjustValue]; break;
        case GPUIMAGE_POLARPIXELLATE: [(GPUImagePolarPixellateFilter *)filter setPixelSize:CGSizeMake(adjustValue, adjustValue)]; break;
        case GPUIMAGE_PIXELLATE_POSITION: [(GPUImagePixellatePositionFilter *)filter setRadius:adjustValue]; break;
        case GPUIMAGE_POLKADOT: [(GPUImagePolkaDotFilter *)filter setFractionalWidthOfAPixel:adjustValue]; break;
        case GPUIMAGE_HALFTONE: [(GPUImageHalftoneFilter *)filter setFractionalWidthOfAPixel:adjustValue]; break;
        case GPUIMAGE_SATURATION: [(GPUImageSaturationFilter *)filter setSaturation:adjustValue]; break;
        case GPUIMAGE_CONTRAST: [(GPUImageContrastFilter *)filter setContrast:adjustValue]; break;
        case GPUIMAGE_BRIGHTNESS: [(GPUImageBrightnessFilter *)filter setBrightness:adjustValue]; break;
        case GPUIMAGE_LEVELS: {
            float value = adjustValue;
            [(GPUImageLevelsFilter *)filter setRedMin:value gamma:1.0 max:1.0 minOut:0.0 maxOut:1.0];
            [(GPUImageLevelsFilter *)filter setGreenMin:value gamma:1.0 max:1.0 minOut:0.0 maxOut:1.0];
            [(GPUImageLevelsFilter *)filter setBlueMin:value gamma:1.0 max:1.0 minOut:0.0 maxOut:1.0];
        }; break;
        case GPUIMAGE_EXPOSURE: [(GPUImageExposureFilter *)filter setExposure:adjustValue]; break;
        case GPUIMAGE_MONOCHROME: [(GPUImageMonochromeFilter *)filter setIntensity:adjustValue]; break;
        case GPUIMAGE_RGB: [(GPUImageRGBFilter *)filter setGreen:adjustValue]; break;
        case GPUIMAGE_HUE: [(GPUImageHueFilter *)filter setHue:adjustValue]; break;
        case GPUIMAGE_WHITEBALANCE: [(GPUImageWhiteBalanceFilter *)filter setTemperature:adjustValue]; break;
        case GPUIMAGE_SHARPEN: [(GPUImageSharpenFilter *)filter setSharpness:adjustValue]; break;
        case GPUIMAGE_HISTOGRAM: [(GPUImageHistogramFilter *)filter setDownsamplingFactor:round(adjustValue)]; break;
        case GPUIMAGE_UNSHARPMASK: [(GPUImageUnsharpMaskFilter *)filter setIntensity:adjustValue]; break;
            //        case GPUIMAGE_UNSHARPMASK: [(GPUImageUnsharpMaskFilter *)filter setBlurSize:adjustValue]; break;
        case GPUIMAGE_GAMMA: [(GPUImageGammaFilter *)filter setGamma:adjustValue]; break;
        case GPUIMAGE_CROSSHATCH: [(GPUImageCrosshatchFilter *)filter setCrossHatchSpacing:adjustValue]; break;
        case GPUIMAGE_POSTERIZE: [(GPUImagePosterizeFilter *)filter setColorLevels:round(adjustValue)]; break;
        case GPUIMAGE_HAZE: [(GPUImageHazeFilter *)filter setDistance:adjustValue]; break;
        case GPUIMAGE_THRESHOLD: [(GPUImageLuminanceThresholdFilter *)filter setThreshold:adjustValue]; break;
        case GPUIMAGE_ADAPTIVETHRESHOLD: [(GPUImageAdaptiveThresholdFilter *)filter setBlurSize:adjustValue]; break;
        case GPUIMAGE_AVERAGELUMINANCETHRESHOLD: [(GPUImageAverageLuminanceThresholdFilter *)filter setThresholdMultiplier:adjustValue]; break;
        case GPUIMAGE_DISSOLVE: [(GPUImageDissolveBlendFilter *)filter setMix:adjustValue]; break;
        case GPUIMAGE_POISSONBLEND: [(GPUImagePoissonBlendFilter *)filter setMix:adjustValue]; break;
        case GPUIMAGE_LOWPASS: [(GPUImageLowPassFilter *)filter setFilterStrength:adjustValue]; break;
        case GPUIMAGE_HIGHPASS: [(GPUImageHighPassFilter *)filter setFilterStrength:adjustValue]; break;
        case GPUIMAGE_MOTIONDETECTOR: [(GPUImageMotionDetector *)filter setLowPassFilterStrength:adjustValue]; break;
        case GPUIMAGE_CHROMAKEY: [(GPUImageChromaKeyBlendFilter *)filter setThresholdSensitivity:adjustValue]; break;
        case GPUIMAGE_CHROMAKEYNONBLEND: [(GPUImageChromaKeyFilter *)filter setThresholdSensitivity:adjustValue]; break;
        case GPUIMAGE_KUWAHARA: [(GPUImageKuwaharaFilter *)filter setRadius:round(adjustValue)]; break;
        case GPUIMAGE_SWIRL: [(GPUImageSwirlFilter *)filter setAngle:adjustValue]; break;
        case GPUIMAGE_EMBOSS: [(GPUImageEmbossFilter *)filter setIntensity:adjustValue]; break;
        case GPUIMAGE_CANNYEDGEDETECTION: [(GPUImageCannyEdgeDetectionFilter *)filter setBlurSize:adjustValue]; break;
            //        case GPUIMAGE_CANNYEDGEDETECTION: [(GPUImageCannyEdgeDetectionFilter *)filter setLowerThreshold:adjustValue]; break;
        case GPUIMAGE_HARRISCORNERDETECTION: [(GPUImageHarrisCornerDetectionFilter *)filter setThreshold:adjustValue]; break;
        case GPUIMAGE_NOBLECORNERDETECTION: [(GPUImageNobleCornerDetectionFilter *)filter setThreshold:adjustValue]; break;
        case GPUIMAGE_SHITOMASIFEATUREDETECTION: [(GPUImageShiTomasiFeatureDetectionFilter *)filter setThreshold:adjustValue]; break;
        case GPUIMAGE_HOUGHTRANSFORMLINEDETECTOR: [(GPUImageHoughTransformLineDetector *)filter setLineDetectionThreshold:adjustValue]; break;
            //        case GPUIMAGE_HARRISCORNERDETECTION: [(GPUImageHarrisCornerDetectionFilter *)filter setSensitivity:adjustValue]; break;
        case GPUIMAGE_THRESHOLDEDGEDETECTION: [(GPUImageThresholdEdgeDetectionFilter *)filter setThreshold:adjustValue]; break;
        case GPUIMAGE_SMOOTHTOON: [(GPUImageSmoothToonFilter *)filter setBlurSize:adjustValue]; break;
        case GPUIMAGE_THRESHOLDSKETCH: [(GPUImageThresholdSketchFilter *)filter setThreshold:adjustValue]; break;
            //        case GPUIMAGE_BULGE: [(GPUImageBulgeDistortionFilter *)filter setRadius:adjustValue]; break;
        case GPUIMAGE_BULGE: [(GPUImageBulgeDistortionFilter *)filter setScale:adjustValue]; break;
        case GPUIMAGE_SPHEREREFRACTION: [(GPUImageSphereRefractionFilter *)filter setRadius:adjustValue]; break;
        case GPUIMAGE_GLASSSPHERE: [(GPUImageGlassSphereFilter *)filter setRadius:adjustValue]; break;
        case GPUIMAGE_TONECURVE: [(GPUImageToneCurveFilter *)filter setBlueControlPoints:[NSArray arrayWithObjects:[NSValue valueWithCGPoint:CGPointMake(0.0, 0.0)], [NSValue valueWithCGPoint:CGPointMake(0.5, adjustValue)], [NSValue valueWithCGPoint:CGPointMake(1.0, 0.75)], nil]]; break;
        case GPUIMAGE_HIGHLIGHTSHADOW: [(GPUImageHighlightShadowFilter *)filter setHighlights:adjustValue]; break;
        case GPUIMAGE_PINCH: [(GPUImagePinchDistortionFilter *)filter setScale:adjustValue]; break;
        case GPUIMAGE_PERLINNOISE:  [(GPUImagePerlinNoiseFilter *)filter setScale:adjustValue]; break;
        case GPUIMAGE_MOSAIC:  [(GPUImageMosaicFilter *)filter setDisplayTileSize:CGSizeMake(adjustValue, adjustValue)]; break;
        case GPUIMAGE_VIGNETTE: [(GPUImageVignetteFilter *)filter setVignetteEnd:adjustValue]; break;
        case GPUIMAGE_GAUSSIAN: [(GPUImageGaussianBlurFilter *)filter setBlurSize:adjustValue]; break;
            //        case GPUIMAGE_BILATERAL: [(GPUImageBilateralFilter *)filter setBlurSize:adjustValue]; break;
        case GPUIMAGE_BILATERAL: [(GPUImageBilateralFilter *)filter setDistanceNormalizationFactor:adjustValue]; break;
        case GPUIMAGE_FASTBLUR: [(GPUImageFastBlurFilter *)filter setBlurPasses:round(adjustValue)]; break;
            //        case GPUIMAGE_FASTBLUR: [(GPUImageFastBlurFilter *)filter setBlurSize:adjustValue]; break;
        case GPUIMAGE_MOTIONBLUR: [(GPUImageMotionBlurFilter *)filter setBlurAngle:adjustValue]; break;
        case GPUIMAGE_ZOOMBLUR: [(GPUImageZoomBlurFilter *)filter setBlurSize:adjustValue]; break;
        case GPUIMAGE_OPACITY:  [(GPUImageOpacityFilter *)filter setOpacity:adjustValue]; break;
        case GPUIMAGE_GAUSSIAN_SELECTIVE: [(GPUImageGaussianSelectiveBlurFilter *)filter setExcludeCircleRadius:adjustValue]; break;
        case GPUIMAGE_GAUSSIAN_POSITION: [(GPUImageGaussianBlurPositionFilter *)filter setBlurRadius:adjustValue]; break;
        case GPUIMAGE_FILTERGROUP: [(GPUImagePixellateFilter *)[(GPUImageFilterGroup *)filter filterAtIndex:1] setFractionalWidthOfAPixel:adjustValue]; break;
        case GPUIMAGE_CROP: [(GPUImageCropFilter *)filter setCropRegion:CGRectMake(0.0, 0.0, 1.0, adjustValue)]; break;
        case GPUIMAGE_TRANSFORM: [(GPUImageTransformFilter *)filter setAffineTransform:CGAffineTransformMakeRotation(adjustValue)]; break;
        case GPUIMAGE_TRANSFORM3D:
        {
            CATransform3D perspectiveTransform = CATransform3DIdentity;
            perspectiveTransform.m34 = 0.4;
            perspectiveTransform.m33 = 0.4;
            perspectiveTransform = CATransform3DScale(perspectiveTransform, 0.75, 0.75, 0.75);
            perspectiveTransform = CATransform3DRotate(perspectiveTransform, adjustValue, 0.0, 1.0, 0.0);
            
            [(GPUImageTransformFilter *)filter setTransform3D:perspectiveTransform];
        }; break;
        case GPUIMAGE_TILTSHIFT:
        {
            CGFloat midpoint = adjustValue;
            [(GPUImageTiltShiftFilter *)filter setTopFocusLevel:midpoint - 0.1];
            [(GPUImageTiltShiftFilter *)filter setBottomFocusLevel:midpoint + 0.1];
        }; break;
        case GPUIMAGE_LOCALBINARYPATTERN:
        {
            CGFloat multiplier = adjustValue;
            [(GPUImageLocalBinaryPatternFilter *)filter setTexelWidth:(multiplier / view.bounds.size.width)];
            [(GPUImageLocalBinaryPatternFilter *)filter setTexelHeight:(multiplier / view.bounds.size.height)];
        }; break;
        default: break;
    }
}
@end
