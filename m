Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B57762102
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 20:07:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XDJKnAna;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HzQhJ0em;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9Q3S6GHCz3cQL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 04:07:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XDJKnAna;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HzQhJ0em;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9Q2K4yyMz3cTq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 04:06:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690308374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VyRd3M8p7RXXamr68HvIAH9l9kBVFDDur1Wgkf6GWSc=;
	b=XDJKnAnaXVKUTNGyGUGt5BfOgC2ohd/7q7FhHvL/ULMBHBWt3rAFREfEpEXA9CUPzBdAY/
	vwSNttcskQai/eJhFnvUSImnFW2ZppRRfF/BKb8OEOTN2bd2CEUOHPm7+XFG27ykqkq2WE
	laTNXMSNFNI7v3jUdQpODDUgj0jGwZs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690308375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VyRd3M8p7RXXamr68HvIAH9l9kBVFDDur1Wgkf6GWSc=;
	b=HzQhJ0emYyUnW2RocYwVbkJIuFOaVA6T7gi8Rqc8nlJylz4MqSrL7aMcu0xnTH1bpBfGa2
	d3HxJkGBCVVfsk5sFFclOt18gaL2sUYZ4NUjIoPQ85h/c5FRMvQghyG43LzcJ/gFUp73WQ
	h5adr/pjo0DYlm3BTfHKiJS2fB5I3no=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-5kCqBol3OHy7W8xVEtwTDw-1; Tue, 25 Jul 2023 14:06:13 -0400
X-MC-Unique: 5kCqBol3OHy7W8xVEtwTDw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3fbdf341934so34166485e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 11:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690308372; x=1690913172;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VyRd3M8p7RXXamr68HvIAH9l9kBVFDDur1Wgkf6GWSc=;
        b=KYNizbdmZVdIco2zHLnXe543pB4Ho6ZtwVd7XifuJzGuW5vTb6EeVCL+YlItEVVita
         ktZN16YgZB6S0Ryy74S1cU0MWSfC/98nvTr6pQ7tl67IrUKh2RDDVOYkqyOLH5t27ONs
         4vI0aYmxbSEeEf+5QscO3Q3KBl6RRClzKiENrMwTHEChCpuzD2avW3/hXg3OCBbRhOaV
         0Zw8Btm5dGxurM89UAz22k0QHUEMPaWR9wmJOhxsLfQaD/er+xMvmgwcoyiTcQv+Nalh
         0+yDY0aA9pAxOdfIEgJ0P537neOIRLwkxLGflL49e188247v62m3PIayoUwQtWZLc5j+
         8g/g==
X-Gm-Message-State: ABy/qLYS2GXzqxhHGxuhLDGyGn2GZ3NzawRgRgiK34EqBp0qcES1tNan
	cBe0Y9kr9sygct0Tn7JF9+d5FeVWlBgRLAGVxVyvMMDv18BYzOvo3vSHy3sc0jnEkxfrbBRd4an
	HqFCibnelkvmM0/E6RnXYAd/PWw==
X-Received: by 2002:a7b:ce12:0:b0:3fc:25:ced6 with SMTP id m18-20020a7bce12000000b003fc0025ced6mr11324583wmc.13.1690308372260;
        Tue, 25 Jul 2023 11:06:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEfbMalZnC5jaLstg+fMvdW4Ua3uzmPfgZdS36IlfqNJbN2At02wxkl8lUBzKqR/39Zu56B+A==
X-Received: by 2002:a7b:ce12:0:b0:3fc:25:ced6 with SMTP id m18-20020a7bce12000000b003fc0025ced6mr11324558wmc.13.1690308371757;
        Tue, 25 Jul 2023 11:06:11 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73f:e900:3b0d:87a6:2953:20d1? (p200300cbc73fe9003b0d87a6295320d1.dip0.t-ipconnect.de. [2003:cb:c73f:e900:3b0d:87a6:2953:20d1])
        by smtp.gmail.com with ESMTPSA id n19-20020a7bc5d3000000b003fc02e8ea68sm16835585wmk.13.2023.07.25.11.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 11:06:11 -0700 (PDT)
