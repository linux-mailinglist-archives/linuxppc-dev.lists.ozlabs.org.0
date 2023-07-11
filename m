Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FB674F3F9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 17:45:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X3YH6vC9;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X3YH6vC9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0lZd33Wnz3bsS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 01:45:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X3YH6vC9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X3YH6vC9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0lYm24C5z2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 01:44:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689090297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTkg9s0iWcbfFgL9SSLNDg8Sjekn535Q+HAoBWAYbEM=;
	b=X3YH6vC90akqJoPRc6xa1pdp9ZQH8HpjN538iwMVjVJlpGc+KfMmB7ihAslQseZq6e+sSj
	KNfCI+/6DkyDhD6H2sr05wAXjwQZpPbUtBNLd5qTbtilETkSM0B5BMwlOKVlMc8apDvggn
	U6FCDWGuBjc0UKFrfyxjMeDKyUhOELs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689090297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTkg9s0iWcbfFgL9SSLNDg8Sjekn535Q+HAoBWAYbEM=;
	b=X3YH6vC90akqJoPRc6xa1pdp9ZQH8HpjN538iwMVjVJlpGc+KfMmB7ihAslQseZq6e+sSj
	KNfCI+/6DkyDhD6H2sr05wAXjwQZpPbUtBNLd5qTbtilETkSM0B5BMwlOKVlMc8apDvggn
	U6FCDWGuBjc0UKFrfyxjMeDKyUhOELs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-QERICbbdNPiWwUdsrZMJ-A-1; Tue, 11 Jul 2023 11:44:56 -0400
X-MC-Unique: QERICbbdNPiWwUdsrZMJ-A-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f5fa06debcso39544465e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 08:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689090294; x=1691682294;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTkg9s0iWcbfFgL9SSLNDg8Sjekn535Q+HAoBWAYbEM=;
        b=JL5bWvo081FeLwp/3UWtCZX5sv0aKiFbrkpMqBVulNArk6lUT/r17U1jcRiHFp0hTf
         D/8zzySuat4u6NlqyMprhdBfQ3y1DNvxp1jSPUBCwp2el16NU/H0Ju5Mlz61ctyICNL/
         lX4qQIa9RmNwWVgTefd3KgZZa6okoun5CD/WF9vbFul1ZjNTldsSFFoWth3cajYz6sxa
         QgU3EzpsqR7U1Eov6DZgP7BTeZUEsICnmiDaxvfcumLDBP+Ccki564PkXI4k4nKxXrMX
         nkacE2GK50usglQLdfJDTy1FZlZEbryKrQaMXC0TsAZAS16Sdwhkz4MTvAGze+xTdSzS
         E1MA==
X-Gm-Message-State: ABy/qLaXL8akZRHa6RP+9RASJmzxkjoXYhQVg43NE8DoRPcclRjQttG3
	pIBPRAn7f6+1MiaYfe+qTE2OpLKg2+ap58gF5hrvCTuEY3IwmN6s87WhI5Jir/KhQcFEGqxj/vE
	U+BiNNokqCo5+iFra15ZMroypFA==
X-Received: by 2002:a05:6000:545:b0:314:3344:72f6 with SMTP id b5-20020a056000054500b00314334472f6mr14650268wrf.32.1689090294482;
        Tue, 11 Jul 2023 08:44:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHFpPSfAiISpVurSJyI/hKeOFmPWL02N1P55IJ91jovnrrBjvuApbRDH1+rdxg2E2VoyCAKKA==
X-Received: by 2002:a05:6000:545:b0:314:3344:72f6 with SMTP id b5-20020a056000054500b00314334472f6mr14650250wrf.32.1689090294092;
        Tue, 11 Jul 2023 08:44:54 -0700 (PDT)
Received: from ?IPV6:2003:cb:c745:4000:13ad:ed64:37e6:115d? (p200300cbc745400013aded6437e6115d.dip0.t-ipconnect.de. [2003:cb:c745:4000:13ad:ed64:37e6:115d])
        by smtp.gmail.com with ESMTPSA id g23-20020a7bc4d7000000b003fc0505be19sm2844720wmk.37.2023.07.11.08.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 08:44:53 -0700 (PDT)
