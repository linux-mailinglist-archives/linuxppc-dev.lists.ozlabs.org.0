Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B8475F9FC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 16:35:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JSezAyhE;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eHQGc7jO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8jPy5Bdzz30Yb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 00:35:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JSezAyhE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eHQGc7jO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8jP337Fyz2yDF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:35:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690209300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cv1BGKEgPfA0f21ZhgeV0Mg+YALdKw9yFeoZhStnjTA=;
	b=JSezAyhEoY9E1MhOm8JYZS3sJXAb+81I6FB1JCOGcCpU+plcQAhdWBVhRj3McK6sXitCPj
	rttP1gmdaXvxN4HDFYhIw7aLDAuWR0iDO2FP2LjqKG8f47BS6Y8Ao0v7qIzqmuWrtjMA0y
	vT5YxqHGoChTa1AFInxime5Xd+O1F7I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690209301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cv1BGKEgPfA0f21ZhgeV0Mg+YALdKw9yFeoZhStnjTA=;
	b=eHQGc7jO+aBdHKL+V176Kwo2kmYKqn8/9TKyraNVKztkVDWIH44LODZk+GJ+I2nDWIFAbo
	VGlM6ZydGhjNDUwtQE2+ukpxEQNltCwGZz0NdcUGTWT+boloFi1RwiA/POy/k1ie0oq5zz
	u8oEOmNUQKSNuBUxkdCaul/hqnwELRs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-1hOqymozPu-ln_pY1ZxOBw-1; Mon, 24 Jul 2023 10:34:59 -0400
X-MC-Unique: 1hOqymozPu-ln_pY1ZxOBw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3fd2e59bc53so8787875e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 07:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690209298; x=1690814098;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cv1BGKEgPfA0f21ZhgeV0Mg+YALdKw9yFeoZhStnjTA=;
        b=CJ3R+RZAuGUcBTY03u5fYThH0vrZXZ4Rf5I0BcEDqJcgBjZfyIAr8o6t2pGSFHZlm8
         une00A7HiH2i7daJkG189cWvW3hkJCQUKpIZAJmIrLC/h0Qhumfmnjf6ztBsWSU1/F5z
         FhOOBqILC1FURSJwRmishtxHB7Fuf2asNEGs2BTFmDfK7A8uFUczWADWGUzGemBs/cTB
         hiRLM9fyfb1pw6gkw1q5CQ/8ur539xOzuvQcUpo1EkU9o0rbFCbVogPs8TOT1w8yycK8
         79MMc4YvVcH6eeHX0Bdn5Tu8QgDWv7XA8eydHcCADaG5q8dnGIdjWwYKsrY1Cas2vaa5
         gVyA==
X-Gm-Message-State: ABy/qLaHEcbNzErlw1jOHqrjFFCI7MhI9i1qLUcjGqrOhrr0wcJvGV/q
	7vUBpY0RmifkRQp6PLupZbAgbR/PWFnL/OCH4GNT3ACEFlBdQaeMLEB9+y97eW6MixAPpKj8qHb
	BH/nD1HP/fuPhe7cozpDlcfNVdg==
X-Received: by 2002:a05:600c:220d:b0:3f8:f6fe:26bf with SMTP id z13-20020a05600c220d00b003f8f6fe26bfmr5994142wml.12.1690209297853;
        Mon, 24 Jul 2023 07:34:57 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEK+6UVxrOXzI9dzV9dWjdpAkLQ8U1H2g0L4PcZh4lTRXibDfQksnRU4A0Vjft2TQ/8SaDckQ==
X-Received: by 2002:a05:600c:220d:b0:3f8:f6fe:26bf with SMTP id z13-20020a05600c220d00b003f8f6fe26bfmr5994130wml.12.1690209297466;
        Mon, 24 Jul 2023 07:34:57 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73d:bb00:91a5:d1c:3a7e:4c77? (p200300cbc73dbb0091a50d1c3a7e4c77.dip0.t-ipconnect.de. [2003:cb:c73d:bb00:91a5:d1c:3a7e:4c77])
        by smtp.gmail.com with ESMTPSA id x21-20020a05600c21d500b003fb41491670sm13113901wmj.24.2023.07.24.07.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 07:34:57 -0700 (PDT)
Message-ID: <7d3a0d68-1d65-a34a-c6c7-80234face7ce@redhat.com>
Date: Mon, 24 Jul 2023 16:34:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 5/6] powerpc/book3s64/memhotplug: Enable memmap on
 memory for radix
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230718024409.95742-1-aneesh.kumar@linux.ibm.com>
 <20230718024409.95742-6-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230718024409.95742-6-aneesh.kumar@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 18.07.23 04:44, Aneesh Kumar K.V wrote:
