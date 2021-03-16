Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 971C933CE08
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 07:41:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F03bQ42bRz30JN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 17:41:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YMEFHX0I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=YMEFHX0I; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F03Zz0fLJz2yYx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 17:40:58 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F03Zy1c3hz9sSC;
 Tue, 16 Mar 2021 17:40:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1615876858;
 bh=s3zCdWI8/qYef5KMS7O5uGTQGb0lF5m46RfN4phT9ac=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=YMEFHX0IVHgpQgsSGeE0L0YWXA71sXJBRh3cftSQDFi2/j379XJqRmofYPWv4iHgP
 0Eoh+h0jc7RX2xkJqt9SMwXKodrwrPCDO2yBX8Vj4mDR9OPVkxa52PeHSvkCAY/Uzp
 ee9o3lvZUBS+Wi/+PqkBK87br7+05GZeS7H+5kAPI8mpXqXBODFr7+l6GkLEITAAx/
 0XzNZ3m89pbJ36bgHUxU9oKWF9JVN9ixqdDQjlP7GecWLHXXRucBFJ1YKosF81dp53
 gvsmAMoRjDJX9tZNkuANhTlgXNVEPszdatv1iyXMS41+oPDigv8UAvZBnnz2Gc9wKP
 +oXfJQOHNLGZw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/6] powerpc/mm/64s/hash: Add real-mode
 change_memory_range() for hash LPAR
In-Reply-To: <1613086376.ygjdbhz8p5.astroid@bobo.none>
References: <20210211135130.3474832-1-mpe@ellerman.id.au>
 <20210211135130.3474832-5-mpe@ellerman.id.au>
 <1613086376.ygjdbhz8p5.astroid@bobo.none>
Date: Tue, 16 Mar 2021 17:40:56 +1100
Message-ID: <87czvz4n47.fsf@mpe.ellerman.id.au>
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
>> When we enabled STRICT_KERNEL_RWX we received some reports of boot
>> failures when using the Hash MMU and running under phyp. The crashes
>> are intermittent, and often exhibit as a completely unresponsive
>> system, or possibly an oops.
...
>> 
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
>
> Pity we don't have something that can switch to emergency stack and
> so we can write this stuff in C.
>
> How's something like this suit you?

It looks like it would be really good for writing exploits :)

I think at the very least we would want the asm part to load the SP
from the paca itself, rather than taking it as a parameter.

But I'm not sure writing these type of things in C is a big win, because
you have to be so careful about what you call anyway. It's almost better
in asm because it's so restrictive.

Obviously having said that, my first attempt got the IRQ save/restore
wrong, so maybe we should at least have some macros to help with it.

Did you have another user for this in mind? The only one that I can
think of at the moment is the subcore stuff.

cheers

> diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
> index 070465825c21..5e911d0b0b16 100644
> --- a/arch/powerpc/kernel/misc_64.S
> +++ b/arch/powerpc/kernel/misc_64.S
> @@ -27,6 +27,28 @@
>  
>  	.text
>  
> +#ifdef CONFIG_PPC_BOOK3S_64
> +_GLOBAL(__call_realmode)
> +	mflr	r0
> +	std	r0,16(r1)
> +	stdu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r5)
> +	mr	r1,r5
> +	mtctr	r3
> +	mr	r3,r4
> +	mfmsr	r4
> +	xori	r4,r4,(MSR_IR|MSR_DR)
> +	mtmsrd	r4
> +	bctrl
> +	mfmsr	r4
> +	xori	r4,r4,(MSR_IR|MSR_DR)
> +	mtmsrd	r4
> +	ld	r1,0(r1)
> +	ld	r0,16(r1)
> +	mtlr	r0
> +	blr
> +
> +#endif
> +
>  _GLOBAL(call_do_softirq)
>  	mflr	r0
>  	std	r0,16(r1)
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index a66f435dabbf..260d60f665a3 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -2197,6 +2197,43 @@ void show_stack(struct task_struct *tsk, unsigned long *stack,
>  	put_task_stack(tsk);
>  }
>  
> +#ifdef CONFIG_PPC_BOOK3S_64
> +int __call_realmode(int (*fn)(void *arg), void *arg, void *sp);
> +
> +/* XXX: find a better place for this
> + * Executing C code in real-mode in general Book3S-64 code can only be done
> + * via this function that switches the stack to one inside the real-mode-area,
> + * which may cover only a small first part of real memory on hash guest LPARs.
> + * fn must be NOKPROBES, must not access vmalloc or anything outside the RMA,
> + * probably shouldn't enable the MMU or interrupts, etc, and be very careful
> + * about calling other generic kernel or powerpc functions.
> + */
> +int call_realmode(int (*fn)(void *arg), void *arg)
> +{
> +	unsigned long flags;
> +	void *cursp, *emsp;
> +	int ret;
> +
> +	/* Stack switch is only really required for HPT LPAR, but do it for all to help test coverage of tricky code */
> +	cursp = (void *)(current_stack_pointer & ~(THREAD_SIZE - 1));
> +	emsp = (void *)(local_paca->emergency_sp - THREAD_SIZE);
> +
> +	/* XXX check_stack_overflow(); */
> +
> +	if (WARN_ON_ONCE(cursp == emsp))
> +		return -EBUSY;
> +
> +	local_irq_save(flags);
> +	hard_irq_disable();
> +
> +	ret = __call_realmode(fn, arg, emsp);
> +
> +	local_irq_restore(flags);
> +
> +	return ret;
> +}
> +#endif
> +
>  #ifdef CONFIG_PPC64
>  /* Called with hard IRQs off */
>  void notrace __ppc64_runlatch_on(void)
> -- 
> 2.23.0
