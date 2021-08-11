Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 324513E8A90
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 08:49:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gl0lt1Gcqz3cJ2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 16:48:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=pulehui@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gl0lN0mv8z3048
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 16:48:28 +1000 (AEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Gl0fd4DyVz86Hg;
 Wed, 11 Aug 2021 14:44:25 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 11 Aug 2021 14:48:22 +0800
Received: from [10.67.109.184] (10.67.109.184) by
 dggpemm500019.china.huawei.com (7.185.36.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 11 Aug 2021 14:48:22 +0800
Subject: Re: [PATCH v2] powerpc/kprobes: Fix kprobe Oops happens in booke
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20210809023658.218915-1-pulehui@huawei.com>
 <df17030e-484c-ebd4-0225-6923e2982282@huawei.com>
 <9c6cdb3f-37ac-9a8c-2c75-3a939ed76ab4@csgroup.eu>
From: Pu Lehui <pulehui@huawei.com>
Message-ID: <c00161c6-878d-523a-0f04-7ee79b86d5fe@huawei.com>
Date: Wed, 11 Aug 2021 14:48:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9c6cdb3f-37ac-9a8c-2c75-3a939ed76ab4@csgroup.eu>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 zhangjinhao2@huawei.com, paulus@samba.org, mhiramat@kernel.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2021/8/11 13:31, Christophe Leroy wrote:
> 
> 
> Le 11/08/2021 à 04:53, Pu Lehui a écrit :
>> Ping, serious problem here. All booke ppc will trigger Oops when
>> perform kprobes related operations.
> 
> As far as I can see it is in the fixes branch: 
> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=fixes 
> 
> 
Thanks.
>>
>> On 2021/8/9 10:36, Pu Lehui wrote:
>>> When using kprobe on powerpc booke series processor, Oops happens
>>> as show bellow:
>>>
>>> / # echo "p:myprobe do_nanosleep" > 
>>> /sys/kernel/debug/tracing/kprobe_events
>>> / # echo 1 > /sys/kernel/debug/tracing/events/kprobes/myprobe/enable
>>> / # sleep 1
>>> [   50.076730] Oops: Exception in kernel mode, sig: 5 [#1]
>>> [   50.077017] BE PAGE_SIZE=4K SMP NR_CPUS=24 QEMU e500
>>> [   50.077221] Modules linked in:
>>> [   50.077462] CPU: 0 PID: 77 Comm: sleep Not tainted 
>>> 5.14.0-rc4-00022-g251a1524293d #21
>>> [   50.077887] NIP:  c0b9c4e0 LR: c00ebecc CTR: 00000000
>>> [   50.078067] REGS: c3883de0 TRAP: 0700   Not tainted 
>>> (5.14.0-rc4-00022-g251a1524293d)
>>> [   50.078349] MSR:  00029000 <CE,EE,ME>  CR: 24000228  XER: 20000000
>>> [   50.078675]
>>> [   50.078675] GPR00: c00ebdf0 c3883e90 c313e300 c3883ea0 00000001 
>>> 00000000 c3883ecc 00000001
>>> [   50.078675] GPR08: c100598c c00ea250 00000004 00000000 24000222 
>>> 102490c2 bff4180c 101e60d4
>>> [   50.078675] GPR16: 00000000 102454ac 00000040 10240000 10241100 
>>> 102410f8 10240000 00500000
>>> [   50.078675] GPR24: 00000002 00000000 c3883ea0 00000001 00000000 
>>> 0000c350 3b9b8d50 00000000
>>> [   50.080151] NIP [c0b9c4e0] do_nanosleep+0x0/0x190
>>> [   50.080352] LR [c00ebecc] hrtimer_nanosleep+0x14c/0x1e0
>>> [   50.080638] Call Trace:
>>> [   50.080801] [c3883e90] [c00ebdf0] hrtimer_nanosleep+0x70/0x1e0 
>>> (unreliable)
>>> [   50.081110] [c3883f00] [c00ec004] sys_nanosleep_time32+0xa4/0x110
>>> [   50.081336] [c3883f40] [c001509c] ret_from_syscall+0x0/0x28
>>> [   50.081541] --- interrupt: c00 at 0x100a4d08
>>> [   50.081749] NIP:  100a4d08 LR: 101b5234 CTR: 00000003
>>> [   50.081931] REGS: c3883f50 TRAP: 0c00   Not tainted 
>>> (5.14.0-rc4-00022-g251a1524293d)
>>> [   50.082183] MSR:  0002f902 <CE,EE,PR,FP,ME>  CR: 24000222  XER: 
>>> 00000000
>>> [   50.082457]
>>> [   50.082457] GPR00: 000000a2 bf980040 1024b4d0 bf980084 bf980084 
>>> 64000000 00555345 fefefeff
>>> [   50.082457] GPR08: 7f7f7f7f 101e0000 00000069 00000003 28000422 
>>> 102490c2 bff4180c 101e60d4
>>> [   50.082457] GPR16: 00000000 102454ac 00000040 10240000 10241100 
>>> 102410f8 10240000 00500000
>>> [   50.082457] GPR24: 00000002 bf9803f4 10240000 00000000 00000000 
>>> 100039e0 00000000 102444e8
>>> [   50.083789] NIP [100a4d08] 0x100a4d08
>>> [   50.083917] LR [101b5234] 0x101b5234
>>> [   50.084042] --- interrupt: c00
>>> [   50.084238] Instruction dump:
>>> [   50.084483] 4bfffc40 60000000 60000000 60000000 9421fff0 39400402 
>>> 914200c0 38210010
>>> [   50.084841] 4bfffc20 00000000 00000000 00000000 <7fe00008> 
>>> 7c0802a6 7c892378 93c10048
>>> [   50.085487] ---[ end trace f6fffe98e2fa8f3e ]---
>>> [   50.085678]
>>> Trace/breakpoint trap
>>>
>>> There is no real mode for booke arch and the MMU translation is
>>> always on. The corresponding MSR_IS/MSR_DS bit in booke is used
>>> to switch the address space, but not for real mode judgment.
>>>
>>> Fixes: 21f8b2fa3ca5 ("powerpc/kprobes: Ignore traps that happened in 
>>> real mode")
>>> Signed-off-by: Pu Lehui <pulehui@huawei.com>
>>> ---
>>> v1->v2:
>>> - use IS_ENABLED(CONFIG_BOOKE) as suggested by Michael Ellerman and
>>>    Christophe Leroy
>>> - update Oops log to make problem clear
>>>
>>>   arch/powerpc/kernel/kprobes.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/kernel/kprobes.c 
>>> b/arch/powerpc/kernel/kprobes.c
>>> index cbc28d1a2e1b..7a7cd6bda53e 100644
>>> --- a/arch/powerpc/kernel/kprobes.c
>>> +++ b/arch/powerpc/kernel/kprobes.c
>>> @@ -292,7 +292,8 @@ int kprobe_handler(struct pt_regs *regs)
>>>       if (user_mode(regs))
>>>           return 0;
>>> -    if (!(regs->msr & MSR_IR) || !(regs->msr & MSR_DR))
>>> +    if (!IS_ENABLED(CONFIG_BOOKE) &&
>>> +        (!(regs->msr & MSR_IR) || !(regs->msr & MSR_DR)))
>>>           return 0;
>>>       /*
>>>
> .
