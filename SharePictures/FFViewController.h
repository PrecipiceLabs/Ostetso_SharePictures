#import <UIKit/UIKit.h>
#import "GPUImage.h"
#import <CoreMotion/CoreMotion.h>
#define UPLOAD_IMAGE_MAX_DIMENSION 640

@class FFEffectInfo;

typedef struct
{
    CGPoint _originalPosition;
    
    CGPoint _translate;
    CGPoint _scale;
    float   _rotate;
} Transform2D;

typedef enum
{
	kPanStatusOff,
	kPanStatusInitiated,
	kPanStatusLeft,
	kPanStatusRight,
} PanStatus;



@interface FFFilterView : NSObject

@property (atomic, retain) GPUImageOutput<GPUImageInput> *filter;
@property (atomic, retain) GPUImageView *view;
@property (atomic, retain) FFEffectInfo *effect;

- (FFFilterView *)initWithFrame: (CGRect) frame;

@end

@interface FFUIImageView : UIImageView

@end



@interface FFViewController : UIViewController <GPUImageVideoCameraDelegate, UIGestureRecognizerDelegate, UINavigationBarDelegate,
                                                UIAlertViewDelegate>
{
    GPUImageStillCamera *stillCamera;
    GPUImageOutput<GPUImageInput> *filter, *secondFilter, *terminalFilter;
    GPUImageView *primaryView;
    
    
    
    GPUImageStillCamera *_camera;
    
    FFFilterView *_filterView;
    FFFilterView *_tempFilterView;   // used when transitioning to new effect
    
    // Effects
    NSMutableDictionary *_effectList;
    NSMutableArray      *_sortedEffectTitles;
    NSString            *_currentEffect;
    
    // Sharing
    BOOL _shareDialogActive;

	// Operation queue for uploading
	NSOperationQueue*	_operationQueue;
    
    // Shader uniforms
    float _shrinkScaleValue;
    
    // Outlets
    __weak IBOutlet FFUIImageView           *_capturedImageView;
    __weak IBOutlet UIToolbar               *_toolbar;
    
    // Tool Bar Buttons
    IBOutlet UIBarButtonItem                *_resetButton;
    IBOutlet UIBarButtonItem                *_shareButton;
    IBOutlet UIBarButtonItem                *_leftFixedSpace;
    IBOutlet UIBarButtonItem                *_leftFlexSpace;
    IBOutlet UIBarButtonItem                *_rightFixedSpace;
    
    __weak IBOutlet UILabel                 *_shareLabel;
    
    // On- Screen Buttons
    __weak IBOutlet UIButton                *_switchCameraButton;
	__weak IBOutlet UIButton                *_flashToggleButton;
    __weak IBOutlet UIButton                *_cameraButton;
    
    __weak IBOutlet UISlider                *_effectAmountSlider;
    __unsafe_unretained IBOutlet UILabel    *_shrinkScale;
    __unsafe_unretained IBOutlet UISlider   *_shrinkScaleSlider;
    __weak IBOutlet UIActivityIndicatorView *_activityIndicator;
    __weak IBOutlet UIImageView             *_testImageView;
    __weak IBOutlet UIScrollView            *_effectChoiceView;    // Contains FX buttons.  Subview of _effectSelectionView
    __weak IBOutlet UIView                  *_effectSelectionView; // Contains _effectChoiceView

    // Gestures
    UISwipeGestureRecognizer               *_swipeRightRecognizer;
    UISwipeGestureRecognizer               *_swipeLeftRecognizer;

    CGPoint                         _pinchStartScale;
    float _lastRotation;
    float _lastScaleX, _lastScaleY;
    
    CGPoint                         _overlayScale;
    CGPoint                         _aspectRatioCorrection;    // Effects are created at 480x640, need to scale to correct for differences at other ARs
	CGPoint							_dragStartPos;
	CGPoint							_xlateStartPos;
    CGSize                          _cameraRes;
    float                           _videoToDisplayScale;
    CGSize                          _ipadToiPhoneRatio;
    CGPoint                         _flipScale;
    PanStatus                       _panStatus;
    CGRect                          _origFilterViewFrame;
    CGRect                          _origTempViewFrame;
    double                          _timeToSetNewEffect;

    
    // Image stuff
    CMSampleBufferRef              _lastSample;
    UIImage                        *_image;
    UIImage                        *_imageSelected;
    int                            _setOverlayPending;
    
    // State
    BOOL                            _isIPad;
    BOOL                            _isSavingImage;
    BOOL                            _frontCamera;
    BOOL                            _showEffectsPalette;
    BOOL                            _oldDeviceModel;  // iPhone4, iPad2, or iPod2 or prior
}

@property BOOL isIPad;
@property (nonatomic, weak) UIView *effectSelectionView;

- (void) setCameraCaptureState: (BOOL) cameraActive;
- (IBAction)captureImage:(id)sender;
- (IBAction)switchCamera:(id)sender;
- (IBAction)toggleFlash:(id)sender;
- (IBAction)reset:(id)sender;
- (IBAction)shareImage:(id)sender;
- (IBAction)effectAmountValueChanged:(id)sender;
@property (nonatomic, strong) CMMotionManager *motionManager;   // To get accelerator rotation
@property (nonatomic) UIInterfaceOrientation deviceOrientation;
@property (nonatomic ,strong) NSString *checkOrientation;       // Putting rotation string to compare deviceOrientation
@property (strong,nonatomic) NSString *getImage; // Passing string to differentiate between native gallery and live camera mode
@property (strong,nonatomic) UIImage *selectedImage; // To get image selected from native Gallery.
@property (strong,nonatomic) FFFilterView *backGroundFilter; // Declared this filterView to get the effect to be applied on image while saving
@property (strong,nonatomic) GPUImagePicture *stillImagePicture; // Declared this property to apply filter on image selected from cameraRoll
@property (strong, nonatomic) IBOutlet GPUImageView *previewImageView;// To show the image into the effect preview mode
@property (nonatomic,strong) UIImage *anotherImage; // Image to apply effect while saving image
@end
