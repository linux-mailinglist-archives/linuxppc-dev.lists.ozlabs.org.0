Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBEC77CBD8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 13:39:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=l3rjqSvC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQ8SY2yvHz3cNV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 21:39:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=l3rjqSvC;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQ8Rj4C9vz3c1M
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 21:38:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692099532;
	bh=V/NidSQ98oxxB1G21yOs4UVictE6JoE4wCMA+7dQFjI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=l3rjqSvCdVYCZIfdriP0jTu8WjiNRoil9UtAgMmSauITsMgEqYasR7qsq6J4Dt7T8
	 9PBo0scIDymFoauOs5I25aaxOUam4yA8WY/ngmP7qk2EVZJ4B8vWwgsKxdN8pl4min
	 DWEuglx6J9wQcN9SU1mgLp+IjQei7EYDEzmy3Nk2O8lSe4XL1MjH3p9LfcYNBJcfVM
	 rGXRv/BeKJtWqRwlkHPAcy8HCrOg3UnSmL/qVoRTNjEJlxmEkITgJi2NadLTZ2D5q3
	 VeOt51Cm6t8zTPIJKgKVubLmu5qXYpjFpzYRlKZ/bx/6/mJFq2Qs9v9NYn8KGqoiYD
	 /aVJ9ebHKv9Rg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RQ8Rc4LNGz4wxQ;
	Tue, 15 Aug 2023 21:38:52 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/32s: Cleanup the mess in __set_pte_at()
In-Reply-To: <ba485f4a77ed4279b30500bfcc32d99ef0069ba0.1656656649.git.christophe.leroy@csgroup.eu>
References: <ba485f4a77ed4279b30500bfcc32d99ef0069ba0.1656656649.git.christophe.leroy@csgroup.eu>
Date: Tue, 15 Aug 2023 21:38:52 +1000
Message-ID: <87msyscz77.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> __set_pte_at() handles 3 main cases with #ifdefs plus the 'percpu'
> subcase which leads to code duplication.
>
> Rewrite the function using IS_ENABLED() to minimise the total number
> of cases and remove duplicated code.

I think the code change is good, but the comment becomes completely
misleading. Because it talks about "the first case" etc., but then the
code is structured differently.

cheers

> diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
> index 40041ac713d9..2a0ca1f9a1ff 100644
> --- a/arch/powerpc/include/asm/book3s/32/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
> @@ -534,58 +534,43 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
>  
>  
>  /* This low level function performs the actual PTE insertion
> - * Setting the PTE depends on the MMU type and other factors. It's
> - * an horrible mess that I'm not going to try to clean up now but
> - * I'm keeping it in one place rather than spread around
> + * Setting the PTE depends on the MMU type and other factors.
> + *
> + * First case is 32-bit Hash MMU in SMP mode with 32-bit PTEs. We use the
> + * helper pte_update() which does an atomic update. We need to do that
> + * because a concurrent invalidation can clear _PAGE_HASHPTE. If it's a
> + * per-CPU PTE such as a kmap_atomic, we do a simple update preserving
> + * the hash bits instead (ie, same as the non-SMP case)
> + *
> + * Second case is 32-bit with 64-bit PTE.  In this case, we
> + * can just store as long as we do the two halves in the right order
> + * with a barrier in between. This is possible because we take care,
> + * in the hash code, to pre-invalidate if the PTE was already hashed,
> + * which synchronizes us with any concurrent invalidation.
> + * In the percpu case, we also fallback to the simple update preserving
> + * the hash bits
> + *
> + * Third case is 32-bit hash table in UP mode, we need to preserve
> + * the _PAGE_HASHPTE bit since we may not have invalidated the previous
> + * translation in the hash yet (done in a subsequent flush_tlb_xxx())
> + * and see we need to keep track that this PTE needs invalidating
>   */
>  static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
>  				pte_t *ptep, pte_t pte, int percpu)
>  {
> -#if defined(CONFIG_SMP) && !defined(CONFIG_PTE_64BIT)
> -	/* First case is 32-bit Hash MMU in SMP mode with 32-bit PTEs. We use the
> -	 * helper pte_update() which does an atomic update. We need to do that
> -	 * because a concurrent invalidation can clear _PAGE_HASHPTE. If it's a
> -	 * per-CPU PTE such as a kmap_atomic, we do a simple update preserving
> -	 * the hash bits instead (ie, same as the non-SMP case)
> -	 */
> -	if (percpu)
> -		*ptep = __pte((pte_val(*ptep) & _PAGE_HASHPTE)
> -			      | (pte_val(pte) & ~_PAGE_HASHPTE));
> -	else
> -		pte_update(mm, addr, ptep, ~_PAGE_HASHPTE, pte_val(pte), 0);
> +	if ((!IS_ENABLED(CONFIG_SMP) && !IS_ENABLED(CONFIG_PTE_64BIT)) || percpu) {
> +		*ptep = __pte((pte_val(*ptep) & _PAGE_HASHPTE) |
> +			      (pte_val(pte) & ~_PAGE_HASHPTE));
> +	} else if (IS_ENABLED(CONFIG_PTE_64BIT)) {
> +		if (pte_val(*ptep) & _PAGE_HASHPTE)
> +			flush_hash_entry(mm, ptep, addr);
>  
> -#elif defined(CONFIG_PTE_64BIT)
> -	/* Second case is 32-bit with 64-bit PTE.  In this case, we
> -	 * can just store as long as we do the two halves in the right order
> -	 * with a barrier in between. This is possible because we take care,
> -	 * in the hash code, to pre-invalidate if the PTE was already hashed,
> -	 * which synchronizes us with any concurrent invalidation.
> -	 * In the percpu case, we also fallback to the simple update preserving
> -	 * the hash bits
> -	 */
> -	if (percpu) {
> -		*ptep = __pte((pte_val(*ptep) & _PAGE_HASHPTE)
> -			      | (pte_val(pte) & ~_PAGE_HASHPTE));
> -		return;
> +		asm volatile("stw%X0 %2,%0; eieio; stw%X1 %L2,%1" :
> +			     "=m" (*ptep), "=m" (*((unsigned char *)ptep+4)) :
> +			     "r" (pte) : "memory");
> +	} else {
> +		pte_update(mm, addr, ptep, ~_PAGE_HASHPTE, pte_val(pte), 0);
>  	}
> -	if (pte_val(*ptep) & _PAGE_HASHPTE)
> -		flush_hash_entry(mm, ptep, addr);
> -	__asm__ __volatile__("\
> -		stw%X0 %2,%0\n\
> -		eieio\n\
> -		stw%X1 %L2,%1"
> -	: "=m" (*ptep), "=m" (*((unsigned char *)ptep+4))
> -	: "r" (pte) : "memory");
> -
> -#else
> -	/* Third case is 32-bit hash table in UP mode, we need to preserve
> -	 * the _PAGE_HASHPTE bit since we may not have invalidated the previous
> -	 * translation in the hash yet (done in a subsequent flush_tlb_xxx())
> -	 * and see we need to keep track that this PTE needs invalidating
> -	 */
> -	*ptep = __pte((pte_val(*ptep) & _PAGE_HASHPTE)
> -		      | (pte_val(pte) & ~_PAGE_HASHPTE));
> -#endif
>  }
>  
>  /*
> -- 
> 2.36.1
