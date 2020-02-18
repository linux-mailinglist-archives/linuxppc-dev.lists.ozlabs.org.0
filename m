Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B47C1620A3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 07:00:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48M9DZ4fvDzDqX2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 16:59:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=PtLbXmu1; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48M9Bd40v5zDqDy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 16:58:15 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48M9BT1TNYz9tyXP;
 Tue, 18 Feb 2020 06:58:09 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=PtLbXmu1; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YqYe0eJh2thM; Tue, 18 Feb 2020 06:58:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48M9BS75FDz9tyXN;
 Tue, 18 Feb 2020 06:58:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582005489; bh=ogw+hy4IWhCHrGtRBqsL5QxHQjeYs+krpmX6nrtbSbE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=PtLbXmu1+ZOmJ2xAxpgFuH6/2G0nBHAA0FfqPouP23yy+aL0KKAXNa7+hJYEHPovv
 rl/YXu2Gb+KzNqoteIW7pehm8e6E1kUkrYaKKRWnq0pV4/qzH+5ivpnC9Hm8/YMiei
 hkngmJfanGCpau1GIwVtCM/59nnn+/DXAy6ZhVuY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9B8598B7C7;
 Tue, 18 Feb 2020 06:58:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id eun3vn1RxS_s; Tue, 18 Feb 2020 06:58:09 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 656438B752;
 Tue, 18 Feb 2020 06:58:07 +0100 (CET)
Subject: Re: [PATCH] powerpc/kprobes: Fix trap address when trap happened in
 real mode
To: Masami Hiramatsu <mhiramat@kernel.org>
References: <b1451438f7148ad0e03306a1f1409f4ad1d6ec7c.1581684263.git.christophe.leroy@c-s.fr>
 <20200214225434.464ec467ad9094961abb8ddc@kernel.org>
 <e09d3c42-542e-48c1-2f1e-cfe605b05bec@c-s.fr>
 <20200216213411.824295a321d8fa979dedbbbe@kernel.org>
 <baee8186-549a-f6cf-3619-884b6d708185@c-s.fr>
 <20200217192735.5070f0925c4159ccffa4e465@kernel.org>
 <c6257b49-bf02-d30a-1e2e-99abba5955e6@c-s.fr>
 <20200218094421.6d402de389ce23a55a3ec084@kernel.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <c93c5346-d964-9167-c4dd-3123917344cf@c-s.fr>
