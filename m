Return-Path: <linuxppc-dev+bounces-12743-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C887BC87B0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 12:27:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cj5fZ48njz3cDN;
	Thu,  9 Oct 2025 21:27:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760005654;
	cv=none; b=cB+ko/wmIP8vxcP3M3NAhqVzn1R/8DKIrLbM5YHxN7MUdf5RVpNHNmAgO4k7YuFXPvDuEDXYRS3cu0SzYdw/eh1DaTYBBvp0QPvHoCUaqi5y3HqyTkQJxhhsJynMRfppzC0ZjjNQ/ZRLaUMKp6gAIsAp0Tbc3eWppIoyWSnItzt1qAeXOujXWSaWP+U4rqLjyi3VUOybDrk4uxHkPDWPioYH1TJ+XD5dlBH8gXaDz/wX36UCHcoFwPigp7u7JbdZiw+wn9E/Y2e5YwpwByEX1S971XRWOYs90FRn9xvGa8VBPJ/AzilJf0MJKsvKg+ZBvqZIV3GLzfb938awS1Mpfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760005654; c=relaxed/relaxed;
	bh=PnaMSwBDtuymaXBhgXecb0+EmYLZhk15irlwltuvb1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=keqJFe7bQfNkwCsyXwRcFxys6AmFYMSCdb2rAHNIHtcixKe+CpzhJSxgT1QEpSMN6tJlPBuZ+LzkRC50kF5pSMufE5BqUB6E5DhpKHnErGSlxIrkc0TAQY1zYmK1BG98hYOVItHANM4BkYtrm8oEmMPeoZHIIrX1g5z+2RRlmE+WnqwtUBOfHZeCt7PKlQGMWsB67g8xkHe+81kkrb/5xflTle0no/5EE9OTiPEevU9aTmc+sETVn/46eM9I3qGfFh8w2oV5FWILDZB2+s3S052BJ0DhJF0flrRdOEU5M9i6l7IrUOgAkcLjofw6clD/QXOGZCg9F0YsiNW2chq4iQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gorcv2kH; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gorcv2kH; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gorcv2kH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gorcv2kH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cj5fY0m88z2xQ3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 21:27:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760005648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PnaMSwBDtuymaXBhgXecb0+EmYLZhk15irlwltuvb1Y=;
	b=gorcv2kHuKBuohjfXdLCl01tYZFEw7t9MYakKT0fOcXMoG4xG03jwfL38o+6zLCRV1q6Zm
	7jplN3rtAba36PrWCRUIzRe58i5paKk5UVgdkPMFHi3z2DqkB3XkK84z5CX6uIn0Xt/Hh3
	PX3cBbny2ZXczVE7tihr7vNcnfNv1tw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760005648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PnaMSwBDtuymaXBhgXecb0+EmYLZhk15irlwltuvb1Y=;
	b=gorcv2kHuKBuohjfXdLCl01tYZFEw7t9MYakKT0fOcXMoG4xG03jwfL38o+6zLCRV1q6Zm
	7jplN3rtAba36PrWCRUIzRe58i5paKk5UVgdkPMFHi3z2DqkB3XkK84z5CX6uIn0Xt/Hh3
	PX3cBbny2ZXczVE7tihr7vNcnfNv1tw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-6tUbqjSDO8CdntedddZ-MQ-1; Thu, 09 Oct 2025 06:27:24 -0400
X-MC-Unique: 6tUbqjSDO8CdntedddZ-MQ-1
X-Mimecast-MFC-AGG-ID: 6tUbqjSDO8CdntedddZ-MQ_1760005644
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-401dbafbcfaso615974f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Oct 2025 03:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760005644; x=1760610444;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnaMSwBDtuymaXBhgXecb0+EmYLZhk15irlwltuvb1Y=;
        b=U3/mG99n/KbpFzIN6fhGbVHKk1a60U7fHBpYV98CDzvXHmMjpqgUSYv4YD0pt1W0vv
         u8deM1htkYc1nPQpl98SMPIm0DAIg9ouUfC9xshELPZomJA+FdmJkqdmEhyzMc6kCaFE
         WCW+Ozt8fYHOSm79GlC9hCoVIDFUrtYgcqKn9mZVhznOiRplWq9BUmxXdPF6wsncAOnm
         vO4wsCa7lTCe8X9R/uPJhLAmesHPeZ2QHPuYtgSmrIZ/bQMQy0mHB5WK65+zEfD+YQHZ
         C4m7LHYFe5lBzhiHsU9wHUExFVoOoHFZWeAAUYTpTyrO7Vq11XPQ15FvqyRpq6lu2IvJ
         SSNg==