Message-ID: <e1a4430e-d3ae-711b-7efa-5085934b62fd@redhat.com>
Date: Tue, 25 Jul 2023 20:06:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230725100212.531277-1-aneesh.kumar@linux.ibm.com>
 <20230725100212.531277-5-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v5 4/7] mm/hotplug: Support memmap_on_memory when memmap
 is not aligned to pageblocks
In-Reply-To: <20230725100212.531277-5-aneesh.kumar@linux.ibm.com>
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

On 25.07.23 12:02, Aneesh Kumar K.V wrote:
> Currently, memmap_on_memory feature is only supported with memory block
> sizes that result in vmemmap pages covering full page blocks. This is
> because memory onlining/offlining code requires applicable ranges to be
> pageblock-aligned, for example, to set the migratetypes properly.
> 
> This patch helps to lift that restriction by reserving more pages than
> required for vmemmap space. This helps the start address to be page
> block aligned with different memory block sizes. Using this facility
> implies the kernel will be reserving some pages for every memoryblock.
> This allows the memmap on memory feature to be widely useful with
> different memory block size values.
> 
> For ex: with 64K page size and 256MiB memory block size, we require 4
> pages to map vmemmap pages, To align things correctly we end up adding a
> reserve of 28 pages. ie, for every 4096 pages 28 pages get reserved.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   .../admin-guide/mm/memory-hotplug.rst         |  12 ++
>   mm/memory_hotplug.c                           | 121 ++++++++++++++++--
>   2 files changed, 119 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
> index bd77841041af..2994958c7ce8 100644
> --- a/Documentation/admin-guide/mm/memory-hotplug.rst
> +++ b/Documentation/admin-guide/mm/memory-hotplug.rst
> @@ -433,6 +433,18 @@ The following module parameters are currently defined:
>   				 memory in a way that huge pages in bigger
>   				 granularity cannot be formed on hotplugged
>   				 memory.
> +
> +				 With value "force" it could result in memory
> +				 wastage due to memmap size limitations. For
> +				 example, if the memmap for a memory block
> +				 requires 1 MiB, but the pageblock size is 2
> +				 MiB, 1 MiB of hotplugged memory will be wasted.
> +				 Note that there are still cases where the
> +				 feature cannot be enforced: for example, if the
> +				 memmap is smaller than a single page, or if the
> +				 architecture does not support the forced mode
> +				 in all configurations.
> +
>   ``online_policy``		 read-write: Set the basic policy used for
>   				 automatic zone selection when onlining memory
>   				 blocks without specifying a target zone.
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 457824a6ecb8..5b472e137898 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -41,17 +41,89 @@
>   #include "internal.h"
>   #include "shuffle.h"
>   
> +enum {
> +	MEMMAP_ON_MEMORY_DISABLE = 0,
> +	MEMMAP_ON_MEMORY_ENABLE,
> +	MEMMAP_ON_MEMORY_FORCE,
> +};
> +
> +static int memmap_mode __read_mostly = MEMMAP_ON_MEMORY_DISABLE;
> +
> +static inline unsigned long memory_block_memmap_pages(void)
> +{
> +	unsigned long memmap_size;
> +
> +	memmap_size = PHYS_PFN(memory_block_size_bytes()) * sizeof(struct page);
> +	return memmap_size >> PAGE_SHIFT;

I'd really move a !page variant (memory_block_memmap_size()) to the 
previous patch and use it in mhp_supports_memmap_on_memory() and 
arch_supports_memmap_on_memory().

Then, in this patch, reuse that function in 
memory_block_memmap_on_memory_pages() and ...

> +}
> +
> +static inline unsigned long memory_block_memmap_on_memory_pages(void)
> +{
> +	unsigned long nr_pages = memory_block_memmap_pages();

... do here a

nr_pages = PHYS_PFN(memory_block_memmap_size());


Conceptually, it would be even cleaner to have here

nr_pages = PFN_UP(memory_block_memmap_size());

even though one can argue that mhp_supports_memmap_on_memory() will make 
sure that the unaligned value (memory_block_memmap_size()) covers full 
pages, but at least to me it looks cleaner that way. No strong opinion.


> +
> +	/*
> +	 * In "forced" memmap_on_memory mode, we add extra pages to align the
> +	 * vmemmap size to cover full pageblocks. That way, we can add memory
> +	 * even if the vmemmap size is not properly aligned, however, we might waste
> +	 * memory.
> +	 */
> +	if (memmap_mode == MEMMAP_ON_MEMORY_FORCE)
> +		return pageblock_align(nr_pages);
> +	return nr_pages;
> +}
> +
>   #ifdef CONFIG_MHP_MEMMAP_ON_MEMORY
>   /*
>    * memory_hotplug.memmap_on_memory parameter
>    */
> -static bool memmap_on_memory __ro_after_init;
> -module_param(memmap_on_memory, bool, 0444);
> -MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hotplug");
> +static int set_memmap_mode(const char *val, const struct kernel_param *kp)
> +{
> +	int ret, mode;
> +	bool enabled;
> +
> +	if (sysfs_streq(val, "force") ||  sysfs_streq(val, "FORCE")) {
> +		mode =  MEMMAP_ON_MEMORY_FORCE;
> +		goto matched;
> +	}

Avoid the goto + label

} else {
	ret = kstrtobool(val, &enabled);
	...
}

