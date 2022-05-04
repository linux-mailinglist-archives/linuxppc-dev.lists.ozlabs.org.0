Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31164519691
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 06:28:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtP2h0Cplz3brp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 14:28:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bC0SMIwF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtP233PWPz2xnM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 14:27:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=bC0SMIwF; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KtP232qptz4xXS;
 Wed,  4 May 2022 14:27:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1651638459;
 bh=4sM2j3BRcMpmeza4V5S7AVgFp6Yn9zTTV5iVujj+gyE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bC0SMIwFaxBOZjqcSS31sFWjfDNPG9ynZQ5VHo4uPLDNtKtMmH6TCjZ3IUkwKl2Re
 WgOWScAzufXX58ExM9BA3lbHAWTOVVCezwPJ3A6Ie9jwGQYZFHlj/jO8dCvLs5VScv
 Cxwo+BWhEr0pJpOWwM+xyo5QqONlqya+BD8bjcBP6PoByWECribrQDhMy1qOOrvQi+
 GtcZ17wyNaRxYD1j6iSJihqiEmROGGWQfRR8VbM/Kj0e9mkGaZdkA4Zzw7LbR0fbef
 3ONdkfptjbL9stkwmtIaRUQdyst4mgmwXGSCJYLKIH7jiRBncj4X8YLdckVcaXN/Us
 QMS4I05CCyDMA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Laurent Dufour <ldufour@linux.ibm.com>, Fabiano Rosas
 <farosas@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/rtas: Keep MSR[RI] set when calling RTAS
In-Reply-To: <60195753-93fc-ced7-c250-da65c05508af@linux.ibm.com>
References: <20220401140634.65726-1-ldufour@linux.ibm.com>
 <87r15aveny.fsf@mpe.ellerman.id.au> <87levia8wy.fsf@linux.ibm.com>
 <60195753-93fc-ced7-c250-da65c05508af@linux.ibm.com>
Date: Wed, 04 May 2022 14:27:38 +1000
Message-ID: <87h765vs5h.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
 stable@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:
> On 03/05/2022, 18:16:29, Fabiano Rosas wrote:
>> Michael Ellerman <mpe@ellerman.id.au> writes:
>> 
>>>> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
>>>> index 9581906b5ee9..65cb14b56f8d 100644
>>>> --- a/arch/powerpc/kernel/entry_64.S
>>>> +++ b/arch/powerpc/kernel/entry_64.S
>>>> @@ -330,22 +330,18 @@ _GLOBAL(enter_rtas)
>>>>  	clrldi	r4,r4,2			/* convert to realmode address */
>>>>         	mtlr	r4
>>>>  
>>>> -	li	r0,0
>>>> -	ori	r0,r0,MSR_EE|MSR_SE|MSR_BE|MSR_RI
>>>> -	andc	r0,r6,r0
>>>> -	
>>>> -        li      r9,1
>>>> -        rldicr  r9,r9,MSR_SF_LG,(63-MSR_SF_LG)
>>>> -	ori	r9,r9,MSR_IR|MSR_DR|MSR_FE0|MSR_FE1|MSR_FP|MSR_RI|MSR_LE
>>>> -	andc	r6,r0,r9
>>>  
>>> One advantage of the old method is it can adapt to new MSR bits being
>>> set by the kernel.
>>>
>>> For example we used to use RTAS on powernv, and this code didn't need
>>> updating to cater to MSR_HV being set. We will probably never use RTAS
>>> on bare-metal again, so that's OK.
>>>
>>> But your change might break secure virtual machines, because it clears
>>> MSR_S whereas the old code didn't. I think SVMs did use RTAS, but I
>>> don't know whether it matters if it's called with MSR_S set or not?
>>>
>>> Not sure if anyone will remember, or has a working setup they can test.
>>> Maybe for now we just copy MSR_S from the kernel MSR the way the
>>> current code does.
>> 
>> Would the kernel even be able to change the bit? I think only urfid can
>> clear MSR_S.
>
> That's a good point, thanks Fabiano!
>
> The POWER ISA programming note about MSR[S] is explicit:
> "MSR[S] can be set to 1 only by the System Call instruction and some
> interrupts. It can be set to 0 only by urfid."
>
> Since RTAS is entered using rfid, MSR[S] should remain whatever is the
> value in SRR1.
>
> And that's what POWER ISA is saying about the rfid instruction, in the
> synopsis of the instruction the bit 41 of the resulting MSR (aka MSR[S]) is
> not impacted.
>
> So there is no need to take care of this MSR bit in our code, but for sure,
> this should be well commented.
>
> Michael, do you agree?

Yep.

Can you send a v3 with updated change log and comment mentioning MSR_S
and MSR_LE, thanks.

cheers
