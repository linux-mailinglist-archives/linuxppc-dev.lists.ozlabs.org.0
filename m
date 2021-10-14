Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A25CF42D556
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 10:45:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVNKJ18chz3cD0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 19:45:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVNJS2nRrz2yPh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 19:45:10 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HVNJM64LNz9sSK;
 Thu, 14 Oct 2021 10:45:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qyhZ82yXN95R; Thu, 14 Oct 2021 10:45:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HVNJM57kzz9sSF;
 Thu, 14 Oct 2021 10:45:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9BB0D8B788;
 Thu, 14 Oct 2021 10:45:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Qfwqq51fPSNq; Thu, 14 Oct 2021 10:45:07 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.231])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3694E8B763;
 Thu, 14 Oct 2021 10:45:07 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc/s64: Clarify that radix lacks DEBUG_PAGEALLOC
To: Joel Stanley <joel@jms.id.au>, Jordan Niethe <jniethe5@gmail.com>
References: <20211013213438.675095-1-joel@jms.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6fb9e0ec-8ac8-1cc3-38de-78749ffee623@csgroup.eu>
Date: Thu, 14 Oct 2021 10:45:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211013213438.675095-1-joel@jms.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/10/2021 à 23:34, Joel Stanley a écrit :
> The page_alloc.c code will call into __kernel_map_pages when
> DEBUG_PAGEALLOC is configured and enabled.
> 
> As the implementation assumes hash, this should crash spectacularly if
> not for a bit of luck in __kernel_map_pages. In this function
> linear_map_hash_count is always zero, the for loop exits without doing
> any damage.
> 
> There are no other platforms that determine if they support
> debug_pagealloc at runtime. Instead of adding code to mm/page_alloc.c to
> do that, this change turns the map/unmap into a noop when in radix
> mode and prints a warning once.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2: Put __kernel_map_pages in pgtable.h
> 
>   arch/powerpc/include/asm/book3s/64/hash.h    |  2 ++
>   arch/powerpc/include/asm/book3s/64/pgtable.h | 11 +++++++++++
>   arch/powerpc/include/asm/book3s/64/radix.h   |  3 +++
>   arch/powerpc/mm/book3s64/hash_utils.c        |  2 +-
>   arch/powerpc/mm/book3s64/radix_pgtable.c     |  7 +++++++
>   5 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
> index d959b0195ad9..674fe0e890dc 100644
> --- a/arch/powerpc/include/asm/book3s/64/hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/hash.h
> @@ -255,6 +255,8 @@ int hash__create_section_mapping(unsigned long start, unsigned long end,
>   				 int nid, pgprot_t prot);
>   int hash__remove_section_mapping(unsigned long start, unsigned long end);
>   
> +void hash__kernel_map_pages(struct page *page, int numpages, int enable);
> +
>   #endif /* !__ASSEMBLY__ */
>   #endif /* __KERNEL__ */
>   #endif /* _ASM_POWERPC_BOOK3S_64_HASH_H */
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index 5d34a8646f08..265661ded238 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -1101,6 +1101,17 @@ static inline void vmemmap_remove_mapping(unsigned long start,
>   }
>   #endif
>   
> +#ifdef CONFIG_DEBUG_PAGEALLOC
> +static inline void __kernel_map_pages(struct page *page, int numpages, int enable)
> +{
> +	if (radix_enabled()) {
> +		radix__kernel_map_pages(page, numpages, enable);
> +		return;
> +	}
> +	hash__kernel_map_pages(page, numpages, enable);

I'd have prefered something like below

	if (radix_enabled())
		radix__kernel_map_pages(page, numpages, enable);
	else
		hash__kernel_map_pages(page, numpages, enable);


But regardless,

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>



> +}
> +#endif
> +
>   static inline pte_t pmd_pte(pmd_t pmd)
>   {
>   	return __pte_raw(pmd_raw(pmd));
> diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
> index 59cab558e2f0..d090d9612348 100644
> --- a/arch/powerpc/include/asm/book3s/64/radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/radix.h
> @@ -316,5 +316,8 @@ int radix__create_section_mapping(unsigned long start, unsigned long end,
>   				  int nid, pgprot_t prot);
>   int radix__remove_section_mapping(unsigned long start, unsigned long end);
>   #endif /* CONFIG_MEMORY_HOTPLUG */
> +
> +void radix__kernel_map_pages(struct page *page, int numpages, int enable);
> +
>   #endif /* __ASSEMBLY__ */
>   #endif
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index c145776d3ae5..cfd45245d009 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1988,7 +1988,7 @@ static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
>   				     mmu_kernel_ssize, 0);
>   }
>   
> -void __kernel_map_pages(struct page *page, int numpages, int enable)
> +void hash__kernel_map_pages(struct page *page, int numpages, int enable)
>   {
>   	unsigned long flags, vaddr, lmi;
>   	int i;
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index ae20add7954a..83b33418ad28 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -920,6 +920,13 @@ void __meminit radix__vmemmap_remove_mapping(unsigned long start, unsigned long
>   #endif
>   #endif
>   
> +#ifdef CONFIG_DEBUG_PAGEALLOC
> +void radix__kernel_map_pages(struct page *page, int numpages, int enable)
> +{
> +        pr_warn_once("DEBUG_PAGEALLOC not supported in radix mode\n");
> +}
> +#endif
> +
>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>   
>   unsigned long radix__pmd_hugepage_update(struct mm_struct *mm, unsigned long addr,
> 
