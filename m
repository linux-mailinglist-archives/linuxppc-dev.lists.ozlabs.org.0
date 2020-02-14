Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B99715D3F2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 09:38:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JmxW4N8tzDqXT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 19:38:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=bxnstb7b; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Jmvp3P18zDqCY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 19:37:10 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48Jmvk0gCfz9txhn;
 Fri, 14 Feb 2020 09:37:06 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=bxnstb7b; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 9ANGaoymhzTK; Fri, 14 Feb 2020 09:37:06 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48Jmvj6kYRz9txhm;
 Fri, 14 Feb 2020 09:37:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581669425; bh=ddxc67V5RXhkdNTVaQ7sd3n3LU9GQgEQfAysbLNxMao=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=bxnstb7bOoshwKDEpC12LAZEnPqZvsQEHDw+7ZngXz7fQ1ewn+wdk7/kGYLNmN82b
 6x1eAOdicY8YQc//mS4FHachzifppVcAWniSjZNIR/8UDR11jbHIoXsm8QVdithFsy
 ZcVZWcj9LCWffy6J+rJbSyB9nyuUxz9VVklzwPk0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DC7EF8B87B;
 Fri, 14 Feb 2020 09:37:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HfggUkm26GkN; Fri, 14 Feb 2020 09:37:06 +0100 (CET)
Received: from [172.25.230.102] (po15451.idsi0.si.c-s.fr [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A568A8B874;
 Fri, 14 Feb 2020 09:37:06 +0100 (CET)
Subject: Re: [PATCH 1/2] powerpc/8xx: Merge 8M hugepage slice and basepage
 slice
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 aneesh.kumar@linux.ibm.com
References: <4ad03047ac61bfbdad3edb92542dedc807fc3cf4.1581011735.git.christophe.leroy@c-s.fr>
Message-ID: <70082b0a-00c4-4d53-8846-ceab9a626328@c-s.fr>
Date: Fri, 14 Feb 2020 09:37:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <4ad03047ac61bfbdad3edb92542dedc807fc3cf4.1581011735.git.christophe.leroy@c-s.fr>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/02/2020 à 20:21, Christophe Leroy a écrit :
> On 8xx, slices are used because hugepages (512k or 8M) and small
> pages (4k or 16k) cannot share the same PGD entry. However, as 8M
> entirely covers two PGD entries (One PGD entry covers 4M), there
> will implicitely be no conflict between 8M pages and any other size.
> So 8M is compatible with the basepage size as well.
> 
> Remove the struct slice_mask mask_8m from mm_context_t and make
> vma_mmu_pagesize() rely on vma_kernel_pagesize() as the base
> slice can now host several sizes.

I'm working on getting rid of CONFIG_PPC_MM_SLICES on the 8xx, so this 
little series is probably not worth merging.

Christophe

> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>   arch/powerpc/include/asm/nohash/32/mmu-8xx.h | 7 ++-----
>   arch/powerpc/mm/hugetlbpage.c                | 3 ++-
>   2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
> index 76af5b0cb16e..54f7f3362edb 100644
> --- a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
> +++ b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
> @@ -215,9 +215,8 @@ typedef struct {
>   	unsigned char low_slices_psize[SLICE_ARRAY_SIZE];
>   	unsigned char high_slices_psize[0];
>   	unsigned long slb_addr_limit;
> -	struct slice_mask mask_base_psize; /* 4k or 16k */
> +	struct slice_mask mask_base_psize; /* 4k or 16k or 8M */
>   	struct slice_mask mask_512k;
> -	struct slice_mask mask_8m;
>   #endif
>   	void *pte_frag;
>   } mm_context_t;
> @@ -257,10 +256,8 @@ static inline struct slice_mask *slice_mask_for_size(mm_context_t *ctx, int psiz
>   {
>   	if (psize == MMU_PAGE_512K)
>   		return &ctx->mask_512k;
> -	if (psize == MMU_PAGE_8M)
> -		return &ctx->mask_8m;
>   
> -	BUG_ON(psize != mmu_virtual_psize);
> +	BUG_ON(psize != mmu_virtual_psize && psize != MMU_PAGE_8M);
>   
>   	return &ctx->mask_base_psize;
>   }
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> index edf511c2a30a..0b4ab741bf09 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -551,7 +551,8 @@ unsigned long hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
>   unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
>   {
>   	/* With radix we don't use slice, so derive it from vma*/
> -	if (IS_ENABLED(CONFIG_PPC_MM_SLICES) && !radix_enabled()) {
> +	if (IS_ENABLED(CONFIG_PPC_MM_SLICES) && !IS_ENABLED(CONFIG_PPC_8xx) &&
> +	    !radix_enabled()) {
>   		unsigned int psize = get_slice_psize(vma->vm_mm, vma->vm_start);
>   
>   		return 1UL << mmu_psize_to_shift(psize);
> 
