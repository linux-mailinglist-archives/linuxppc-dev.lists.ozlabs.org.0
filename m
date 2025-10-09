Return-Path: <linuxppc-dev+bounces-12742-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56830BC8723
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 12:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cj5VZ43qrz3cDN;
	Thu,  9 Oct 2025 21:20:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760005238;
	cv=none; b=g6d8h4Jbrnp4UZfPeGj7R5CP6ITYrhKDZQKayCwozJSxkRS0tKrcDoZbIoWVe0B72e0jG/3/uJQSgrxRc3se/eWoC1sAfYCzD9q+HfaaLA8wDtyHEUiJZa15X4ltbRJFlm4ucb6MSSdrDFfdehUwn8faVFsrfVuB95e21DTYIp8isnkrcc6Sp6kSIWiNoL5VTMPJXRWUfBcomEwFleoxmr7DbIdiYjeiaDZfX8Fqfxec2SSKREZsR54AY/i5OHyqw5jh+S8/OvXk8bgPdmrK2W4RRDt1O5mjpN2+CSNYABarFtB1YPvDXYooFlm2zWv/PuPHXCfMvoIhWb37HAFWRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760005238; c=relaxed/relaxed;
	bh=Mviit9av+xJ2i1UCKCKoymOIpaOEjjA1p687Sppc3JU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=krsAepTGfm+hjOyMJzuzuBBZZUhQ71wqO8B0hMr9/4EzZ2GCvRdoky1xDwP49bC70OQ+PtX+qGAe67Tw9d4wO9etoOh4kUhwKuOMnLKxLgZKEahSB+j4hGE5UZAuezXTvSB8Y9wcCrWOPkAn0GGnlhaLGmTTDwFwNVrH4/DhzsD7LjxIAcTewr5pcNAr04EEKpWNqg4YA7Oe5cQUF2yVbI0b7EsCaPePxJRCuNo0vbta3yjLpHnpDcM/Gd/3RwsvcirgL6ciXcO/ORUJPa+l4po8upA5OfqjctitjSHLZe4Ye4mJ8qDJokwpq8T4eKEM39YbytJCMX60Pu3vJg+sbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cj5VY4TCMz2xQ3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 21:20:37 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cj548110xz9sSL;
	Thu,  9 Oct 2025 12:01:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qOLNCcqM6pFr; Thu,  9 Oct 2025 12:01:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cj5476tjqz9sSC;
	Thu,  9 Oct 2025 12:01:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D06108B76C;
	Thu,  9 Oct 2025 12:01:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MfDghYtIuYkA; Thu,  9 Oct 2025 12:01:11 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 776CE8B767;
	Thu,  9 Oct 2025 12:01:09 +0200 (CEST)
Message-ID: <0c730c52-97ee-43ea-9697-ac11d2880ab7@csgroup.eu>
Date: Thu, 9 Oct 2025 12:01:08 +0200
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
Subject: Re: (bisected) [PATCH v2 08/37] mm/hugetlb: check for unreasonable
 folio sizes when registering hstate
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20250901150359.867252-1-david@redhat.com>
 <20250901150359.867252-9-david@redhat.com>
 <3e043453-3f27-48ad-b987-cc39f523060a@csgroup.eu>
 <d3fc12d4-0b59-4b1f-bb5c-13189a01e13d@redhat.com>
 <faf62f20-8844-42a0-a7a7-846d8ead0622@csgroup.eu>
 <9361c75a-ab37-4d7f-8680-9833430d93d4@redhat.com>
 <03671aa8-4276-4707-9c75-83c96968cbb2@csgroup.eu>
 <1db15a30-72d6-4045-8aa1-68bd8411b0ba@redhat.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <1db15a30-72d6-4045-8aa1-68bd8411b0ba@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 09/10/2025 à 11:20, David Hildenbrand a écrit :
