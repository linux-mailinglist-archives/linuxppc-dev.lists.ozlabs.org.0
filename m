Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E09C39E595
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 19:36:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzLCH0Mv7z3bsF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 03:36:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzLBt4P92z2yRQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 03:36:18 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FzLBl1Q4mzB92x;
 Mon,  7 Jun 2021 19:36:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XkA2fU4fjAHo; Mon,  7 Jun 2021 19:36:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FzLBl0PjgzB92v;
 Mon,  7 Jun 2021 19:36:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 046EA8B79E;
 Mon,  7 Jun 2021 19:36:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WJpbFR7UO37z; Mon,  7 Jun 2021 19:36:14 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 88FF68B79C;
 Mon,  7 Jun 2021 19:36:14 +0200 (CEST)
Subject: Re: [PATCH] powerpc/kprobes: Pass ppc_inst as a pointer to
 emulate_step() on ppc32
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20210520072909.2901326-1-naveen.n.rao@linux.vnet.ibm.com>
 <1623065577.8oijg4kgxv.naveen@linux.ibm.com>
 <d10d599c-065e-6baa-af01-6c099482ece5@csgroup.eu>
Message-ID: <5affed0d-a86f-43de-6f3e-4a4b8da5ffb2@csgroup.eu>
Date: Mon, 7 Jun 2021 19:36:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d10d599c-065e-6baa-af01-6c099482ece5@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/06/2021 à 16:31, Christophe Leroy a écrit :
> 
> 
> Le 07/06/2021 à 13:34, Naveen N. Rao a écrit :
>> Naveen N. Rao wrote:
>>> Trying to use a kprobe on ppc32 results in the below splat:
>>>     BUG: Unable to handle kernel data access on read at 0x7c0802a6
>>>     Faulting instruction address: 0xc002e9f0
>>>     Oops: Kernel access of bad area, sig: 11 [#1]
>>>     BE PAGE_SIZE=4K PowerPC 44x Platform
>>>     Modules linked in:
>>>     CPU: 0 PID: 89 Comm: sh Not tainted 5.13.0-rc1-01824-g3a81c0495fdb #7
>>>     NIP:  c002e9f0 LR: c0011858 CTR: 00008a47
>>>     REGS: c292fd50 TRAP: 0300   Not tainted  (5.13.0-rc1-01824-g3a81c0495fdb)
>>>     MSR:  00009000 <EE,ME>  CR: 24002002  XER: 20000000
>>>     DEAR: 7c0802a6 ESR: 00000000
>>>     <snip>
>>>     NIP [c002e9f0] emulate_step+0x28/0x324
>>>     LR [c0011858] optinsn_slot+0x128/0x10000
>>>     Call Trace:
>>>      opt_pre_handler+0x7c/0xb4 (unreliable)
>>>      optinsn_slot+0x128/0x10000
>>>      ret_from_syscall+0x0/0x28
>>>
>>> The offending instruction is:
>>>     81 24 00 00     lwz     r9,0(r4)
>>>
>>> Here, we are trying to load the second argument to emulate_step():
>>> struct ppc_inst, which is the instruction to be emulated. On ppc64,
>>> structures are passed in registers when passed by value. However, per
>>> the ppc32 ABI, structures are always passed to functions as pointers.
>>> This isn't being adhered to when setting up the call to emulate_step()
>>> in the optprobe trampoline. Fix the same.
>>>
>>> Fixes: eacf4c0202654a ("powerpc: Enable OPTPROBES on PPC32")
>>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>>> ---
>>>  arch/powerpc/kernel/optprobes.c | 8 ++++++--
>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> Christophe,
>> Can you confirm if this patch works for you? It would be good if this can go in v5.13.
>>
> 
> I'm trying to use kprobes, but I must be missing something. I have tried to follow the exemple in 
> kernel's documentation:
> 
>   # echo 'p:myprobe do_sys_open dfd=%r3' > /sys/kernel/debug/tracing/kprobe_events
> 
>   # echo 1 > /sys/kernel/debug/tracing/events/kprobes/myprobe/enable
> 
>   # cat /sys/kernel/debug/kprobes/list
> 
>   c00122e4  k  kretprobe_trampoline+0x0    [OPTIMIZED]
>   c018a1b4  k  do_sys_open+0x0    [OPTIMIZED]
> 
>   # cat /sys/kernel/debug/tracing/tracing_on
> 
>   1
> 
>   # cat /sys/kernel/debug/tracing/trace
> 
> # tracer: nop
> #
> # entries-in-buffer/entries-written: 0/0   #P:1
> #
> #                                _-----=> irqs-off
> #                               / _----=> need-resched
> #                              | / _---=> hardirq/softirq
> #                              || / _--=> preempt-depth
> #                              ||| /     delay
> #           TASK-PID     CPU#  ||||   TIMESTAMP  FUNCTION
> #              | |         |   ||||      |         |
> 
> 
> 
> So it looks like I get no event. I can't believe that do_sys_open() is never hit.
> 
> This is without your patch, so it should Oops ?
> 
> 
> Then it looks like something is locked up somewhere, because I can't do anything else:
> 
>   # echo 'p:myprobe2 do_sys_openat2 dfd=%r3' >/sys/kernel/debug/tracing/kprobe_events
> 
>   -sh: can't create /sys/kernel/debug/tracing/kprobe_events: Device or resource busy
> 
>   # echo '-:myprobe' > /sys/kernel/debug/tracing/kprobe_events
> 
>   -sh: can't create /sys/kernel/debug/tracing/kprobe_events: Device or resource busy
> 
>   # echo > /sys/kernel/debug/tracing/kprobe_events
> 
>   -sh: can't create /sys/kernel/debug/tracing/kprobe_events: Device or resource busy
> 
> 

Ok, did a new test. Seems like do_sys_open() is really never called.
I set the test at do_sys_openat2 , it was not optimised and was working.
I set the test at do_sys_openat2+0x10 , it was optimised and crashed.
Now I'm going to test the patch.

When I set an event, is that normal that it removes the previous one ? Then we can have only one 
event at a time ? And then when that event is enabled we get 'Device or resource busy' when trying 
to add a new one ?

Christophe
