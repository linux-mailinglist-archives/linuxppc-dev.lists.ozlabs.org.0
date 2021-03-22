Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C464343C4A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 10:07:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3pYk1GPmz30D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 20:07:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Nbw5cGy2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Nbw5cGy2; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3pYL2xWlz2yQx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 20:07:33 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F3pYJ21BGz9sRf;
 Mon, 22 Mar 2021 20:07:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1616404052;
 bh=k03xODoZEL716WEE1AYo3f4QeCbzb6lINhdSlDwFzBk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Nbw5cGy2aA+c0P3hxc2RGg5TVdC3YWt30V5dKgN7Iwm6zhWmbVBNxOIcCFXpn/lFi
 2yPkaAv25m6lrVBS+RqFWFKMpnLVcRWLKEUhM8hwmCltpQmdibGnSEi56sdeqtzslg
 Eivu0C4ID1NQeVR5SzgwxeRM9aNv0tDfgRAZg8xrhKZ1NYwH9dHlg9flfshQhbAxFt
 fzguEVn851I0SrI6cUmkz8751wQeBeoNLOrdwPugYlfF0I2lNRiFLxUENO/HBYQYDE
 iXRwDV1hVwuFwzIaVp7ylMksgVDjx8f7KmArGOGErR5M00nR5d6dHqRBHQGQD0tJY8
 D4cGuCJxDqKkw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/6] powerpc/mm/64s/hash: Add real-mode
 change_memory_range() for hash LPAR
In-Reply-To: <1616382012.2m85hefs07.astroid@bobo.none>
References: <20210211135130.3474832-1-mpe@ellerman.id.au>
 <20210211135130.3474832-5-mpe@ellerman.id.au>
 <1613086376.ygjdbhz8p5.astroid@bobo.none>
 <87czvz4n47.fsf@mpe.ellerman.id.au>
 <1616382012.2m85hefs07.astroid@bobo.none>
Date: Mon, 22 Mar 2021 20:07:28 +1100
Message-ID: <87zgyvh7zj.fsf@mpe.ellerman.id.au>
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
> Excerpts from Michael Ellerman's message of March 16, 2021 4:40 pm:
>> Nicholas Piggin <npiggin@gmail.com> writes:
>>> Excerpts from Michael Ellerman's message of February 11, 2021 11:51 pm:
>>>> When we enabled STRICT_KERNEL_RWX we received some reports of boot
>>>> failures when using the Hash MMU and running under phyp. The crashes
>>>> are intermittent, and often exhibit as a completely unresponsive
>>>> system, or possibly an oops.
>> ...
>>>> 
>>>> diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
>>>> index 3663d3cdffac..01de985df2c4 100644
>>>> --- a/arch/powerpc/mm/book3s64/hash_pgtable.c
>>>> +++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
>>>> @@ -414,6 +428,73 @@ static void change_memory_range(unsigned long start, unsigned long end,
>>>>  							mmu_kernel_ssize);
>>>>  }
>>>>  
>>>> +static int notrace chmem_secondary_loop(struct change_memory_parms *parms)
>>>> +{
>>>> +	unsigned long msr, tmp, flags;
>>>> +	int *p;
>>>> +
>>>> +	p = &parms->cpu_counter.counter;
>>>> +
>>>> +	local_irq_save(flags);
>>>> +	__hard_EE_RI_disable();
>>>> +
>>>> +	asm volatile (
>>>> +	// Switch to real mode and leave interrupts off
>>>> +	"mfmsr	%[msr]			;"
>>>> +	"li	%[tmp], %[MSR_IR_DR]	;"
>>>> +	"andc	%[tmp], %[msr], %[tmp]	;"
>>>> +	"mtmsrd %[tmp]			;"
>>>> +
>>>> +	// Tell the master we are in real mode
>>>> +	"1:				"
>>>> +	"lwarx	%[tmp], 0, %[p]		;"
>>>> +	"addic	%[tmp], %[tmp], -1	;"
>>>> +	"stwcx.	%[tmp], 0, %[p]		;"
>>>> +	"bne-	1b			;"
>>>> +
>>>> +	// Spin until the counter goes to zero
>>>> +	"2:				;"
>>>> +	"lwz	%[tmp], 0(%[p])		;"
>>>> +	"cmpwi	%[tmp], 0		;"
>>>> +	"bne-	2b			;"
>>>> +
>>>> +	// Switch back to virtual mode
>>>> +	"mtmsrd %[msr]			;"
>>>
>>> Pity we don't have something that can switch to emergency stack and
>>> so we can write this stuff in C.
>>>
>>> How's something like this suit you?
>> 
>> It looks like it would be really good for writing exploits :)
>
> Hmm. In that case maybe the callee function could be inlined into it 
> like the interrupt wrappers, and the asm real-mode entry/exit gets
> added around it rather than have this little exploit stub. So similar to 
> yours but with a stack switch as well so you can come back up in real 
> mode.

Yeah inlining as much as possible would reduce the risk.

>> I think at the very least we would want the asm part to load the SP
>> from the paca itself, rather than taking it as a parameter.
>> 
>> But I'm not sure writing these type of things in C is a big win, because
>> you have to be so careful about what you call anyway. It's almost better
>> in asm because it's so restrictive.
>> 
>> Obviously having said that, my first attempt got the IRQ save/restore
>> wrong, so maybe we should at least have some macros to help with it.
>> 
>> Did you have another user for this in mind? The only one that I can
>> think of at the moment is the subcore stuff.
>
> Possibly rtas entry/exit (although that has other issues). But I guess 
> it's not a huge amount of asm compared with what I'm dealing with.

Ah yep, I hadn't thought of RTAS.

> I'm okay if you just put your thing in at the moment, we might or might 
> not get keen and c-ify it later.

OK.

cheers
