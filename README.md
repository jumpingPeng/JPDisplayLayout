# JPDisplayLayout


此demo主要给出了5种Cell自适应高度的解决方案，并对比了每种实现方案的流畅度。
也可以说是从UI最不流畅的一种我们慢慢优化，从而实现了这5种解决方案。



我们是观察屏幕的FPS来判断屏幕在操作时是否卡顿。

我们在对其滑动操作时，可以根据下方这个FPS组件来观察屏幕的流畅度。
当然，每个内容列表页的布局和显示内容都是相同的，不过不同的Cell自适应解决方案所对应的UI流畅度也是不同的。


下面每种Cell的自适应的实现方案。

1.
Autolayout + AutomaticDimension: 该解决方案对应着完全由AutoLayout进行布局，
Cell自适应的高度也不用我们自己计算，而是使用系统提供的解决方案UITableViewAutomaticDimension来解决。
当然，使用UITableViewAutomaticDimension要依赖于你添加的约束，这种实现方案用起来简单，不过UI流畅度方面不太理想。
当TableView快速滑动时，就会出现掉帧，卡的不要不要的。

2.
Autolayout + CountHeight: 这种解决方案依然是采用AutoLayout的方式来对Cell的内容进行布局，
不过Cell的高度我们是自己计算的，当然我们这个计算Cell高度的过程是放在子线程中进行的，所以这种实现方式要优于第一种实现方式。


3.
FrameLayout + CountHeight: 为了进一步提高流畅度，我们采用了纯Frame布局。
因为Autolayout最终也是会被转换成Frame进行布局的，所以我们索性就使用Frame对整个Cell中的元素进行布局。
当然Cell高度已经Cell中可变内容的高度都是在子线程中进行计算的，这也是优化很重要的一步。
这种实现方式还是比较流畅的，可以作为折中的方案。



4.
YYKit + CountHeight: 这种解决方案用到了YYKit中的控件，并且使用Frame布局与Cell高度的计算。
这种方式要由于上面的解决方案，因为YYKit中的一些控件做了优化。


5.
AsyncDisplayKit + CountHeight: 则是使用了AsyncDisplayKit中提供的相关Note代替系统的原生控件，
这种实现方式是这5种实现方式中最为流畅的。稍后会详细介绍。
