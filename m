Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4CF429D6D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 08:02:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HT4nq3Tcwz2yn9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 17:02:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HT4nP3jWXz2yPM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 17:02:14 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HT4nH3nTgz9sTc;
 Tue, 12 Oct 2021 08:02:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xx_QPrtQlJSE; Tue, 12 Oct 2021 08:02:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HT4nH2q5Wz9sSN;
 Tue, 12 Oct 2021 08:02:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0AD238B76E;
 Tue, 12 Oct 2021 08:02:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id IgLcf_gTW2O7; Tue, 12 Oct 2021 08:02:10 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (po18920.idsi0.si.c-s.fr
 [192.168.202.149])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8EEB98B763;
 Tue, 12 Oct 2021 08:02:10 +0200 (CEST)
Subject: Re: [PATCH] powerpc/s64: Clarify that radix lacks DEBUG_PAGEALLOC
To: Joel Stanley <joel@jms.id.au>, Jordan Niethe <jniethe5@gmail.com>
References: <20211012011350.395767-1-joel@jms.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <3d078c92-7a87-bd88-51d2-3fcf0abf3c84@csgroup.eu>
Date: Tue, 12 Oct 2021 08:02:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211012011350.395767-1-joel@jms.id.au>
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



Le 12/10/2021 à 03:13, Joel Stanley a écrit :
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
> I noticed this when I was looking at adding kfence support a while back.
> I've put that work aside and jpn has since gotten further than me, but I
> think this is a fix worth considering.
> 
>   arch/powerpc/include/asm/book3s/64/hash.h |  2 ++
>   arch/powerpc/mm/book3s64/hash_utils.c     |  2 +-
>   arch/powerpc/mm/book3s64/pgtable.c        | 12 ++++++++++++
>   3 files changed, 15 insertions(+), 1 deletion(-)
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
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index 9e16c7b1a6c5..0aefc272cd03 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -526,3 +526,15 @@ static int __init pgtable_debugfs_setup(void)
>   	return 0;
>   }
>   arch_initcall(pgtable_debugfs_setup);
> +
> +#ifdef CONFIG_DEBUG_PAGEALLOC
> +void __kernel_map_pages(struct page *page, int numpages, int enable)
> +{
> +	if (radix_enabled()) {
> +		pr_warn_once("DEBUG_PAGEALLOC not supported in radix mode\n");
> +		return;
> +	}
> +
> +	hash__kernel_map_pages(page, numpages, enable);
> +}

I think it would be better to do similar to most other functions (like 
map_kernel_page() for instance):

In arch/powerpc/include/asm/book3s/64/pgtable.h do:

static inline void __kernel_map_pages(struct page *page, int numpages, 
int enable)
{
	if (radix_enabled())
		radix__kernel_map_pages(...);
	else
		hash__kernel_map_pages(...);
}

Then in arch/powerpc/include/asm/book3s/64/radix.h do (or in 
/arch/powerpc/mm/book3s64/radix_pgtable.c in you prefer ?):

static inline void radix__kernel_map_pages(struct page *page, int 
numpages, int enable)
{
	pr_warn_once("DEBUG_PAGEALLOC not supported in radix mode\n");
}

> +#endif
> 
