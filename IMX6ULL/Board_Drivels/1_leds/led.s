.global _start


_start:
@   是能外设时钟
    ldr r0 , =0x020c4068
    ldr r1 , =0xffffffff
    str r1 , [r0]         @将0xffffffff写入CCGR0中

    ldr r0 , =0x020c406c
    str r1 , [r0]         @将0xffffffff写入CCGR1中

    ldr r0 , =0x020c4070
    str r1 , [r0]         @将0xffffffff写入CCGR2中

    ldr r0 , =0x020c4074
    str r1 , [r0]         @将0xffffffff写入CCGR3中

    ldr r0 , =0x020c4078
    str r1 , [r0]         @将0xffffffff写入CCGR4中

    ldr r0 , =0x020c407c
    str r1 , [r0]         @将0xffffffff写入CCGR5中

    ldr r0 , =0x020c4080
    str r1 , [r0]         @将0xffffffff写入CCGR6中

@    复用,配置GPIO1_IO03 PIN的复用为GPIO，也就是设置IOMUXC_SW_MUX_CTL_PAD_GPIO1_IO03=5
@   IOMUXC_SW_MUX_CTL_PAD_GPIO1_IO03地址是0x020e0068

    ldr r0 , = 0x020e0068
    ldr r1 , = 0x5

@   配置GPIO1_IO03的电气属性，也就是设置IOMUXC_SW_PAD_GPIO1_I001    
@   寄存器地址是0x020e02f4
@   bit0 : 0 低速率
@   bit5-3 :110 R0/6驱动能力
@   bit7-6 :10  100Mhz速度
@   bit11 :0 关闭开路输出
@   bit12 :1 是能pull/keeper
@   bit13 :0 kepper
@   bit15-14 :00 100K下拉
@   bit16 :0 关闭hys
@   
    ldr r0, =0x020e02f4
    ldr r1, =0x10b0
    str r1, [r0]


@设置GPIO 设置寄存器GPIO1_GPIR寄存器，设置GPIO1_GDIR03为输出
@ GPIO1_GDIR寄存器地址是0x0209c004 ,设置GPIO1_GDIR寄存器bit3为1
    ldr r0, =0x0209c004
    ldr r1, =0x8
    str r1, [r0]

@  打开led，也就是设置GPIO1_IO03为0
@  GPIO_DR寄存器地址是0x0209c000
    ldr r0, =0x0209c000
    ldr r1, =0
    str r1, [r0]

loop:
    b loop
