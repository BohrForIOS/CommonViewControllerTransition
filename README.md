# CommonViewControllerTransition
在Object-C中，控制器的转场有两类，一类是导航控制器的push和pop，一类是普通控制器的present和dismiss，我们经常使用系统的API（如下所示）来实现控制器的转场动画

#####1.导航控制器里使用到的转场动画代码
>[self.navigationController pushViewController:vc animated:YES]

>[self.navigationController popViewControllerAnimated:YES]

#####2.普通控制器里使用到的转场动画代码
>[self presentViewController:secVC animated:YES completion:nil];

> [self dismissViewControllerAnimated:YES completion:nil];

但是系统的转场动画可能有时候不是我们想要的效果，我们想自己定制控制器的转场动画，这就需要我们对控制器的转场动画的实现进行了解，本文只是针对普通控制器如何自定义实现转场动画的步骤进行陈述。

自定义动画的效果很简单，如下。

![image](https://github.com/BohrForIOS/CommonViewControllerTransition/blob/master/CustomPresent/ViewControllerTransition.gif ) 

一、自定义的方式present出一个控制器；

二、自定义的方式dismiss刚才present的控制器；

####实现的步骤如下：
1.第一个控制器：遵守控制器转场代理协议UIViewControllerTransitioningDelegate

2.第一个控制器：实现控制器转场代理协议的present方法，和dismiss方法

3.点击present按钮时，让第二个控制器的转场代理transitioningDelegate为第一个控制器，并设置modal出的方式modalPresentationStyle为用户自定义，调用系统presentViewController方法[self presentViewController:secVC animated:YES completion:nil];

看起来十分简单，就三个步骤，实现控制器转场代理协议的方法即可。

需要说明的是，协议方法present和dismiss返回的是一个遵守控制器转场动画协议UIViewControllerAnimatedTransitioning的对象，这个对象控制着不同的转场动画的效果，而转场动画协议UIViewControllerAnimatedTransitioning负责转场动画的实现，这个协议有两个方法，一个是动画的时间，一个是动画的实现，需要用户自己定义

详情见简书地址：http://www.jianshu.com/p/d88030216001
