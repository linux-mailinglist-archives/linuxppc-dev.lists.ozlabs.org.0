Return-Path: <linuxppc-dev+bounces-14625-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC732CA5258
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 20:39:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMlF90TRCz2xJ8;
	Fri, 05 Dec 2025 06:39:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764877148;
	cv=none; b=mhMuElx+sHNab+PlUlH12UplLepWyGaStjVZixUS9aDHDHWIYHf5zLP3wMykyjjtQpuwxN6yFSo6+dHk9bcnLN1g5J/qNySoocI1xLgDZpKNIFmWMKQLYVSQ7/zC+vLut4+xSs0QYLX+WyB35pSrx61wHjtz3yiS04OsCkCWCPxwQZX6La0t1NcW05Iawv6m9hXjmtfvwezdj3dMfK/QIQq2tT/qOp3vnUWPJv7gqeU21ZntY63DXJpas7hxtOvHPmXVDDPt2SXwWw0aXNPQzAr2wXTsLV8qgip+c7psTUDcSvqsCAb20pEH01lckz2XnYEylIiXkC6VFdB62Sc2dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764877148; c=relaxed/relaxed;
	bh=zlnt8UMquDekV44NsGIqu3q4V2h5Bg8dHyh34gkZfkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D777yYotVqFXCdekpidXm8xNo6qdSTv17I0ezTxD2uST33UJv4ou/8/dk2VzAO7+iQcbAC+/BEXRJm4bPVco+2v1PCiXj/M+TGewhA82IIUF65aWKBR95ZolZ/opI3TCGBlBX3VbCUsNbR41Gxq2TZnKiCWY4IwFUpYNINVQ2iZXePNHb1glPvHyQrZPqytKp5uLklR/nRdEwA3X74hI/BXDvL5gTJQGLE7EB5u+fUnypB6YXfcDfubdURgzYQZcLfrbb8cGWsmxbJZgP0+pUnloUsvAruTRSvGaZQIoozhHwnK1x68VxRL7i5j/plfGhW+vcFn11la5ONMDZZpWOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lxo07IQA; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lxo07IQA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMlF66lK6z2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 06:39:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FC8D43D05;
	Thu,  4 Dec 2025 19:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED09C4CEFB;
	Thu,  4 Dec 2025 19:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764877143;
	bh=7xoWfZb/rQlOyV51uYCWOVPmwkaZ4pvqIYT0hW3+62M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lxo07IQAhkWMt2l8zQ9z0zjXSecELZqm/Sl/HVxpGQ3HrR32VZ/HcjuZZIECRJyuc
	 b9AzhJXdV5j/DiFeh1DcrpWMQCqz/W0KmqtebGB5fy6P7btaWJ2f325YRNUM085/yT
	 8ax/GnH3DxXkdSyLt/Wkxp+BHtMijuaoql6FBscs/4yJUFlyB78XqPA/3MI/alf+Ga
	 zCzXcq75PuK2Yx/PGKMG+wUeST30nFTCs+39VviL+9YHWYnLqEmJgSWHEyOtKHT6X9
	 rMeg0TNesxFsC8wSY69xa/Dtn+qNfbKDxsspDfh93eWHo51STHZK6sqNvm3w8dX4gG
	 T2SwhXwLTyAhQ==
Message-ID: <8a5b59b9-112d-44cf-b81e-6f79f59bb999@kernel.org>
Date: Thu, 4 Dec 2025 20:38:56 +0100
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
To: Shuah Khan <skhan@linuxfoundation.org>, Mike Rapoport <rppt@kernel.org>
Cc: akpm@linux-foundation.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com, mhocko@suse.com,
 masahiroy@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20251204023358.54107-1-skhan@linuxfoundation.org>
 <0b007374-1058-487c-8033-4f0d2830dc89@kernel.org>
 <aTErsX-wfnxkNJ1G@kernel.org>
 <78af7da4-d213-42c6-8ca6-c2bdca81f233@linuxfoundation.org>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <78af7da4-d213-42c6-8ca6-c2bdca81f233@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/4/25 18:03, Shuah Khan wrote:
> On 12/3/25 23:35, Mike Rapoport wrote:
>> On Thu, Dec 04, 2025 at 07:17:06AM +0100, David Hildenbrand (Red Hat) wrote:
>>> Hi,
>>>
>>> On 12/4/25 03:33, Shuah Khan wrote:
>>>> This reverts commit 39231e8d6ba7f794b566fd91ebd88c0834a23b98.
>>>
>>> That was supposed to fix powerpc handling though. So I think we have to
>>> understand what is happening here.
> 
> This patch changes include/linux/mm.h and mm/Kconfig in addition to
> arch/powerpc/Kconfig and arch/powerpc/platforms/Kconfig.cputype
> 
> With this patch HAVE_GIGANTIC_FOLIOS is enabled on x86_64 config
> 
> The following mm/Kconfig isn't arch specific. This makes this
> not powerpc specific and this is enabled on x86_64

Yes, and as the patch explains that's expected. See below.

