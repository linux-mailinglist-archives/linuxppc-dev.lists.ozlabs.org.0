Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA04C74981E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 11:19:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XeK+OYXp;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XeK+OYXp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxWFl61ZKz2ygr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 19:19:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XeK+OYXp;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XeK+OYXp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxWDp6Yvkz2ygr
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 19:19:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688635143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RPebE8QWnPzwlWbjblsdxk7DEkuF3S+UJHZ3Izk2Tco=;
	b=XeK+OYXpdVG9FUewgn5J1DTDuYRIsIhCSXLM0kFIAi6IvrgB4rkvPt5oWlINt5y+Pupv6k
	ovztRhY9asVcx//NdtaO278JOq0Whkeg+Asp4h0PYMPuZNuo5/NKAfg7nHRgDq3Mcl/w/q
	TeMQT39LKyo3fdfJF3fW8SV1ex+CZB4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688635143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RPebE8QWnPzwlWbjblsdxk7DEkuF3S+UJHZ3Izk2Tco=;
	b=XeK+OYXpdVG9FUewgn5J1DTDuYRIsIhCSXLM0kFIAi6IvrgB4rkvPt5oWlINt5y+Pupv6k
	ovztRhY9asVcx//NdtaO278JOq0Whkeg+Asp4h0PYMPuZNuo5/NKAfg7nHRgDq3Mcl/w/q
	TeMQT39LKyo3fdfJF3fW8SV1ex+CZB4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-8sQSpGZ6OeuQgLiTHzlvqA-1; Thu, 06 Jul 2023 05:19:01 -0400
X-MC-Unique: 8sQSpGZ6OeuQgLiTHzlvqA-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4fb7b4be07bso444217e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 02:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688635140; x=1691227140;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPebE8QWnPzwlWbjblsdxk7DEkuF3S+UJHZ3Izk2Tco=;
        b=A5RXAHFS4zM7Xf2mc/pJxGJslhtyPBV4w+xlLh3XhG512+eStWLV+HqyMvuIk93MN0
         UyfHF7P3xXYdO6C1Hfm3p0jrUYIbo/nqHjuQL0XrCY2oUPIQK6o6pqVVJBDh8NZrnBB8
         /gW3dj1GfKpms1tk/9EhaIAro5zwV0bWOwe33KdCQZNxw2lSXQfTAOoI43Sw2d7gLXmq
         /p54AHBkQ1nVRae1yvXE2zvmRib9TDHZsXmqG3jV89Xwm4BUKq/ehTdklygbBagl8/Nu
         3aqf9Lr4caJu6/7Fpaug7+qHMckPH3MaUW9N96t5q8Pscd4WKW5vUXgY43wSRtTxpJuu
         uEDg==
X-Gm-Message-State: ABy/qLZ5Yk8VqnDReYwbG6ye+O77Udj/3pSpfhXNELHvo7oJwBzEICYI
	LJNie2GKzxOsF8++0n53O3hN+dqmA6nD3sEnYbdPqK33Fh2YTDSKOIMrRnL78lVpQQ7Bx1JSjvO
	LbXXbSGL3TEeDilnYABaxFIHX5Q==
X-Received: by 2002:a19:5f1c:0:b0:4f8:67aa:4f03 with SMTP id t28-20020a195f1c000000b004f867aa4f03mr1059293lfb.1.1688635140394;
        Thu, 06 Jul 2023 02:19:00 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFCniOQLT9lvwUgCkA8BLQRCj3UZt9TtN428IpglPeLw3ODUKsTJ4WV8Tyv+ejt6GaRMR7aiw==
X-Received: by 2002:a19:5f1c:0:b0:4f8:67aa:4f03 with SMTP id t28-20020a195f1c000000b004f867aa4f03mr1059284lfb.1.1688635140041;
        Thu, 06 Jul 2023 02:19:00 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id r13-20020a05600c458d00b003fa9a00d74csm5350128wmo.3.2023.07.06.02.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 02:18:59 -0700 (PDT)
