Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 823C732C99
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 11:18:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HTy25F6LzDqRP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 19:18:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="qK7a3Bjr"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HTvj0PY8zDqLN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 19:16:49 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45HTvX2c3jz9v0D1;
 Mon,  3 Jun 2019 11:16:40 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=qK7a3Bjr; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id h-bkbOG883yC; Mon,  3 Jun 2019 11:16:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45HTvX1RnFz9v0Cw;
 Mon,  3 Jun 2019 11:16:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1559553400; bh=K6V04fp2wmNbVXlm3f+rVXZBYc12IY9zUHEdy7YPcVY=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=qK7a3Bjr5D25uyATGphCM9C/xx8iCEUSQGdHuU9XkZ6fme6ggDZem5DtAkMj1EdTH
 yynocMV1TG0Mi6+RMi7USLvmLHcBw1mrY+q/bg1aMBm6F1x8byrpJFvnDw89c54Lt3
 oLMDPd1y2F/oH5SezRWm9qg2/2wwVHaLZjKqNzr8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DFCF68B879;
 Mon,  3 Jun 2019 11:16:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xrKd7VIqcsZv; Mon,  3 Jun 2019 11:16:44 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.231.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AD5C18B7B1;
 Mon,  3 Jun 2019 11:16:44 +0200 (CEST)
Subject: Re: [PATCH v3 14/16] powerpc/32: implement fast entry for syscalls on
 BOOKE
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1556627571.git.christophe.leroy@c-s.fr>
 <3e254178a157e7eaeef48f983880f71f97d1f296.1556627571.git.christophe.leroy@c-s.fr>
 <20190523061427.GA19655@blackberry>
 <98bf5745-88ae-7f17-fcb9-7d06ba5b9e49@c-s.fr>
 <58f0e70f-ed9d-965e-e8d2-cc5d13a4c9eb@c-s.fr>
 <87r28jp2b0.fsf@concordia.ellerman.id.au>
 <20190528190341.Horde.nTXOule-IO2ReXFiNIqNbg8@messagerie.si.c-s.fr>
Message-ID: <c4ff97c8-f601-0e62-9408-08bbef409636@c-s.fr>
Date: Mon, 3 Jun 2019 09:16:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20190528190341.Horde.nTXOule-IO2ReXFiNIqNbg8@messagerie.si.c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 05/28/2019 05:03 PM, Christophe Leroy wrote:
> Michael Ellerman <mpe@ellerman.id.au> a écrit :
> 
>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>> Le 23/05/2019 à 09:00, Christophe Leroy a écrit :
>>>
>>> [...]
>>>
>>>>> arch/powerpc/kernel/head_fsl_booke.o: In function `SystemCall':
>>>>> arch/powerpc/kernel/head_fsl_booke.S:416: undefined reference to
>>>>> `kvmppc_handler_BOOKE_INTERRUPT_SYSCALL_SPRN_SRR1'
>>>>> Makefile:1052: recipe for target 'vmlinux' failed
>>>>>
>>>>>> +.macro SYSCALL_ENTRY trapno intno
>>>>>> +    mfspr    r10, SPRN_SPRG_THREAD
>>>>>> +#ifdef CONFIG_KVM_BOOKE_HV
>>>>>> +BEGIN_FTR_SECTION
>>>>>> +    mtspr    SPRN_SPRG_WSCRATCH0, r10
>>>>>> +    stw    r11, THREAD_NORMSAVE(0)(r10)
>>>>>> +    stw    r13, THREAD_NORMSAVE(2)(r10)
>>>>>> +    mfcr    r13            /* save CR in r13 for now       */
>>>>>> +    mfspr    r11, SPRN_SRR1
>>>>>> +    mtocrf    0x80, r11    /* check MSR[GS] without clobbering 
>>>>>> reg */
>>>>>> +    bf    3, 1975f
>>>>>> +    b    kvmppc_handler_BOOKE_INTERRUPT_\intno\()_SPRN_SRR1
>>>>>
>>>>> It seems to me that the "_SPRN_SRR1" on the end of this line
>>>>> isn't meant to be there...  However, it still fails to link with that
>>>>> removed.
>>>
>>> It looks like I missed the macro expansion.
>>>
>>> The called function should be kvmppc_handler_8_0x01B
>>>
>>> Seems like kisskb doesn't build any config like this.
>>
>> I thought we did, ie:
>>
>> http://kisskb.ellerman.id.au/kisskb/buildresult/13817941/
> 
> That's a ppc64 config it seems. The problem was on booke32.
> 
> Christophe
> 
>>
>> But clearly something is missing to trigger the bug.

I was able to trigger the bug with mpc85xx_defconfig + 
CONFIG_VIRTUALIZATION + CONFIG_PPC_E500MC

The bug pops up when CONFIG_KVM_BOOKE_HV is set.

Christophe

>>
>> cheers
> 
> 