> Radix vmemmap mapping can map things correctly at the PMD level or PTE
> level based on different device boundary checks. Hence we skip the
> restrictions w.r.t vmemmap size to be multiple of PMD_SIZE. This also
> makes the feature widely useful because to use PMD_SIZE vmemmap area we
> require a memory block size of 2GiB
> 
> We can also use MHP_RESERVE_PAGES_MEMMAP_ON_MEMORY to that the feature
> can work with a memory block size of 256MB. Using altmap.reserve feature
> to align things correctly at pageblock granularity. We can end up
> losing some pages in memory with this. For ex: with a 256MiB memory block
> size, we require 4 pages to map vmemmap pages, In order to align things
> correctly we end up adding a reserve of 28 pages. ie, for every 4096
> pages 28 pages get reserved.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   arch/powerpc/Kconfig                          |  1 +
>   arch/powerpc/include/asm/pgtable.h            | 24 +++++++++++++++++++
>   .../platforms/pseries/hotplug-memory.c        |  3 ++-
>   mm/memory_hotplug.c                           |  2 ++
>   4 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 116d6add0bb0..f890907e5bbf 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -157,6 +157,7 @@ config PPC
>   	select ARCH_HAS_UBSAN_SANITIZE_ALL
>   	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>   	select ARCH_KEEP_MEMBLOCK
> +	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if PPC_RADIX_MMU
>   	select ARCH_MIGHT_HAVE_PC_PARPORT
>   	select ARCH_MIGHT_HAVE_PC_SERIO
>   	select ARCH_OPTIONAL_KERNEL_RWX		if ARCH_HAS_STRICT_KERNEL_RWX
> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
> index 68817ea7f994..3d35371395a9 100644
> --- a/arch/powerpc/include/asm/pgtable.h
> +++ b/arch/powerpc/include/asm/pgtable.h
> @@ -169,6 +169,30 @@ static inline bool is_ioremap_addr(const void *x)
>   int __meminit vmemmap_populated(unsigned long vmemmap_addr, int vmemmap_map_size);
>   bool altmap_cross_boundary(struct vmem_altmap *altmap, unsigned long start,
>   			   unsigned long page_size);
> +/*
> + * mm/memory_hotplug.c:mhp_supports_memmap_on_memory goes into details
> + * some of the restrictions. We don't check for PMD_SIZE because our
> + * vmemmap allocation code can fallback correctly. The pageblock
> + * alignment requirement is met using altmap->reserve blocks.
> + */
> +#define arch_supports_memmap_on_memory arch_supports_memmap_on_memory
> +static inline bool arch_supports_memmap_on_memory(unsigned long size)
> +{
> +	unsigned long nr_pages = size >> PAGE_SHIFT;
> +	unsigned long vmemmap_size = nr_pages * sizeof(struct page);
> +
> +	if (!radix_enabled())
> +		return false;
> +
> +	if (IS_ENABLED(CONFIG_PPC_4K_PAGES))
> +		return IS_ALIGNED(vmemmap_size, PMD_SIZE);

Can you add a comment why we care about that in the 4K case only?

> +	/*
> +	 * The pageblock alignment requirement is met by using
> +	 * reserve blocks in altmap.
> +	 */

Just drop that comment, that's handled by common code now.

> +	return true;
> +}
> +
>   #endif /* CONFIG_PPC64 */
>   
>   #endif /* __ASSEMBLY__ */
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index 9c62c2c3b3d0..1447509357a7 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -617,6 +617,7 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
>   
>   static int dlpar_add_lmb(struct drmem_lmb *lmb)
>   {
> +	mhp_t mhp_flags = MHP_NONE | MHP_MEMMAP_ON_MEMORY;
>   	unsigned long block_sz;
>   	int nid, rc;
>   
> @@ -637,7 +638,7 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>   		nid = first_online_node;
>   
>   	/* Add the memory */
> -	rc = __add_memory(nid, lmb->base_addr, block_sz, MHP_NONE);
> +	rc = __add_memory(nid, lmb->base_addr, block_sz, mhp_flags);
>   	if (rc) {
>   		invalidate_lmb_associativity_index(lmb);
>   		return rc;
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index c409f5ff6a59..6da063c80733 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -2174,6 +2174,8 @@ static int __ref try_remove_memory(u64 start, u64 size)
>   			 * right thing if we used vmem_altmap when hot-adding
>   			 * the range.
>   			 */
> +			mhp_altmap.base_pfn = PHYS_PFN(start);
> +			mhp_altmap.free = PHYS_PFN(size) - nr_vmemmap_pages;


That change does not belong into this patch.

>   			mhp_altmap.alloc = nr_vmemmap_pages;
>   			altmap = &mhp_altmap;
>   		}

-- 
Cheers,

David / dhildenb

