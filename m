Return-Path: <linuxppc-dev+bounces-14150-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7570C584F5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Nov 2025 16:21:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6kWy5Q7rz2yvV;
	Fri, 14 Nov 2025 02:21:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763047310;
	cv=none; b=P5QzW4Qq+bXhJuRonhKdTWR1qwVu4vgJftWsirJts06hByIk37zDQNMI70n42hceHBQWLw+A3T4urBao5yBlhG55J/XS8zL/GlLTAIItmPO1bpz4UVs9tTOJU3emadeWdEpIh+16tQamoUU48d86vhQIN1+RnKaFAEET5qcN2TvqdLkxH0OrqRjd15Bs0JDy5E7y6s4GBPPxvduZg/3vuDDUxb0ldB4ufUiRy6Poke/zehxhKfVqeF5/Rw6amGYKoEP4jgW8w5cwNLw9IpNJTIVMqbTplWoUG7esR6TFHdVNRukkuqaM37A2UsfskKksmrAEle+ZJCON7+gDRdCvaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763047310; c=relaxed/relaxed;
	bh=gIAMjwImOBRNCPZKc9ifwEuKpxWO9qKA3942dhlI43E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXdTmp3wcJ27fc6KYk5Zo+0JwzAjaBBsaYTryZMJ/MIqR9SIFQDuQbFm78Ruv8h0vV7tt1qo1ZMaKNfO946Em36qVLW6CnR60wks0xXGhtAoGd56J9LVdnY0OVFVSrXs05jpl9u0ZItN4Kl/ksrZzT2B2LD/wsxhvoYBF95DvLGrjrgBIPy7Jh0c5mqOmbGWi+UWJVq0Xu5bhmYInRC7rrU1z/SszgNkk7swnkm2WjvYvKc55jESIG5nkYGUMYiUQX72SNBrXvp8ghPpwQk7M94Yw2JPT+drbooqo4KVc5zBF489jjdxorcwTxmpp0+by6MhDMPh9BlqrKztBCq0HQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uaXIN16e; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uaXIN16e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6kWx5PNBz2ynC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Nov 2025 02:21:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 591C042E17;
	Thu, 13 Nov 2025 15:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A83C4CEF7;
	Thu, 13 Nov 2025 15:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763047307;
	bh=DDR6lwZeYHTpioGw+6ohDncoc3q5Cexlww6K4aupOIs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uaXIN16ewn7hEVzRKZDArZ+eJgUCAKSHAt/OloF5MCrMEAN4+PDujpsLttqSSWqVZ
	 mltOkv0VUkTgYtrxwZWW0VuLZG1LR0wC//pusw96qsO51UtUAKmHJP1jkyv+e8zWif
	 oDRaOtAan3PpeL2lp3wJ4mb38iNmLKQEyDAuve9pMq3iIPnjpUH90GV6oMjnaPFzF3
	 5SgxbgErxNpY8LQHDvZme/zp584w4IxmkAR1ibY/hy+lZ9OYnfKhGKJOCBeyRVwGQ2
	 HU14ow4FJeWd7gy6H+MywTHvJzy0KdvvyKRVnAAl3kdlmUJfNnGPKkgFF+fSyBwphb
	 lNQNoU+rFSXGQ==
Message-ID: <3fa6d496-b9de-4b66-a7db-247eebec92ca@kernel.org>
Date: Thu, 13 Nov 2025 16:21:41 +0100
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
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Donet Tom
 <donettom@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
References: <20251112145632.508687-1-david@kernel.org>
 <eaf2e733-f967-43bb-88e6-7876a28a370c@lucifer.local>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <eaf2e733-f967-43bb-88e6-7876a28a370c@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 13.11.25 14:01, Lorenzo Stoakes wrote:
> FYI, trivial to fix but a conflict on mm/Kconfig for mm-new:

Thanks for the review!