> On 09.10.25 11:16, Christophe Leroy wrote:
>>
>>
>> Le 09/10/2025 à 10:14, David Hildenbrand a écrit :
>>> On 09.10.25 10:04, Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 09/10/2025 à 09:22, David Hildenbrand a écrit :
>>>>> On 09.10.25 09:14, Christophe Leroy wrote:
>>>>>> Hi David,
>>>>>>
>>>>>> Le 01/09/2025 à 17:03, David Hildenbrand a écrit :
>>>>>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>>>>>> index 1e777cc51ad04..d3542e92a712e 100644
>>>>>>> --- a/mm/hugetlb.c
>>>>>>> +++ b/mm/hugetlb.c
>>>>>>> @@ -4657,6 +4657,7 @@ static int __init hugetlb_init(void)
>>>>>>>          BUILD_BUG_ON(sizeof_field(struct page, private) *
>>>>>>> BITS_PER_BYTE <
>>>>>>>                  __NR_HPAGEFLAGS);
>>>>>>> +    BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
>>>>>>>          if (!hugepages_supported()) {
>>>>>>>              if (hugetlb_max_hstate || 
>>>>>>> default_hstate_max_huge_pages)
>>>>>>> @@ -4740,6 +4741,7 @@ void __init hugetlb_add_hstate(unsigned int
>>>>>>> order)
>>>>>>>          }
>>>>>>>          BUG_ON(hugetlb_max_hstate >= HUGE_MAX_HSTATE);
>>>>>>>          BUG_ON(order < order_base_2(__NR_USED_SUBPAGE));
>>>>>>> +    WARN_ON(order > MAX_FOLIO_ORDER);
>>>>>>>          h = &hstates[hugetlb_max_hstate++];
>>>>>>>          __mutex_init(&h->resize_lock, "resize mutex", &h- 
>>>>>>> >resize_key);
>>>>>>>          h->order = order;
>>>>>
>>>>> We end up registering hugetlb folios that are bigger than
>>>>> MAX_FOLIO_ORDER. So we have to figure out how a config can trigger 
>>>>> that
>>>>> (and if we have to support that).
>>>>>
>>>>
>>>> MAX_FOLIO_ORDER is defined as:
>>>>
>>>> #ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
>>>> #define MAX_FOLIO_ORDER        PUD_ORDER
>>>> #else
>>>> #define MAX_FOLIO_ORDER        MAX_PAGE_ORDER
>>>> #endif
>>>>
>>>> MAX_PAGE_ORDER is the limit for dynamic creation of hugepages via
>>>> /sys/kernel/mm/hugepages/ but bigger pages can be created at boottime
>>>> with kernel boot parameters without CONFIG_ARCH_HAS_GIGANTIC_PAGE:
>>>>
>>>>      hugepagesz=64m hugepages=1 hugepagesz=256m hugepages=1
>>>>
>>>> Gives:
>>>>
>>>> HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
>>>> HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
>>>> HugeTLB: registered 64.0 MiB page size, pre-allocated 1 pages
>>>> HugeTLB: 0 KiB vmemmap can be freed for a 64.0 MiB page
>>>> HugeTLB: registered 256 MiB page size, pre-allocated 1 pages
>>>> HugeTLB: 0 KiB vmemmap can be freed for a 256 MiB page
>>>> HugeTLB: registered 4.00 MiB page size, pre-allocated 0 pages
>>>> HugeTLB: 0 KiB vmemmap can be freed for a 4.00 MiB page
>>>> HugeTLB: registered 16.0 MiB page size, pre-allocated 0 pages
>>>> HugeTLB: 0 KiB vmemmap can be freed for a 16.0 MiB page
>>>
>>> I think it's a violation of CONFIG_ARCH_HAS_GIGANTIC_PAGE. The existing
>>> folio_dump() code would not handle it correctly as well.
>>
>> I'm trying to dig into history and when looking at commit 4eb0716e868e
>> ("hugetlb: allow to free gigantic pages regardless of the
>> configuration") I understand that CONFIG_ARCH_HAS_GIGANTIC_PAGE is
>> needed to be able to allocate gigantic pages at runtime. It is not
>> needed to reserve gigantic pages at boottime.
>>
>> What am I missing ?
> 
> That CONFIG_ARCH_HAS_GIGANTIC_PAGE has nothing runtime-specific in its 
> name.

In its name for sure, but the commit I mention says:

     On systems without CONTIG_ALLOC activated but that support gigantic 
pages,
     boottime reserved gigantic pages can not be freed at all.  This patch
     simply enables the possibility to hand back those pages to memory
     allocator.

And one of the hunks is:

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7f7fbd8bd9d5b..7a1aa53d188d3 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -19,7 +19,7 @@ config ARM64
         select ARCH_HAS_FAST_MULTIPLIER
         select ARCH_HAS_FORTIFY_SOURCE
         select ARCH_HAS_GCOV_PROFILE_ALL
-       select ARCH_HAS_GIGANTIC_PAGE if CONTIG_ALLOC
+       select ARCH_HAS_GIGANTIC_PAGE
         select ARCH_HAS_KCOV
         select ARCH_HAS_KEEPINITRD
         select ARCH_HAS_MEMBARRIER_SYNC_CORE

So I understand from the commit message that it was possible at that 
time to have gigantic pages without ARCH_HAS_GIGANTIC_PAGE as long as 
you didn't have to be able to free them during runtime.

> 
> Can't we just select CONFIG_ARCH_HAS_GIGANTIC_PAGE for the relevant 
> hugetlb config that allows for *gigantic pages*.
> 

We probably can, but I'd really like to understand history and how we 
ended up in the situation we are now.
Because blind fixes often lead to more problems.

If I follow things correctly I see a helper gigantic_page_supported() 
added by commit 944d9fec8d7a ("hugetlb: add support for gigantic page 
allocation at runtime").

And then commit 461a7184320a ("mm/hugetlb: introduce 
ARCH_HAS_GIGANTIC_PAGE") is added to wrap gigantic_page_supported()

Then commit 4eb0716e868e ("hugetlb: allow to free gigantic pages 
regardless of the configuration") changed gigantic_page_supported() to 
gigantic_page_runtime_supported()

So where are we now ?

Christophe

