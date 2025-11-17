Return-Path: <linuxppc-dev+bounces-14217-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EF9C63C87
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Nov 2025 12:23:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d953Q3hxmz2yvM;
	Mon, 17 Nov 2025 22:23:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763378626;
	cv=none; b=JRdJcYQp+MIy2oQ02mqnMtYxs0rSiO2Jg/vKripVd2qlvDPZ/zXyetoZho55zRLTVSZZHBlAMA7QG/LvzqxLh0wCUCWaH8T52tbl1EXMWaR3hsVqsiZGkV3D594xxuzof3eWCsFeTXkkqfB9nw0AiGWmziqjyeJKVag8ZrSsHPScNAouCf/shD/4xkLSk2LaOkOiUY5/eQ/wGu/kptcllsgsAAipO4NTUWKdzVO12uEgtbsSm+A6p3iuGC8SgV63VMePW3nOhzmvPlXhwXdd786ovw/+ESlABX/cmZnvL7Ms2ZdEIkJogne4qYdNBRdmwnSxcKJ3nx65tA6VxuA8Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763378626; c=relaxed/relaxed;
	bh=dCaySQh8kklKAYlqDtgRlLbv3sGSXbwe58B+5cNMuzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nJApRZwRAUsHAfFP4SiIsXNyZOhCwP1YiTQmzSAKPruZJHYOVuIzSVphLox5UaD/yLqifzl2FNoBzDnrrYOfSYmSSQ5MBImX9n/BK/xnm5eAsAYtq8Fsv4PkFYT+PXFK2b6+2dNIrn9h2SfrdbR41RrIEHO0HvqEP2t18Vv17jgF4kIKtmUJkQV3rXE6A9rnqpbFjn/5WKXDJ68LNdTGh42BedrTNDBPGFCnpzeL6KE4ABAVw7HpOZG9eQNQ3Bdi7e/ElYdSO3JJpz4dhw5OCYzGe2A12AKwa53WbeTx2Sizd/ng9ZdYcyvG+CiHTPuF6X5MRkBoPzrTwlgf4RZZ4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mI2M+SGs; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mI2M+SGs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d953P2hWfz2yv6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Nov 2025 22:23:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03CDE407F9;
	Mon, 17 Nov 2025 11:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1272C4CEF1;
	Mon, 17 Nov 2025 11:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763378622;
	bh=AS2LOdZB9mGe8g+PTF2d3HZ0vp9cklG1f8pIgTQRq+Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mI2M+SGsm9caH86sXqrWFYAILM/5jD96wHWRsWaZ9Y/ikSIoYC5zTmEouwBUzllC0
	 TZgKQQ3QNY7ALqjO9/QbMJTNt8+IrF6Wp1sVZToAcy/IX6QhaMzLwFbC2k19OnWDc1
	 NkBJ7t5o4AlfQysgofzrrF7tBUtdjZOjWivHCDSqjjyP+MDomvSNsYVA9I1AHQt4ak
	 DVNXsdg1SKU8oLcMTKyOFkh5oCAyoUjziAuunPJLyFaeKfUVAaben8Kf6slF78d3NO
	 FYCpLpmF1MFK67/xcRRQVTLIbG0sX8jPQj2U+NCuVYy46g+ux4eANLg+MrxwJDVqzp
	 Utx3AI8iCMu2g==
Message-ID: <4b81bc10-59a0-4ff2-99db-12dc7157da85@kernel.org>
Date: Mon, 17 Nov 2025 12:23:35 +0100
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
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
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
 <fb95d369-dda3-47a9-b294-6d5038cee4d4@csgroup.eu>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <fb95d369-dda3-47a9-b294-6d5038cee4d4@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 15.11.25 10:37, Christophe Leroy wrote:
> 
> 
> Le 14/11/2025 à 22:49, David Hildenbrand (Red Hat) a écrit :
>> In the past, CONFIG_ARCH_HAS_GIGANTIC_PAGE indicated that we support
>> runtime allocation of gigantic hugetlb folios. In the meantime it evolved
>> into a generic way for the architecture to state that it supports
>> gigantic hugetlb folios.
>>
>> In commit fae7d834c43c ("mm: add __dump_folio()") we started using
>> CONFIG_ARCH_HAS_GIGANTIC_PAGE to decide MAX_FOLIO_ORDER: whether we could
>> have folios larger than what the buddy can handle. In the context of
>> that commit, we started using MAX_FOLIO_ORDER to detect page corruptions
>> when dumping tail pages of folios. Before that commit, we assumed that
>> we cannot have folios larger than the highest buddy order, which was
>> obviously wrong.
>>
>> In commit 7b4f21f5e038 ("mm/hugetlb: check for unreasonable folio sizes
>> when registering hstate"), we used MAX_FOLIO_ORDER to detect
>> inconsistencies, and in fact, we found some now.
>>
>> Powerpc allows for configs that can allocate gigantic folio during boot
>> (not at runtime), that do not set CONFIG_ARCH_HAS_GIGANTIC_PAGE and can
>> exceed PUD_ORDER.
>>
>> To fix it, let's make powerpc select CONFIG_ARCH_HAS_GIGANTIC_PAGE with
>> hugetlb on powerpc, and increase the maximum folio size with hugetlb to 16
>> GiB on 64bit (possible on arm64 and powerpc) and 1 GiB on 32 bit (powerpc).
>> Note that on some powerpc configurations, whether we actually have gigantic
>> pages depends on the setting of CONFIG_ARCH_FORCE_MAX_ORDER, but there is
>> nothing really problematic about setting it unconditionally: we just try to
>> keep the value small so we can better detect problems in __dump_folio()
>> and inconsistencies around the expected largest folio in the system.
>>
>> Ideally, we'd have a better way to obtain the maximum hugetlb folio size
>> and detect ourselves whether we really end up with gigantic folios. Let's
>> defer bigger changes and fix the warnings first.
>>
>> While at it, handle gigantic DAX folios more clearly: DAX can only
>> end up creating gigantic folios with HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD.
>>
>> Add a new Kconfig option HAVE_GIGANTIC_FOLIOS to make both cases
>> clearer. In particular, worry about ARCH_HAS_GIGANTIC_PAGE only with
>> HUGETLB_PAGE.
>>
>> Note: with enabling CONFIG_ARCH_HAS_GIGANTIC_PAGE on powerpc, we will now
>> also allow for runtime allocations of folios in some more powerpc configs.
>> I don't think this is a problem, but if it is we could handle it through
>> __HAVE_ARCH_GIGANTIC_PAGE_RUNTIME_SUPPORTED.
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> Tested on powerpc 8xx with CONFIG_ARCH_FORCE_MAX_ORDER=8 instead of 9.
> It is now possible to add hugepages with the following command:
> 
> echo 4 > /sys/kernel/mm/hugepages/hugepages-8192kB/nr_hugepages
> 
> But only if CONFIG_CMA is set.
> 
> Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thanks a lot for the review and test!

(thanks to the other reviewers obviously as well :) )

-- 
Cheers

David