Yeah, this fix will have to obviously go in sooner. And it's easy to
resolve.

That's why this patch is already in  mm/mm-hotfixes-unstable.

[...]

> 
> On Wed, Nov 12, 2025 at 03:56:32PM +0100, David Hildenbrand (Red Hat) wrote:
>> In the past, CONFIG_ARCH_HAS_GIGANTIC_PAGE indicated that we support
>> runtime allocation of gigantic hugetlb folios. In the meantime it evolved
>> into a generic way for the architecture to state that it supports
>> gigantic hugetlb folios.
>>
>> In commit fae7d834c43c ("mm: add __dump_folio()") we started using
>> CONFIG_ARCH_HAS_GIGANTIC_PAGE to decide MAX_FOLIO_ORDER: whether we could
> 
> Hm strange commit to introduce this :)

The first commit to be confused about what CONFIG_ARCH_HAS_GIGANTIC_PAGE 
actually means (obviously hugetlb, ... :) ), and which sizes are possible...

[...]

>>
>> To fix it, let's make powerpc select CONFIG_ARCH_HAS_GIGANTIC_PAGE with
>> hugetlb on powerpc, and increase the maximum folio size with hugetlb to 16
>> GiB (possible on arm64 and powerpc). Note that on some powerpc
> 
> I guess this is due to 64 KiB base page possibilities. Fun :)
> 
> Will this cause powerpc to now support gigantic hugetlb pages when it didn't
> before?

It's not really related to 64K IIRC, just the way 
CONFIG_ARCH_FORCE_MAX_ORDER and other things interact with powerpcs ways 
of mapping cont-pmd-like things for hugetlb.

This patch here doesn't change any of that, it just makes us now 
correctly detect that gigantic folios are indeed possible.

> 
>> configurations, whether we actually have gigantic pages
>> depends on the setting of CONFIG_ARCH_FORCE_MAX_ORDER, but there is
>> nothing really problematic about setting it unconditionally: we just try to
>> keep the value small so we can better detect problems in __dump_folio()
>> and inconsistencies around the expected largest folio in the system.
>>
>> Ideally, we'd have a better way to obtain the maximum hugetlb folio size
>> and detect ourselves whether we really end up with gigantic folios. Let's
>> defer bigger changes and fix the warnings first.
> 
> Right.
> 
>>
>> While at it, handle gigantic DAX folios more clearly: DAX can only
>> end up creating gigantic folios with HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD.
> 
> Yes, this is... quite something. Config implying gigantic THP possible but
> actually only relevant to DAX...
> 
>>
>> Add a new Kconfig option HAVE_GIGANTIC_FOLIOS to make both cases
>> clearer. In particular, worry about ARCH_HAS_GIGANTIC_PAGE only with
>> HUGETLB_PAGE.
> 
> Hm, I see:
> 
> config HUGETLB_PAGE
> 	def_bool HUGETLBFS
> 	select XARRAY_MULTI
> 
> 
> Which means (unless I misunderstand Kconfig, very possible :) that this is
> always set if HUGETLBFS is specified.

Yeah, def_bool enforces that both are set.

> Would it be clearer to just check for
> CONFIG_HUGETLBFS?

IMHO, MM code should focus on CONFIG_HUGETLB_PAGE (especially when 
dealing with the page/folio aspects), not the FS part of it.

$ git grep CONFIG_HUGETLB_PAGE | wc -l
45
$ git grep CONFIG_HUGETLBFS | wc -l
7

Unsurprisingly, we are not being completely consistent :)

