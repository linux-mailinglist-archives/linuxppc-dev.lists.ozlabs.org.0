Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B51F2933EC9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2024 16:43:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KnAhcoV/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KnAhcoV/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPJbD4mVnz3clx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 00:43:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KnAhcoV/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KnAhcoV/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPJZX5S3jz30Tv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 00:42:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721227376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=M2vL8rRc69gotddfUAFMWYk4nVzDmp9tj4adCdBDziU=;
	b=KnAhcoV/nrmH/vNi6zw7j1gfWPjlqpxQDxYgyLcQ2bQsH0b0qZC7WKEkMUgy1vGHN3kMYi
	T0/qOGrbOmwSgz0gQHSPbSFgV2X96gsfcf0KDQyIl4U7PXtJcIJt+7NeEeTxErkPSGgcGs
	wmUNL9ctheChx1/4+FTQOOV8dTqoDyA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721227376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=M2vL8rRc69gotddfUAFMWYk4nVzDmp9tj4adCdBDziU=;
	b=KnAhcoV/nrmH/vNi6zw7j1gfWPjlqpxQDxYgyLcQ2bQsH0b0qZC7WKEkMUgy1vGHN3kMYi
	T0/qOGrbOmwSgz0gQHSPbSFgV2X96gsfcf0KDQyIl4U7PXtJcIJt+7NeEeTxErkPSGgcGs
	wmUNL9ctheChx1/4+FTQOOV8dTqoDyA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-V8Js_PjkNUuixLIf73odFA-1; Wed, 17 Jul 2024 10:42:53 -0400
X-MC-Unique: V8Js_PjkNUuixLIf73odFA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a77c6ea022fso127096866b.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2024 07:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721227372; x=1721832172;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M2vL8rRc69gotddfUAFMWYk4nVzDmp9tj4adCdBDziU=;
        b=eI+xdJ+0crQaaSr8updpP5Nt2vpzShGvyreRZ/hEFYeoSVOSIrZm0Yby9g1EJqk5Jo
         cSYSd7YuXMnsedjKAN+LoVNXeQs5buYLutkznMYby3+/nygySrH218FipQDJ3INesQYl
         kC4tk2YqNq//L9X0m4oMWQh5yDb57F9PEQVCSWvUepgKTk9sUx3EX0Tg6dZqwXAz/1GL
         4QFwj+Fhg9n8MWscR90ZOQKeSU2w/LU+H5WG18MXxbGtqD47P6QQc2k4c3B2bdVrdNWK
         ZgN7m7ses29GmRoC3zLpI4XTBm/0DNerWDKot9WqGp7zZ+sxWRtsb+AdrwZUlrhkImx3
         zcOw==
X-Forwarded-Encrypted: i=1; AJvYcCXwSUUyHQFKh2u13KEAshV/amdnQK1EX9mD5CHmZ7XrGnUusskmDod0JGC0bBLCTvrOZ8IqfBIJDYGpAyvZ3MGWCh8CDAddvCE3BkE+Tw==
X-Gm-Message-State: AOJu0YxT7aCaE/e7LNIYgvVc05oc8MXP1fBPqdrkuJq3GGoSyWqcBmPG
	SoRNfqlzYhIl+Y9zkkjoJfAz3P3Uicyu/EbdOqDJhStlV8xz+ly/vi+zL0su6GuHLB0JigUONUx
	fvi3KmPGIaFvRKhhw7c6Wm64Pdx4CYk5ZVS20b+4B8kUIZIc6XG+iz1qRm+2Dn7s=
X-Received: by 2002:a17:906:1c0f:b0:a6f:46f1:5434 with SMTP id a640c23a62f3a-a79eda04168mr521686566b.6.1721227372352;
        Wed, 17 Jul 2024 07:42:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEi6DrDSqxxObcD+4KvqZEIVIf6XCAhrJ0LWIBdtNZjezxwhMU5bcwwGQ0tRJ1krbBOftaEqw==
