// Copyright 2019-present the Material Components for iOS authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "MaterialRipple.h"
#import "MaterialSnapshot.h"

@interface MDCRippleViewSnapshotTests : MDCSnapshotTestCase

@property(nonatomic, strong) MDCRippleView *rippleView;
@property(nonatomic, strong) UIView *view;

@end

@implementation MDCRippleViewSnapshotTests

- (void)setUp {
  [super setUp];

  // Uncomment below to recreate all the goldens (or add the following line to the specific
  // test you wish to recreate the golden for).
  //   self.recordMode = YES;

  self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
  self.rippleView = [[MDCRippleView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
  [self.view addSubview:self.rippleView];
}

- (void)tearDown {
  self.view = nil;
  self.rippleView = nil;

  [super tearDown];
}

#pragma mark - Helpers

- (void)generateSnapshotAndVerifyForView:(UIView *)view {
  UIView *snapshotView = [view mdc_addToBackgroundView];
  [self snapshotVerifyView:snapshotView];
}

#pragma mark - Tests

- (void)testDefaultRippleView {
  // Given
  [self.rippleView beginRippleTouchDownAtPoint:CGPointZero animated:NO completion:nil];

  // Then
  [self generateSnapshotAndVerifyForView:self.view];
}

- (void)testLayoutChange {
  // Given
  [self.rippleView beginRippleTouchDownAtPoint:CGPointZero animated:NO completion:nil];

  // When
  self.view.bounds = CGRectMake(0, 0, 180, 20);

  // Then
  [self generateSnapshotAndVerifyForView:self.view];
}

- (void)testMaximumRadius {
  // Given
  self.rippleView.rippleStyle = MDCRippleStyleUnbounded;
  self.rippleView.maximumRadius = 20;

  // When
  [self.rippleView beginRippleTouchDownAtPoint:self.rippleView.center animated:NO completion:nil];

  // Then
  [self generateSnapshotAndVerifyForView:self.view];
}

@end