Date: Tue, 18 Feb 2020 06:58:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200218094421.6d402de389ce23a55a3ec084@kernel.org>
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
Cc: linux-kernel@vger.kernel.org,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Paul Mackerras <paulus@samba.org>, stable@kernel.vger.org,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/02/2020 à 01:44, Masami Hiramatsu a écrit :
> On Mon, 17 Feb 2020 16:38:50 +0100
> Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> 
>>
>>
>> Le 17/02/2020 à 11:27, Masami Hiramatsu a écrit :
>>> On Mon, 17 Feb 2020 10:03:22 +0100
>>> Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>>
>>>>
>>>>
>>>> Le 16/02/2020 à 13:34, Masami Hiramatsu a écrit :
>>>>> On Sat, 15 Feb 2020 11:28:49 +0100
>>>>> Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> Le 14/02/2020 à 14:54, Masami Hiramatsu a écrit :
>>>>>>> Hi,
>>>>>>>
>>>>>>> On Fri, 14 Feb 2020 12:47:49 +0000 (UTC)
>>>>>>> Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>>>>>>
>>>>>>>> When a program check exception happens while MMU translation is
>>>>>>>> disabled, following Oops happens in kprobe_handler() in the following
>>>>>>>> test:
>>>>>>>>
>>>>>>>> 		} else if (*addr != BREAKPOINT_INSTRUCTION) {
>>>>>>>
>>>>>>> Thanks for the report and patch. I'm not so sure about powerpc implementation
>>>>>>> but at where the MMU translation is disabled, can the handler work correctly?
>>>>>>> (And where did you put the probe on?)
>>>>>>>
>>>>>>> Your fix may fix this Oops, but if the handler needs special care, it is an
>>>>>>> option to blacklist such place (if possible).
>>>>>>
>>>>>> I guess that's another story. Here we are not talking about a place
>>>>>> where kprobe has been illegitimately activated, but a place where there
>>>>>> is a valid trap, which generated a valid 'program check exception'. And
>>>>>> kprobe was off at that time.
>>>>>
>>>>> Ah, I got it. It is not a kprobe breakpoint, but to check that correctly,
>>>>> it has to know the address where the breakpoint happens. OK.
>>>>>
>>>>>>
>>>>>> As any 'program check exception' due to a trap (ie a BUG_ON, a WARN_ON,
>>>>>> a debugger breakpoint, a perf breakpoint, etc...) calls
>>>>>> kprobe_handler(), kprobe_handler() must be prepared to handle the case
>>>>>> where the MMU translation is disabled, even if probes are not supposed
>>>>>> to be set for functions running with MMU translation disabled.
>>>>>
>>>>> Can't we check the MMU is disabled there (as same as checking the exception
>>>>> happened in user space or not)?
>>>>>
>>>>
>>>> What do you mean by 'there' ? At the entry of kprobe_handler() ?
>>>>
>>>> That's what my patch does, it checks whether MMU is disabled or not. If
>>>> it is, it converts the address to a virtual address.
>>>>
>>>> Do you mean kprobe_handler() should bail out early as it does when the
>>>> trap happens in user mode ?
>>>
>>> Yes, that is what I meant.
>>>
>>>> Of course we can do that, I don't know
>>>> enough about kprobe to know if kprobe_handler() should manage events
>>>> that happened in real-mode or just ignore them. But I tested adding an
>>>> event on a function that runs in real-mode, and it (now) works.
>>>>
>>>> So, what should we do really ?
>>>
>>> I'm not sure how the powerpc kernel runs in real mode.
>>> But clearly, at least kprobe event can not handle that case because
>>> it tries to access memory by probe_kernel_read(). Unless that function
>>> correctly handles the address translation, I want to prohibit kprobes
>>> on such address.
>>>
>>> So what I would like to see is, something like below.
>>>
>>> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
>>> index 2d27ec4feee4..4771be152416 100644
>>> --- a/arch/powerpc/kernel/kprobes.c
>>> +++ b/arch/powerpc/kernel/kprobes.c
>>> @@ -261,7 +261,7 @@ int kprobe_handler(struct pt_regs *regs)
>>>           unsigned int *addr = (unsigned int *)regs->nip;
>>>           struct kprobe_ctlblk *kcb;
>>>    
>>> -       if (user_mode(regs))
>>> +       if (user_mode(regs) || !(regs->msr & MSR_IR))
>>>                   return 0;
>>>    
>>>           /*
>>>
>>>
>>
>> With this instead change of my patch, I get an Oops everytime a kprobe
>> event occurs in real-mode.
>>
>> This is because kprobe_handler() is now saying 'this trap doesn't belong
>> to me' for a trap that has been installed by it.
> 
> Hmm, on powerpc, kprobes is allowed to probe on the code which runs
> in the real mode? I think we should also prohibit it by blacklisting.
> (It is easy to add blacklist by NOKPROBE_SYMBOL(func))

Yes, I see a lot of them tagged with _ASM_NOKPROBE_SYMBOL() on PPC64, 
but none on PPC32. I suppose that's missing and have to be added. 
Nevertheless, if one symbol has been forgotten in the blacklist, I think 
it is a problem if it generate Oopses.

> Or, some parts are possble to run under both real mode and kernel mode?

I don't think so, at least on PPC32

> 
>>
>> So the 'program check' exception handler doesn't find the owner of the
>> trap hence generate an Oops.
>>
>> Even if we don't want kprobe() to proceed with the event entirely
>> (allthough it works at least for simple events), I'd expect it to fail
>> gracefully.
> 
> Agreed. I thought it was easy to identify real mode code. But if it is
> hard, we should apply your first patch and also skip user handlers
> if we are in the real mode (and increment missed count).

user handlers are already skipped.

What do you think about my latest proposal below ? If a trap is 
encoutered in real mode, if checks if the matching virtual address 
corresponds to a valid kprobe. If it is, it skips it. If not, it returns 
0 to tell "it's no me". You are also talking about incrementing the 
missed count. Who do we do that ?



@@ -264,6 +265,13 @@ int kprobe_handler(struct pt_regs *regs)
      if (user_mode(regs))
          return 0;

+    if (!(regs->msr & MSR_IR)) {
+        if (!get_kprobe(phys_to_virt(regs->nip)))
+            return 0;
+        regs->nip += 4;
+        return 1;
+    }
+
      /*
       * We don't want to be preempted for the entire
       * duration of kprobe processing


> 
> BTW, can the emulater handle the real mode code correctly?

I don't know, how do I test that ?

Christophe
