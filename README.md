Current context presentations leave their presenting views with ambiguous layout
===

The default behavior of current context presentations in iOS 8 is to remove the presenting view controller's view while the presentation is occurring. This destroys any constraints that are configured on that view, which means that the presenting view seems to have disappeared when the presentation is dismissed.

Since the `-shouldRemovePresentersView` property is intrinsic to the subclass of `UIPresentationController` that drives the presentation, rather than being configurable by the outside, it doesn't seem like there's any way for the client to inform the presented view controller that removing its presenter's view will destroy critical constraints. In my actual app, these constraints are nontrivial.

But moreover, I'm puzzled why `-shouldRemovePresentersView` is considered to be a worthwhile thing in the first place. iOS doesn't save memory by unloading views anymore; it jettisons views' backing stores, which still seems like a great thing to do when there's a fullscreen or current-context presentation going on.


Steps to Reproduce
---

1. Build and run the attached demo app.
2. Tap the "Present a view controller" button to begin a current-context presentation.
3. Tap the "Dismiss me" button to end the presentation


Expected results
---

The navigation controller from which the modal view controller was presented is once again visible.


Actual results
---

The navigation controller appears to be missing; in fact, it has a zero frame because all of its constraints were obliterated.