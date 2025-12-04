Return-Path: <linuxppc-dev+bounces-14589-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB3ACA27CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 07:17:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMPRx0Jvtz2xHG;
	Thu, 04 Dec 2025 17:17:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764829036;
	cv=none; b=mL5MyrSnFUjvhlkA4qu9QS9XzlQz4r/Jgcmqxm/9/39u0lJspYhgvSG/Ot7+4JfsNGTh7FBuK6eQNR8GteWn4AvoDx9zaAxbQYUwanNzP82HaCah8OWyzikSDNGpXZMEtJk/kECW+n4bipoPTGAjs3pPNUWyVWaBH4Vo5zMVgJbxHcFfaXd1py9lKVP0onc8ei/3m3zWNkgg4KicCPpBFDIbZfHOEnMI9w+mbJ9o5rsc4vQoLX4oFJlPePX+lDv4JAY/7cLv5JrbW7YQhMGLSbWYPFhYQ9+jR3C0felZBI7OQ7uUdRvgD9TGbfTrSeL149MzPfa/90i36ZetKJBQqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764829036; c=relaxed/relaxed;
	bh=Gn1VRYVqjPDCBe/3B+3c2qEZ1R46oEbsGe4ohLKwUDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gfg5boRVpQT08+Qo2J5b8PUuyfFiJUGpJs/lhWc2XXp2FU7+fkbevtsJLLNnv6jhXHmGcZNldMY5gDYp9Ectl1JRd3Bt2FmeyjqGztRR2VT53cPfR52h7WjZ3z6K+6A3q3rRgJ/6cX2DASZD8wsMB2X6BND5yYHQHuzvTFriWRFWRV/FLtwVktytSAQdGd9ojys+aZg5M7mOKy7V/brNpCJQT6ItSjwcIArwCPC5+yAcqWKQxFPG9IekEue5gfk3mU9hHOADily8lgPzTUKUMIf/CaPlEVAaWLtTuPQZMaZBhFUsZhIi2KmYDz6CJJ7KAC/KHeVKOJTgSfXfmgkRxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rRStUzRD; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rRStUzRD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMPRw1Pvyz2xDD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Dec 2025 17:17:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF5B444244;
	Thu,  4 Dec 2025 06:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAE8C113D0;
	Thu,  4 Dec 2025 06:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764829033;
	bh=Q8MUdHMvEgmjaaGlAO28ILhZXpbj6vh8gSr4j+aWy4I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rRStUzRDg7J6StefxqN06Vm3l470tFr4uFpW1lkwsXV2CHlF9G032x1MxsBtD9JlT
	 kQDVwHTeTi1uRkYUBZLXDH2im/vhjY0njrN203gT3IAcTpfmAxGMa72lSZ4+s0jduq
	 ZG6Ukj3IG3DwHWpuBKiePeewSA9ri5xvMStsLZnbEK6IFCYkJ22HgCsrduq/CoKNYN
	 fU0Qrx94BoGuQVSY1SEZ3Gkm0WxfNgt3pl072vbPl2mXFemK895uribiDls4nD1U8N
	 r1uGyYf+nomV0bFuGqyVJUdUSwpZahS6so2CHBXGx6YkplS1GWzKoqtZ9AZ26SsVtM
	 G3gf9HY/zaOrg==
Message-ID: <0b007374-1058-487c-8033-4f0d2830dc89@kernel.org>
Date: Thu, 4 Dec 2025 07:17:06 +0100
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
Subject: Re: [PATCH] Revert "mm: fix MAX_FOLIO_ORDER on powerpc configs with
 hugetlb"
To: Shuah Khan <skhan@linuxfoundation.org>, akpm@linux-foundation.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, masahiroy@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20251204023358.54107-1-skhan@linuxfoundation.org>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251204023358.54107-1-skhan@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On 12/4/25 03:33, Shuah Khan wrote:
> This reverts commit 39231e8d6ba7f794b566fd91ebd88c0834a23b98.

That was supposed to fix powerpc handling though. So I think we have to
understand what is happening here.

> 
> Enabling HAVE_GIGANTIC_FOLIOS broke kernel build and git clone on two
> systems. git fetch-pack fails when cloning large repos and make hangs
> or errors out of Makefile.build with Error: 139. These failures are
> random with git clone failing after fetching 1% of the objects, and
> make hangs while compiling random files.

On which architecture do we see these issues and with which kernel configs?
Can you share one?

> 
> The blow is is one of the git clone failures:
> 
> git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git linux_6.19
> Cloning into 'linux_6.19'...
> remote: Enumerating objects: 11173575, done.
> remote: Counting objects: 100% (785/785), done.
> remote: Compressing objects: 100% (373/373), done.
> remote: Total 11173575 (delta 534), reused 505 (delta 411), pack-reused 11172790 (from 1)
> Receiving objects: 100% (11173575/11173575), 3.00 GiB | 7.08 MiB/s, done.
> Resolving deltas: 100% (9195212/9195212), done.
> fatal: did not receive expected object 0002003e951b5057c16de5a39140abcbf6e44e50
> fatal: fetch-pack: invalid index-pack output

If I would have to guess, these symptoms match what we saw between commit
adfb6609c680 ("mm/huge_memory: initialise the tags of the huge zero folio")
and commit 5bebe8de1926 ("mm/huge_memory: Fix initialization of huge zero folio").

5bebe8de1926 went into v6.18-rc7.

