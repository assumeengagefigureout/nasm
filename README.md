这个是针对Linux用户想要安全来联系汇编的一个环境配置
主要是x86_64的一个主机
使用了docker来隔离
并且将引导写道了扇区，bootloader部分我们是通过qemu来实现的引导
然后我们最主要的是完全隔离，但是交互式还是需要一个Interactivte 的方法来实现
所以说我们的现在调试只能是单步调试gdb
(((
    waiting for pr please
)))


