Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAE1945B74
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 11:49:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wb1Jx1rhqz3fnj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 19:49:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wb1JX25fjz3d96
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 19:49:29 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wb1G048mKz6K610;
	Fri,  2 Aug 2024 17:47:20 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 129BE140A08;
	Fri,  2 Aug 2024 17:49:24 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 2 Aug
 2024 10:49:23 +0100
Date: Fri, 2 Aug 2024 10:49:22 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v3 07/26] mm: drop CONFIG_HAVE_ARCH_NODEDATA_EXTENSION
Message-ID: <20240802104922.000051a0@Huawei.com>
In-Reply-To: <20240801060826.559858-8-rppt@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
	<20240801060826.559858-8-rppt@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Vasily Gorbik <gor@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav
 Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu,  1 Aug 2024 09:08:07 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> There are no users of HAVE_ARCH_NODEDATA_EXTENSION left, so
> arch_alloc_nodedata() and arch_refresh_nodedata() are not needed
> anymore.
> 
> Replace the call to arch_alloc_nodedata() in free_area_init() with
> memblock_alloc(), remove arch_refresh_nodedata() and cleanup
> include/linux/memory_hotplug.h from the associated ifdefery.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64

Hi Mike, 

This has an accidental (I assume) functional change and if
you have an initially offline node it all goes wrong.


> ---
>  include/linux/memory_hotplug.h | 48 ----------------------------------
>  mm/mm_init.c                   |  3 +--
>  2 files changed, 1 insertion(+), 50 deletions(-)
> 
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index ebe876930e78..b27ddce5d324 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -16,54 +16,6 @@ struct resource;
>  struct vmem_altmap;
>  struct dev_pagemap;
>  
> -#ifdef CONFIG_HAVE_ARCH_NODEDATA_EXTENSION
> -/*
> - * For supporting node-hotadd, we have to allocate a new pgdat.
> - *
> - * If an arch has generic style NODE_DATA(),
> - * node_data[nid] = kzalloc() works well. But it depends on the architecture.
> - *
> - * In general, generic_alloc_nodedata() is used.
> - *
> - */
> -extern pg_data_t *arch_alloc_nodedata(int nid);
> -extern void arch_refresh_nodedata(int nid, pg_data_t *pgdat);
> -
> -#else /* CONFIG_HAVE_ARCH_NODEDATA_EXTENSION */
> -
> -#define arch_alloc_nodedata(nid)	generic_alloc_nodedata(nid)
> -
> -#ifdef CONFIG_NUMA
> -/*
> - * XXX: node aware allocation can't work well to get new node's memory at this time.
> - *	Because, pgdat for the new node is not allocated/initialized yet itself.
> - *	To use new node's memory, more consideration will be necessary.
> - */
> -#define generic_alloc_nodedata(nid)				\
> -({								\
> -	memblock_alloc(sizeof(*pgdat), SMP_CACHE_BYTES);	\
> -})
> -
> -extern pg_data_t *node_data[];
> -static inline void arch_refresh_nodedata(int nid, pg_data_t *pgdat)
> -{
> -	node_data[nid] = pgdat;
> -}
> -
> -#else /* !CONFIG_NUMA */
> -
> -/* never called */
> -static inline pg_data_t *generic_alloc_nodedata(int nid)
> -{
> -	BUG();
> -	return NULL;
> -}
> -static inline void arch_refresh_nodedata(int nid, pg_data_t *pgdat)
> -{
> -}
> -#endif /* CONFIG_NUMA */
> -#endif /* CONFIG_HAVE_ARCH_NODEDATA_EXTENSION */
> -
>  #ifdef CONFIG_MEMORY_HOTPLUG
>  struct page *pfn_to_online_page(unsigned long pfn);
>  
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 75c3bd42799b..bcc2f2dd8021 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1838,11 +1838,10 @@ void __init free_area_init(unsigned long *max_zone_pfn)
>  
>  		if (!node_online(nid)) {
>  			/* Allocator not initialized yet */
> -			pgdat = arch_alloc_nodedata(nid);
> +			pgdat = memblock_alloc(sizeof(*pgdat), SMP_CACHE_BYTES);
>  			if (!pgdat)
>  				panic("Cannot allocate %zuB for node %d.\n",
>  				       sizeof(*pgdat), nid);
> -			arch_refresh_nodedata(nid, pgdat);

This allocates pgdat but never sets node_data[nid] to it
and promptly leaks it on the line below. 

Just to sanity check this I spun up a qemu machine with no memory
initially present on some nodes and it went boom as you'd expect.

I tested with addition of
			NODE_DATA(nid) = pgdat;
and it all seems to work as expected.

Jonathan



>  		}
>  
>  		pgdat = NODE_DATA(nid);


