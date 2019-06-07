Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 254B9384A9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 08:58:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KtfK39RBzDqr5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 16:58:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="wCaGEw9e"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Ktcc40PWzDqhn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 16:57:03 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45KtcT21D4z9v0N1;
 Fri,  7 Jun 2019 08:56:57 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=wCaGEw9e; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id A-GiD1E03wRz; Fri,  7 Jun 2019 08:56:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45KtcT0s81z9v0N0;
 Fri,  7 Jun 2019 08:56:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1559890617; bh=rT2KYJLpEW56BJH8AO09xSF37HrkE6VvVKe3nohmyDo=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=wCaGEw9ewG+laqvE9GkVsbqSFGW0Sp0xPRSo+RMueeQaMdVDoHU/S8gMVyISuFk6s
 ONc9j90Spga9/8AUpxido37Hyei8rTYLUDTOhG4b1zzq2ZG55xMP9BjR2zIH0Ee9gg
 0WLo2cbnb+4y5KGzOSrN7h+N6zdXYjTFueabdxjs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1C6958B83A;
 Fri,  7 Jun 2019 08:56:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id z1rrrPhV_zWW; Fri,  7 Jun 2019 08:56:58 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E692A8B75A;
 Fri,  7 Jun 2019 08:56:57 +0200 (CEST)
Subject: Re: [PATCH 2/2] powerpc/64s/radix: ioremap use huge page mappings
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190607061922.20542-1-npiggin@gmail.com>
 <20190607061922.20542-2-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <f842646a-c9a1-61a8-9c2b-befb4d6313fa@c-s.fr>
Date: Fri, 7 Jun 2019 08:56:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607061922.20542-2-npiggin@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/06/2019 à 08:19, Nicholas Piggin a écrit :
> powerpc/64s does not use ioremap_page_range, so it does not get huge
> vmap iomap mappings automatically. The radix kernel mapping function
> already allows larger page mappings that work with huge vmap, so wire
> that up to allow huge pages to be used for ioremap mappings.

Argh ... I was on the way to merge pgtable_64.c and pgtable_32.c. This 
will complicate the task ... Anyway this looks a good improvment.

Any reason to limit that to Radix ?

> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/book3s/64/pgtable.h |  8 +++
>   arch/powerpc/mm/pgtable_64.c                 | 58 ++++++++++++++++++--
>   include/linux/io.h                           |  1 +
>   lib/ioremap.c                                |  2 +-
>   4 files changed, 62 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index ccf00a8b98c6..d7a4f2d80598 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -274,6 +274,14 @@ extern unsigned long __vmalloc_end;
>   #define VMALLOC_START	__vmalloc_start
>   #define VMALLOC_END	__vmalloc_end
>   
> +static inline unsigned int ioremap_max_order(void)
> +{
> +	if (radix_enabled())
> +		return PUD_SHIFT;
> +	return 7 + PAGE_SHIFT; /* default from linux/vmalloc.h */
> +}
> +#define IOREMAP_MAX_ORDER ({ ioremap_max_order();})

Following form doesn't work ?

#define IOREMAP_MAX_ORDER	ioremap_max_order()

> +
>   extern unsigned long __kernel_virt_start;
>   extern unsigned long __kernel_virt_size;
>   extern unsigned long __kernel_io_start;
> diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
> index d2d976ff8a0e..cf02b67eee55 100644
> --- a/arch/powerpc/mm/pgtable_64.c
> +++ b/arch/powerpc/mm/pgtable_64.c
> @@ -112,7 +112,7 @@ unsigned long ioremap_bot = IOREMAP_BASE;
>    * __ioremap_at - Low level function to establish the page tables
>    *                for an IO mapping
>    */
> -void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_t prot)
> +static void __iomem * hash__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_t prot)

Is this the correct name ?

As far as I understand, this function will be used by nohash/64, looks 
strange to call hash__something() a function used by nohash platforms.

