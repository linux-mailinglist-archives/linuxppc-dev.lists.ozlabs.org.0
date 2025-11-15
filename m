Return-Path: <linuxppc-dev+bounces-14193-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 480FDC602B2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Nov 2025 10:50:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7q4s3Gjhz2yv0;
	Sat, 15 Nov 2025 20:50:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763200237;
	cv=none; b=NKYyoiIvsNvp7WV+hJ1SJ1g5HMDUVS4746taTZdh48Uzj3enrItnyvgNYtgR2G6nMEOobJTwPDRhjr+lI9tD7yQTXxeB+xvB9uuzPlm/3lMr4S3NDNBaVbeszmMynZSK3lUGB4huYmYESl92sm3NNmOMlnvsrIqfC23a8hsM+3vYEV4nV+5sOTkIAdi8puEcBkix6KBI1b7uw8czpmGKby7KdUjvAfsN3xQ0a8/k08QRuNpH6sKlPdfPuNrHJa9NVX2cDEjBFbPfUQVY4RXAd+BhEvnJ9Hy1MAhBIcD9QSyCDWaJSPbkqMOqRSzKbtebbxF8GWyzK7NByr4wvYCUFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763200237; c=relaxed/relaxed;
	bh=KRSbS6BXI4D/KBq+34SOTawVeX+U6PfIE+nE+9GQxW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UnwMPVj/SgMYHsJd9AGKB+Fymhd5pTGKQS0rJnDq+v1Kv8OPvQwS4u+6cfh8Ukw7EzuGxwcrU3y6v+mx5Ier9dY3vCC6K6mIGenS58y9rJA6kX/NjDSa285+HpByHAoO93uAWOi2Bnse41KShaXcsq68vK2JN4+F6bOoU3v0f+vhosgMUIiirqc2CdwgiwbVQRrlwKWwOcajO6z6XoV6j4aeekmLJkTCbW981Lmd4AXIoALtirlfa+HKoG5AwSvrVsexjaE9kWIbkIGDXucAvhK79F2U6+uU31CCtOnwRbTBFUhtFMh2mE3Y/c9oA8cnzRE9QeXZSQx8j4nAH6VHZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7q4r3zCmz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Nov 2025 20:50:35 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d7pnJ3RdWz9sSf;
	Sat, 15 Nov 2025 10:37:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rSndbvcbPBGm; Sat, 15 Nov 2025 10:37:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d7pnJ26rnz9sSY;
	Sat, 15 Nov 2025 10:37:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2AFF08B770;
	Sat, 15 Nov 2025 10:37:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 8AuJ7JBTv9yp; Sat, 15 Nov 2025 10:37:08 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3D45F8B76E;
	Sat, 15 Nov 2025 10:37:07 +0100 (CET)
Message-ID: <fb95d369-dda3-47a9-b294-6d5038cee4d4@csgroup.eu>
Date: Sat, 15 Nov 2025 10:37:06 +0100
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
Subject: Re: [PATCH v2] mm: fix MAX_FOLIO_ORDER on powerpc configs with
 hugetlb
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Donet Tom
 <donettom@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Nathan Chancellor <nathan@kernel.org>
References: <20251114214920.2550676-1-david@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251114214920.2550676-1-david@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 14/11/2025 à 22:49, David Hildenbrand (Red Hat) a écrit :
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
> To fix it, let's make powerpc select CONFIG_ARCH_HAS_GIGANTIC_PAGE with
> hugetlb on powerpc, and increase the maximum folio size with hugetlb to 16
> GiB on 64bit (possible on arm64 and powerpc) and 1 GiB on 32 bit (powerpc).
> Note that on some powerpc configurations, whether we actually have gigantic
> pages depends on the setting of CONFIG_ARCH_FORCE_MAX_ORDER, but there is
> nothing really problematic about setting it unconditionally: we just try to
> keep the value small so we can better detect problems in __dump_folio()
> and inconsistencies around the expected largest folio in the system.
> 
> Ideally, we'd have a better way to obtain the maximum hugetlb folio size
> and detect ourselves whether we really end up with gigantic folios. Let's
> defer bigger changes and fix the warnings first.
> 
> While at it, handle gigantic DAX folios more clearly: DAX can only
> end up creating gigantic folios with HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD.
> 
> Add a new Kconfig option HAVE_GIGANTIC_FOLIOS to make both cases
> clearer. In particular, worry about ARCH_HAS_GIGANTIC_PAGE only with
> HUGETLB_PAGE.
> 
> Note: with enabling CONFIG_ARCH_HAS_GIGANTIC_PAGE on powerpc, we will now
> also allow for runtime allocations of folios in some more powerpc configs.
> I don't think this is a problem, but if it is we could handle it through
> __HAVE_ARCH_GIGANTIC_PAGE_RUNTIME_SUPPORTED.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Tested on powerpc 8xx with CONFIG_ARCH_FORCE_MAX_ORDER=8 instead of 9.
It is now possible to add hugepages with the following command:

