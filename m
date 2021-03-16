Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD2433CDF5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 07:30:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F03MM6Tnwz30MF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 17:30:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lD65srtq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=lD65srtq; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F03Lx2cFlz2xg3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 17:30:32 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F03Ls2CnLz9sSC;
 Tue, 16 Mar 2021 17:30:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1615876229;
 bh=SV5fVTxmimTejsH9jfDzClzUW7Jq5gsyQ7GeHPrpGlc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=lD65srtqfpxx/9wbryud4wveH4s0sX8MtXbLpEWfT9YZuKQw6XaLs4yJik0YJF0CO
 V766nJVncTrsC523phppLuRjk4Yc+J0nq6w4D8FFzpCb1zr3tADz3VYij/MStj1aeb
 9r0dmMWpfku7LNm8qDx/6xyCMzaNtLQJybUqp99oGK35DTdWAy9h9iZMEHFsTFbzDm
 6xTAT7Z6X2Oh+0GFSPEtc7kyn9so7a6TejrLVTXIyRY61lFU3j06kp5iGvY+E6OT6H
 RDbcvHKGMmbbV+ZZklcI/xTUYesOwSAP/ubXdETinzyiR7jMUzMtopiWnDTVb7GSUg
 opYXhTdFFPBSg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 4/6] powerpc/mm/64s/hash: Factor out change_memory_range()
In-Reply-To: <87k0r4q060.fsf@dja-thinkpad.axtens.net>
References: <20210211135130.3474832-1-mpe@ellerman.id.au>
 <20210211135130.3474832-4-mpe@ellerman.id.au>
 <87k0r4q060.fsf@dja-thinkpad.axtens.net>
Date: Tue, 16 Mar 2021 17:30:24 +1100
Message-ID: <87ft0v4nlr.fsf@mpe.ellerman.id.au>
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

Daniel Axtens <dja@axtens.net> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>
>> Pull the loop calling hpte_updateboltedpp() out of
>> hash__change_memory_range() into a helper function. We need it to be a
>> separate function for the next patch.
>>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>  arch/powerpc/mm/book3s64/hash_pgtable.c | 23 +++++++++++++++--------
>>  1 file changed, 15 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
>> index 03819c259f0a..3663d3cdffac 100644
>> --- a/arch/powerpc/mm/book3s64/hash_pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
>> @@ -400,10 +400,23 @@ EXPORT_SYMBOL_GPL(hash__has_transparent_hugepage);
>>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>>  
>>  #ifdef CONFIG_STRICT_KERNEL_RWX
>> +static void change_memory_range(unsigned long start, unsigned long end,
>> +				unsigned int step, unsigned long newpp)
>
> Looking at the call paths, this gets called only in bare metal, not
> virtualised: should the name reflect that?

It's also called on bare metal:

static bool hash__change_memory_range(unsigned long start, unsigned long end,
				      unsigned long newpp)
{
	...
	if (firmware_has_feature(FW_FEATURE_LPAR)) {
	        ...
		stop_machine_cpuslocked(change_memory_range_fn, &chmem_parms,
					cpu_online_mask);
	        ...
	} else
		change_memory_range(start, end, step, newpp);
                ^^^^^^^^^^^^^^^^^^^


>> +{
>> +	unsigned long idx;
>> +
>> +	pr_debug("Changing page protection on range 0x%lx-0x%lx, to 0x%lx, step 0x%x\n",
>> +		 start, end, newpp, step);
>> +
>> +	for (idx = start; idx < end; idx += step)
>> +		/* Not sure if we can do much with the return value */
>
> Hmm, I realise this comment isn't changed, but it did make me wonder
> what the return value!
>
> It turns out that the function doesn't actually return anything.
>
> Tracking back the history of hpte_updateboltedpp, it looks like it has
> not had a return value since the start of git history:
>
> ^1da177e4c3f4 include/asm-ppc64/machdep.h    void            (*hpte_updateboltedpp)(unsigned long newpp, 
> 3c726f8dee6f5 include/asm-powerpc/machdep.h                                         unsigned long ea,
> 1189be6508d45 include/asm-powerpc/machdep.h                                        int psize, int ssize);
>
> The comment comes from commit cd65d6971334 ("powerpc/mm/hash: Implement
> mark_rodata_ro() for hash") where Balbir added the comment, but again I
> can't figure out what sort of return value there would be to ignore.

I suspect he just assumed there was a return value, and the comment is
saying we aren't really allowed to fail here, so what could we do?

In general these routines changing the kernel map permissions aren't
allowed to fail, because the callers don't cope with a failure, and at
least in some cases eg. RW -> RX the permission change is not optional.

> Should we drop the comment? (or return something from hpte_updateboltedpp)

I'll leave the comment for now, but we could probably drop it.

It would be good if hpte_updateboltedpp() could fail and return an
error. Currently pSeries_lpar_hpte_updateboltedpp() BUGs if the hcall
fails, because the only error cases are due to bad input on our part.
And similarly native_hpte_updateboltedpp() panics if we give it bad
input.

We may still need to panic() at a higher level, ie. adding execute to a
mapping is not optional. But possibly for some changes, like RW->RO we
could WARN and continue.

And I guess for modules we could eventually plumb the error all the way
out and fail the module load.

>> +		mmu_hash_ops.hpte_updateboltedpp(newpp, idx, mmu_linear_psize,
>> +							mmu_kernel_ssize);
>> +}
>> +
>>  static bool hash__change_memory_range(unsigned long start, unsigned long end,
>>  				      unsigned long newpp)
>>  {
>> -	unsigned long idx;
>>  	unsigned int step, shift;
>>  
>>  	shift = mmu_psize_defs[mmu_linear_psize].shift;
>> @@ -415,13 +428,7 @@ static bool hash__change_memory_range(unsigned long start, unsigned long end,
>>  	if (start >= end)
>>  		return false;
>>  
>> -	pr_debug("Changing page protection on range 0x%lx-0x%lx, to 0x%lx, step 0x%x\n",
>> -		 start, end, newpp, step);
>> -
>> -	for (idx = start; idx < end; idx += step)
>> -		/* Not sure if we can do much with the return value */
>> -		mmu_hash_ops.hpte_updateboltedpp(newpp, idx, mmu_linear_psize,
>> -							mmu_kernel_ssize);
>> +	change_memory_range(start, end, step, newpp);
>
> Looking at how change_memory_range is called, step is derived by:
>
> 	shift = mmu_psize_defs[mmu_linear_psize].shift;
> 	step = 1 << shift;
>
> We probably therefore don't really need to pass step in to
> change_memory_range. Having said that, I'm not sure it would really be that
> much tidier to compute step in change_memory_range, especially since we
> also need step for the other branch in hash__change_memory_range.

Hmm yeah, swings and roundabouts. I think I'll leave it as is, so that
we're only calculating step in one place.

> Beyond that it all looks reasonable to me!
>
> I also checked that the loop operations made sense, I think they do - we
> cover from start inclusive to end exclusive and the alignment is done
> before we call into change_memory_range.

Thanks.

cheers