*((int *)kp->arg) =  mode;

> +
> +	ret = kstrtobool(val, &enabled);
> +	if (ret < 0)
> +		return ret;
> +	if (enabled)
> +		mode =  MEMMAP_ON_MEMORY_ENABLE;
> +	else
> +		mode =  MEMMAP_ON_MEMORY_DISABLE;
> +
> +matched:
> +	*((int *)kp->arg) =  mode;
> +	if (mode == MEMMAP_ON_MEMORY_FORCE) {
> +		unsigned long memmap_pages = memory_block_memmap_on_memory_pages();
> +
> +		pr_info("Memory hotplug will reserve %ld pages in each memory block\n",
> +			memmap_pages - memory_block_memmap_pages());

pr_info_once() ?

> +	}
> +	return 0;
> +}
> +

[...]

>   	/*
>   	 * Besides having arch support and the feature enabled at runtime, we
> @@ -1294,10 +1366,28 @@ static bool mhp_supports_memmap_on_memory(unsigned long size)
>   	 *       altmap as an alternative source of memory, and we do not exactly
>   	 *       populate a single PMD.
>   	 */
> -	return mhp_memmap_on_memory() &&
> -	       size == memory_block_size_bytes() &&
> -	       IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT)) &&
> -	       arch_supports_memmap_on_memory(size);
> +	if (!mhp_memmap_on_memory() || size != memory_block_size_bytes())
> +		return false;
> +
> +	/*
> +	 * Make sure the vmemmap allocation is fully contained
> +	 * so that we always allocate vmemmap memory from altmap area.
> +	 */
> +	if (!IS_ALIGNED(vmemmap_size, PAGE_SIZE))
> +		return false;
> +
> +	/*
> +	 * start pfn should be pageblock_nr_pages aligned for correctly
> +	 * setting migrate types
> +	 */
> +	if (!pageblock_aligned(memmap_pages))
> +		return false;
> +
> +	if (memmap_pages == PHYS_PFN(memory_block_size_bytes()))
> +		/* No effective hotplugged memory doesn't make sense. */
> +		return false;
> +
> +	return arch_supports_memmap_on_memory(size);
>   }
>   
>   /*
> @@ -1310,7 +1400,10 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>   {
>   	struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
>   	enum memblock_flags memblock_flags = MEMBLOCK_NONE;
> -	struct vmem_altmap mhp_altmap = {};
> +	struct vmem_altmap mhp_altmap = {
> +		.base_pfn =  PHYS_PFN(res->start),
> +		.end_pfn  =  PHYS_PFN(res->end),

Is it required to set .end_pfn, and if so, shouldn't we also set it to 
base_pfn + memory_block_memmap_on_memory_pages()) ?

We also don't set it on the try_remove_memory() part,.



With these things addressed, feel free to add

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