Message-ID: <72488b8a-8f1e-c652-ab48-47e38290441f@redhat.com>
Date: Thu, 6 Jul 2023 11:18:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230706085041.826340-1-aneesh.kumar@linux.ibm.com>
 <20230706085041.826340-2-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 1/5] mm/hotplug: Embed vmem_altmap details in memory
 block
In-Reply-To: <20230706085041.826340-2-aneesh.kumar@linux.ibm.com>
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

On 06.07.23 10:50, Aneesh Kumar K.V wrote:
> With memmap on memory, some architecture needs more details w.r.t altmap
> such as base_pfn, end_pfn, etc to unmap vmemmap memory.

Can you elaborate why ppc64 needs that and x86-64 + aarch64 don't?

IOW, why can't ppc64 simply allocate the vmemmap from the start of the 
memblock (-> base_pfn) and use the stored number of vmemmap pages to 
calculate the end_pfn?

To rephrase: if the vmemmap is not at the beginning and doesn't cover 
full apgeblocks, memory onlining/offlining would be broken.

[...]

>   
> +/**
> + * struct vmem_altmap - pre-allocated storage for vmemmap_populate
> + * @base_pfn: base of the entire dev_pagemap mapping
> + * @reserve: pages mapped, but reserved for driver use (relative to @base)
> + * @free: free pages set aside in the mapping for memmap storage
> + * @align: pages reserved to meet allocation alignments
> + * @alloc: track pages consumed, private to vmemmap_populate()
> + */
> +struct vmem_altmap {
> +	unsigned long base_pfn;
> +	const unsigned long end_pfn;
> +	const unsigned long reserve;
> +	unsigned long free;
> +	unsigned long align;
> +	unsigned long alloc;
> +};

Instead of embedding that, what about conditionally allocating it and 
store a pointer to it in the "struct memory_block"?

In the general case as of today, we don't have an altmap.

> +
>   struct memory_block {
>   	unsigned long start_section_nr;
>   	unsigned long state;		/* serialized by the dev->lock */
> @@ -77,11 +94,7 @@ struct memory_block {
>   	 */
>   	struct zone *zone;
>   	struct device dev;
> -	/*
> -	 * Number of vmemmap pages. These pages
> -	 * lay at the beginning of the memory block.
> -	 */
> -	unsigned long nr_vmemmap_pages;
> +	struct vmem_altmap altmap;
>   	struct memory_group *group;	/* group (if any) for this block */
>   	struct list_head group_next;	/* next block inside memory group */
>   #if defined(CONFIG_MEMORY_FAILURE) && defined(CONFIG_MEMORY_HOTPLUG)
> @@ -147,7 +160,7 @@ static inline int hotplug_memory_notifier(notifier_fn_t fn, int pri)
>   extern int register_memory_notifier(struct notifier_block *nb);
>   extern void unregister_memory_notifier(struct notifier_block *nb);
>   int create_memory_block_devices(unsigned long start, unsigned long size,

[...]

>   static int check_cpu_on_node(int nid)
> @@ -2036,9 +2042,8 @@ EXPORT_SYMBOL(try_offline_node);
>   
>   static int __ref try_remove_memory(u64 start, u64 size)
>   {
> -	struct vmem_altmap mhp_altmap = {};
> +	int ret;
>   	struct vmem_altmap *altmap = NULL;
> -	unsigned long nr_vmemmap_pages;
>   	int rc = 0, nid = NUMA_NO_NODE;
>   
>   	BUG_ON(check_hotplug_memory_range(start, size));
> @@ -2060,24 +2065,16 @@ static int __ref try_remove_memory(u64 start, u64 size)
>   	 * We only support removing memory added with MHP_MEMMAP_ON_MEMORY in
>   	 * the same granularity it was added - a single memory block.
>   	 */
> +

^ unrealted change?

-- 
Cheers,

David / dhildenb

