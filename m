Return-Path: <linuxppc-dev+bounces-13891-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C34DDC3C92B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 17:50:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2Sqc3dc1z2ySP;
	Fri,  7 Nov 2025 03:50:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762447836;
	cv=none; b=KL4pjGCdn7P4MeOtJzSef74Bon4vszCdShiF30QSLI14LFD/I36cuXklh0fk3gSxZZHntYDqHuwOUSNYmGfamPYlZEPMv5Fey4+1m5suLRon4wPPdTxERwxegj3sgwUcC0ISl01sKFq2zNq0z6FWbdLoooAdAT3zOg3JxhONSLyw2SNiMxtM8bW0zHs51IUYjip4MVr2s2XHiowfxQ5/KBulRxkVF0VCYz3IqNWuw6sooJziEnu9/a3k2U7m8UatvqI9qIldn2nuhAA7v2J2d2CyBzt7rGRdgYq0t5DQKnH6r7FA5hX8IEPEupM9kRr/QdBEIx+3EC9/5xE9vH9w2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762447836; c=relaxed/relaxed;
	bh=D/V5TIkrjNn/BIAvhpQWR7fwDxpgwfKY8b0Z++zrPD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VwQUovrtI17Udpkna3XXVu6+O9EuebL3n2idubbd/m3qrPuKssu72XQTtOPGYta77H4NouAKs6iMU5UM/p0xJLqWTOhUkS5y8E1c0DwM4J6blIP3aUlrm5iDUp2o/Yv0ol7Cj9MPj4tzIF+WTdGoirBZI65qu8uyKdBdYUiZIgFL5+j0MCKPXeJvfUgqvvJz1QfciOVIxRKgqkI4sZihQyEFArI3Ot6r52orYLhWbwXuZjibwgpvbEViImcKPbFTgqUD2dMceYlaIXh8QOmdAN1hKlsz4Yo+WwQcg56kH9KvgV9OaOcl0oG0MWTNEoLlzod6E2SzBcFZa00qVsKThg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2Sqb4NBtz2xR2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 03:50:35 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d2S7w53xNz9sSr;
	Thu,  6 Nov 2025 17:19:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AeGtnbfdBa51; Thu,  6 Nov 2025 17:19:40 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d2S7w3z2yz9sSp;
	Thu,  6 Nov 2025 17:19:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 72F658B794;
	Thu,  6 Nov 2025 17:19:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 7rvAyQ1nhtvl; Thu,  6 Nov 2025 17:19:40 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0FBA08B787;
	Thu,  6 Nov 2025 17:19:40 +0100 (CET)
Message-ID: <d62eea1f-3aff-4b51-976a-4cb8abf502bf@csgroup.eu>
Date: Thu, 6 Nov 2025 17:19:39 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: powerpc/e500: WARNING: at mm/hugetlb.c:4755 hugetlb_add_hstate
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <94377f5c-d4f0-4c0f-b0f6-5bf1cd7305b1@linux.ibm.com>
 <dd634b17-cc5e-497c-8228-2470f6533177@redhat.com>
 <82ef1da8-44c4-4a58-bd00-9839548cb72d@csgroup.eu>
 <ba3a2131-c8d4-481d-aebb-d25be7ae0d19@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <ba3a2131-c8d4-481d-aebb-d25be7ae0d19@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 06/11/2025 à 16:02, David Hildenbrand (Red Hat) a écrit :