> 
> +#
> +# We can end up creating gigantic folio.
> +#
> +config HAVE_GIGANTIC_FOLIOS
> +       def_bool (HUGETLB_PAGE && ARCH_HAS_GIGANTIC_PAGE) || \
> +                (ZONE_DEVICE && HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
> +
> 
> The following change in include/linux/mm.h is also generic
> and applies to x86_64 as well.
> 
> -#if !defined(CONFIG_ARCH_HAS_GIGANTIC_PAGE)
> +#if !defined(CONFIG_HAVE_GIGANTIC_FOLIOS)
> 
> Is this not intended on all architectures?

All expected. See below.

> 
>>>
>>>>
>>>> Enabling HAVE_GIGANTIC_FOLIOS broke kernel build and git clone on two
>>>> systems. git fetch-pack fails when cloning large repos and make hangs
>>>> or errors out of Makefile.build with Error: 139. These failures are
>>>> random with git clone failing after fetching 1% of the objects, and
>>>> make hangs while compiling random files.
>>>
>>> On which architecture do we see these issues and with which kernel configs?
>>> Can you share one?
> 
> Config attached.

Okay, let's walk this through. The config has:

CONFIG_HAVE_GIGANTIC_FOLIOS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_ZONE_DEVICE=y
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_VMEMMAP=y


In the old code:

#if !defined(CONFIG_ARCH_HAS_GIGANTIC_PAGE)
/*
  * We don't expect any folios that exceed buddy sizes (and consequently
  * memory sections).
  */
#define MAX_FOLIO_ORDER         MAX_PAGE_ORDER
#elif defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
/*
  * Only pages within a single memory section are guaranteed to be
  * contiguous. By limiting folios to a single memory section, all folio
  * pages are guaranteed to be contiguous.
  */
#define MAX_FOLIO_ORDER         PFN_SECTION_SHIFT
#else
/*
  * There is no real limit on the folio size. We limit them to the maximum we
  * currently expect (e.g., hugetlb, dax).
  */
#define MAX_FOLIO_ORDER         PUD_ORDER
#endif


We would get MAX_FOLIO_ORDER = PUD_ORDER = 18


In the new code we will get:

#if !defined(CONFIG_HAVE_GIGANTIC_FOLIOS)
/*
  * We don't expect any folios that exceed buddy sizes (and consequently
  * memory sections).
  */
#define MAX_FOLIO_ORDER         MAX_PAGE_ORDER
#elif defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
/*
  * Only pages within a single memory section are guaranteed to be
  * contiguous. By limiting folios to a single memory section, all folio
  * pages are guaranteed to be contiguous.
  */
#define MAX_FOLIO_ORDER         PFN_SECTION_SHIFT
#elif defined(CONFIG_HUGETLB_PAGE)
/*
  * There is no real limit on the folio size. We limit them to the maximum we
  * currently expect (see CONFIG_HAVE_GIGANTIC_FOLIOS): with hugetlb, we expect
  * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
  */
#define MAX_FOLIO_ORDER         get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
#else
/*
  * Without hugetlb, gigantic folios that are bigger than a single PUD are
  * currently impossible.
  */
#define MAX_FOLIO_ORDER         PUD_ORDER
#endif


MAX_FOLIO_ORDER = get_order(SZ_16G) = 22


That's expected and okay (raising the maximum we expect), as we only want to set a
rough upper cap on the maximum folio size.

As I raised, observe how MAX_FOLIO_ORDER is only used to
* trigger warnings if we observe an unexpectedly large folio size. Safety checks.
* use it when dumping a folio to detect possible folio corruption on unexpected folio sizes


> 
>>>
>>>>
>>>> The blow is is one of the git clone failures:
>>>>
>>>> git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git linux_6.19
>>>> Cloning into 'linux_6.19'...
>>>> remote: Enumerating objects: 11173575, done.
>>>> remote: Counting objects: 100% (785/785), done.
>>>> remote: Compressing objects: 100% (373/373), done.
>>>> remote: Total 11173575 (delta 534), reused 505 (delta 411), pack-reused 11172790 (from 1)
>>>> Receiving objects: 100% (11173575/11173575), 3.00 GiB | 7.08 MiB/s, done.
>>>> Resolving deltas: 100% (9195212/9195212), done.
>>>> fatal: did not receive expected object 0002003e951b5057c16de5a39140abcbf6e44e50
>>>> fatal: fetch-pack: invalid index-pack output
>>>
>>> If I would have to guess, these symptoms match what we saw between commit
>>> adfb6609c680 ("mm/huge_memory: initialise the tags of the huge zero folio")
>>> and commit 5bebe8de1926 ("mm/huge_memory: Fix initialization of huge zero folio").
>>>
>>> 5bebe8de1926 went into v6.18-rc7.
>>>
>>> Just to be sure, are you sure we were able to reproduce this issue with a
>>> v6.18-rc7 or even v6.18 that contains 5bebe8de1926?
>>>
>>> Bisecting might give you wrong results, as the problems of adfb6609c680 do not
>>> reproduce reliably.
>>    
>> I can confirm that bisecting gives odd results between v6.18-rc5 and
>> v6.18-rc6. I was seeing failures in some tests, bisected a few times and
>> got a bunch of bogus commits including 3470715e5c22 ("MAINTAINERS: update
>> David Hildenbrand's email address") :)
> 
> I am sure this patch is the cause oh the problems I have seen on my two
> systems. Reverting this commit solved issues since this commit does
> impact all architectures enabling HAVE_GIGANTIC_FOLIOS if the conditions
> are right.
> 
>>
>> And 5bebe8de1926 actually solved the issue for me.
> 
> Were you seeing the problems I reported without 5bebe8de1926?
> Is 5bebe8de1926 is 6.18?

We were seeing all kinds of different segmentation faults or corruptions.
In my case, every-time I tried to login something would segfault. For others,
compilers stopped working or they got different random segfaults.

Assume you think you have a shared zero page, but every time you reboot it's filled
with other garbage data. Not good when your app assumes something contains 0s.

> 
> I can try this commit with 39231e8d6ba7f794b566fd91ebd88c0834a23b98
> and see what happens on my system.

Yes, please. I cannot yet make sense of how MAX_FOLIO_ORDER would make any
difference.

Unless you would actually be seeing one of the WARNINGS that are based on
MAX_FOLIO_ORDER / MAX_FOLIO_NR_PAGES. But I guess none showed up in dmesg?

-- 
Cheers

David