X-Forwarded-Encrypted: i=1; AJvYcCW6WFDRdhH6myKgYOWp3P6sU4CtHOkoG68od78eAeojD+Nj7aY+HVM3L2K20qxL8Bz5yGa5Nb/TV6WZGdY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwCQYc/zjVkSUU/oS2v59ZO0kFcmJPqtKo/gjrUGS50rlPvfb9S
	hNJ4pVB1Yk+Qt+ssyqaiIr2nK21E1jkiNTs3d50WyFw0YNYavRhvhsDc/VXDxcT3f2NIeBG7028
	a8+d0khD89suMh/IAyZMMc4pexdRGuQn93WAq5H6L4oGytDwGJyjaKrMYL/xJLoWiSJA=
X-Gm-Gg: ASbGnctIAGWIa4wiLYfRfGo6Hc0Vy/CTvqhEs22KpOf3ahuGENCnF7CorRU/G3dndK+
	UBKyVyyQm3SPZt+umyLyWJuAwLCMFfPR313pcWdZ+VybZx5bg4TwIjI2V8XtPtvmunGHGsm13i7
	h4ih9KLphEZqp2grNyD1BVrhfMdvS7GYQnF7xYhPBPtDmBMGdp9+jZU25fvgPCScy40Dy8BGIpE
	Z5knBWGAT11c9cGmukwLxE/s6/ZFY2PJMPyI3omMMYWfrRoDmZWGFEUcWaUFc+zCMB6m1bzhxph
	vuqWQfW5DkOl/8DiER0yV3AtPs8yjH6KwGWoAcaXcADEH7LuXaIe8GQJJxtSgYCFByDPBjO2DDy
	+4u82ruDV
X-Received: by 2002:a05:6000:26c9:b0:425:74e1:25f7 with SMTP id ffacd0b85a97d-4266e8e6d0amr4383272f8f.62.1760005643656;
        Thu, 09 Oct 2025 03:27:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEesLOt7nL3ssClyJORVAYlz8cRc7j7l9rZT7U1D7oG6YdutQizbYz0xgMQfBuUYe2CfhAXag==
X-Received: by 2002:a05:6000:26c9:b0:425:74e1:25f7 with SMTP id ffacd0b85a97d-4266e8e6d0amr4383228f8f.62.1760005643040;
        Thu, 09 Oct 2025 03:27:23 -0700 (PDT)