> 
>>
>> Note: with enabling CONFIG_ARCH_HAS_GIGANTIC_PAGE on powerpc, we will now
>> also allow for runtime allocations of folios in some more powerpc configs.
> 
> Ah OK you're answering the above. I mean I don't think it'll be a problem
> either.
> 
>> I don't think this is a problem, but if it is we could handle it through
>> __HAVE_ARCH_GIGANTIC_PAGE_RUNTIME_SUPPORTED.
>>
>> While __dump_page()/__dump_folio was also problematic (not handling dumping
>> of tail pages of such gigantic folios correctly), it doesn't relevant
>> critical enough to mark it as a fix.
> 
> Small typo 'it doesn't relevant critical enough' -> 'it doesn't seem
> critical enough' perhaps? Doesn't really matter, only fixup if respin or
> easy for Andrew to fix.

Ah yes, thanks.

> 
> Are you planning to do follow ups then I guess?

As time permits, I think this all needs to be reworked :(

[...]

>> @@ -137,6 +137,7 @@ config PPC
>>   	select ARCH_HAS_DMA_OPS			if PPC64
>>   	select ARCH_HAS_FORTIFY_SOURCE
>>   	select ARCH_HAS_GCOV_PROFILE_ALL
>> +	select ARCH_HAS_GIGANTIC_PAGE		if ARCH_SUPPORTS_HUGETLBFS
> 
> Given we know the architecture can support it (presumably all powerpc
> arches or all that can support hugetlbfs anyway?), this seems reasonable.

powerpc allows for quite some different configs, so I assume there are 
some configs that don't allow ARCH_SUPPORTS_HUGETLBFS.

[...]

>>   /*
>>    * There is no real limit on the folio size. We limit them to the maximum we
>> - * currently expect (e.g., hugetlb, dax).
>> + * currently expect: with hugetlb, we expect no folios larger than 16 GiB.
> 
> Maybe worth saying 'see CONFIG_HAVE_GIGANTIC_FOLIOS definition' or something?

To me that's implied from the initial ifdef. But not strong opinion 
about spelling that out.

> 
>> + */
>> +#define MAX_FOLIO_ORDER		get_order(SZ_16G)
> 
> Hmm, is the base page size somehow runtime adjustable on powerpc? Why isn't
> PUD_ORDER good enough here?

We tried P4D_ORDER but even that doesn't work. I think we effectively 
end up with cont-pmd/cont-PUD mappings (or even cont-p4d, I am not 100% 
sure because the folding code complicates that).

See powerpcs variant of huge_pte_alloc() where we have stuff like

p4d = p4d_offset(pgd_offset(mm, addr), addr);
if (!mm_pud_folded(mm) && sz >= P4D_SIZE)
	return (pte_t *)p4d;

As soon as we go to things like P4D_ORDER we're suddenly in the range of 
512 GiB on x86 etc, so that's also not what we want as an easy fix. (and 
it didn't work)

> 
> Or does powerpc have some way of getting 16 GiB gigantic pages even with 4
> KiB base page size?

IIUC, yes.

Take a look at MMU_PAGE_16G.

There is MMU_PAGE_64G already defined, but it's essentially unused for now.

> 
>> +#else
>> +/*
>> + * Without hugetlb, gigantic folios that are bigger than a single PUD are
>> + * currently impossible.
>>    */
>>   #define MAX_FOLIO_ORDER		PUD_ORDER
>>   #endif
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index 0e26f4fc8717b..ca3f146bc7053 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -908,6 +908,13 @@ config PAGE_MAPCOUNT
>>   config PGTABLE_HAS_HUGE_LEAVES
>>   	def_bool TRANSPARENT_HUGEPAGE || HUGETLB_PAGE
>>
>> +#
>> +# We can end up creating gigantic folio.
>> +#
>> +config HAVE_GIGANTIC_FOLIOS
>> +	def_bool (HUGETLB_PAGE && ARCH_HAS_GIGANTIC_PAGE) || \
>> +		 (ZONE_DEVICE && HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
> 
> Maybe worth spelling out in a comment these two cases?

Not sure if the comments wouldn't just explain what we are reading?

"gigantic folios with hugetlb, PUD-sized folios with ZONE_DEVICE"?

-- 
Cheers

David

