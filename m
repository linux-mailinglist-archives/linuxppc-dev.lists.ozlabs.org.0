Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D22872EBE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 07:17:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MvZkxAzs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqMfc2q4bz3d8y
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 17:17:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MvZkxAzs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqMdt3JFQz3d8y
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 17:16:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 73C82CE20B2;
	Wed,  6 Mar 2024 06:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F608C433C7;
	Wed,  6 Mar 2024 06:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709705806;
	bh=IB3GfOzNUfXIFpeJe83ampj3Bt5+cvL3ZIZkQ8chnV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MvZkxAzsCLc/0ZLBdD7AJr1R8IXx+NjawjJcePutExZPCOi0qLI0u6XEPirHngsWw
	 6jkkHtLd9ocCleDtOhmO+Usd8PQWEmDAsy7EpBC2MDFlT8iFzlvxnwCqFWtGW8sE11
	 PoGZMscM6T2m04L+rU3wgOg4vayMgd5e7LD9vkZhlhiO7IsQMzk854f9WmF6Ww0pgr
	 o6h9EbhB5nmpC6VW4bxaVLxbeCt8MMiwlEremthZOjx+gAbAgyIrFr/9rQyDX9ctor
	 POTbTZi/F+PwOinsAGphF0K50OMAjX+J00tS6AaCwPs+mPY/Uho2xKDcvIHthehBL2
	 Ywr6Rprr3pl2w==
Date: Wed, 6 Mar 2024 08:15:53 +0200
From: Mike Rapoport <rppt@kernel.org>
To: peterx@redhat.com
Subject: Re: [PATCH v3 01/10] mm/ppc: Define pXd_large() with pXd_leaf()
Message-ID: <ZegKGU4kTV-icKKC@kernel.org>
References: <20240305043750.93762-1-peterx@redhat.com>
 <20240305043750.93762-2-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305043750.93762-2-peterx@redhat.com>
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
Cc: Muchun Song <muchun.song@linux.dev>, Yang Shi <shy828301@gmail.com>, x86@kernel.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org, Nicholas Piggin <npiggin@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 05, 2024 at 12:37:41PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> The two definitions are the same.  The only difference is that pXd_large()
> is only defined with THP selected, and only on book3s 64bits.
> 
> Instead of implementing it twice, make pXd_large() a macro to pXd_leaf().
> Define it unconditionally just like pXd_leaf().  This helps to prepare
> merging the two APIs.
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 16 ++--------------
>  arch/powerpc/include/asm/pgtable.h           |  2 +-
>  2 files changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index 927d585652bc..d1318e8582ac 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -1157,20 +1157,6 @@ pud_hugepage_update(struct mm_struct *mm, unsigned long addr, pud_t *pudp,
>  	return pud_val(*pudp);
>  }
>  
> -/*
> - * returns true for pmd migration entries, THP, devmap, hugetlb
> - * But compile time dependent on THP config
> - */
> -static inline int pmd_large(pmd_t pmd)
> -{
> -	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
> -}
> -
> -static inline int pud_large(pud_t pud)
> -{
> -	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
> -}
> -
>  /*
>   * For radix we should always find H_PAGE_HASHPTE zero. Hence
>   * the below will work for radix too
> @@ -1455,6 +1441,7 @@ static inline bool is_pte_rw_upgrade(unsigned long old_val, unsigned long new_va
>   */
>  #define pmd_is_leaf pmd_is_leaf
>  #define pmd_leaf pmd_is_leaf
> +#define pmd_large pmd_leaf
>  static inline bool pmd_is_leaf(pmd_t pmd)
>  {
>  	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
> @@ -1462,6 +1449,7 @@ static inline bool pmd_is_leaf(pmd_t pmd)
>  
>  #define pud_is_leaf pud_is_leaf
>  #define pud_leaf pud_is_leaf
> +#define pud_large pud_leaf
>  static inline bool pud_is_leaf(pud_t pud)
>  {
>  	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
> index 7a1ba8889aea..5928b3c1458d 100644
> --- a/arch/powerpc/include/asm/pgtable.h
> +++ b/arch/powerpc/include/asm/pgtable.h
> @@ -101,7 +101,7 @@ void poking_init(void);
>  extern unsigned long ioremap_bot;
>  extern const pgprot_t protection_map[16];
>  
> -#ifndef CONFIG_TRANSPARENT_HUGEPAGE
> +#ifndef pmd_large
>  #define pmd_large(pmd)		0
>  #endif
>  
> -- 
> 2.44.0
> 
> 

-- 
Sincerely yours,
Mike.
