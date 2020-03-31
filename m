Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A906198BF4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 07:53:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rz586KwVzDqnG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 16:53:00 +1100 (AEDT)
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
 header.s=mail header.b=pw6Tei71; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rz3h4vHNzDqNQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 16:51:43 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48rz3Z0nKKz9tyc3;
 Tue, 31 Mar 2020 07:51:38 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=pw6Tei71; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id FEURwzAM9jo2; Tue, 31 Mar 2020 07:51:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48rz3Y6lK0z9tyc2;
 Tue, 31 Mar 2020 07:51:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585633897; bh=RsRX+upq0Vb9aewDshmpMZdg8IpeKPQ6FcruDeS840k=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=pw6Tei71C52k7Csq5GKjEuJUVEVB9UfIkmnCsCGGMqvTRun37zKA53oFdjFnDbBSD
 KAA0669a6/2pSmT5QwTU5SdH0QQIgRmIFn1RXDj0+BvOeJ1OPvonlBsyPLO2wBMZzE
 ZKzuREvPl9iRyEYndqEyhv7ZaCzuhKoS8XvJb4WQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B3BFD8B752;
 Tue, 31 Mar 2020 07:51:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VvqqrzDCY0N4; Tue, 31 Mar 2020 07:51:38 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A30C38B784;
 Tue, 31 Mar 2020 07:51:35 +0200 (CEST)
Subject: Re: [PATCH 10/12] powerpc/entry32: Blacklist exception entry points
 for kprobe.
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <dff05b59a161434a546010507000816750073f28.1585474724.git.christophe.leroy@c-s.fr>
 <aea027844b12fcbc29ea78d26c5848a6794d1688.1585474724.git.christophe.leroy@c-s.fr>
 <1585588031.jvow7mwq4x.naveen@linux.ibm.com>
 <7f367f35-1bb8-bbb6-f399-8e911f76e043@c-s.fr>
Message-ID: <83053ddf-9ba6-d551-6711-890c3f3810b5@c-s.fr>
Date: Tue, 31 Mar 2020 07:51:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <7f367f35-1bb8-bbb6-f399-8e911f76e043@c-s.fr>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/03/2020 à 20:33, Christophe Leroy a écrit :
> 
> 
> Le 30/03/2020 à 19:08, Naveen N. Rao a écrit :
>> Christophe Leroy wrote:
>>> kprobe does not handle events happening in real mode.
>>>
>>> As exception entry points are running with MMU disabled,
>>> blacklist them.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>> ---
>>>  arch/powerpc/kernel/entry_32.S | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/arch/powerpc/kernel/entry_32.S 
>>> b/arch/powerpc/kernel/entry_32.S
>>> index 94f78c03cb79..9a1a45d6038a 100644
>>> --- a/arch/powerpc/kernel/entry_32.S
>>> +++ b/arch/powerpc/kernel/entry_32.S
>>> @@ -51,6 +51,7 @@ mcheck_transfer_to_handler:
>>>      mfspr    r0,SPRN_DSRR1
>>>      stw    r0,_DSRR1(r11)
>>>      /* fall through */
>>> +_ASM_NOKPROBE_SYMBOL(mcheck_transfer_to_handler)
>>>
>>>      .globl    debug_transfer_to_handler
>>>  debug_transfer_to_handler:
>>> @@ -59,6 +60,7 @@ debug_transfer_to_handler:
>>>      mfspr    r0,SPRN_CSRR1
>>>      stw    r0,_CSRR1(r11)
>>>      /* fall through */
>>> +_ASM_NOKPROBE_SYMBOL(debug_transfer_to_handler)
>>>
>>>      .globl    crit_transfer_to_handler
>>>  crit_transfer_to_handler:
>>> @@ -94,6 +96,7 @@ crit_transfer_to_handler:
>>>      rlwinm    r0,r1,0,0,(31 - THREAD_SHIFT)
>>>      stw    r0,KSP_LIMIT(r8)
>>>      /* fall through */
>>> +_ASM_NOKPROBE_SYMBOL(crit_transfer_to_handler)
>>>  #endif
>>>
>>>  #ifdef CONFIG_40x
>>> @@ -115,6 +118,7 @@ crit_transfer_to_handler:
>>>      rlwinm    r0,r1,0,0,(31 - THREAD_SHIFT)
>>>      stw    r0,KSP_LIMIT(r8)
>>>      /* fall through */
>>> +_ASM_NOKPROBE_SYMBOL(crit_transfer_to_handler)
>>>  #endif
>>>
>>>  /*
>>> @@ -127,6 +131,7 @@ crit_transfer_to_handler:
>>>      .globl    transfer_to_handler_full
>>>  transfer_to_handler_full:
>>>      SAVE_NVGPRS(r11)
>>> +_ASM_NOKPROBE_SYMBOL(transfer_to_handler_full)
>>>      /* fall through */
>>>
>>>      .globl    transfer_to_handler
>>> @@ -286,6 +291,8 @@ reenable_mmu:
>>>      lwz    r2, GPR2(r11)
>>>      b    fast_exception_return
>>>  #endif
>>> +_ASM_NOKPROBE_SYMBOL(transfer_to_handler)
>>> +_ASM_NOKPROBE_SYMBOL(transfer_to_handler_cont)
>>
>> These are added after 'reenable_mmu', which is itself not blacklisted. 
>> Is that intentional?
> 
> Yes I put it as the complete end of the entry part, ie just before 
> stack_ovf which is a function by itself.
> 
> Note that reenable_mmu is inside an #ifdef CONFIG_TRACE_IRQFLAGS.
> 
> I'm not completely sure where to put the _ASM_NOKPROBE_SYMBOL()s, that's 
> the reason why I put it close to the symbol itself in my first series.
> 
> Could you have a look at the code and tell me what looks the most 
> appropriate as a location to you ?
> 
> https://elixir.bootlin.com/linux/v5.6/source/arch/powerpc/kernel/entry_32.S#L230 

Ok, thinking about it once more, I guess we have a problem as everything 
after that reenable_mmu will be visible.

So I'll respin

Christophe