Just to be sure, are you sure we were able to reproduce this issue with a
v6.18-rc7 or even v6.18 that contains 5bebe8de1926?

Bisecting might give you wrong results, as the problems of adfb6609c680 do not
reproduce reliably.


The confusing bit is that MAX_FOLIO_ORDER is mostly used for warnings:

$ git grep MAX_FOLIO_ORDER
include/linux/mm.h:#define MAX_FOLIO_ORDER              MAX_PAGE_ORDER
include/linux/mm.h:#define MAX_FOLIO_ORDER              PFN_SECTION_SHIFT
include/linux/mm.h:#define MAX_FOLIO_ORDER              get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
include/linux/mm.h:#define MAX_FOLIO_ORDER              PUD_ORDER
include/linux/mm.h:#define MAX_FOLIO_NR_PAGES   (1UL << MAX_FOLIO_ORDER)
mm/hugetlb.c:   BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
mm/hugetlb.c:   WARN_ON(order > MAX_FOLIO_ORDER);
mm/internal.h:  VM_WARN_ON_ONCE(order > MAX_FOLIO_ORDER);
mm/memremap.c:  if (WARN_ONCE(pgmap->vmemmap_shift > MAX_FOLIO_ORDER,
mm/page_alloc.c:        if (WARN_ON_ONCE((gfp_mask & __GFP_COMP) && order > MAX_FOLIO_ORDER))


And MAX_FOLIO_NR_PAGES (derived from MAX_FOLIO_ORDER) is only used in a debug helper

$ git grep MAX_FOLIO_NR_PAGES
include/linux/mm.h:#define MAX_FOLIO_NR_PAGES   (1UL << MAX_FOLIO_ORDER)
mm/util.c:      if (ps->idx < MAX_FOLIO_NR_PAGES) {


> 
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
>   arch/powerpc/Kconfig                   |  1 -
>   arch/powerpc/platforms/Kconfig.cputype |  1 +
>   include/linux/mm.h                     | 13 +++----------
>   mm/Kconfig                             |  7 -------
>   4 files changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 9537a61ebae0..e24f4d88885a 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -137,7 +137,6 @@ config PPC
>   	select ARCH_HAS_DMA_OPS			if PPC64
>   	select ARCH_HAS_FORTIFY_SOURCE
>   	select ARCH_HAS_GCOV_PROFILE_ALL
> -	select ARCH_HAS_GIGANTIC_PAGE		if ARCH_SUPPORTS_HUGETLBFS
>   	select ARCH_HAS_KCOV
>   	select ARCH_HAS_KERNEL_FPU_SUPPORT	if PPC64 && PPC_FPU
>   	select ARCH_HAS_MEMBARRIER_CALLBACKS
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 4c321a8ea896..7b527d18aa5e 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -423,6 +423,7 @@ config PPC_64S_HASH_MMU
>   config PPC_RADIX_MMU
>   	bool "Radix MMU Support"
>   	depends on PPC_BOOK3S_64
> +	select ARCH_HAS_GIGANTIC_PAGE
>   	default y
>   	help
>   	  Enable support for the Power ISA 3.0 Radix style MMU. Currently this
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 7c79b3369b82..d16b33bacc32 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2074,7 +2074,7 @@ static inline unsigned long folio_nr_pages(const struct folio *folio)
>   	return folio_large_nr_pages(folio);
>   }
>   
> -#if !defined(CONFIG_HAVE_GIGANTIC_FOLIOS)
> +#if !defined(CONFIG_ARCH_HAS_GIGANTIC_PAGE)
>   /*
>    * We don't expect any folios that exceed buddy sizes (and consequently
>    * memory sections).
> @@ -2087,17 +2087,10 @@ static inline unsigned long folio_nr_pages(const struct folio *folio)
>    * pages are guaranteed to be contiguous.
>    */
>   #define MAX_FOLIO_ORDER		PFN_SECTION_SHIFT
> -#elif defined(CONFIG_HUGETLB_PAGE)
> -/*
> - * There is no real limit on the folio size. We limit them to the maximum we
> - * currently expect (see CONFIG_HAVE_GIGANTIC_FOLIOS): with hugetlb, we expect
> - * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
> - */
> -#define MAX_FOLIO_ORDER		get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
>   #else
>   /*
> - * Without hugetlb, gigantic folios that are bigger than a single PUD are
> - * currently impossible.
> + * There is no real limit on the folio size. We limit them to the maximum we
> + * currently expect (e.g., hugetlb, dax).
>    */
>   #define MAX_FOLIO_ORDER		PUD_ORDER
>   #endif
> diff --git a/mm/Kconfig b/mm/Kconfig
> index ca3f146bc705..0e26f4fc8717 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -908,13 +908,6 @@ config PAGE_MAPCOUNT
>   config PGTABLE_HAS_HUGE_LEAVES
>   	def_bool TRANSPARENT_HUGEPAGE || HUGETLB_PAGE
>   
> -#
> -# We can end up creating gigantic folio.
> -#
> -config HAVE_GIGANTIC_FOLIOS
> -	def_bool (HUGETLB_PAGE && ARCH_HAS_GIGANTIC_PAGE) || \
> -		 (ZONE_DEVICE && HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
> -
>   # TODO: Allow to be enabled without THP
>   config ARCH_SUPPORTS_HUGE_PFNMAP
>   	def_bool n


-- 
Cheers

David

