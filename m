Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8443D5ACDE9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 10:38:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLhkK3J7Pz3bkG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 18:38:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fc8fy/9l;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fc8fy/9l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fc8fy/9l;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fc8fy/9l;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLhjY0F5Wz2xr1
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 18:37:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662367066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RskN8vPxcZR9tBlMGRowc28Et8faIlvMz95rfc0y61A=;
	b=Fc8fy/9lEJ3WjUgnAYjdClNGYDfzzV72cvIw+3lZ6BfbXV6a4HGm1OHp1H8WFG4zlZqo48
	RnerWzmzeMm9pZaD/Z5U3BHxnP8DiKmtRkbYrHKOlJpnZ2cfcatkcoJeyhwXpe3Yw4zfxQ
	rrrhVfJYys64KlGpWLNGM3V5qQsHpbA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662367066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RskN8vPxcZR9tBlMGRowc28Et8faIlvMz95rfc0y61A=;
	b=Fc8fy/9lEJ3WjUgnAYjdClNGYDfzzV72cvIw+3lZ6BfbXV6a4HGm1OHp1H8WFG4zlZqo48
	RnerWzmzeMm9pZaD/Z5U3BHxnP8DiKmtRkbYrHKOlJpnZ2cfcatkcoJeyhwXpe3Yw4zfxQ
	rrrhVfJYys64KlGpWLNGM3V5qQsHpbA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-314-PNo3kW4lO9yr7ZRkKsH9nw-1; Mon, 05 Sep 2022 04:37:45 -0400
X-MC-Unique: PNo3kW4lO9yr7ZRkKsH9nw-1
Received: by mail-wr1-f70.google.com with SMTP id d16-20020adfa350000000b00228628ff913so502384wrb.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Sep 2022 01:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=RskN8vPxcZR9tBlMGRowc28Et8faIlvMz95rfc0y61A=;
        b=QLOv87QOXbN8hNTGOUQ/duL3VHKHrqT9i4B/j7ypXVXZcSbQwPIWmmOhTOMYh7p9PP
         7jgU2XEoEuIy1u2OKBHb1KhPc+FpJfeSpJlIMAJeK1V7m7rXNaGY6Ytvqwy9BlBo+cs3
         w5505fQDkrrJzA51hL37pqFoYyPgT/u/s2B3jetRBHdZvUjjm0dPfV+ntIo5C0WhmwcK
         LdQHWjE9KY6eUpmFrDCOsw59hmXy53H2Bo49SNZrYG3pVTj0gHDUpfTKG4DC1D6+b39a
         jPcwfnF6vrjKh/jFbZUf7UoTrqwiFxx5UVgYHLf0tMIAXozB+K3bF1vWqR/PIpYEDOeZ
         roYg==
X-Gm-Message-State: ACgBeo1c+qVbpXx00zXi8E2Gb9I2AKov92E+3XCX9kpOW2jpdjXi6gm5
	gCDW+55A+9ZxVNFbAMAIiOlHQseCVKkdBcTZSorRsAx4VEce3CYI6yV2QwfM37WOR+AbpdvSVqQ
	25Hy8KckpMMEY48nivrTW7/b5zQ==
X-Received: by 2002:a05:600c:4148:b0:3a5:4f94:577b with SMTP id h8-20020a05600c414800b003a54f94577bmr10251118wmm.167.1662367063950;
        Mon, 05 Sep 2022 01:37:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6hOewj1kAW5ksLrjog3tDXN8mruAU1BTTIBPUwXHo5nCkedd3cF0KNcRs+6mz3jaCdK4MqQA==
X-Received: by 2002:a05:600c:4148:b0:3a5:4f94:577b with SMTP id h8-20020a05600c414800b003a54f94577bmr10251102wmm.167.1662367063706;
        Mon, 05 Sep 2022 01:37:43 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0d:ba00:c951:31d7:b2b0:8ba0? (p200300d82f0dba00c95131d7b2b08ba0.dip0.t-ipconnect.de. [2003:d8:2f0d:ba00:c951:31d7:b2b0:8ba0])
        by smtp.gmail.com with ESMTPSA id n22-20020a05600c465600b003a839b9ba0asm15604972wmo.40.2022.09.05.01.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 01:37:43 -0700 (PDT)