Message-ID: <f5c4970b-f829-2750-ad60-d0fe04ec93c9@redhat.com>
Date: Tue, 11 Jul 2023 17:44:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 5/7] powerpc/book3s64/memhotplug: Enable memmap on
 memory for radix
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
 <20230711044834.72809-6-aneesh.kumar@linux.ibm.com>
 <98285185-170f-10fb-67a7-09e35ab47650@redhat.com>
 <006e24f1-1261-1018-4125-02dd354da519@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <006e24f1-1261-1018-4125-02dd354da519@linux.ibm.com>
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11.07.23 17:40, Aneesh Kumar K V wrote:
> On 7/11/23 8:56 PM, David Hildenbrand wrote:
>> On 11.07.23 06:48, Aneesh Kumar K.V wrote:
>>> Radix vmemmap mapping can map things correctly at the PMD level or PTE
>>> level based on different device boundary checks. Hence we skip the
>>> restrictions w.r.t vmemmap size to be multiple of PMD_SIZE. This also
>>> makes the feature widely useful because to use PMD_SIZE vmemmap area we
>>> require a memory block size of 2GiB
>>>
>>> We can also use MHP_RESERVE_PAGES_MEMMAP_ON_MEMORY to that the feature
>>> can work with a memory block size of 256MB. Using altmap.reserve feature
>>> to align things correctly at pageblock granularity. We can end up
>>> losing some pages in memory with this. For ex: with a 256MiB memory block
>>> size, we require 4 pages to map vmemmap pages, In order to align things
>>> correctly we end up adding a reserve of 28 pages. ie, for every 4096
>>> pages 28 pages get reserved.
>>>
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ---
>>>    arch/powerpc/Kconfig                          |  1 +
>>>    arch/powerpc/include/asm/pgtable.h            | 28 +++++++++++++++++++
>>>    .../platforms/pseries/hotplug-memory.c        |  3 +-
>>>    mm/memory_hotplug.c                           |  2 ++
>>>    4 files changed, 33 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index 116d6add0bb0..f890907e5bbf 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -157,6 +157,7 @@ config PPC
>>>        select ARCH_HAS_UBSAN_SANITIZE_ALL
>>>        select ARCH_HAVE_NMI_SAFE_CMPXCHG
>>>        select ARCH_KEEP_MEMBLOCK
>>> +    select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE    if PPC_RADIX_MMU
>>>        select ARCH_MIGHT_HAVE_PC_PARPORT
>>>        select ARCH_MIGHT_HAVE_PC_SERIO
>>>        select ARCH_OPTIONAL_KERNEL_RWX        if ARCH_HAS_STRICT_KERNEL_RWX
>>> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
>>> index 68817ea7f994..8e6c92dde6ad 100644
>>> --- a/arch/powerpc/include/asm/pgtable.h
>>> +++ b/arch/powerpc/include/asm/pgtable.h
>>> @@ -169,6 +169,34 @@ static inline bool is_ioremap_addr(const void *x)
>>>    int __meminit vmemmap_populated(unsigned long vmemmap_addr, int vmemmap_map_size);
>>>    bool altmap_cross_boundary(struct vmem_altmap *altmap, unsigned long start,
>>>                   unsigned long page_size);
>>> +/*
>>> + * mm/memory_hotplug.c:mhp_supports_memmap_on_memory goes into details
>>> + * some of the restrictions. We don't check for PMD_SIZE because our
>>> + * vmemmap allocation code can fallback correctly. The pageblock
>>> + * alignment requirement is met using altmap->reserve blocks.
>>> + */
>>> +#define arch_supports_memmap_on_memory arch_supports_memmap_on_memory
>>> +static inline bool arch_supports_memmap_on_memory(unsigned long size)
>>> +{
>>> +    unsigned long nr_pages = size >> PAGE_SHIFT;
>>> +    unsigned long vmemmap_size = nr_pages * sizeof(struct page);
>>> +
>>> +    if (!radix_enabled())
>>> +        return false;
>>> +
>>> +#ifdef CONFIG_PPC_4K_PAGES
>>> +    return IS_ALIGNED(vmemmap_size, PMD_SIZE);
>>> +#else
>>> +    /*
>>> +     * Make sure the vmemmap allocation is fully contianed
>>> +     * so that we always allocate vmemmap memory from altmap area.
>>> +     * The pageblock alignment requirement is met by using
>>> +     * reserve blocks in altmap.
>>> +     */
>>> +    return IS_ALIGNED(vmemmap_size,  PAGE_SIZE);
>>
>> Can we move that check into common code as well?
>>
>> If our (original) vmemmap size would not fit into a single page, we would be in trouble on any architecture. Did not check if it would be an issue for arm64 as well in case we would allow eventually wasting memory.
>>
> 
> 
> For x86 and arm we already do IS_ALIGNED(vmemmap_size, PMD_SIZE); in arch_supports_memmap_on_memory(). That should imply PAGE_SIZE alignment.
> If arm64 allow the usage of altmap.reserve, I would expect the arch_supports_memmap_on_memory to have the PAGE_SIZE check.
> 
> Adding the PAGE_SIZE check in  mhp_supports_memmap_on_memory() makes it redundant check for x86 and arm currently?

IMHO not an issue. The common code check is a bit weaker and the arch 
check a bit stronger.

> 
> modified   mm/memory_hotplug.c
> @@ -1293,6 +1293,13 @@ static bool mhp_supports_memmap_on_memory(unsigned long size)
>   	 */
>   	if (!mhp_memmap_on_memory() || size != memory_block_size_bytes())
>   		return false;
> +
> +	/*
> +	 * Make sure the vmemmap allocation is fully contianed

s/contianed/contained/

> +	 * so that we always allocate vmemmap memory from altmap area.

In theory, it's not only the vmemmap size, but also the vmemmap start 
(that it doesn't start somewhere in between a page, crossing a page). I 
suspect the start is always guaranteed to be aligned (of the vmemmap 
size is aligned), correct?

> +	 */
> +	if (!IS_ALIGNED(vmemmap_size,  PAGE_SIZE))
> +		return false;
>   	 /*
>   	  * Without page reservation remaining pages should be pageblock aligned.
>   	  */
> 
> 

-- 
Cheers,

David / dhildenb

