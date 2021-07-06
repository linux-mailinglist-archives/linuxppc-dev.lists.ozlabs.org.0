Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A72A3BD827
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 16:11:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GK4H81zd5z30DG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 00:11:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GK4Gq3s5jz2xYt
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 00:11:12 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GK4Gj42TvzB9qy;
 Tue,  6 Jul 2021 16:11:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gsOjby0jUkVR; Tue,  6 Jul 2021 16:11:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GK4Gh1lQKzB9qj;
 Tue,  6 Jul 2021 16:11:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 370218B7A9;
 Tue,  6 Jul 2021 16:11:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id goS3JGdg3fxT; Tue,  6 Jul 2021 16:11:08 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CCFD78B7A3;
 Tue,  6 Jul 2021 16:11:07 +0200 (CEST)
Subject: Re: Hitting BUG_ON in do_notify_resume() with gdb and SIGTRAP
To: Radu Rendec <radu.rendec@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
References: <6b5327e32549860c1e6c73e5b669528bfb383df2.camel@gmail.com>
 <d02fca74-933b-4586-496b-65511e435628@csgroup.eu>
 <786399a77d82890a391172fee269272e12c52489.camel@gmail.com>
 <200445ae-c3fc-ccc8-f77d-aebce2b09046@csgroup.eu>
 <159a8bf58c9f8838bf38e495a3a376aaae14eaa6.camel@gmail.com>
 <376d1887-1deb-1c04-a2c7-3680daef7505@csgroup.eu>
 <c5f245d84ba7b64263af47743aac1e1ab67c0ca4.camel@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <7d300d51-22f9-26ab-883b-ed757e0fc2e6@csgroup.eu>
Date: Tue, 6 Jul 2021 16:11:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c5f245d84ba7b64263af47743aac1e1ab67c0ca4.camel@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/07/2021 à 16:05, Radu Rendec a écrit :
> On Tue, 2021-07-06 at 15:53 +0200, Christophe Leroy wrote:
>> Le 06/07/2021 à 15:50, Radu Rendec a écrit :
>>> On Tue, 2021-07-06 at 15:16 +0200, Christophe Leroy wrote:
>>>> Le 06/07/2021 à 13:56, Radu Rendec a écrit :
>>>>> On Tue, 2021-07-06 at 12:43 +0200, Christophe Leroy wrote:
>>>>>> Le 04/07/2021 à 23:38, Radu Rendec a écrit :
>>>>>>> I'm trying to set up my (virtual) environment to test an old bug in the
>>>>>>> PPC32 ptrace() code. I came across a completely different problem,
>>>>>>> which seems to make gdb pretty much unusable on PPC32. I'm not sure if
>>>>>>> this is a real kernel bug or maybe something wrong with my
>>>>>>> configuration.
>>>>>>>
>>>>>>> I'm running kernel 5.13 in a qemu VM with one e500mc CPU. I am running
>>>>>>> native gdb (inside the VM) and setting a breakpoint in main() in a test
>>>>>>> "hello world" program. Upon running the test program, I am hitting the
>>>>>>> BUG_ON in do_notify_resume() on line 292. The kernel bug log snippet is
>>>>>>> included below at the end of the email.
>>>>>>>
>>>>>>> FWIW, gdb says:
>>>>>>> Program terminated with signal SIGTRAP, Trace/breakpoint trap.
>>>>>>> The program no longer exists.
>>>>>>>
>>>>>>> I also added a pr_info() to do_notify_resume() just to see how much
>>>>>>> different 'regs' and 'current->thread.regs' are. Surprisingly, they are
>>>>>>> just 0x30 apart: regs=c7955f10 cur=c7955f40. Also, 'current' seems to
>>>>>>> be OK (pid and comm are consistent with the test program).
>>>>>>
>>>>>> The TRAP = 0x7d8 is obviously wrong.
>>>>>>
>>>>>> Need to know which 'TRAP' it is exactly.
>>>>>> Could you try to dump what we have at the correct regs ?
>>>>>> Something like 'show_regs(current->thread.regs)' should do it.
>>>>>
>>>>> Sure, please see the output below. It looks to me like the "correct"
>>>>> regs are just garbage. Either they are overwritten or current->thread.regs
>>>>> is wrong. But in any case, r1 = 0 doesn't look good.
>>>>
>>>> Yes indeed. I think I identified the problem. For Critical interrupts like DEBUG interrupt, struct
>>>> exception_regs is added, therefore the frame has 12x4 (0x30) more bytes. That's what you see.
>>>>
>>>> Commit
>>>> https://github.com/linuxppc/linux/commit/db297c3b07af7856fb7c666fbc9792d8e37556be#diff-dd6b952a3980da19df4facccdb4f3dddeb8cef56ee384c7f03d02b23b0c6cb26
>>>>
>>>> Need to find the best solution now to fix that.
>>>
>>> Awesome, happy to see you figured it out so quickly.
>>>
>>> I'm not sure if it makes any sense, but one thing that comes to mind is
>>> to put struct exception_regs before struct pt_regs when the frame is
>>> saved. Unless of course other parts of the code expect the opposite.
>>
>> Yes I think it is a good idea. I think I won't have time to look at that before summer vacation though.
> 
> I can take a stab at it. I'm not familiar with that part of the code,
> but the best way to learn is to get your hands dirty :) In the worst
> case, I won't fix it.
> 

Not that easy in fact.
After looking once more, the best solution I see now would be to move the content of struct 
exception_regs into the second part of struct pt_regs (the kernel one in asm/ptrace.h).

Changes should be limited to head_booke.h and asm-offsets.c
struct exception_regs and STACK_EXC_LVL_FRAME_SIZE should go away.

Christophe