Message-ID: <5f6a7c6b-5073-f050-8dae-6ee279a8bb0b@redhat.com>
Date: Mon, 5 Sep 2022 10:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] hugetlb: simplify hugetlb handling in follow_page_mask
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Kravetz <mike.kravetz@oracle.com>
References: <20220829234053.159158-1-mike.kravetz@oracle.com>
 <608934d4-466d-975e-6458-34a91ccb4669@redhat.com> <Yw5AOZ/Kc5f3UP+s@monkey>
 <Yw6Bpsow+gUMlHCU@monkey> <739dc825-ece3-a59f-adc5-65861676e0ae@redhat.com>
 <YxJQfGSsbXd3W4m/@monkey> <323fdb0f-c5a5-e0e5-1ff4-ab971bc295cc@redhat.com>
 <c6f3d408-e050-c1dc-9864-c1b2c92369ed@csgroup.eu>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <c6f3d408-e050-c1dc-9864-c1b2c92369ed@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Muchun Song <songmuchun@bytedance.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, Naoya Horiguchi <naoya.horiguchi@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03.09.22 09:07, Christophe Leroy wrote:
> +Resending with valid powerpc list address
> 
> Le 02/09/2022 à 20:52, David Hildenbrand a écrit :
>>>>> Adding Christophe on Cc:
>>>>>
>>>>> Christophe do you know if is_hugepd is true for all hugetlb entries, not
>>>>> just hugepd?
> 
> is_hugepd() is true if and only if the directory entry points to a huge
> page directory and not to the normal lower level directory.
> 
> As far as I understand if the directory entry is not pointing to any
> lower directory but is a huge page entry, pXd_leaf() is true.
> 
> 
>>>>>
>>>>> On systems without hugepd entries, I guess ptdump skips all hugetlb entries.
>>>>> Sigh!
> 
> As far as I can see, ptdump_pXd_entry() handles the pXd_leaf() case.
> 
>>>>
>>>> IIUC, the idea of ptdump_walk_pgd() is to dump page tables even outside
>>>> VMAs (for debugging purposes?).
>>>>
>>>> I cannot convince myself that that's a good idea when only holding the
>>>> mmap lock in read mode, because we can just see page tables getting
>>>> freed concurrently e.g., during concurrent munmap() ... while holding
>>>> the mmap lock in read we may only walk inside VMA boundaries.
>>>>
>>>> That then raises the questions if we're only calling this on special MMs
>>>> (e.g., init_mm) whereby we cannot really see concurrent munmap() and
>>>> where we shouldn't have hugetlb mappings or hugepd entries.
> 
> At least on powerpc, PTDUMP handles only init_mm.
> 
> Hugepage are used at least on powerpc 8xx for linear memory mapping, see
> 
> commit 34536d780683 ("powerpc/8xx: Add a function to early map kernel
> via huge pages")
> commit cf209951fa7f ("powerpc/8xx: Map linear memory with huge pages")
> 
> hugepds may also be used in the future to use huge pages for vmap and
> vmalloc, see commit a6a8f7c4aa7e ("powerpc/8xx: add support for huge
> pages on VMAP and VMALLOC")
> 
> As far as I know, ppc64 also use huge pages for VMAP and VMALLOC, see
> 
> commit d909f9109c30 ("powerpc/64s/radix: Enable HAVE_ARCH_HUGE_VMAP")
> commit 8abddd968a30 ("powerpc/64s/radix: Enable huge vmalloc mappings")

There is a difference between an ordinary huge mapping (e.g., as used 
for THP) and a a hugetlb mapping.

Our current understanding is that hugepd only applies to hugetlb. 
Wouldn't vmap/vmalloc user ordinary huge pmd entries instead of hugepd?

-- 
Thanks,

David / dhildenb

