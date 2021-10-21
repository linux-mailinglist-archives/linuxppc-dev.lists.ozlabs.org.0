Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35660435A26
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 07:04:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZb4N64nwz3c7q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 16:04:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZb3z13Dfz2xrD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 16:03:56 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HZb3s2tNkz9sSQ;
 Thu, 21 Oct 2021 07:03:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i3A5h3hdkNDG; Thu, 21 Oct 2021 07:03:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HZb3s1tQjz9sSN;
 Thu, 21 Oct 2021 07:03:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 25DA38B80E;
 Thu, 21 Oct 2021 07:03:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LoacUJDuppY3; Thu, 21 Oct 2021 07:03:53 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.154])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D11F38B764;
 Thu, 21 Oct 2021 07:03:52 +0200 (CEST)
Subject: Re: [PATCH v2 12/16] powerpc/64e: remove mmu_linear_psize
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211021035417.2157804-1-npiggin@gmail.com>
 <20211021035417.2157804-13-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <dc126027-0ad2-e643-748c-2035b6fff8e7@csgroup.eu>
Date: Thu, 21 Oct 2021 07:03:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211021035417.2157804-13-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/10/2021 à 05:54, Nicholas Piggin a écrit :
> mmu_linear_psize is only set at boot once on 64e, is not necessarily
> the correct size of the linear map pages, and is never used anywhere
> except memremap_compat_align.
> 
> Remove mmu_linear_psize and hard code the 1GB value instead in
> memremap_compat_align.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/mm/ioremap.c    | 6 +++++-
>   arch/powerpc/mm/nohash/tlb.c | 9 ---------
>   2 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
> index 57342154d2b0..730c3bbe4759 100644
> --- a/arch/powerpc/mm/ioremap.c
> +++ b/arch/powerpc/mm/ioremap.c
> @@ -109,12 +109,16 @@ void __iomem *do_ioremap(phys_addr_t pa, phys_addr_t offset, unsigned long size,
>   */
>   unsigned long memremap_compat_align(void)
>   {
> +#ifdef CONFIG_PPC_BOOK3E_64

I don't think this function really belongs to ioremap.c

Could avoid the #ifdef by going in:

arch/powerpc/mm/nohash/book3e_pgtable.c

and

arch/powerpc/mm/book3s64/pgtable.c

> +	// 1GB maximum possible size of the linear mapping.
> +	return max(SUBSECTION_SIZE, 1UL << 30);

Use SZ_1G

> +#else
>   	unsigned int shift = mmu_psize_defs[mmu_linear_psize].shift;
>   
>   	if (radix_enabled())
>   		return SUBSECTION_SIZE;
>   	return max(SUBSECTION_SIZE, 1UL << shift);
> -
> +#endif
>   }
>   EXPORT_SYMBOL_GPL(memremap_compat_align);
>   #endif
> diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
> index 5872f69141d5..8c1523ae7f7f 100644
> --- a/arch/powerpc/mm/nohash/tlb.c
> +++ b/arch/powerpc/mm/nohash/tlb.c
> @@ -150,7 +150,6 @@ static inline int mmu_get_tsize(int psize)
>    */
>   #ifdef CONFIG_PPC64
>   
> -int mmu_linear_psize;		/* Page size used for the linear mapping */
>   int mmu_pte_psize;		/* Page size used for PTE pages */
>   int mmu_vmemmap_psize;		/* Page size used for the virtual mem map */
>   int book3e_htw_mode;		/* HW tablewalk?  Value is PPC_HTW_* */
> @@ -655,14 +654,6 @@ static void early_init_this_mmu(void)
>   
>   static void __init early_init_mmu_global(void)
>   {
> -	/* XXX This will have to be decided at runtime, but right
> -	 * now our boot and TLB miss code hard wires it. Ideally
> -	 * we should find out a suitable page size and patch the
> -	 * TLB miss code (either that or use the PACA to store
> -	 * the value we want)
> -	 */
> -	mmu_linear_psize = MMU_PAGE_1G;
> -
>   	/* XXX This should be decided at runtime based on supported
>   	 * page sizes in the TLB, but for now let's assume 16M is
>   	 * always there and a good fit (which it probably is)
> 
