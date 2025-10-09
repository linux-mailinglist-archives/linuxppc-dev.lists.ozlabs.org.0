Return-Path: <linuxppc-dev+bounces-12737-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F31BC7FFE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 10:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cj2r673YNz3cDN;
	Thu,  9 Oct 2025 19:20:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759998038;
	cv=none; b=ns4UcxfZr0CqxgRaxDpwu2FGulcWtk11fNn6zRMDMFbP1DE2HIN6/MtthV0L1WT596rvgypuo02ATYgTKXWW4mZfeVwXRQx973G3qLzbD1TdjZyzJcuWnMBbdNLFghdZFYYK5zINGZwiGzDO8rNJs0HAYxw5sOXCKLKr07SHrLyZxh3QJL+POx72vnrVfxLxdQwxu7kjB5QFIOT6MFWm08pQKPWBulyDeksD9I665qIrbdrqwXvcNy8HBbaFTa0D6AhH35Yrg1oc3lCk/MmF2ABYZ09nyI8sPo2bTCVvX6CL08cc+vD6Qx7i1EBtzRK/UyRoPw9Bp24lZ/LIfsWtHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759998038; c=relaxed/relaxed;
	bh=Xbw+RhCM/KhKNE+NeIDOVsuF3+v6zQfqYVSxtVn6guE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OxmAJjAIcphSsxR6Gye1XQECEcB3vbm1I35Pcp92StytDmjMNPSwYlGtXZy9uI5eSnLI3u7rkDyjdy2n2D2n8qMpLKRov4T5ArFP08Q1nY5/JW5m6Yiov11tSXoM+kCAGZ/9eFP/Dj0YTWU5rAdYM3xQPtTdveOfYyBK/zIjxa9NbXUsdzJURqLCyxfUeOUC7PjbdjYnjmpDOoAoRtmkzuFfv1ojFepN+J96BVtqRv5MNwtzlloiTgrEpVvsXHkbOsDovlGyvGCNiXAXeWkIMNcO5YnZvfUmimPvmwuP1x+9gznW9Pe45qvDQ4t0FxX83kKntcE/0+hm1hb7G1kMyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cj2r60xHWz2xQ3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 19:20:36 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cj2Td0Mj6z9sSL;
	Thu,  9 Oct 2025 10:04:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qQ36Dhni13kk; Thu,  9 Oct 2025 10:04:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cj2Tc5kJ8z9sSC;
	Thu,  9 Oct 2025 10:04:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A8FDF8B770;
	Thu,  9 Oct 2025 10:04:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id CnXkw3FAfnqR; Thu,  9 Oct 2025 10:04:36 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AE04F8B76D;
	Thu,  9 Oct 2025 10:04:34 +0200 (CEST)
Message-ID: <faf62f20-8844-42a0-a7a7-846d8ead0622@csgroup.eu>
Date: Thu, 9 Oct 2025 10:04:34 +0200
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
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <d3fc12d4-0b59-4b1f-bb5c-13189a01e13d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 09/10/2025 à 09:22, David Hildenbrand a écrit :
> On 09.10.25 09:14, Christophe Leroy wrote:
>> Hi David,
>>
>> Le 01/09/2025 à 17:03, David Hildenbrand a écrit :
>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>> index 1e777cc51ad04..d3542e92a712e 100644
>>> --- a/mm/hugetlb.c
>>> +++ b/mm/hugetlb.c
>>> @@ -4657,6 +4657,7 @@ static int __init hugetlb_init(void)
>>>        BUILD_BUG_ON(sizeof_field(struct page, private) * BITS_PER_BYTE <
>>>                __NR_HPAGEFLAGS);
>>> +    BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
>>>        if (!hugepages_supported()) {
>>>            if (hugetlb_max_hstate || default_hstate_max_huge_pages)
>>> @@ -4740,6 +4741,7 @@ void __init hugetlb_add_hstate(unsigned int order)
>>>        }
>>>        BUG_ON(hugetlb_max_hstate >= HUGE_MAX_HSTATE);
>>>        BUG_ON(order < order_base_2(__NR_USED_SUBPAGE));
>>> +    WARN_ON(order > MAX_FOLIO_ORDER);
>>>        h = &hstates[hugetlb_max_hstate++];
>>>        __mutex_init(&h->resize_lock, "resize mutex", &h->resize_key);
>>>        h->order = order;
> 
> We end up registering hugetlb folios that are bigger than 
> MAX_FOLIO_ORDER. So we have to figure out how a config can trigger that 
> (and if we have to support that).
> 

MAX_FOLIO_ORDER is defined as:

#ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
#define MAX_FOLIO_ORDER		PUD_ORDER
#else
#define MAX_FOLIO_ORDER		MAX_PAGE_ORDER
#endif

MAX_PAGE_ORDER is the limit for dynamic creation of hugepages via 
/sys/kernel/mm/hugepages/ but bigger pages can be created at boottime 
with kernel boot parameters without CONFIG_ARCH_HAS_GIGANTIC_PAGE:

   hugepagesz=64m hugepages=1 hugepagesz=256m hugepages=1

Gives:

HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
HugeTLB: registered 64.0 MiB page size, pre-allocated 1 pages
HugeTLB: 0 KiB vmemmap can be freed for a 64.0 MiB page
HugeTLB: registered 256 MiB page size, pre-allocated 1 pages
HugeTLB: 0 KiB vmemmap can be freed for a 256 MiB page
HugeTLB: registered 4.00 MiB page size, pre-allocated 0 pages
HugeTLB: 0 KiB vmemmap can be freed for a 4.00 MiB page
HugeTLB: registered 16.0 MiB page size, pre-allocated 0 pages
HugeTLB: 0 KiB vmemmap can be freed for a 16.0 MiB page


Christophe

