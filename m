Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 253AC125BC9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 07:59:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47djRp2YmlzDqTF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 17:59:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="hJIh69rg"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47djP73tbqzDqnG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 17:57:30 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47djP031Kbz9v02n;
 Thu, 19 Dec 2019 07:57:24 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=hJIh69rg; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4zsNDiTYkOWZ; Thu, 19 Dec 2019 07:57:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47djP01xGSz9v02k;
 Thu, 19 Dec 2019 07:57:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1576738644; bh=MBZphaLvN7Y7xmwStybWkMj7P7KceZL2/izi15FLe2g=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hJIh69rgLLxnthcBrxF/1T3c0JibNrCX6uPNuvFpD9JKNNTFiQ78GrSzXnDytU/K0
 /7Mg5YCcJule+LCPv+0KhJr3JKa9QA/Lg0A7glx6nveEy6UMuPgb99JBWJyfvyZxoI
 Ltss9EiGr/yr4PRRdkd7lg7xM3qM03AlU5gRdXlo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 24BAF8B784;
 Thu, 19 Dec 2019 07:57:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1Y6LUm90Zee9; Thu, 19 Dec 2019 07:57:25 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8B24F8B756;
 Thu, 19 Dec 2019 07:57:24 +0100 (CET)
Subject: Re: [PATCH v4 2/2] powerpc/irq: inline call_do_irq() and
 call_do_softirq()
To: Michael Ellerman <mpe@ellerman.id.au>,
 Segher Boessenkool <segher@kernel.crashing.org>
References: <20191121101552.GR16031@gate.crashing.org>
 <87y2w49rgo.fsf@mpe.ellerman.id.au> <20191125142556.GU9491@gate.crashing.org>
 <5fdb1c92-8bf4-01ca-f81c-214870c33be3@c-s.fr>
 <20191127145958.GG9491@gate.crashing.org>
 <2072e066-1ffb-867e-60ec-04a6bb9075c1@c-s.fr>
 <20191129184658.GR9491@gate.crashing.org>
 <ebc67964-e5a9-acd0-0011-61ba23692f7e@c-s.fr>
 <20191206205953.GQ3152@gate.crashing.org>
 <2a22feca-d6d6-6cb0-6c76-035234fa8742@c-s.fr>
 <20191207174057.GY3152@gate.crashing.org> <878snlrcrs.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <4668c204-3064-0e9e-5216-e7853f732821@c-s.fr>
Date: Thu, 19 Dec 2019 07:57:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <878snlrcrs.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/12/2019 à 11:53, Michael Ellerman a écrit :
> Segher Boessenkool <segher@kernel.crashing.org> writes:
>> On Sat, Dec 07, 2019 at 10:42:28AM +0100, Christophe Leroy wrote:
>>> Le 06/12/2019 à 21:59, Segher Boessenkool a écrit :
>>>> If the compiler can see the callee wants the same TOC as the caller has,
>>>> it does not arrange to set (and restore) it, no.  If it sees it may be
>>>> different, it does arrange for that (and the linker then will check if
>>>> it actually needs to do anything, and do that if needed).
>>>>
>>>> In this case, the compiler cannot know the callee wants the same TOC,
>>>> which complicates thing a lot -- but it all works out.
>>>
>>> Do we have a way to make sure which TOC the functions are using ? Is
>>> there several TOC at all in kernel code ?
>>
>> Kernel modules have their own TOC, I think?
> 
> Yes.

Yes, this means that exported functions have to care about that, right ?
And that's the reason why exported assembly functions like copy_page() 
use _GLOBAL_TOC() and not _GLOBAL()

But main part of the kernel only has one TOC, so r2 can be assumed 
constant for non exported functions, can't it ?

> 
>>>> I think things can still go wrong if any of this is inlined into a kernel
>>>> module?  Is there anything that prevents this / can this not happen for
>>>> some fundamental reason I don't see?
>>>
>>> This can't happen can it ?
>>> do_softirq_own_stack() is an outline function, defined in powerpc irq.c
>>> Its only caller is do_softirq() which is an outline function defined in
>>> kernel/softirq.c
>>>
>>> That prevents inlining, doesn't it ?
>>
>> Hopefully, sure.  Would be nice if it was clearer that this works...  It
>> is too much like working by chance, the way it is :-(
> 
> There's no way any of that code can end up in a module. Or at least if
> there is, that's a bug.

That's my conclusion as well. So I guess we can consider r2 as constant 
over those functions.

> 
>>> Anyway, until we clarify all this I'll limit my patch to PPC32 which is
>>> where the real benefit is I guess.
>>>
>>> At the end, maybe the solution should be to switch to IRQ stack
>>> immediately in the exception entry as x86_64 do ?
> 
> Yeah that might be cleaner.
> 

I prepared a patch for that on PPC32, but it doesn't get rid of the IRQ 
stack switch completely because do_IRQ() is also called from other 
places like the timer interrupt.

And we will still have the switch for softirqs. We could move 
do_softirq_own_stack() to assembly and merge it with call_do_softirq(), 
but a find it cleaner to inline call_do_softirq() instead, now that we 
have demonstrated that r2 can't change.

Christophe