>>> Yes, we discussed that in [1].
>>>
>>> We'll have to set ARCH_HAS_GIGANTIC_PAGE on ppc and increase
>>> MAX_FOLIO_ORDER, because apparently, there might be ppc configs that
>>> have even larger hugetlb sizes than PUDs.
>>>
>>> @Cristophe, I was under the impression that you would send a fix. Do you
>>> want me to prepare something and send it out?
>>
>> Indeed I would have liked to better understand the implications of all
>> this, but I didn't have the time.
> 
> Indeed, too me longer than it should to understand and make up my mind 
> as well.
> 
>>
>> By the way, you would describe the fix better than me so yes if you can
>> prepare and send a fix please do.
> 
> I just crafted the following. I yet have to test it more, some early
> feedback+testing would be appreciated!
> 
>  From 274928854644c49c92515f8675c090dba15a0db6 Mon Sep 17 00:00:00 2001
> From: "David Hildenbrand (Red Hat)" <david@kernel.org>
> Date: Thu, 6 Nov 2025 11:31:45 +0100
> Subject: [PATCH] mm: fix MAX_FOLIO_ORDER on some ppc64 configs with hugetlb
> 
> In the past, CONFIG_ARCH_HAS_GIGANTIC_PAGE indicated that we support
> runtime allocation of gigantic hugetlb folios. In the meantime it evolved
> into a generic way for the architecture to state that it supports
> gigantic hugetlb folios.
> 
> In commit fae7d834c43c ("mm: add __dump_folio()") we started using
> CONFIG_ARCH_HAS_GIGANTIC_PAGE to decide MAX_FOLIO_ORDER: whether we could
> have folios larger than what the buddy can handle. In the context of
> that commit, we started using MAX_FOLIO_ORDER to detect page corruptions
> when dumping tail pages of folios. Before that commit, we assumed that
> we cannot have folios larger than the highest buddy order, which was
> obviously wrong.
> 
> In commit 7b4f21f5e038 ("mm/hugetlb: check for unreasonable folio sizes
> when registering hstate"), we used MAX_FOLIO_ORDER to detect
> inconsistencies, and in fact, we found some now.
> 
> Powerpc allows for configs that can allocate gigantic folio during boot
> (not at runtime), that do not set CONFIG_ARCH_HAS_GIGANTIC_PAGE and can
> exceed PUD_ORDER.
> 
> To fix it, let's make powerpc select CONFIG_ARCH_HAS_GIGANTIC_PAGE for
> all 64bit configs, and increase the maximum folio size to P4D_ORDER.
> 
> Ideally, we'd have a better way to obtain a maximum value. But this should
> be good enough for now fix the issue and now mostly states "no real folio
> size limit".
> 
> While at it, handle gigantic DAX folios more clearly: DAX can only
> end up creating gigantic folios with HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD.
> 
> Add a new Kconfig option HAVE_GIGANTIC_FOLIOS to make both cases
> clearer. In particular, worry about ARCH_HAS_GIGANTIC_PAGE only with
> HUGETLB_PAGE.
> 
> Note: with enabling CONFIG_ARCH_HAS_GIGANTIC_PAGE on PPC64, we will now
> also allow for runtime allocations of folios in some more powerpc configs.
> I don't think this is a problem, but if it is we could handle it through
> __HAVE_ARCH_GIGANTIC_PAGE_RUNTIME_SUPPORTED.
> 
> While __dump_page()/__dump_folio was also problematic (not handling dumping
> of tail pages of such gigantic folios correctly), it doesn't relevant
> critical enough to mark it as a fix.
> 
> Fixes: 7b4f21f5e038 ("mm/hugetlb: check for unreasonable folio sizes 
> when registering hstate")
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
> ---
>   arch/powerpc/Kconfig                   | 1 +
>   arch/powerpc/platforms/Kconfig.cputype | 1 -
>   include/linux/mm.h                     | 4 ++--
>   include/linux/pgtable.h                | 1 +
>   mm/Kconfig                             | 7 +++++++
>   5 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index e24f4d88885ae..55c3626c86273 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -137,6 +137,7 @@ config PPC
>       select ARCH_HAS_DMA_OPS            if PPC64
>       select ARCH_HAS_FORTIFY_SOURCE
>       select ARCH_HAS_GCOV_PROFILE_ALL
> +    select ARCH_HAS_GIGANTIC_PAGE        if PPC64

Problem is not only on PPC64, it is on PPC32 as well, for instance 
corenet32_smp_defconfig has the problem as well.

On the other hand for book3s/64 it is already handled, see 
arch/powerpc/platforms/Kconfig.cputype:

config PPC_RADIX_MMU
	bool "Radix MMU Support"
	depends on PPC_BOOK3S_64
	select ARCH_HAS_GIGANTIC_PAGE
	default y


So I think what you want instead is:

diff --git a/arch/powerpc/platforms/Kconfig.cputype 
b/arch/powerpc/platforms/Kconfig.cputype
index 7b527d18aa5ee..1f5a1e587740c 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -276,6 +276,7 @@ config PPC_E500
         select FSL_EMB_PERFMON
         bool
         select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
+       select ARCH_HAS_GIGANTIC_PAGE if ARCH_SUPPORTS_HUGETLBFS
         select PPC_SMP_MUXED_IPI
         select PPC_DOORBELL
         select PPC_KUEP



>       select ARCH_HAS_KCOV
>       select ARCH_HAS_KERNEL_FPU_SUPPORT    if PPC64 && PPC_FPU
>       select ARCH_HAS_MEMBARRIER_CALLBACKS
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/ 
> platforms/Kconfig.cputype
> index 7b527d18aa5ee..4c321a8ea8965 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -423,7 +423,6 @@ config PPC_64S_HASH_MMU
>   config PPC_RADIX_MMU
>       bool "Radix MMU Support"
>       depends on PPC_BOOK3S_64
> -    select ARCH_HAS_GIGANTIC_PAGE

Should remain I think.

>       default y
>       help
>         Enable support for the Power ISA 3.0 Radix style MMU. Currently 
> this
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index d16b33bacc32b..4842edc875185 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2074,7 +2074,7 @@ static inline unsigned long folio_nr_pages(const 
> struct folio *folio)
>       return folio_large_nr_pages(folio);
>   }
> 
> -#if !defined(CONFIG_ARCH_HAS_GIGANTIC_PAGE)
> +#if !defined(CONFIG_HAVE_GIGANTIC_FOLIOS)
>   /*
>    * We don't expect any folios that exceed buddy sizes (and consequently
>    * memory sections).
> @@ -2092,7 +2092,7 @@ static inline unsigned long folio_nr_pages(const 
> struct folio *folio)
>    * There is no real limit on the folio size. We limit them to the 
> maximum we
>    * currently expect (e.g., hugetlb, dax).
>    */
> -#define MAX_FOLIO_ORDER        PUD_ORDER
> +#define MAX_FOLIO_ORDER        P4D_ORDER
>   #endif
> 
>   #define MAX_FOLIO_NR_PAGES    (1UL << MAX_FOLIO_ORDER)
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 32e8457ad5352..09fc3c2ba39e2 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -7,6 +7,7 @@
> 
>   #define PMD_ORDER    (PMD_SHIFT - PAGE_SHIFT)
>   #define PUD_ORDER    (PUD_SHIFT - PAGE_SHIFT)
> +#define P4D_ORDER    (P4D_SHIFT - PAGE_SHIFT)
> 
>   #ifndef __ASSEMBLY__
>   #ifdef CONFIG_MMU
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 0e26f4fc8717b..ca3f146bc7053 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -908,6 +908,13 @@ config PAGE_MAPCOUNT
>   config PGTABLE_HAS_HUGE_LEAVES
>       def_bool TRANSPARENT_HUGEPAGE || HUGETLB_PAGE
> 
> +#
> +# We can end up creating gigantic folio.
> +#
> +config HAVE_GIGANTIC_FOLIOS
> +    def_bool (HUGETLB_PAGE && ARCH_HAS_GIGANTIC_PAGE) || \
> +         (ZONE_DEVICE && HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
> +
>   # TODO: Allow to be enabled without THP
>   config ARCH_SUPPORTS_HUGE_PFNMAP
>       def_bool n