Received: from [192.168.3.141] (tmo-083-189.customers.d1-online.com. [80.187.83.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab8fdsm33619939f8f.15.2025.10.09.03.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 03:27:22 -0700 (PDT)
Message-ID: <543e9440-8ee0-4d9e-9b05-0107032d665b@redhat.com>
Date: Thu, 9 Oct 2025 12:27:17 +0200
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
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-kernel@vger.kernel.org
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
 <0c730c52-97ee-43ea-9697-ac11d2880ab7@csgroup.eu>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <0c730c52-97ee-43ea-9697-ac11d2880ab7@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e0a6dotSp6A6bhmOjxzqdY9mtG3Kbeu4AAzp2HsUKi4_1760005644
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 09.10.25 12:01, Christophe Leroy wrote:
> 
> 
> Le 09/10/2025 à 11:20, David Hildenbrand a écrit :
>> On 09.10.25 11:16, Christophe Leroy wrote:
>>>
>>>
>>> Le 09/10/2025 à 10:14, David Hildenbrand a écrit :
>>>> On 09.10.25 10:04, Christophe Leroy wrote:
>>>>>
>>>>>
>>>>> Le 09/10/2025 à 09:22, David Hildenbrand a écrit :
>>>>>> On 09.10.25 09:14, Christophe Leroy wrote:
>>>>>>> Hi David,
>>>>>>>
>>>>>>> Le 01/09/2025 à 17:03, David Hildenbrand a écrit :
>>>>>>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>>>>>>> index 1e777cc51ad04..d3542e92a712e 100644
>>>>>>>> --- a/mm/hugetlb.c
>>>>>>>> +++ b/mm/hugetlb.c
>>>>>>>> @@ -4657,6 +4657,7 @@ static int __init hugetlb_init(void)
>>>>>>>>           BUILD_BUG_ON(sizeof_field(struct page, private) *
>>>>>>>> BITS_PER_BYTE <
>>>>>>>>                   __NR_HPAGEFLAGS);
>>>>>>>> +    BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
>>>>>>>>           if (!hugepages_supported()) {
>>>>>>>>               if (hugetlb_max_hstate ||
>>>>>>>> default_hstate_max_huge_pages)
>>>>>>>> @@ -4740,6 +4741,7 @@ void __init hugetlb_add_hstate(unsigned int
>>>>>>>> order)
>>>>>>>>           }
>>>>>>>>           BUG_ON(hugetlb_max_hstate >= HUGE_MAX_HSTATE);
>>>>>>>>           BUG_ON(order < order_base_2(__NR_USED_SUBPAGE));
>>>>>>>> +    WARN_ON(order > MAX_FOLIO_ORDER);
>>>>>>>>           h = &hstates[hugetlb_max_hstate++];
>>>>>>>>           __mutex_init(&h->resize_lock, "resize mutex", &h-
>>>>>>>>> resize_key);
>>>>>>>>           h->order = order;
>>>>>>
>>>>>> We end up registering hugetlb folios that are bigger than
>>>>>> MAX_FOLIO_ORDER. So we have to figure out how a config can trigger
>>>>>> that
>>>>>> (and if we have to support that).
>>>>>>
>>>>>
>>>>> MAX_FOLIO_ORDER is defined as:
>>>>>
>>>>> #ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
>>>>> #define MAX_FOLIO_ORDER        PUD_ORDER
>>>>> #else
>>>>> #define MAX_FOLIO_ORDER        MAX_PAGE_ORDER
>>>>> #endif
>>>>>
>>>>> MAX_PAGE_ORDER is the limit for dynamic creation of hugepages via
>>>>> /sys/kernel/mm/hugepages/ but bigger pages can be created at boottime
>>>>> with kernel boot parameters without CONFIG_ARCH_HAS_GIGANTIC_PAGE:
>>>>>
>>>>>       hugepagesz=64m hugepages=1 hugepagesz=256m hugepages=1
>>>>>
>>>>> Gives:
>>>>>
>>>>> HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
>>>>> HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
>>>>> HugeTLB: registered 64.0 MiB page size, pre-allocated 1 pages
>>>>> HugeTLB: 0 KiB vmemmap can be freed for a 64.0 MiB page
>>>>> HugeTLB: registered 256 MiB page size, pre-allocated 1 pages
>>>>> HugeTLB: 0 KiB vmemmap can be freed for a 256 MiB page
>>>>> HugeTLB: registered 4.00 MiB page size, pre-allocated 0 pages
>>>>> HugeTLB: 0 KiB vmemmap can be freed for a 4.00 MiB page
>>>>> HugeTLB: registered 16.0 MiB page size, pre-allocated 0 pages
>>>>> HugeTLB: 0 KiB vmemmap can be freed for a 16.0 MiB page
>>>>
>>>> I think it's a violation of CONFIG_ARCH_HAS_GIGANTIC_PAGE. The existing
>>>> folio_dump() code would not handle it correctly as well.
>>>
>>> I'm trying to dig into history and when looking at commit 4eb0716e868e
>>> ("hugetlb: allow to free gigantic pages regardless of the
>>> configuration") I understand that CONFIG_ARCH_HAS_GIGANTIC_PAGE is
>>> needed to be able to allocate gigantic pages at runtime. It is not
>>> needed to reserve gigantic pages at boottime.
>>>
>>> What am I missing ?
>>
>> That CONFIG_ARCH_HAS_GIGANTIC_PAGE has nothing runtime-specific in its
>> name.
> 
> In its name for sure, but the commit I mention says:
> 
>       On systems without CONTIG_ALLOC activated but that support gigantic
> pages,
>       boottime reserved gigantic pages can not be freed at all.  This patch
>       simply enables the possibility to hand back those pages to memory
>       allocator.

Right, I think it was a historical artifact.

> 
> And one of the hunks is:
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 7f7fbd8bd9d5b..7a1aa53d188d3 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -19,7 +19,7 @@ config ARM64
>           select ARCH_HAS_FAST_MULTIPLIER
>           select ARCH_HAS_FORTIFY_SOURCE
>           select ARCH_HAS_GCOV_PROFILE_ALL
> -       select ARCH_HAS_GIGANTIC_PAGE if CONTIG_ALLOC
> +       select ARCH_HAS_GIGANTIC_PAGE
>           select ARCH_HAS_KCOV
>           select ARCH_HAS_KEEPINITRD
>           select ARCH_HAS_MEMBARRIER_SYNC_CORE
> 
> So I understand from the commit message that it was possible at that
> time to have gigantic pages without ARCH_HAS_GIGANTIC_PAGE as long as
> you didn't have to be able to free them during runtime.

Yes, I agree.

> 
>>
>> Can't we just select CONFIG_ARCH_HAS_GIGANTIC_PAGE for the relevant
>> hugetlb config that allows for *gigantic pages*.
>>
> 
> We probably can, but I'd really like to understand history and how we
> ended up in the situation we are now.
> Because blind fixes often lead to more problems.

Yes, let's figure out how to to it cleanly.

> 
> If I follow things correctly I see a helper gigantic_page_supported()
> added by commit 944d9fec8d7a ("hugetlb: add support for gigantic page
> allocation at runtime").
> 
> And then commit 461a7184320a ("mm/hugetlb: introduce
> ARCH_HAS_GIGANTIC_PAGE") is added to wrap gigantic_page_supported()
> 
> Then commit 4eb0716e868e ("hugetlb: allow to free gigantic pages
> regardless of the configuration") changed gigantic_page_supported() to
> gigantic_page_runtime_supported()
> 
> So where are we now ?

In

commit fae7d834c43ccdb9fcecaf4d0f33145d884b3e5c
Author: Matthew Wilcox (Oracle) <willy@infradead.org>
Date:   Tue Feb 27 19:23:31 2024 +0000

     mm: add __dump_folio()


We started assuming that a folio in the system (boottime, dynamic, whatever)
has a maximum of MAX_FOLIO_NR_PAGES.

Any other interpretation doesn't make any sense for MAX_FOLIO_NR_PAGES.


So we have two questions:

1) How to teach MAX_FOLIO_NR_PAGES that hugetlb supports gigantic pages

2) How do we handle CONFIG_ARCH_HAS_GIGANTIC_PAGE


We have the following options

(A) Rename existing CONFIG_ARCH_HAS_GIGANTIC_PAGE to something else that is
clearer and add a new CONFIG_ARCH_HAS_GIGANTIC_PAGE.

(B) Rename existing CONFIG_ARCH_HAS_GIGANTIC_PAGE -> to something else that is
clearer and derive somehow else that hugetlb in that config supports gigantic pages.

(c) Just use CONFIG_ARCH_HAS_GIGANTIC_PAGE if hugetlb on an architecture
supports gigantic pages.


I don't quite see why an architecture should be able to opt in into dynamically
allocating+freeing gigantic pages. That's just CONTIG_ALLOC magic and not some
arch-specific thing IIRC.


Note that in mm/hugetlb.c it is

	#ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
	#ifdef CONFIG_CONTIG_ALLOC

Meaning that at least the allocation side is guarded by CONTIG_ALLOC.

So I think (C) is just the right thing to do.

diff --git a/fs/Kconfig b/fs/Kconfig
index 0bfdaecaa8775..12c11eb9279d3 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -283,6 +283,8 @@ config HUGETLB_PMD_PAGE_TABLE_SHARING
         def_bool HUGETLB_PAGE
         depends on ARCH_WANT_HUGE_PMD_SHARE && SPLIT_PMD_PTLOCKS
  
+# An architecture must select this option if there is any mechanism (esp. hugetlb)
+# could obtain gigantic folios.
  config ARCH_HAS_GIGANTIC_PAGE
         bool
  


-- 
Cheers

David / dhildenb


