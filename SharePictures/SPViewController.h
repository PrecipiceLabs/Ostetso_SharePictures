#import <UIKit/UIKit.h>
#import "GPUImage.h"
#import <CoreMotion/CoreMotion.h>
#define UPLOAD_IMAGE_MAX_DIMENSION 640

@class SPEffectInfo;
@class SPFilterView;
@class GPUImagePicture;

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




@interface SPViewController : UIViewController <GPUImageVideoCameraDelegate, UIGestureRecognizerDelegate, UINavigationBarDelegate,
                                                UIAlertViewDelegate>
{
    GPUImageStillCamera *_camera;
    
    SPFilterView *_filterView;
    SPFilterView *_tempFilterView;   // used when transitioning to new effect
    
    // Effects
    NSMutableDictionary *_effectList;
    NSMutableArray      *_sortedEffectTitles;
    NSString            *_currentEffect;
    
    // Outlets
    __weak IBOutlet UIImageView             *_capturedImageView;
    __weak IBOutlet UIToolbar               *_toolbar;
    
    // Tool Bar Buttons
    IBOutlet UIBarButtonItem                *_resetButton;
    IBOutlet UIBarButtonItem                *_shareButton;

   
    // On- Screen Buttons
    __weak IBOutlet UIButton                *_switchCameraButton;
	__weak IBOutlet UIButton                *_flashToggleButton;
    __weak IBOutlet UIButton                *_cameraButton;
    
    __weak IBOutlet UISlider                *_effectAmountSlider;
    __weak IBOutlet UIActivityIndicatorView *_activityIndicator;
    __weak IBOutlet UIScrollView            *_effectChoiceView;    // Contains FX buttons.  Subview of _effectSelectionView

    // Gestures
    UISwipeGestureRecognizer               *_swipeRightRecognizer;
    UISwipeGestureRecognizer               *_swipeLeftRecognizer;

    PanStatus                       _panStatus;
    CGRect                          _origFilterViewFrame;
    CGRect                          _origTempViewFrame;
    
    // Image stuff
    UIImage                        *_image;
    UIImage                        *_imageSelected;
    
    // State
    BOOL                            _isSavingImage;
    BOOL                            _oldDeviceModel;  // iPhone4, iPad2, or iPod2 or prior
    BOOL                            _reloadImage;     // To check the need of reloading _selectedImage on GPUImageView after saving image

}


- (void) setCameraCaptureState: (BOOL) cameraActive;

- (IBAction)captureImage:(id)sender;
- (IBAction)switchCamera:(id)sender;
- (IBAction)toggleFlash:(id)sender;
- (IBAction)reset:(id)sender;
- (IBAction)shareImage:(id)sender;
- (IBAction)effectAmountValueChanged:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *effectSelectionView;
@property (strong, nonatomic) IBOutlet GPUImageView *previewImageView; // To show the image into the effect preview mode

@property (nonatomic, strong) CMMotionManager *motionManager;          // To get accelerator rotation
@property (nonatomic) UIInterfaceOrientation deviceOrientation;        // The current device orientation
@property (nonatomic) BOOL imageSourceCamera;                          // YES if we are using the camera, NO if we are using an image from the camera roll
@property (strong,nonatomic) UIImage *selectedImage;                   // To get image selected from native Gallery.
@property (strong,nonatomic) SPFilterView *backGroundFilter;           // Declared this filterView to get the effect to be applied on image while saving
@property (strong,nonatomic) GPUImagePicture *stillImagePicture;       // Declared this property to apply filter on image selected from cameraRoll
@property (nonatomic,strong) GPUImagePicture *foregroundPicture;       // Used if an effect loads an auxillary image

@end