echo 4 > /sys/kernel/mm/hugepages/hugepages-8192kB/nr_hugepages

But only if CONFIG_CMA is set.

Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> 
> While __dump_page()/__dump_folio was also problematic (not handling dumping
> of tail pages of such gigantic folios correctly), it doesn't seem
> critical enough to mark it as a fix.
> 
> Fixes: 7b4f21f5e038 ("mm/hugetlb: check for unreasonable folio sizes when registering hstate")
> Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Closes: https://lore.kernel.org/r/3e043453-3f27-48ad-b987-cc39f523060a@csgroup.eu/
> Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Closes: https://lore.kernel.org/r/94377f5c-d4f0-4c0f-b0f6-5bf1cd7305b1@linux.ibm.com/
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Donet Tom <donettom@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
> ---
> 
> v1 -> v2:
> * Adjust patch description (typo, 16G vs 1G)
> * Remove ARCH_HAS_GIGANTIC_PAGE from arch/powerpc/platforms/Kconfig.cputype
> * Mention CONFIG_HAVE_GIGANTIC_FOLIOS in comment
> * Use 1 GiB on 32bit to avoid unsigned-long capacity issues
> 
> I yet have to boot-test this on 32bit powerpc. Something for Monday.
> 
> ---
>   arch/powerpc/Kconfig                   |  1 +
>   arch/powerpc/platforms/Kconfig.cputype |  1 -
>   include/linux/mm.h                     | 13 ++++++++++---
>   mm/Kconfig                             |  7 +++++++
>   4 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index e24f4d88885ae..9537a61ebae02 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -137,6 +137,7 @@ config PPC
>   	select ARCH_HAS_DMA_OPS			if PPC64
>   	select ARCH_HAS_FORTIFY_SOURCE
>   	select ARCH_HAS_GCOV_PROFILE_ALL
> +	select ARCH_HAS_GIGANTIC_PAGE		if ARCH_SUPPORTS_HUGETLBFS
>   	select ARCH_HAS_KCOV
>   	select ARCH_HAS_KERNEL_FPU_SUPPORT	if PPC64 && PPC_FPU
>   	select ARCH_HAS_MEMBARRIER_CALLBACKS
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 7b527d18aa5ee..4c321a8ea8965 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -423,7 +423,6 @@ config PPC_64S_HASH_MMU
>   config PPC_RADIX_MMU
>   	bool "Radix MMU Support"
>   	depends on PPC_BOOK3S_64
> -	select ARCH_HAS_GIGANTIC_PAGE
>   	default y
>   	help
>   	  Enable support for the Power ISA 3.0 Radix style MMU. Currently this
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index d16b33bacc32b..7c79b3369b82c 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2074,7 +2074,7 @@ static inline unsigned long folio_nr_pages(const struct folio *folio)
>   	return folio_large_nr_pages(folio);
>   }
>   
> -#if !defined(CONFIG_ARCH_HAS_GIGANTIC_PAGE)
> +#if !defined(CONFIG_HAVE_GIGANTIC_FOLIOS)
>   /*
>    * We don't expect any folios that exceed buddy sizes (and consequently
>    * memory sections).
> @@ -2087,10 +2087,17 @@ static inline unsigned long folio_nr_pages(const struct folio *folio)
>    * pages are guaranteed to be contiguous.
>    */
>   #define MAX_FOLIO_ORDER		PFN_SECTION_SHIFT
> -#else
> +#elif defined(CONFIG_HUGETLB_PAGE)
>   /*
>    * There is no real limit on the folio size. We limit them to the maximum we
> - * currently expect (e.g., hugetlb, dax).
> + * currently expect (see CONFIG_HAVE_GIGANTIC_FOLIOS): with hugetlb, we expect
> + * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
> + */
> +#define MAX_FOLIO_ORDER		get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
> +#else
> +/*
> + * Without hugetlb, gigantic folios that are bigger than a single PUD are
> + * currently impossible.
>    */
>   #define MAX_FOLIO_ORDER		PUD_ORDER
>   #endif
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 0e26f4fc8717b..ca3f146bc7053 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -908,6 +908,13 @@ config PAGE_MAPCOUNT
>   config PGTABLE_HAS_HUGE_LEAVES
>   	def_bool TRANSPARENT_HUGEPAGE || HUGETLB_PAGE
>   
> +#
> +# We can end up creating gigantic folio.
> +#
> +config HAVE_GIGANTIC_FOLIOS
> +	def_bool (HUGETLB_PAGE && ARCH_HAS_GIGANTIC_PAGE) || \
> +		 (ZONE_DEVICE && HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
> +
>   # TODO: Allow to be enabled without THP
>   config ARCH_SUPPORTS_HUGE_PFNMAP
>   	def_bool n
> 
> base-commit: 6146a0f1dfae5d37442a9ddcba012add260bceb0


