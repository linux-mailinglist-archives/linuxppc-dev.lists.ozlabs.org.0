Return-Path: <linuxppc-dev+bounces-14100-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 167B4C4DA1C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 13:20:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5QbH6t6Yz306N;
	Tue, 11 Nov 2025 23:20:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762863611;
	cv=none; b=VA37o97qeTCQ7UTgsDLk0hQ8Is7mmcysMh++i9g+/ed3qoyx6D3Ahbhkt/1i8mmmL+L4vWhCNULY5w0LMDXt4HiBHnXlPYypB/h3BULTy5GcjAHEQ/8s2sVrNPwMUDJJbNOQNGpNyGBhePVd+DTe5NhOnFIr9OOL0Q9dD1JlywGM1H7lY4ux0YOu1I2fvD3T85/pcXc9hnuAXVOJzyfcX3MR68aSNeLHir65QqiLYUMpp+UD+61vov0HiO90PS7T5U6hBuJule1w7uTZaCASPLPI8VieX9p4uxkLJ0NOkTS0v6IyDVOksHTfT0uAZwichPoC3XAtl+dbh5BjLode1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762863611; c=relaxed/relaxed;
	bh=9VZnni2yCeEuKoj1jQ5hW1Dn60Nneuj0LhDze5dDWTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BXIQXTV59tYdEy0b8lhIDeIbF25dRjAmMWntbKsLAXKNMZtb9kk7opZWgTzIzStTXDNJ2c4hwU9kL4NJjOSkVMPjAfBYrO1F7fnlvcgcp2aeEVqngXNCPra/QQWfmabgrgg0Q9yc1H3jFlbpMIjUoIwjC8N+zoar5eXMM16zz36vd3klZiSSMqSKYl9W4nl7wq5Z3GS3P6MCksaEQcKfyNQKm9c6Z4fxvGIhT8fZyzkKjaM3gyJfOL+O1mZkvgFG/Pd9wCPRjIiHMhRjPq8GRoghuEgPuziPYc96LCVi3QAifRE+F4rexnVRE+8cH1oVgx3Xu//wLiFrWy48vCcmeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZRqcbmGZ; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZRqcbmGZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5QbH1YrSz2xFR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 23:20:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E9CC943AFC;
	Tue, 11 Nov 2025 12:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF452C4CEFB;
	Tue, 11 Nov 2025 12:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762863608;
	bh=K0YaNL2pmRgAppZkCyAuVDX23Yiz++0ivtc6R/YgURM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZRqcbmGZWL4KMIRGt/Z6w0A3USAjOvR5wJguYgimvZSP0s9pLZ5G5E6tQWBtbq5Uc
	 fh73+m88ycZuFP0iVZOdO+6M20LAM1zThLTHWgMhx5+LYF11jz++dNsjQzkbYHnx77
	 EmyVM5Nt/It4PnDBCd++X8lbJl7S+IlekTTEmsXgiCl4GiTULTURPTn1Z936g7I42q
	 r42rh7wQajSgwQPgAUNFWEwSlsNR/z4sOo7yjuxcB9rfYnr3B/7XCVfDTMRrVv13Ue
	 2MIV1GOMlt7bBt1hJT00ciRCFpqI6yp0xNBLBpV3l0Op1FJ7/Xnh2h5Pt5clRpsW6c
	 21+bPmcIldlQw==
Message-ID: <b2a79874-4718-47dd-ad79-99d7fb49246e@kernel.org>
Date: Tue, 11 Nov 2025 13:20:03 +0100
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
 <82fdddb1-b89f-4140-a1b9-7dcd2656402e@kernel.org>
 <a31e6d70-9275-4277-991b-9de1aea03cd7@csgroup.eu>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <a31e6d70-9275-4277-991b-9de1aea03cd7@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11.11.25 12:42, Christophe Leroy wrote:
