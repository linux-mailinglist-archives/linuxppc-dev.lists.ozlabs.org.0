Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3190C3EFE2D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 09:47:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqKk40sWXz3bc4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 17:47:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qMoZkzge;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qMoZkzge; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqKjM2Cblz2y0D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 17:46:46 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GqKjK5Rr7z9sWq;
 Wed, 18 Aug 2021 17:46:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629272806;
 bh=KgNbeJ7DXM2VriOwIcdiRdwFjqTg+4C2mmpo8d288kA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qMoZkzge9D1M1fk07RWdbI7/FnTh9WYwMiAdQ2RnW8bzjq8DfC3c8dFWXu0o5Pb/b
 u1cDbKNWARvq3iN+q2WssdNm7Ik+8lDOgfal4oLJwsMTbBFlPLeI8Tl+Fm7onX3nGI
 1mNFbxYA6N9JBYVllZQ3Eo01/8NjSUPuAnT/9ayzPhEGVc+kJ77GJU+5mzff+pGVPz
 SX+bPS/3cKzgJUU5lwTjpBHVVdNKeMso4KeZHfx3cmv/GonU7dGwiFAMmKnkZCyXMX
 OQH+9F8J2jA4q4cF6x5vpDAC6bmJ4hceITg7dd9yJUObCKnsDm1BYnTEka8tBgCNZW
 ybr75Z/xsEx+A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/mm: Fix set_memory_*() against concurrent accesses
In-Reply-To: <87sfz8tam3.fsf@linux.ibm.com>
References: <20210817132552.3375738-1-mpe@ellerman.id.au>
 <87sfz8tam3.fsf@linux.ibm.com>
Date: Wed, 18 Aug 2021 17:46:42 +1000
Message-ID: <87v943fb4t.fsf@mpe.ellerman.id.au>
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
Cc: lvivier@redhat.com, jniethe5@gmail.com, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fabiano Rosas <farosas@linux.ibm.com> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>
> Hi, I already mentioned these things in private, but I'll post here so
> everyone can see:
>
>> Because pte_update() takes the set of PTE bits to set and clear we can't
>> use our existing helpers, eg. pte_wrprotect() etc. and instead have to
>> open code the set of flags. We will clean that up somehow in a future
>> commit.
>
> I tested the following on P9 and it seems to work fine. Not sure if it
> works for CONFIG_PPC_8xx, though.
>
>
>  static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
>  {
>  	long action = (long)data;
>  	pte_t pte;
>  
>  	spin_lock(&init_mm.page_table_lock);
> -
> -	/* invalidate the PTE so it's safe to modify */
> -	pte = ptep_get_and_clear(&init_mm, addr, ptep);
> -	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +	pte = *ptep;
>  
>  	/* modify the PTE bits as desired, then apply */
>  	switch (action) {
> @@ -59,11 +42,9 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
>  		break;
>  	}
>  
> -	set_pte_at(&init_mm, addr, ptep, pte);
> +	pte_update(&init_mm, addr, ptep, ~0UL, pte_val(pte), 0);

I avoided that because it's not atomic, but pte_update() is not atomic
on some platforms anyway. And for now at least we still have the
page_table_lock as well.

So you're right that's a nicer way to do it.

And I'll use ptep_get() as Christophe suggested.

> +	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>  
> -	/* See ptesync comment in radix__set_pte_at() */
> -	if (radix_enabled())
> -		asm volatile("ptesync": : :"memory");

I didn't do that because I wanted to keep the patch minimal. We can do
that as a separate patch.

>  	spin_unlock(&init_mm.page_table_lock);
>  
>  	return 0;
> ---
>
> For reference, the full patch is here:
> https://github.com/farosas/linux/commit/923c95c84d7081d7be9503bf5b276dd93bd17036.patch
>
>>
>> [1]: https://lore.kernel.org/linuxppc-dev/87y318wp9r.fsf@linux.ibm.com/
>>
>> Fixes: 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines")
>> Reported-by: Laurent Vivier <lvivier@redhat.com>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>
> ...
>
>> -	set_pte_at(&init_mm, addr, ptep, pte);
>> +	pte_update(&init_mm, addr, ptep, clear, set, 0);
>>  
>>  	/* See ptesync comment in radix__set_pte_at() */
>>  	if (radix_enabled())
>>  		asm volatile("ptesync": : :"memory");
>> +
>> +	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>
> I think there's an optimization possible here, when relaxing access, to
> skip the TLB flush. Would still need the ptesync though. Similar to what
> Nick did in e5f7cb58c2b7 ("powerpc/64s/radix: do not flush TLB when
> relaxing access").

That commit is specific to Radix, whereas this code needs to work on all
platforms.

We'd need to verify that it's safe to skip the flush on all platforms
and CPU versions.

What I think we can do, and would possibly be a more meaningful
optimisation, is to move the TLB flush out of the loop and up into
change_memory_attr(). So we just do it once for the range, rather than
per page. But that too would be a separate patch.

cheers
