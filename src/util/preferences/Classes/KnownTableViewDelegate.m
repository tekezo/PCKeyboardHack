#import "KnownTableViewDelegate.h"
#import "KnownKeyCode.h"
#import "KnownTableViewDataSource.h"

@interface KnownTableViewDelegate ()

@property(weak) IBOutlet KnownTableViewDataSource* knownTableViewDataSource;

@end

@implementation KnownTableViewDelegate

- (NSView*)tableView:(NSTableView*)tableView viewForTableColumn:(NSTableColumn*)tableColumn row:(NSInteger)row {
  if (0 <= row && row < (NSInteger)([self.knownTableViewDataSource.source count])) {
    KnownKeyCode* knownKeyCode = self.knownTableViewDataSource.source[row];

    if ([tableColumn.identifier isEqualToString:@"KnownNameColumn"]) {
      NSTableCellView* result = [tableView makeViewWithIdentifier:@"KnownNameCellView" owner:self];
      result.textField.stringValue = knownKeyCode.name;
      return result;

    } else if ([tableColumn.identifier isEqualToString:@"KnownValueColumn"]) {
      NSTableCellView* result = [tableView makeViewWithIdentifier:@"KnownValueCellView" owner:self];
      result.textField.stringValue = knownKeyCode.keyCode;
      return result;
    }
  }

  return nil;
}

@end
