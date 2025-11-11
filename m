Return-Path: <linuxppc-dev+bounces-14095-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CD3C4D610
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 12:21:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5PHk3Qm6z303B;
	Tue, 11 Nov 2025 22:21:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762860098;
	cv=none; b=DeNqH4VrRtVAnWAZLmrVclZJcAZo2xJgTg95WOpaG2pWMIrPsj/KYYZmP8vFEU16Bfnonlb91zjz/vNnfXYdSh9osEgxpBw2GihQjqxNbWMOmRw0A4J/jYHD1qznPIhXUII1rrMl+oyNtvKFme5bsON8aYKMnmuDIKkaeebQt99CwCCDaf7evh9WNCsPCqxNOf4Mif+DAXvAdEsVhJybN1OVNEuQzRCpdTwG0OX0xFcrvwFh+OAw4BxNXjxaFLaaNhqrkC2/EnNoUdnnts7lQiLsSr+Ibl9G9xMBTyMPHIAynNdXP7j959BmEGvNzEsyOvfQBKYbtAAFVYyeWIfsHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762860098; c=relaxed/relaxed;
	bh=wE4US+WxLfdXrpDyXT8Krt8zUjUBj0Tbv/e+sx8EDG8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TKgaCg/wcpGWoJxM3ju9KIU/tnPlTayh3jounLJuxrwrrhETZcHdKlUIW6vO9J+EunMJRIctrzDTOmQnlxxmuj6WCIdzXhpXp6oAM6EsqcBIER8rJFxA5eUFPVrJwop9LtbdoM/bzI3/6WQfcpnnazQLy9iYbTaIDHKk9ziumZym39mPQ0Arz6M0WCFRgZqp0NnEBspwhXv33bAS5Kd8mobFXnu/wIcP21x5y4UgkM1LYrzAD1mHmusHSdDvq497z6HmGhiQqbhXttM7Hz9W5BSw2PIBppIOdQa5svVM62cnurp2YoBCqHrbVi2zYCtXJhB2BRe8mxCymNMvr3axaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JLjDzCkt; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JLjDzCkt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5PHj375Kz2yvk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 22:21:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F4FC61903;
	Tue, 11 Nov 2025 11:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E68C116B1;
	Tue, 11 Nov 2025 11:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762860094;
	bh=ZrGvdPq9Hz5cC97AVar+8oEqhKThf0QRPlHIfq5phDg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=JLjDzCktn0HzTQgMQjVqvax+DFXluvFN4nKr/69dEreycHD7laU17c/EY9F623487
	 9+6exCUjVmVx9EMdKkAeQ0img4M2acO6gDAdLubGgwruWd/PohR6UUC2jTAVqEXFog
	 zDiOm4odTDYNQaRh8dwWP1FlZTrsZWuJegk8nluM/pOodn3GzPcUfAozQeYdUbQ/dQ
	 9XATVE86iBH2jPbFFCwLLdWe+5Hl6TA4N+17jGgn4oZiiQTx5oRNh6b89oVji52OD4
	 jQn06F9bsBEsIWlHW01T6wbPHgDTgK5PujJJSJ1Ud/bGxe05VLJzSSg7Gd5U/WSI6O
	 lx5H4SNVxQNGQ==
Message-ID: <82fdddb1-b89f-4140-a1b9-7dcd2656402e@kernel.org>
Date: Tue, 11 Nov 2025 12:21:29 +0100
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
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
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
 <d62eea1f-3aff-4b51-976a-4cb8abf502bf@csgroup.eu>
 <cdd23dd6-5444-4000-ac68-a72b22bf6a57@kernel.org>
 <1463bcd5-c47b-4c7f-bb13-2664e2e8226e@csgroup.eu>
 <16daac89-d382-466b-a800-dbc861dc7c24@kernel.org>