> 
> 
> Le 11/11/2025 à 12:21, David Hildenbrand (Red Hat) a écrit :
>> On 11.11.25 09:29, David Hildenbrand (Red Hat) wrote:
>>> On 10.11.25 19:31, Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 10/11/2025 à 12:27, David Hildenbrand (Red Hat) a écrit :
>>>>> Thanks for the review!
>>>>>
>>>>>>
>>>>>> So I think what you want instead is:
>>>>>>
>>>>>> diff --git a/arch/powerpc/platforms/Kconfig.cputype
>>>>>> b/arch/powerpc/platforms/Kconfig.cputype
>>>>>> index 7b527d18aa5ee..1f5a1e587740c 100644
>>>>>> --- a/arch/powerpc/platforms/Kconfig.cputype
>>>>>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>>>>>> @@ -276,6 +276,7 @@ config PPC_E500
>>>>>>              select FSL_EMB_PERFMON
>>>>>>              bool
>>>>>>              select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
>>>>>> +       select ARCH_HAS_GIGANTIC_PAGE if ARCH_SUPPORTS_HUGETLBFS
>>>>>>              select PPC_SMP_MUXED_IPI
>>>>>>              select PPC_DOORBELL
>>>>>>              select PPC_KUEP
>>>>>>
>>>>>>
>>>>>>
>>>>>>>           select ARCH_HAS_KCOV
>>>>>>>           select ARCH_HAS_KERNEL_FPU_SUPPORT    if PPC64 && PPC_FPU
>>>>>>>           select ARCH_HAS_MEMBARRIER_CALLBACKS
>>>>>>> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/
>>>>>>> platforms/Kconfig.cputype
>>>>>>> index 7b527d18aa5ee..4c321a8ea8965 100644
>>>>>>> --- a/arch/powerpc/platforms/Kconfig.cputype
>>>>>>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>>>>>>> @@ -423,7 +423,6 @@ config PPC_64S_HASH_MMU
>>>>>>>       config PPC_RADIX_MMU
>>>>>>>           bool "Radix MMU Support"
>>>>>>>           depends on PPC_BOOK3S_64
>>>>>>> -    select ARCH_HAS_GIGANTIC_PAGE
>>>>>>
>>>>>> Should remain I think.
>>>>>>
>>>>>>>           default y
>>>>>>>           help
>>>>>>>             Enable support for the Power ISA 3.0 Radix style MMU.
>>>>>>> Currently
>>>>>
>>>>>
>>>>> We also have PPC_8xx do a
>>>>>
>>>>>         select ARCH_SUPPORTS_HUGETLBFS
>>>>>
>>>>> And of course !PPC_RADIX_MMU (e.g., PPC_64S_HASH_MMU) through
>>>>> PPC_BOOK3S_64.
>>>>>
>>>>> Are we sure they cannot end up with gigantic folios through hugetlb?
>>>>>
>>>>
>>>> Yes indeed. My PPC_8xx is OK because I set CONFIG_ARCH_FORCE_MAX_ORDER=9
>>>> (largest hugepage is 8M) but I do get the warning with the default value
>>>> which is 8 (with 16k pages).
>>>>
>>>> For PPC_64S_HASH_MMU, max page size is 16M, we get no warning with
>>>> CONFIG_ARCH_FORCE_MAX_ORDER=8 which is the default value but get the
>>>> warning with CONFIG_ARCH_FORCE_MAX_ORDER=7
>>>
>>> Right, the dependency on CONFIG_ARCH_FORCE_MAX_ORDER is nasty. In the
>>> future,
>>> likely the arch should just tell us the biggest possible hugetlb size
>>> and we
>>> can then determine this ourselves.
>>>
>>> ... or we'll simply remove the gigantic vs. !gigantic handling
>>> completely and
>>> simply assume that "if there is hugetlb, we might have gigantic folios".
>>>
>>>> Should CONFIG_ARCH_HAS_GIGANTIC_PAGE be set unconditionaly as soon as
>>>> hugepages are selected, or should it depend on
>>>> CONFIG_ARCH_FORCE_MAX_ORDER ? What is the cost of selecting
>>>> CONFIG_ARCH_HAS_GIGANTIC_PAGE ?
>>>
>>> There is no real cost, we just try to keep the value small so
>>> __dump_folio()
>>> can better detect inconsistencies.
>>>
>>> To fix it for now, likely the following is good enough (pushed to the
>>> previously mentioned branch):
>>>
>>>
>>>    From 7abf0f52e59d96533aa8c96194878e9453aa8be0 Mon Sep 17 00:00:00 2001
>>> From: "David Hildenbrand (Red Hat)" <david@kernel.org>
>>> Date: Thu, 6 Nov 2025 11:31:45 +0100
>>> Subject: [PATCH] mm: fix MAX_FOLIO_ORDER on powerpc configs with hugetlb
>>>
>>> In the past, CONFIG_ARCH_HAS_GIGANTIC_PAGE indicated that we support
>>> runtime allocation of gigantic hugetlb folios. In the meantime it evolved
>>> into a generic way for the architecture to state that it supports
>>> gigantic hugetlb folios.
>>>
>>> In commit fae7d834c43c ("mm: add __dump_folio()") we started using
>>> CONFIG_ARCH_HAS_GIGANTIC_PAGE to decide MAX_FOLIO_ORDER: whether we could
>>> have folios larger than what the buddy can handle. In the context of
>>> that commit, we started using MAX_FOLIO_ORDER to detect page corruptions
>>> when dumping tail pages of folios. Before that commit, we assumed that
>>> we cannot have folios larger than the highest buddy order, which was
>>> obviously wrong.
>>>
>>> In commit 7b4f21f5e038 ("mm/hugetlb: check for unreasonable folio sizes
>>> when registering hstate"), we used MAX_FOLIO_ORDER to detect
>>> inconsistencies, and in fact, we found some now.
>>>
>>> Powerpc allows for configs that can allocate gigantic folio during boot
>>> (not at runtime), that do not set CONFIG_ARCH_HAS_GIGANTIC_PAGE and can
>>> exceed PUD_ORDER.
>>>
>>> To fix it, let's make powerpc select CONFIG_ARCH_HAS_GIGANTIC_PAGE with
>>> hugetlb on powerpc, and increase the maximum folio size with hugetlb
>>> to 16
>>> GiB (possible on arm64 and powerpc). Note that on some powerpc
>>> configurations, whether we actually have gigantic pages
>>> depends on the setting of CONFIG_ARCH_FORCE_MAX_ORDER, but there is
>>> nothing really problematic about setting it unconditionally: we just
>>> try to
>>> keep the value small so we can better detect problems in __dump_folio()
>>> and inconsistencies around the expected largest folio in the system.
>>>
>>> Ideally, we'd have a better way to obtain the maximum hugetlb folio size
>>> and detect ourselves whether we really end up with gigantic folios. Let's
>>> defer bigger changes and fix the warnings first.
>>>
>>> While at it, handle gigantic DAX folios more clearly: DAX can only
>>> end up creating gigantic folios with HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD.
>>>
>>> Add a new Kconfig option HAVE_GIGANTIC_FOLIOS to make both cases
>>> clearer. In particular, worry about ARCH_HAS_GIGANTIC_PAGE only with
>>> HUGETLB_PAGE.
>>>
>>> Note: with enabling CONFIG_ARCH_HAS_GIGANTIC_PAGE on powerpc, we will now
>>> also allow for runtime allocations of folios in some more powerpc
>>> configs.
>>> I don't think this is a problem, but if it is we could handle it through
>>> __HAVE_ARCH_GIGANTIC_PAGE_RUNTIME_SUPPORTED.
>>>
>>> While __dump_page()/__dump_folio was also problematic (not handling
>>> dumping
>>> of tail pages of such gigantic folios correctly), it doesn't relevant
>>> critical enough to mark it as a fix.
>>>
>>> Fixes: 7b4f21f5e038 ("mm/hugetlb: check for unreasonable folio sizes
>>> when registering hstate")
>>> Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> Closes: https://eur01.safelinks.protection.outlook.com/?
>>> url=https%3A%2F%2Flore.kernel.org%2Fr%2F3e043453-3f27-48ad-b987-
>>> cc39f523060a%40csgroup.eu%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cb376c59325bf40bc08ce08de211479f4%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638984569012877144%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=KwQwqCg2Cu5oXXwBYhuQvW2kZqjyNZMk5N6zfsg%2FCHI%3D&reserved=0
>>> Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>> Closes: https://eur01.safelinks.protection.outlook.com/?
>>> url=https%3A%2F%2Flore.kernel.org%2Fr%2F94377f5c-d4f0-4c0f-
>>> b0f6-5bf1cd7305b1%40linux.ibm.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cb376c59325bf40bc08ce08de211479f4%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638984569012910679%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=1twO%2Ffle%2BX3EKlku7P9C8ZlQQUB2B9r%2FvF8ZaQdVz8k%3D&reserved=0
>>> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
>>> ---
>>>     arch/powerpc/Kconfig |  1 +
>>>     include/linux/mm.h   | 12 +++++++++---
>>>     mm/Kconfig           |  7 +++++++
>>>     3 files changed, 17 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index e24f4d88885ae..9537a61ebae02 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -137,6 +137,7 @@ config PPC
>>>         select ARCH_HAS_DMA_OPS            if PPC64
>>>         select ARCH_HAS_FORTIFY_SOURCE
>>>         select ARCH_HAS_GCOV_PROFILE_ALL
>>> +    select ARCH_HAS_GIGANTIC_PAGE        if ARCH_SUPPORTS_HUGETLBFS
>>>         select ARCH_HAS_KCOV
>>>         select ARCH_HAS_KERNEL_FPU_SUPPORT    if PPC64 && PPC_FPU
>>>         select ARCH_HAS_MEMBARRIER_CALLBACKS
>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>> index d16b33bacc32b..2646ba7c96a49 100644
>>> --- a/include/linux/mm.h
>>> +++ b/include/linux/mm.h
>>> @@ -2074,7 +2074,7 @@ static inline unsigned long folio_nr_pages(const
>>> struct folio *folio)
>>>         return folio_large_nr_pages(folio);
>>>     }
>>> -#if !defined(CONFIG_ARCH_HAS_GIGANTIC_PAGE)
>>> +#if !defined(CONFIG_HAVE_GIGANTIC_FOLIOS)
>>>     /*
>>>      * We don't expect any folios that exceed buddy sizes (and
>>> consequently
>>>      * memory sections).
>>> @@ -2087,10 +2087,16 @@ static inline unsigned long
>>> folio_nr_pages(const struct folio *folio)
>>>      * pages are guaranteed to be contiguous.
>>>      */
>>>     #define MAX_FOLIO_ORDER        PFN_SECTION_SHIFT
>>> -#else
>>> +#elif defined(CONFIG_HUGETLB_PAGE)
>>>     /*
>>>      * There is no real limit on the folio size. We limit them to the
>>> maximum we
>>> - * currently expect (e.g., hugetlb, dax).
>>> + * currently expect: with hugetlb, we expect no folios larger than 16
>>> GiB.
>>> + */
>>> +#define MAX_FOLIO_ORDER        (16 * GIGA / PAGE_SIZE)
>>
>> Forgot to commit the ilog2(), so this should be
>>
>> #define MAX_FOLIO_ORDER                ilog2(16 * GIGA / PAGE_SIZE
> 
> I would have used SZ_16G.
> 

Yeah, much better.

> But could we use get_order() instead ? (From include/asm-generic/getorder.h)

I think so, the compiler should just convert it to a compile-time constant.

> 
>>
>> And we might need unit.h to make some cross compiles happy.
> 
> size.h by the way if we use SZ_16G instead.

sizes.h is even already included in mmh.

Thanks, let me cross-compile and send out something official.

-- 
Cheers

David

