Return-Path: <linuxppc-dev+bounces-12736-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A40ADBC7F80
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 10:14:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cj2hz5Y2qz3cDN;
	Thu,  9 Oct 2025 19:14:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759997667;
	cv=none; b=X9DZpcuFLeNeKfDKcnYcZ9Id3c7UVWnpefbOkCRLVxfI07gT8+g1qq1DXwfS44vUEY6E8uBC5HqCch+gwBD997R/+5JC/ANjZHkKBl5zV6UOoZQ7GaMf01FzqrCxkqFA6qEtvaBKdXAOIooMLsPLgkJaeMWhnm+dKKECZ7wqy69Sq/5TEPW9pDYqjKn4gNT/+Zu40IJnTYoKZsnN65+n7Uw7NGnLSnBxQ3MKGCFXmho1Aazl1AQHPxez4LSsOSurBM/tS3ZFZCWWWA/G4d74+ns3MPYsxFMJBw89tVrnvxohJPorggFfRrdhBYXCCLCXVev6fR8FEjcVzroU0yhEyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759997667; c=relaxed/relaxed;
	bh=z/B31lhY4bVYeZNnk+dMlfOVrRbTYtHHzwgcdMMaTVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iITV9Mr9oAz+jqwmBDKhQtVPEYL0xVVdIVHgSTIbA+UJdvQBu5Ia400Nh5TGgQ6Ra7y5T5yL8HJu4irnzL/3allMfF/jF6hXY+B2SngWscYucHDr/AT60ErpBxb8xNuiYsRTVZhiKoM8shce/DmogbTeqFmL/OqEl/9kM1YatbDPGBCDoQS2lncovX5kBPjwlyE5GjeSDd8wzxE89DY8sHuhGIDbIK3a/AAjS2HM/yFCwAnQUP29Kcnq0yRX1ZbicGZqa+CGMgkeYku+1zfXavmj77eK/az07Avan+wWEsRNINr87cfBunGi1mcafjCLEvuzn5PoHnN8EaMPOHyoPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dfesaZvl; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cFwnkyHp; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dfesaZvl;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cFwnkyHp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cj2hw49g5z2xQ3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 19:14:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759997653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=z/B31lhY4bVYeZNnk+dMlfOVrRbTYtHHzwgcdMMaTVE=;
	b=dfesaZvlsQUtr0U58MS8V+R5ClgquCeqxooEl/2t5bVBYTplzY5cRC/FXZo/gf4iDd6x3z
	5wP5oxNppzcxtkWI9zdEgHWL99pLF6xDxtKxkWxSwNPeRQ3NgXIaru35skPzrl26Lx2t4s
	ynvXvKIEawwU5DrX1FdaEZlIFEIF8gk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759997654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=z/B31lhY4bVYeZNnk+dMlfOVrRbTYtHHzwgcdMMaTVE=;
	b=cFwnkyHpg9sM06axWoSaY8BKNTT1hgyLsDOdiJlBV2+uEooW9lSca+xuBfi2wsqUBDtoBK
	YVNEG/aRx/3nqONkKdjTUImag8NSccTxkseRhNdxyJ58G1oQIf8eCOnfezEiYo2IkH9B3r
	4Rd7GmQWTYy2wZ7kj4pqKpxv0mniIDo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45--Q8n0xLANpSiJ7ik9sd1ig-1; Thu, 09 Oct 2025 04:14:12 -0400
X-MC-Unique: -Q8n0xLANpSiJ7ik9sd1ig-1
X-Mimecast-MFC-AGG-ID: -Q8n0xLANpSiJ7ik9sd1ig_1759997648
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-46e3d9bf9e1so3724865e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Oct 2025 01:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759997648; x=1760602448;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/B31lhY4bVYeZNnk+dMlfOVrRbTYtHHzwgcdMMaTVE=;
        b=aV6FFP4ydHXXbFqfw+FqliLE6h2ROPht1zmYVeI0zWHneENu5BhxZ2brQ5FvRqDU51
         VclPiNKHwanjoWiE4N6yE3/+JhotvVvhq7/G+Uy1sOqv5DUEx5Ri88WzRwH9mghLy2TG
         8Kgr6vnZQgFrg/ndVpUEiyBdwgeIs9x3PZTg5Zd5l8UWo4+VwQTtQNHtLskq+CN6syZS
         2K8Y8O6HdzIJTZnIALvio8eZ8uKSR+fwIqdm1etQpY3fg3FkqmWH9lGjZTWXB+1XZwwB
         ZZcV+rcClyScpvi7EHi3a64da5QeMUBVEPrJRVf+uLU1jNdDQTDKal+hKf0kirAhx3Nr
         veIA==
X-Forwarded-Encrypted: i=1; AJvYcCUVntTn0/YbzSjI28kHQnBzUoSTrJjAuIbpr5MvAxJQJZbupW7gkELdFq2rAYrlnloWuMylX6M8flAcx1k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyxj9++og5IJkr4cm9Rd9aPMrTD2eWUHgT8ofvrP7hOuAvl6GAk
	jzWH5qprjAwMFIauHIzPQxGIg7JZM57cnBrmIMyvIIuNxeTIFBluDyWUxcW0HktvDgwL30bW6zH
	Qo6sjWCILY/d2qkg5DxGiQvEzmm/w0GYHTgLLaaZLnL4L3sDgH2ncIY8ZyPCowWBu4CY=