>   {
>   	unsigned long i;
>   
> @@ -120,6 +120,54 @@ void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_
>   	if (pgprot_val(prot) & H_PAGE_4K_PFN)
>   		return NULL;
>   
> +	for (i = 0; i < size; i += PAGE_SIZE)
> +		if (map_kernel_page((unsigned long)ea + i, pa + i, prot))
> +			return NULL;
> +
> +	return (void __iomem *)ea;
> +}
> +
> +static int radix__ioremap_page_range(unsigned long addr, unsigned long end,
> +		       phys_addr_t phys_addr, pgprot_t prot)
> +{
> +	while (addr != end) {
> +		if (unlikely(ioremap_huge_disabled))
> +			goto use_small_page;

I don't like too much a goto in the middle of an if/else set inside a loop.

Couldn't we have two while() loops, one for the !ioremap_huge_disabled() 
and one for the ioremap_huge_disabled() case ? It would duplicate some 
code but that's only 3 small lines.

Or, when ioremap_huge_disabled(), couldn't it just fallback to the 
hash__ioremap_at() function ?

> +
> +		if (!(addr & ~PUD_MASK) && !(phys_addr & ~PUD_MASK) &&
> +				end - addr >= PUD_SIZE) {
> +			if (radix__map_kernel_page(addr, phys_addr, prot, PUD_SIZE))
> +				return -ENOMEM;
> +			addr += PUD_SIZE;
> +			phys_addr += PUD_SIZE;
> +
> +		} else if (!(addr & ~PMD_MASK) && !(phys_addr & ~PMD_MASK) &&
> +				end - addr >= PMD_SIZE) {
> +			if (radix__map_kernel_page(addr, phys_addr, prot, PMD_SIZE))
> +				return -ENOMEM;
> +			addr += PMD_SIZE;
> +			phys_addr += PMD_SIZE;
> +
> +		} else {
> +use_small_page:
> +			if (radix__map_kernel_page(addr, phys_addr, prot, PAGE_SIZE))
> +				return -ENOMEM;
> +			addr += PAGE_SIZE;
> +			phys_addr += PAGE_SIZE;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static void __iomem * radix__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_t prot)
> +{
> +	if (radix__ioremap_page_range((unsigned long)ea, (unsigned long)ea + size, pa, prot))
> +		return NULL;
> +	return ea;
> +}
> +
> +void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_t prot)
> +{
>   	if ((ea + size) >= (void *)IOREMAP_END) {
>   		pr_warn("Outside the supported range\n");
>   		return NULL;
> @@ -129,11 +177,9 @@ void __iomem *__ioremap_at(phys_addr_t pa, void *ea, unsigned long size, pgprot_
>   	WARN_ON(((unsigned long)ea) & ~PAGE_MASK);
>   	WARN_ON(size & ~PAGE_MASK);
>   
> -	for (i = 0; i < size; i += PAGE_SIZE)
> -		if (map_kernel_page((unsigned long)ea + i, pa + i, prot))
> -			return NULL;
> -
> -	return (void __iomem *)ea;
> +	if (radix_enabled())

What about  if (radix_enabled() && !ioremap_huge_disabled())  instead ?

> +		return radix__ioremap_at(pa, ea, size, prot);
> +	return hash__ioremap_at(pa, ea, size, prot);

Can't we just leave the no radix stuff here instead of making that 
hash__ioremap_at() function ?

Christophe


>   }
>   
>   /**
> diff --git a/include/linux/io.h b/include/linux/io.h
> index 32e30e8fb9db..423c4294aaa3 100644
> --- a/include/linux/io.h
> +++ b/include/linux/io.h
> @@ -44,6 +44,7 @@ static inline int ioremap_page_range(unsigned long addr, unsigned long end,
>   #endif
>   
>   #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
> +extern int ioremap_huge_disabled;
>   void __init ioremap_huge_init(void);
>   int arch_ioremap_pud_supported(void);
>   int arch_ioremap_pmd_supported(void);
> diff --git a/lib/ioremap.c b/lib/ioremap.c
> index 063213685563..386ff956755f 100644
> --- a/lib/ioremap.c
> +++ b/lib/ioremap.c
> @@ -18,7 +18,7 @@
>   static int __read_mostly ioremap_p4d_capable;
>   static int __read_mostly ioremap_pud_capable;
>   static int __read_mostly ioremap_pmd_capable;
> -static int __read_mostly ioremap_huge_disabled;
> +int __read_mostly ioremap_huge_disabled;
>   
>   static int __init set_nohugeiomap(char *str)
>   {
> 
