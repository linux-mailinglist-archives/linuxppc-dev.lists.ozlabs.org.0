Return-Path: <linuxppc-dev+bounces-14186-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D26C5F127
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Nov 2025 20:43:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7SHv1MsJz2yx7;
	Sat, 15 Nov 2025 06:43:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763149435;
	cv=none; b=cwLVtQv7c6mxOQmAjgb8EzlWp8MWb21Kgd+cB5du23nSfV6qOMxJKQPn7pX+xoWZFr4iKrMMHwiawKfNUU0ESVtXMuDGl+bScFixoNqJfC3Qmb1qlS9eH/fT+8vJZ7tOTzw82JTsxlXq1UhbZ4wQAeJwUJw9vxIXSvxJOdC6093PEN/2MIUuF8jWlJen9hAV0nubM5XLJ5hP0DatWcY9vWZtrUMfN2hhZEeWhUWb8EuM6fPHfYT130eRrYC9rnJhkc7pjPEqfL8Gznqe9/bM0mAhsGNTm8z1LGO/V4xO8fQRsQ2RM3qVU82ZTcOh6X8A4BJCFNWa4R953MqVQ6SqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763149435; c=relaxed/relaxed;
	bh=WE7OlafaKyP96402VgeY55yzAoTAjvVTtmvCVmIIt4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWXZZu44JWkxd9YE68TqYfzqUzWhZuRe2jlh+8PJRWIwor4pglf4YjarQ6b854pEkqKy4OE0K0kpk8od7DKcTbFWeoXu/eiYii0TSup/ScUa6c6kJGMwmKVga4k09k3CLIXJ+XMCJM439oONA1V5JWUem5XQVPomrIWONPEeFXgDnB0+0KaP4CFofGZU8I3Mh3oj+KEDeHVjYdxs4fQPyduiikdK/qXEVCVikpGmjCqUX1LZn+qzHLJD4xQ7MI+OmWhHeqSw3SlAONII7G5RHpZapP/ajfMiKoMuyWXJDFlUOE6hr8fenFpGZTrRIxcnHGC4masJ4fbV9cTqDxGGkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kl3XkPFc; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kl3XkPFc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7SHt26dvz2ynH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Nov 2025 06:43:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C1B9D60192;
	Fri, 14 Nov 2025 19:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E7BC4AF09;
	Fri, 14 Nov 2025 19:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763149431;
	bh=5T9R+DZ0cAE97xt1xNOrZCDnV4pc9v2U3yy+1/Gkztg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kl3XkPFcbdBd10maRIJsdzkZj9uqLKeoMdgjb9QvwLiqK1GHQ1WyX8ptgPfUApqlB
	 R89cQ3goj7w10u6RbmRNqHz80ZdiC3QMdR7ZKSikW4Y2FCMxYwXSwFy7rztSUSf5wm
	 9wFb0/zwsCrwoMkBi8vu0VCDCTuNDUbwgJjcKT5iwmD6gq0DcNH+ZBWmYd1L60vCuf
	 VwbnDczWUfVWCmBnHL19/wu6T5v/eeABlCsMiQxUHFey05wANwZpdHjdgTVCrdfUg2
	 3leNoyRrmD8QPFO0W1bQbG+iOJyAdW5Q51EWaKlWfnH2lBASCKIKWwBle5PjtIk+it
	 eQkz48MRpFi+g==
Message-ID: <9c86c4ad-2659-4091-9f2a-d166c5e8daa3@kernel.org>
Date: Fri, 14 Nov 2025 20:43:43 +0100
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
Subject: Re: [PATCH v1] mm: fix MAX_FOLIO_ORDER on powerpc configs with
 hugetlb
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
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
References: <20251112145632.508687-1-david@kernel.org>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251112145632.508687-1-david@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12.11.25 15:56, David Hildenbrand (Red Hat) wrote:
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
> GiB (possible on arm64 and powerpc). Note that on some powerpc
> configurations, whether we actually have gigantic pages
> depends on the setting of CONFIG_ARCH_FORCE_MAX_ORDER, but there is
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
> 
> While __dump_page()/__dump_folio was also problematic (not handling dumping
> of tail pages of such gigantic folios correctly), it doesn't relevant
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
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
> ---
>   arch/powerpc/Kconfig |  1 +
>   include/linux/mm.h   | 12 +++++++++---
>   mm/Kconfig           |  7 +++++++
>   3 files changed, 17 insertions(+), 3 deletions(-)
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
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index d16b33bacc32b..63aea4b3fb5d9 100644
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
> @@ -2087,10 +2087,16 @@ static inline unsigned long folio_nr_pages(const struct folio *folio)
>    * pages are guaranteed to be contiguous.
>    */
>   #define MAX_FOLIO_ORDER		PFN_SECTION_SHIFT
> -#else
> +#elif defined(CONFIG_HUGETLB_PAGE)
>   /*
>    * There is no real limit on the folio size. We limit them to the maximum we
> - * currently expect (e.g., hugetlb, dax).
> + * currently expect: with hugetlb, we expect no folios larger than 16 GiB.
> + */
> +#define MAX_FOLIO_ORDER		get_order(SZ_16G)

Turns out that's a problem on 32bit builds, because it won't fit into unsigned long. Grml.

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 63aea4b3fb5d9..f595565bdd113 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2090,9 +2090,10 @@ static inline unsigned long folio_nr_pages(const struct folio *folio)
  #elif defined(CONFIG_HUGETLB_PAGE)
  /*
   * There is no real limit on the folio size. We limit them to the maximum we
- * currently expect: with hugetlb, we expect no folios larger than 16 GiB.
+ * currently expect: with hugetlb, we expect no folios larger than 16 GiB
+ * on 64bit and 1 GiB on 32bit.
   */
-#define MAX_FOLIO_ORDER                get_order(SZ_16G)
+#define MAX_FOLIO_ORDER                get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
  #else
  /*

I'll resend the patch ...


-- 
Cheers

David