X-Gm-Gg: ASbGncuwUKvYKD7fiEri6hY9+zUtBk9ySGh/GxxbJEiKa1omjGVcGPUsmQSWsgfR9Kq
	bcSelceeaW5pkpPtC2OhXVk6O1YFT0q1vEpN9+VV5AUB9koFSoaa2734M1dubJP8SYC7RwhNASv
	iYW96pXv8zzuHCZ1+O0F+2aIJn/hfSiDEYefH0ws+R6/L4jwmdodyhGdXjb0zCXr9fYbIDUmYnF
	v164ZAvBwYCNPcZ51H3lMeJv9WaoinMYJnDeF+kA9ZILKPVF4ItF+F5dsLka0VPj1nN46EyqPt0
	6rGiUV4u9KxjTU+9bYBeUTnT/AkqFF0RoH1lqM3aSLgjIeF5QPYI7qJGUKeGtJXBAG+VZ/WaiHI
	p8NLO8u0g
X-Received: by 2002:a05:600c:4750:b0:45f:28d2:bd38 with SMTP id 5b1f17b1804b1-46fa9af3095mr47092965e9.18.1759997648108;
        Thu, 09 Oct 2025 01:14:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo93r/upxlN0XWroa/gVbVuSE1HI9H4cBHGhOGnkYv+FuHkp7MlpzQ4ByJt+h+2JF6rzGBiQ==
X-Received: by 2002:a05:600c:4750:b0:45f:28d2:bd38 with SMTP id 5b1f17b1804b1-46fa9af3095mr47092215e9.18.1759997647608;
        Thu, 09 Oct 2025 01:14:07 -0700 (PDT)
Received: from [192.168.3.141] (tmo-083-189.customers.d1-online.com. [80.187.83.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9d6fb41sm71628175e9.17.2025.10.09.01.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 01:14:07 -0700 (PDT)
Message-ID: <9361c75a-ab37-4d7f-8680-9833430d93d4@redhat.com>
Date: Thu, 9 Oct 2025 10:14:02 +0200
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <faf62f20-8844-42a0-a7a7-846d8ead0622@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TfV1Tf9KwEWaXkUBScux1vGxAajPqH6x0QI7QQcSi7g_1759997648
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 09.10.25 10:04, Christophe Leroy wrote:
> 
> 
> Le 09/10/2025 à 09:22, David Hildenbrand a écrit :
>> On 09.10.25 09:14, Christophe Leroy wrote:
>>> Hi David,
>>>
>>> Le 01/09/2025 à 17:03, David Hildenbrand a écrit :
>>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>>> index 1e777cc51ad04..d3542e92a712e 100644
>>>> --- a/mm/hugetlb.c
>>>> +++ b/mm/hugetlb.c
>>>> @@ -4657,6 +4657,7 @@ static int __init hugetlb_init(void)
>>>>         BUILD_BUG_ON(sizeof_field(struct page, private) * BITS_PER_BYTE <
>>>>                 __NR_HPAGEFLAGS);
>>>> +    BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
>>>>         if (!hugepages_supported()) {
>>>>             if (hugetlb_max_hstate || default_hstate_max_huge_pages)
>>>> @@ -4740,6 +4741,7 @@ void __init hugetlb_add_hstate(unsigned int order)
>>>>         }
>>>>         BUG_ON(hugetlb_max_hstate >= HUGE_MAX_HSTATE);
>>>>         BUG_ON(order < order_base_2(__NR_USED_SUBPAGE));
>>>> +    WARN_ON(order > MAX_FOLIO_ORDER);
>>>>         h = &hstates[hugetlb_max_hstate++];
>>>>         __mutex_init(&h->resize_lock, "resize mutex", &h->resize_key);
>>>>         h->order = order;
>>
>> We end up registering hugetlb folios that are bigger than
>> MAX_FOLIO_ORDER. So we have to figure out how a config can trigger that
>> (and if we have to support that).
>>
> 
> MAX_FOLIO_ORDER is defined as:
> 
> #ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
> #define MAX_FOLIO_ORDER		PUD_ORDER
> #else
> #define MAX_FOLIO_ORDER		MAX_PAGE_ORDER
> #endif
> 
> MAX_PAGE_ORDER is the limit for dynamic creation of hugepages via
> /sys/kernel/mm/hugepages/ but bigger pages can be created at boottime
> with kernel boot parameters without CONFIG_ARCH_HAS_GIGANTIC_PAGE:
> 
>     hugepagesz=64m hugepages=1 hugepagesz=256m hugepages=1
> 
> Gives:
> 
> HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
> HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
> HugeTLB: registered 64.0 MiB page size, pre-allocated 1 pages
> HugeTLB: 0 KiB vmemmap can be freed for a 64.0 MiB page
> HugeTLB: registered 256 MiB page size, pre-allocated 1 pages
> HugeTLB: 0 KiB vmemmap can be freed for a 256 MiB page
> HugeTLB: registered 4.00 MiB page size, pre-allocated 0 pages
> HugeTLB: 0 KiB vmemmap can be freed for a 4.00 MiB page
> HugeTLB: registered 16.0 MiB page size, pre-allocated 0 pages
> HugeTLB: 0 KiB vmemmap can be freed for a 16.0 MiB page

I think it's a violation of CONFIG_ARCH_HAS_GIGANTIC_PAGE. The existing 
folio_dump() code would not handle it correctly as well.

See how snapshot_page() uses MAX_FOLIO_NR_PAGES.

-- 
Cheers

David / dhildenb


