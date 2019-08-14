Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B52E8D5E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 16:25:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467sL84XNrzDqsJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 00:25:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="G03rw7QT"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467sF63ZS7zDqcJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 00:20:40 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 467sDz3gSRz9v0cM;
 Wed, 14 Aug 2019 16:20:35 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=G03rw7QT; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ebX1j619Ng1V; Wed, 14 Aug 2019 16:20:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 467sDz2QTXz9v0cL;
 Wed, 14 Aug 2019 16:20:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565792435; bh=VKHZfBPrSStrI2JHQ7GhFuIuRMpuSK6EbPeEhEn928M=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=G03rw7QTWgKwoggAt+fwBkjwOCgoHTGYX3CfqeY2uyoVD4ZdsMIJbgT6kF4mMEAsX
 mFiWH12h4DIvBCFn/fFPOZe2NEXBMakPwaBOSSmtsDH1UWp9/R7RUN01e10fYpRQfA
 X0LhbQetKQox6bv9DtSogvdZsAyfz6z7aD3O4xds=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ED3A38B7F9;
 Wed, 14 Aug 2019 16:20:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vA1qPiDJ3U7H; Wed, 14 Aug 2019 16:20:36 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C12D28B761;
 Wed, 14 Aug 2019 16:20:36 +0200 (CEST)
Subject: Re: [PATCH] powerpc: use the generic dma coherent remap allocator
To: Christoph Hellwig <hch@lst.de>
References: <20190814132230.31874-1-hch@lst.de>
 <20190814132230.31874-2-hch@lst.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <34961f3c-e859-49a0-834f-0342bf1f7974@c-s.fr>
Date: Wed, 14 Aug 2019 16:20:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814132230.31874-2-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/08/2019 à 15:22, Christoph Hellwig a écrit :
> This switches to using common code for the DMA allocations, including
> potential use of the CMA allocator if configured.
> 
> Switching to the generic code enables DMA allocations from atomic
> context, which is required by the DMA API documentation, and also
> adds various other minor features drivers start relying upon.  It
> also makes sure we have on tested code base for all architectures
> that require uncached pte bits for coherent DMA allocations.
> 
> Another advantage is that consistent memory allocations now share
> the general vmalloc pool instead of needing an explicit careout
> from it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   arch/powerpc/Kconfig                         |  12 -
>   arch/powerpc/include/asm/book3s/32/pgtable.h |  12 +-
>   arch/powerpc/include/asm/nohash/32/pgtable.h |  12 +-
>   arch/powerpc/mm/dma-noncoherent.c            | 318 +------------------
>   arch/powerpc/mm/mem.c                        |   4 -
>   arch/powerpc/mm/ptdump/ptdump.c              |   9 -
>   arch/powerpc/platforms/Kconfig.cputype       |   2 +
>   7 files changed, 17 insertions(+), 352 deletions(-)
> 

[...]

> diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-noncoherent.c
> index c617282d5b2a..4272ca5e8159 100644
> --- a/arch/powerpc/mm/dma-noncoherent.c
> +++ b/arch/powerpc/mm/dma-noncoherent.c

[...]

> @@ -408,23 +116,15 @@ void arch_sync_dma_for_cpu(struct device *dev, phys_addr_t paddr,
>   	__dma_sync_page(paddr, size, dir);
>   }
>   
> -/*
> - * Return the PFN for a given cpu virtual address returned by arch_dma_alloc.
> - */
> -long arch_dma_coherent_to_pfn(struct device *dev, void *vaddr,
> -		dma_addr_t dma_addr)
> +void arch_dma_prep_coherent(struct page *page, size_t size)
>   {
> -	/* This should always be populated, so we don't test every
> -	 * level. If that fails, we'll have a nice crash which
> -	 * will be as good as a BUG_ON()
> -	 */
> -	unsigned long cpu_addr = (unsigned long)vaddr;
> -	pgd_t *pgd = pgd_offset_k(cpu_addr);
> -	pud_t *pud = pud_offset(pgd, cpu_addr);
> -	pmd_t *pmd = pmd_offset(pud, cpu_addr);
> -	pte_t *ptep = pte_offset_kernel(pmd, cpu_addr);
> +	unsigned long kaddr = (unsigned long)page_address(page);
>   
> -	if (pte_none(*ptep) || !pte_present(*ptep))
> -		return 0;
> -	return pte_pfn(*ptep);
> +	flush_dcache_range(kaddr, kaddr + size);
> +}
> +
> +static int __init atomic_pool_init(void)
> +{
> +	return dma_atomic_pool_init(GFP_KERNEL, pgprot_noncached(PAGE_KERNEL));
>   }
> +postcore_initcall(atomic_pool_init);

[...]

> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 56a7c814160d..afe71b89dec3 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -450,8 +450,10 @@ config NOT_COHERENT_CACHE
>   	depends on 4xx || PPC_8xx || E200 || PPC_MPC512x || \
>   		GAMECUBE_COMMON || AMIGAONE
>   	select ARCH_HAS_DMA_COHERENT_TO_PFN

You drop arch_dma_coherent_to_pfn(), it's surprising to see 
ARCH_HAS_DMA_COHERENT_TO_PFN remains. At first I thought I'd get a build 
failure.

After looking more, I see there is a arch_dma_coherent_to_pfn()
defined in kernel/dma/remap.c when DMA_DIRECT_REMAP is selected.

I think the naming is not really consistant and should be fixed some 
how, because that's misleading to have an arch_something() being common 
to all.

Christophe

> +	select ARCH_HAS_DMA_PREP_COHERENT
>   	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>   	select ARCH_HAS_SYNC_DMA_FOR_CPU
> +	select DMA_DIRECT_REMAP
>   	default n if PPC_47x
>   	default y
>   
> 
