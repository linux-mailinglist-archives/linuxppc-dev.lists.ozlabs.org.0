Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56635120B5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 18:57:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44w1f551FYzDqM5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 02:57:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="b8I7W1X+"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44w1cY6kdbzDqM4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 02:56:13 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44w1cS5Fwsz9v0Sx;
 Thu,  2 May 2019 18:56:08 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=b8I7W1X+; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4wFI9OSqYAkB; Thu,  2 May 2019 18:56:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44w1cS3z29z9v0Sy;
 Thu,  2 May 2019 18:56:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556816168; bh=Q15LZ3d9bdq9dEoD9BccUn9mlT4iR41PhF1gwPGTDdo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=b8I7W1X+eD9E6f4QICHVyiGb2O+HBaJpc4Gwg6pUFtlpNKygpjn8VED8m8xg+JkOB
 IY+qSAZGLB4WFz+ZuAhNE6IOZlIPudaswik9x6vnbwMIKU3+fxYh/fSD0okZc5lnaA
 cdvwJC11zLQtHCiz8Kggoo4ZlThkHqB1Sg9CxUag=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A25B8B8FE;
 Thu,  2 May 2019 18:56:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RamEpSyy5iYB; Thu,  2 May 2019 18:56:10 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CE4878B899;
 Thu,  2 May 2019 18:56:08 +0200 (CEST)
Subject: Re: [PATCH 12/15] powerpc/nohash/64: switch to generic version of pte
 allocation
To: Mike Rapoport <rppt@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <1556810922-20248-1-git-send-email-rppt@linux.ibm.com>
 <1556810922-20248-13-git-send-email-rppt@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <adcb6ae6-48d9-5ba9-2732-a0ab1d96667c@c-s.fr>
Date: Thu, 2 May 2019 18:56:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556810922-20248-13-git-send-email-rppt@linux.ibm.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 Sam Creasey <sammy@sammy.net>, Arnd Bergmann <arnd@arndb.de>,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Greentime Hu <green.hu@gmail.com>,
 Ley Foon Tan <lftan@altera.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Richard Kuo <rkuo@codeaurora.org>,
 Paul Burton <paul.burton@mips.com>, linux-hexagon@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/05/2019 à 17:28, Mike Rapoport a écrit :
> The 64-bit book-E powerpc implements pte_alloc_one(),
> pte_alloc_one_kernel(), pte_free_kernel() and pte_free() the same way as
> the generic version.

Will soon be converted to the same as the 3 other PPC subarches, see
https://patchwork.ozlabs.org/patch/1091590/

Christophe

> 
> Switch it to the generic version that does exactly the same thing.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/nohash/64/pgalloc.h | 35 ++--------------------------
>   1 file changed, 2 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/nohash/64/pgalloc.h b/arch/powerpc/include/asm/nohash/64/pgalloc.h
> index 66d086f..bfb53a0 100644
> --- a/arch/powerpc/include/asm/nohash/64/pgalloc.h
> +++ b/arch/powerpc/include/asm/nohash/64/pgalloc.h
> @@ -11,6 +11,8 @@
>   #include <linux/cpumask.h>
>   #include <linux/percpu.h>
>   
> +#include <asm-generic/pgalloc.h>	/* for pte_{alloc,free}_one */
> +
>   struct vmemmap_backing {
>   	struct vmemmap_backing *list;
>   	unsigned long phys;
> @@ -92,39 +94,6 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
>   	kmem_cache_free(PGT_CACHE(PMD_CACHE_INDEX), pmd);
>   }
>   
> -
> -static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
> -{
> -	return (pte_t *)__get_free_page(GFP_KERNEL | __GFP_ZERO);
> -}
> -
> -static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
> -{
> -	struct page *page;
> -	pte_t *pte;
> -
> -	pte = (pte_t *)__get_free_page(GFP_KERNEL | __GFP_ZERO | __GFP_ACCOUNT);
> -	if (!pte)
> -		return NULL;
> -	page = virt_to_page(pte);
> -	if (!pgtable_page_ctor(page)) {
> -		__free_page(page);
> -		return NULL;
> -	}
> -	return page;
> -}
> -
> -static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
> -{
> -	free_page((unsigned long)pte);
> -}
> -
> -static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
> -{
> -	pgtable_page_dtor(ptepage);
> -	__free_page(ptepage);
> -}
> -
>   static inline void pgtable_free(void *table, int shift)
>   {
>   	if (!shift) {
> 
