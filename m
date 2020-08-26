Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC64C252D87
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 14:02:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bc4H25kwfzDqTs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 22:02:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bc4D657vMzDqWj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Aug 2020 21:59:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=V70btNfX; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bc4D61TSvz9sPB;
 Wed, 26 Aug 2020 21:59:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1598443190;
 bh=GOzj1DPicMFxSUlas1Q1vx8Ws0Up4IWmSCJigxWCf3c=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=V70btNfX/PLjOnzqQvGO3b4JBQQrVQ+MYJhODoTs3ta63dpYfxgkjnEdefQDD9gKk
 XlRlc5uqLNiplsIQuUTrp0oGH4oIWJNP9GVUJQPoT4FU5Q5a+O7aC9o98aVRCDwk0A
 ODcN9kfK4IQHIeiyOdC0fDr1rCL0GJhchyRW7v77qgZvxXx+41peQWogcU11DF+5vn
 XlnUoGwLtvdnpo014boZOVav604iYLNp0ZEYApFGfH3vXOhe44m+s8UBlKyGvwsK/2
 EvwCBsggA12u7rX2osXIO5K7z6RTSUGtSqY3Lhvgfxd/QMaW+wIFPUC6W4Tf+LKzNm
 w1ahRc3PBceew==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v7 06/12] powerpc: inline huge vmap supported functions
In-Reply-To: <20200825145753.529284-7-npiggin@gmail.com>
References: <20200825145753.529284-1-npiggin@gmail.com>
 <20200825145753.529284-7-npiggin@gmail.com>
Date: Wed, 26 Aug 2020 21:59:49 +1000
Message-ID: <87lfi1hb2i.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Zefan Li <lizefan@huawei.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> This allows unsupported levels to be constant folded away, and so
> p4d_free_pud_page can be removed because it's no longer linked to.
>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>
> Ack or objection if this goes via the -mm tree? 

Fine by me if it builds.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> diff --git a/arch/powerpc/include/asm/vmalloc.h b/arch/powerpc/include/asm/vmalloc.h
> index 105abb73f075..3f0c153befb0 100644
> --- a/arch/powerpc/include/asm/vmalloc.h
> +++ b/arch/powerpc/include/asm/vmalloc.h
> @@ -1,12 +1,25 @@
>  #ifndef _ASM_POWERPC_VMALLOC_H
>  #define _ASM_POWERPC_VMALLOC_H
>  
> +#include <asm/mmu.h>
>  #include <asm/page.h>
>  
>  #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
> -bool arch_vmap_p4d_supported(pgprot_t prot);
> -bool arch_vmap_pud_supported(pgprot_t prot);
> -bool arch_vmap_pmd_supported(pgprot_t prot);
> +static inline bool arch_vmap_p4d_supported(pgprot_t prot)
> +{
> +	return false;
> +}
> +
> +static inline bool arch_vmap_pud_supported(pgprot_t prot)
> +{
> +	/* HPT does not cope with large pages in the vmalloc area */
> +	return radix_enabled();
> +}
> +
> +static inline bool arch_vmap_pmd_supported(pgprot_t prot)
> +{
> +	return radix_enabled();
> +}
>  #endif
>  
>  #endif /* _ASM_POWERPC_VMALLOC_H */
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index eca83a50bf2e..27f5837cf145 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -1134,22 +1134,6 @@ void radix__ptep_modify_prot_commit(struct vm_area_struct *vma,
>  	set_pte_at(mm, addr, ptep, pte);
>  }
>  
> -bool arch_vmap_pud_supported(pgprot_t prot)
> -{
> -	/* HPT does not cope with large pages in the vmalloc area */
> -	return radix_enabled();
> -}
> -
> -bool arch_vmap_pmd_supported(pgprot_t prot)
> -{
> -	return radix_enabled();
> -}
> -
> -int p4d_free_pud_page(p4d_t *p4d, unsigned long addr)
> -{
> -	return 0;
> -}
> -
>  int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
>  {
>  	pte_t *ptep = (pte_t *)pud;
> @@ -1233,8 +1217,3 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
>  
>  	return 1;
>  }
> -
> -bool arch_vmap_p4d_supported(pgprot_t prot)
> -{
> -	return false;
> -}
> -- 
> 2.23.0
