Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3F19451F4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 19:48:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZbz71999z3fnP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 03:48:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZbyl4jTGz3cmk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 03:47:43 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WZbvg4GP6z6K91N;
	Fri,  2 Aug 2024 01:45:03 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id DD56C140B55;
	Fri,  2 Aug 2024 01:47:39 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 1 Aug
 2024 18:47:38 +0100
Date: Thu, 1 Aug 2024 18:47:38 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v3 06/26] MIPS: loongson64: drop
 HAVE_ARCH_NODEDATA_EXTENSION
Message-ID: <20240801184738.00003e6e@Huawei.com>
In-Reply-To: <20240801060826.559858-7-rppt@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
	<20240801060826.559858-7-rppt@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
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

On Thu,  1 Aug 2024 09:08:06 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Commit f8f9f21c7848 ("MIPS: Fix build error for loongson64 and
> sgi-ip27") added HAVE_ARCH_NODEDATA_EXTENSION to loongson64 to silence a
> compilation error that happened because loongson64 didn't define array
> of pg_data_t as node_data like most other architectures did.
> 
> After rename of __node_data to node_data arch_alloc_nodedata() and
> HAVE_ARCH_NODEDATA_EXTENSION can be dropped from loongson64.
> 
> Since it was the only user of HAVE_ARCH_NODEDATA_EXTENSION config option
> also remove this option from arch/mips/Kconfig.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

These are as you say now identical to the generic form, so
don't need a special version for any reason I can see.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


> ---
>  arch/mips/Kconfig           |  4 ----
>  arch/mips/loongson64/numa.c | 10 ----------
>  2 files changed, 14 deletions(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index ea5f3c3c31f6..43da6d596e2b 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -502,7 +502,6 @@ config MACH_LOONGSON64
>  	select USE_OF
>  	select BUILTIN_DTB
>  	select PCI_HOST_GENERIC
> -	select HAVE_ARCH_NODEDATA_EXTENSION if NUMA
>  	help
>  	  This enables the support of Loongson-2/3 family of machines.
>  
> @@ -2612,9 +2611,6 @@ config NUMA
>  config SYS_SUPPORTS_NUMA
>  	bool
>  
> -config HAVE_ARCH_NODEDATA_EXTENSION
> -	bool
> -
>  config RELOCATABLE
>  	bool "Relocatable kernel"
>  	depends on SYS_SUPPORTS_RELOCATABLE
> diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> index b50ce28d2741..64fcfaa885b6 100644
> --- a/arch/mips/loongson64/numa.c
> +++ b/arch/mips/loongson64/numa.c
> @@ -198,13 +198,3 @@ void __init prom_init_numa_memory(void)
>  	pr_info("CP0_PageGrain: CP0 5.1 (0x%x)\n", read_c0_pagegrain());
>  	prom_meminit();
>  }
> -
> -pg_data_t * __init arch_alloc_nodedata(int nid)
> -{
> -	return memblock_alloc(sizeof(pg_data_t), SMP_CACHE_BYTES);
> -}
> -
> -void arch_refresh_nodedata(int nid, pg_data_t *pgdat)
> -{
> -	node_data[nid] = pgdat;
> -}