X-Received: by 2002:a17:906:1c0f:b0:a6f:46f1:5434 with SMTP id a640c23a62f3a-a79eda04168mr521682366b.6.1721227371866;
        Wed, 17 Jul 2024 07:42:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c714:c00:b08b:a871:ce99:dfde? (p200300cbc7140c00b08ba871ce99dfde.dip0.t-ipconnect.de. [2003:cb:c714:c00:b08b:a871:ce99:dfde])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5d2018sm453924466b.85.2024.07.17.07.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 07:42:51 -0700 (PDT)
Message-ID: <220da8ed-337a-4b1e-badf-2bff1d36e6c3@redhat.com>
Date: Wed, 17 Jul 2024 16:42:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] arch, mm: pull out allocation of NODE_DATA to
 generic code
To: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-6-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240716111346.3676969-6-rppt@kernel.org>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16.07.24 13:13, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Architectures that support NUMA duplicate the code that allocates
> NODE_DATA on the node-local memory with slight variations in reporting
> of the addresses where the memory was allocated.
> 
> Use x86 version as the basis for the generic alloc_node_data() function
> and call this function in architecture specific numa initialization.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---

[...]

> diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> index 9208eaadf690..909f6cec3a26 100644
> --- a/arch/mips/loongson64/numa.c
> +++ b/arch/mips/loongson64/numa.c
> @@ -81,12 +81,8 @@ static void __init init_topology_matrix(void)
>   
>   static void __init node_mem_init(unsigned int node)
>   {
> -	struct pglist_data *nd;
>   	unsigned long node_addrspace_offset;
>   	unsigned long start_pfn, end_pfn;
> -	unsigned long nd_pa;
> -	int tnid;
> -	const size_t nd_size = roundup(sizeof(pg_data_t), SMP_CACHE_BYTES);

One interesting change is that we now always round up to full pages on 
architectures where we previously rounded up to SMP_CACHE_BYTES.

I assume we don't really expect a significant growth in memory 
consumption that we care about, especially because most systems with 
many nodes also have  quite some memory around.


> -/* Allocate NODE_DATA for a node on the local memory */
> -static void __init alloc_node_data(int nid)
> -{
> -	const size_t nd_size = roundup(sizeof(pg_data_t), PAGE_SIZE);
> -	u64 nd_pa;
> -	void *nd;
> -	int tnid;
> -
> -	/*
> -	 * Allocate node data.  Try node-local memory and then any node.
> -	 * Never allocate in DMA zone.
> -	 */
> -	nd_pa = memblock_phys_alloc_try_nid(nd_size, SMP_CACHE_BYTES, nid);
> -	if (!nd_pa) {
> -		pr_err("Cannot find %zu bytes in any node (initial node: %d)\n",
> -		       nd_size, nid);
> -		return;
> -	}
> -	nd = __va(nd_pa);
> -
> -	/* report and initialize */
> -	printk(KERN_INFO "NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,
> -	       nd_pa, nd_pa + nd_size - 1);
> -	tnid = early_pfn_to_nid(nd_pa >> PAGE_SHIFT);
> -	if (tnid != nid)
> -		printk(KERN_INFO "    NODE_DATA(%d) on node %d\n", nid, tnid);
> -
> -	node_data[nid] = nd;
> -	memset(NODE_DATA(nid), 0, sizeof(pg_data_t));
> -
> -	node_set_online(nid);
> -}
> -
>   /**
>    * numa_cleanup_meminfo - Cleanup a numa_meminfo
>    * @mi: numa_meminfo to clean up
> @@ -571,6 +538,7 @@ static int __init numa_register_memblks(struct numa_meminfo *mi)
>   			continue;
>   
>   		alloc_node_data(nid);
> +		node_set_online(nid);
>   	}

I can spot that we only remove a single node_set_online() call from x86.

What about all the other architectures? Will there be any change in 
behavior for them? Or do we simply set the nodes online later once more?

-- 
Cheers,

David / dhildenb