Content-Language: en-US
In-Reply-To: <16daac89-d382-466b-a800-dbc861dc7c24@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11.11.25 09:29, David Hildenbrand (Red Hat) wrote:
> On 10.11.25 19:31, Christophe Leroy wrote:
>>
>>
>> Le 10/11/2025 à 12:27, David Hildenbrand (Red Hat) a écrit :
>>> Thanks for the review!
>>>
>>>>
>>>> So I think what you want instead is:
>>>>
>>>> diff --git a/arch/powerpc/platforms/Kconfig.cputype
>>>> b/arch/powerpc/platforms/Kconfig.cputype
>>>> index 7b527d18aa5ee..1f5a1e587740c 100644
>>>> --- a/arch/powerpc/platforms/Kconfig.cputype
>>>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>>>> @@ -276,6 +276,7 @@ config PPC_E500
>>>>             select FSL_EMB_PERFMON
>>>>             bool
>>>>             select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
>>>> +       select ARCH_HAS_GIGANTIC_PAGE if ARCH_SUPPORTS_HUGETLBFS
>>>>             select PPC_SMP_MUXED_IPI
>>>>             select PPC_DOORBELL
>>>>             select PPC_KUEP
>>>>
>>>>
>>>>
>>>>>          select ARCH_HAS_KCOV
>>>>>          select ARCH_HAS_KERNEL_FPU_SUPPORT    if PPC64 && PPC_FPU
>>>>>          select ARCH_HAS_MEMBARRIER_CALLBACKS
>>>>> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/
>>>>> platforms/Kconfig.cputype
>>>>> index 7b527d18aa5ee..4c321a8ea8965 100644
>>>>> --- a/arch/powerpc/platforms/Kconfig.cputype
>>>>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>>>>> @@ -423,7 +423,6 @@ config PPC_64S_HASH_MMU
>>>>>      config PPC_RADIX_MMU
>>>>>          bool "Radix MMU Support"
>>>>>          depends on PPC_BOOK3S_64
>>>>> -    select ARCH_HAS_GIGANTIC_PAGE
>>>>
>>>> Should remain I think.
>>>>
>>>>>          default y
>>>>>          help
>>>>>            Enable support for the Power ISA 3.0 Radix style MMU. Currently
>>>
>>>
>>> We also have PPC_8xx do a
>>>
>>>        select ARCH_SUPPORTS_HUGETLBFS
>>>
>>> And of course !PPC_RADIX_MMU (e.g., PPC_64S_HASH_MMU) through
>>> PPC_BOOK3S_64.
>>>
>>> Are we sure they cannot end up with gigantic folios through hugetlb?
>>>
>>
>> Yes indeed. My PPC_8xx is OK because I set CONFIG_ARCH_FORCE_MAX_ORDER=9
>> (largest hugepage is 8M) but I do get the warning with the default value
>> which is 8 (with 16k pages).
>>
>> For PPC_64S_HASH_MMU, max page size is 16M, we get no warning with
>> CONFIG_ARCH_FORCE_MAX_ORDER=8 which is the default value but get the
>> warning with CONFIG_ARCH_FORCE_MAX_ORDER=7
> 
> Right, the dependency on CONFIG_ARCH_FORCE_MAX_ORDER is nasty. In the future,
> likely the arch should just tell us the biggest possible hugetlb size and we
> can then determine this ourselves.
> 
> ... or we'll simply remove the gigantic vs. !gigantic handling completely and
> simply assume that "if there is hugetlb, we might have gigantic folios".
> 
>> Should CONFIG_ARCH_HAS_GIGANTIC_PAGE be set unconditionaly as soon as
>> hugepages are selected, or should it depend on
>> CONFIG_ARCH_FORCE_MAX_ORDER ? What is the cost of selecting
>> CONFIG_ARCH_HAS_GIGANTIC_PAGE ?
> 
> There is no real cost, we just try to keep the value small so __dump_folio()
> can better detect inconsistencies.
> 
> To fix it for now, likely the following is good enough (pushed to the
> previously mentioned branch):
> 
> 
>   From 7abf0f52e59d96533aa8c96194878e9453aa8be0 Mon Sep 17 00:00:00 2001
> From: "David Hildenbrand (Red Hat)" <david@kernel.org>
> Date: Thu, 6 Nov 2025 11:31:45 +0100
> Subject: [PATCH] mm: fix MAX_FOLIO_ORDER on powerpc configs with hugetlb
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
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
> ---
>    arch/powerpc/Kconfig |  1 +
>    include/linux/mm.h   | 12 +++++++++---
>    mm/Kconfig           |  7 +++++++
>    3 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index e24f4d88885ae..9537a61ebae02 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -137,6 +137,7 @@ config PPC
>    	select ARCH_HAS_DMA_OPS			if PPC64
>    	select ARCH_HAS_FORTIFY_SOURCE
>    	select ARCH_HAS_GCOV_PROFILE_ALL
> +	select ARCH_HAS_GIGANTIC_PAGE		if ARCH_SUPPORTS_HUGETLBFS
>    	select ARCH_HAS_KCOV
>    	select ARCH_HAS_KERNEL_FPU_SUPPORT	if PPC64 && PPC_FPU
>    	select ARCH_HAS_MEMBARRIER_CALLBACKS
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index d16b33bacc32b..2646ba7c96a49 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2074,7 +2074,7 @@ static inline unsigned long folio_nr_pages(const struct folio *folio)
>    	return folio_large_nr_pages(folio);
>    }
>    
> -#if !defined(CONFIG_ARCH_HAS_GIGANTIC_PAGE)
> +#if !defined(CONFIG_HAVE_GIGANTIC_FOLIOS)
>    /*
>     * We don't expect any folios that exceed buddy sizes (and consequently
>     * memory sections).
> @@ -2087,10 +2087,16 @@ static inline unsigned long folio_nr_pages(const struct folio *folio)
>     * pages are guaranteed to be contiguous.
>     */
>    #define MAX_FOLIO_ORDER		PFN_SECTION_SHIFT
> -#else
> +#elif defined(CONFIG_HUGETLB_PAGE)
>    /*
>     * There is no real limit on the folio size. We limit them to the maximum we
> - * currently expect (e.g., hugetlb, dax).
> + * currently expect: with hugetlb, we expect no folios larger than 16 GiB.
> + */
> +#define MAX_FOLIO_ORDER		(16 * GIGA / PAGE_SIZE)

Forgot to commit the ilog2(), so this should be

#define MAX_FOLIO_ORDER                ilog2(16 * GIGA / PAGE_SIZE

And we might need unit.h to make some cross compiles happy.

Still testing ...

-- 
Cheers

David

