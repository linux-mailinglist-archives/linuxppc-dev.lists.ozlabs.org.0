Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 514DA342CF6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 14:04:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2gvk21nHz3c1K
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Mar 2021 00:04:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kHmR/KZL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kHmR/KZL; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2gvK5lRPz2yQl
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Mar 2021 00:04:12 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F2gvJ1s1nz9sW4;
 Sun, 21 Mar 2021 00:04:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1616245452;
 bh=0jvUu/lL0vT5Wn9Hiq1LrSevPknarpA71XtCkS9rqP8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=kHmR/KZL3XC2j9v/B0Raqzi+ehUkFCer/lc9kroxv3DGR9vpKhtC5PEBm5b3OEBuR
 bHYXqlS0k1b5VF/9/vOKhtFFVDYsaA0eTixuuww7qbBW6XAYDDXxAvNLiOvHDwSu33
 kWtW2TeC1+Zb2kVQ+IvKS+f5nu2mwiGQe2/F3s3ZUYq/6xzQln0ruFZuF3jjajmcHQ
 AIGtXWsFVdWj6sgYn1KkwaefS8VwC7O5gDdzXb+/03UNOxmHd11vJ89+Cx+jZTJhKR
 EKXG36EM4VX+EZp56UL/x5M1HC2JMhrFRQ1dVswPJkM9uPH5w/ezOmzXpKsAGbSg+P
 SUk4zevE1U+RA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/6] powerpc/mm/64s/hash: Add real-mode
 change_memory_range() for hash LPAR
In-Reply-To: <1613084139.rsms9jxmax.astroid@bobo.none>
References: <20210211135130.3474832-1-mpe@ellerman.id.au>
 <20210211135130.3474832-5-mpe@ellerman.id.au>
 <1613084139.rsms9jxmax.astroid@bobo.none>
Date: Sun, 21 Mar 2021 00:04:07 +1100
Message-ID: <878s6iht88.fsf@mpe.ellerman.id.au>
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
Cc: aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Michael Ellerman's message of February 11, 2021 11:51 pm:
...
>> diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
>> index 3663d3cdffac..01de985df2c4 100644
>> --- a/arch/powerpc/mm/book3s64/hash_pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
>> @@ -414,6 +428,73 @@ static void change_memory_range(unsigned long start, unsigned long end,
>>  							mmu_kernel_ssize);
>>  }
>>  
>> +static int notrace chmem_secondary_loop(struct change_memory_parms *parms)
>> +{
>> +	unsigned long msr, tmp, flags;
>> +	int *p;
>> +
>> +	p = &parms->cpu_counter.counter;
>> +
>> +	local_irq_save(flags);
>> +	__hard_EE_RI_disable();
>> +
>> +	asm volatile (
>> +	// Switch to real mode and leave interrupts off
>> +	"mfmsr	%[msr]			;"
>> +	"li	%[tmp], %[MSR_IR_DR]	;"
>> +	"andc	%[tmp], %[msr], %[tmp]	;"
>> +	"mtmsrd %[tmp]			;"
>> +
>> +	// Tell the master we are in real mode
>> +	"1:				"
>> +	"lwarx	%[tmp], 0, %[p]		;"
>> +	"addic	%[tmp], %[tmp], -1	;"
>> +	"stwcx.	%[tmp], 0, %[p]		;"
>> +	"bne-	1b			;"
>> +
>> +	// Spin until the counter goes to zero
>> +	"2:				;"
>> +	"lwz	%[tmp], 0(%[p])		;"
>> +	"cmpwi	%[tmp], 0		;"
>> +	"bne-	2b			;"
>> +
>> +	// Switch back to virtual mode
>> +	"mtmsrd %[msr]			;"
>> +
>> +	: // outputs
>> +	  [msr] "=&r" (msr), [tmp] "=&b" (tmp), "+m" (*p)
>> +	: // inputs
>> +	  [p] "b" (p), [MSR_IR_DR] "i" (MSR_IR | MSR_DR)
>> +	: // clobbers
>> +	  "cc", "xer"
>> +	);
>> +
>> +	local_irq_restore(flags);
>
> Hmm. __hard_EE_RI_disable won't get restored by this because it doesn't
> set the HARD_DIS flag. Also we don't want RI disabled here because 
> tracing will get called first (which might take SLB or HPTE fault).

Thanks for noticing. I originally wrote hard_irq_disable() but then
thought disabling RI also would be good.

> But it's also slightly rude to ever enable EE under an irq soft mask,
> because you don't know if it had been disabled by the masked interrupt 
> handler. It's not strictly a problem AFAIK because the interrupt would
> just get masked again, but if we try to maintain a good pattern would
> be good. Hmm that means we should add a check for irqs soft masked in
> __hard_irq_enable(), I'm not sure if all existing users would follow
> this rule.
>
> Might be better to call hard_irq_disable(); after the local_irq_save();
> and then clear and reset RI inside that region (could just do it at the
> same time as disabling MMU).

Thinking about it more, there's no real reason to disable RI.

We should be able to return from an interrupt in there, it's just that
if we do take one we'll probably die before we get a chance to return
because the mapping of text will be missing.

So disabling RI doesn't really gain us anything I don't think.

cheers
