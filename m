Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE61E3E26A9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 11:00:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgzwN6NhRz3cM0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 19:00:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=pulehui@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ggzvx6n0Nz3cGw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 19:00:26 +1000 (AEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Ggzv23VXmzYll5;
 Fri,  6 Aug 2021 16:59:42 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 6 Aug 2021 16:59:45 +0800
Received: from [10.67.109.184] (10.67.109.184) by
 dggpemm500019.china.huawei.com (7.185.36.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 6 Aug 2021 16:59:44 +0800
Subject: Re: [PATCH] powerpc/kprobes: Fix kprobe Oops happens in booke
To: Christophe Leroy <christophe.leroy@csgroup.eu>, <oleg@redhat.com>,
 <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <naveen.n.rao@linux.vnet.ibm.com>, <mhiramat@kernel.org>,
 <peterz@infradead.org>, <npiggin@gmail.com>, <ruscur@russell.cc>
References: <20210804143735.148547-1-pulehui@huawei.com>
 <021cf081-77a9-8e4e-a246-4faaf3937dbe@csgroup.eu>
From: Pu Lehui <pulehui@huawei.com>
Message-ID: <4696431d-daea-2cdd-906f-fa0aa7a6abd7@huawei.com>
Date: Fri, 6 Aug 2021 16:59:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <021cf081-77a9-8e4e-a246-4faaf3937dbe@csgroup.eu>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500019.china.huawei.com (7.185.36.180)
X-CFilter-Loop: Reflected
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: zhangjinhao2@huawei.com, xukuohai@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2021/8/5 17:51, Christophe Leroy wrote:
> 
> 
> Le 04/08/2021 à 16:37, Pu Lehui a écrit :
>> When using kprobe on powerpc booke series processor, Oops happens
>> as show bellow:
>>
>> [   35.861352] Oops: Exception in kernel mode, sig: 5 [#1]
>> [   35.861676] BE PAGE_SIZE=4K SMP NR_CPUS=24 QEMU e500
>> [   35.861905] Modules linked in:
>> [   35.862144] CPU: 0 PID: 76 Comm: sh Not tainted 
>> 5.14.0-rc3-00060-g7e96bf476270 #18
>> [   35.862610] NIP:  c0b96470 LR: c00107b4 CTR: c0161c80
>> [   35.862805] REGS: c387fe70 TRAP: 0700   Not tainted 
>> (5.14.0-rc3-00060-g7e96bf476270)
>> [   35.863198] MSR:  00029002 <CE,EE,ME>  CR: 24022824  XER: 20000000
>> [   35.863577]
>> [   35.863577] GPR00: c0015218 c387ff20 c313e300 c387ff50 00000004 
>> 40000002 40000000 0a1a2cce
>> [   35.863577] GPR08: 00000000 00000004 00000000 59764000 24022422 
>> 102490c2 00000000 00000000
>> [   35.863577] GPR16: 00000000 00000000 00000040 10240000 10240000 
>> 10240000 10240000 10220000
>> [   35.863577] GPR24: ffffffff 10240000 00000000 00000000 bfc655e8 
>> 00000800 c387ff50 00000000
>> [   35.865367] NIP [c0b96470] schedule+0x0/0x130
>> [   35.865606] LR [c00107b4] interrupt_exit_user_prepare_main+0xf4/0x100
>> [   35.865974] Call Trace:
>> [   35.866142] [c387ff20] [c0053224] irq_exit+0x114/0x120 (unreliable)
>> [   35.866472] [c387ff40] [c0015218] interrupt_return+0x14/0x13c
>> [   35.866728] --- interrupt: 900 at 0x100af3dc
>> [   35.866963] NIP:  100af3dc LR: 100de020 CTR: 00000000
>> [   35.867177] REGS: c387ff50 TRAP: 0900   Not tainted 
>> (5.14.0-rc3-00060-g7e96bf476270)
>> [   35.867488] MSR:  0002f902 <CE,EE,PR,FP,ME>  CR: 20022422  XER: 
>> 20000000
>> [   35.867808]
>> [   35.867808] GPR00: c001509c bfc65570 1024b4d0 00000000 100de020 
>> 20022422 bfc655a8 100af3dc
>> [   35.867808] GPR08: 0002f902 00000000 00000000 00000000 72656773 
>> 102490c2 00000000 00000000
>> [   35.867808] GPR16: 00000000 00000000 00000040 10240000 10240000 
>> 10240000 10240000 10220000
>> [   35.867808] GPR24: ffffffff 10240000 00000000 00000000 bfc655e8 
>> 10245910 ffffffff 00000001
>> [   35.869406] NIP [100af3dc] 0x100af3dc
>> [   35.869578] LR [100de020] 0x100de020
>> [   35.869751] --- interrupt: 900
>> [   35.870001] Instruction dump:
>> [   35.870283] 40c20010 815e0518 714a0100 41e2fd04 39200000 913e00c0 
>> 3b1e0450 4bfffd80
>> [   35.870666] 0fe00000 92a10024 4bfff1a9 60000000 <7fe00008> 7c0802a6 
>> 93e1001c 7c5f1378
>> [   35.871339] ---[ end trace 23ff848139efa9b9 ]---
>>
>> There is no real mode for booke arch and the MMU translation is
>> always on. The corresponding MSR_IS/MSR_DS bit in booke is used
>> to switch the address space, but not for real mode judgment.
> 
> Can you explain more the link between that explanation and the Oops 
> itself ?
> 
In fact, the same Oops appears when any probed function is hit, like 
do_nanosleep

/ # echo "p:myprobe do_nanosleep" > /sys/kernel/debug/tracing/kprobe_events
/ # echo 1 > /sys/kernel/debug/tracing/events/kprobes/myprobe/enable
/ # sleep 1
[   50.076730] Oops: Exception in kernel mode, sig: 5 [#1]
[   50.077017] BE PAGE_SIZE=4K SMP NR_CPUS=24 QEMU e500
[   50.077221] Modules linked in:
[   50.077462] CPU: 0 PID: 77 Comm: sleep Not tainted 
5.14.0-rc4-00022-g251a1524293d #21
[   50.077887] NIP:  c0b9c4e0 LR: c00ebecc CTR: 00000000
[   50.078067] REGS: c3883de0 TRAP: 0700   Not tainted 
(5.14.0-rc4-00022-g251a1524293d)
[   50.078349] MSR:  00029000 <CE,EE,ME>  CR: 24000228  XER: 20000000
[   50.078675]
[   50.078675] GPR00: c00ebdf0 c3883e90 c313e300 c3883ea0 00000001 
00000000 c3883ecc 00000001
[   50.078675] GPR08: c100598c c00ea250 00000004 00000000 24000222 
102490c2 bff4180c 101e60d4
[   50.078675] GPR16: 00000000 102454ac 00000040 10240000 10241100 
102410f8 10240000 00500000
[   50.078675] GPR24: 00000002 00000000 c3883ea0 00000001 00000000 
0000c350 3b9b8d50 00000000
[   50.080151] NIP [c0b9c4e0] do_nanosleep+0x0/0x190
[   50.080352] LR [c00ebecc] hrtimer_nanosleep+0x14c/0x1e0
[   50.080638] Call Trace:
[   50.080801] [c3883e90] [c00ebdf0] hrtimer_nanosleep+0x70/0x1e0 
(unreliable)
[   50.081110] [c3883f00] [c00ec004] sys_nanosleep_time32+0xa4/0x110
[   50.081336] [c3883f40] [c001509c] ret_from_syscall+0x0/0x28
[   50.081541] --- interrupt: c00 at 0x100a4d08
[   50.081749] NIP:  100a4d08 LR: 101b5234 CTR: 00000003
[   50.081931] REGS: c3883f50 TRAP: 0c00   Not tainted 
(5.14.0-rc4-00022-g251a1524293d)
[   50.082183] MSR:  0002f902 <CE,EE,PR,FP,ME>  CR: 24000222  XER: 00000000
[   50.082457]
[   50.082457] GPR00: 000000a2 bf980040 1024b4d0 bf980084 bf980084 
64000000 00555345 fefefeff
[   50.082457] GPR08: 7f7f7f7f 101e0000 00000069 00000003 28000422 
102490c2 bff4180c 101e60d4
[   50.082457] GPR16: 00000000 102454ac 00000040 10240000 10241100 
102410f8 10240000 00500000
[   50.082457] GPR24: 00000002 bf9803f4 10240000 00000000 00000000 
100039e0 00000000 102444e8
[   50.083789] NIP [100a4d08] 0x100a4d08
[   50.083917] LR [101b5234] 0x101b5234
[   50.084042] --- interrupt: c00
[   50.084238] Instruction dump:
[   50.084483] 4bfffc40 60000000 60000000 60000000 9421fff0 39400402 
914200c0 38210010
[   50.084841] 4bfffc20 00000000 00000000 00000000 <7fe00008> 7c0802a6 
7c892378 93c10048
[   50.085487] ---[ end trace f6fffe98e2fa8f3e ]---
[   50.085678]
Trace/breakpoint trap

In current code, kprobe_handler() will be called by 'program check 
exception' when a probe is hit,
and kprobe_handler() will check whether it is in real-mode according to 
MSR_IR/MSR_DR bit.
When in real-mode(MSR_IR/MSR_DR are 0), the following process will be 
executed to trigger Oops:
__exception() -> exception_common() -> die("Exception in kernel mode")

But for booke arch, the corresponding bits, which is called 
MSR_IS/MSR_DS, are used for switching
the non-privileged and privileged virtual address spaces, and users can 
change both spaces by
setting MSR_IS/MSR_DS bit. So, when kernel in privileged 
space(MSR_IS/MSR_DS are 0), kprobe trap will
meet a Oops.

And also, the MMU of booke is always enabled, so when other trap 
appears, the problem mentioned in
21f8b2fa3ca5 will never met.
>>
>> Fixes: 21f8b2fa3ca5 ("powerpc/kprobes: Ignore traps that happened in 
>> real mode")
>> Signed-off-by: Pu Lehui <pulehui@huawei.com>
>> ---
>>   arch/powerpc/include/asm/ptrace.h | 6 ++++++
>>   arch/powerpc/kernel/kprobes.c     | 5 +----
>>   2 files changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/ptrace.h 
>> b/arch/powerpc/include/asm/ptrace.h
>> index 3e5d470a6155..4aec1a97024b 100644
>> --- a/arch/powerpc/include/asm/ptrace.h
>> +++ b/arch/powerpc/include/asm/ptrace.h
>> @@ -187,6 +187,12 @@ static inline unsigned long frame_pointer(struct 
>> pt_regs *regs)
>>   #define user_mode(regs) (((regs)->msr & MSR_PR) != 0)
>>   #endif
>> +#ifdef CONFIG_BOOKE
>> +#define real_mode(regs)    0
>> +#else
>> +#define real_mode(regs)    (!((regs)->msr & MSR_IR) || !((regs)->msr 
>> & MSR_DR))
>> +#endif
>> +
> 
> You don't need an #ifdef stuff here, you can base your testing on 
> IS_ENABLED(CONFIG_BOOKE)
>
I'll fix in v2.
>>   #define force_successful_syscall_return()   \
>>       do { \
>>           set_thread_flag(TIF_NOERROR); \
>> diff --git a/arch/powerpc/kernel/kprobes.c 
>> b/arch/powerpc/kernel/kprobes.c
>> index cbc28d1a2e1b..fac9a5974718 100644
>> --- a/arch/powerpc/kernel/kprobes.c
>> +++ b/arch/powerpc/kernel/kprobes.c
>> @@ -289,10 +289,7 @@ int kprobe_handler(struct pt_regs *regs)
>>       unsigned int *addr = (unsigned int *)regs->nip;
>>       struct kprobe_ctlblk *kcb;
>> -    if (user_mode(regs))
>> -        return 0;
>> -
>> -    if (!(regs->msr & MSR_IR) || !(regs->msr & MSR_DR))
>> +    if (user_mode(regs) || real_mode(regs))
>>           return 0;
>>       /*
>>
> .
