Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E58B94802C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2024 19:18:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z7q/lW63;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wd37075GPz3cgd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 03:18:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z7q/lW63;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wd36K0mrdz3cLl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2024 03:17:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0CBA960C67;
	Mon,  5 Aug 2024 17:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A951C32782;
	Mon,  5 Aug 2024 17:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722878259;
	bh=xUiHKiiFB+eGRf4/0vdH6U+v/YkOQHoLKaT521lWFxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z7q/lW639aowtINXwVebTG+OLoxrXof+zBNSeR/8WY86B+624ZIuqcPJ12uz6WAq3
	 TOktvjQuFO3Psh/zSZk6bupzno8UjNgzGdjWYsGzuDHPa53tI5UwJrFUIiEWAMkla2
	 aZhopzXWwqHlnm+KETHsoZ8cxcOCV/ES/RMeaNClV0U/lI74zaSa7QLz8oGGmPM5b+
	 WVRXAQQqToAOAcGGygHFeY2KPxgU/pB39IDAe0i7d4FyqehFfReXcy3JQ8TWWNvwl/
	 YnEvZ6i15oUR+XxxozKV+u9zlrKVedpz+W1ReJtnBjYdPuNzzekfqSWqwV+cKpPHX5
	 XzWc8YkjVKQSQ==
Date: Mon, 5 Aug 2024 20:15:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v3 09/26] arch, mm: pull out allocation of NODE_DATA to
 generic code
Message-ID: <ZrEIqogZ4UJJY0c2@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
 <20240801060826.559858-10-rppt@kernel.org>
 <20240802105527.00005240@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240802105527.00005240@Huawei.com>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Vasily Gorbik <gor@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 02, 2024 at 10:55:27AM +0100, Jonathan Cameron wrote:
> On Thu,  1 Aug 2024 09:08:09 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Architectures that support NUMA duplicate the code that allocates
> > NODE_DATA on the node-local memory with slight variations in reporting
> > of the addresses where the memory was allocated.
> > 
> > Use x86 version as the basis for the generic alloc_node_data() function
> > and call this function in architecture specific numa initialization.
> > 
> > Round up node data size to SMP_CACHE_BYTES rather than to PAGE_SIZE like
> > x86 used to do since the bootmem era when allocation granularity was
> > PAGE_SIZE anyway.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Acked-by: David Hildenbrand <david@redhat.com>
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64
> 
> One comment unrelated to this patch set as such, just made
> more obvious by it.
> 
> > diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> > index 0744a9a2944b..3c1da08304d0 100644
> > --- a/arch/powerpc/mm/numa.c
> > +++ b/arch/powerpc/mm/numa.c
> > @@ -1093,27 +1093,9 @@ void __init dump_numa_cpu_topology(void)
> >  static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
> >  {
> >  	u64 spanned_pages = end_pfn - start_pfn;
> 
> Trivial, but might as well squash this local variable into the
> single place it's used.
 

> > -	const size_t nd_size = roundup(sizeof(pg_data_t), SMP_CACHE_BYTES);

...

> > +
> > +	alloc_node_data(nid);
> > +
> >  	NODE_DATA(nid)->node_id = nid;
> >  	NODE_DATA(nid)->node_start_pfn = start_pfn;
> >  	NODE_DATA(nid)->node_spanned_pages = spanned_pages;

These are actually overridden later in free_area_init(), it would make
sense to audit all arch-specific node setup functions and clean them up a
bit.

-- 
Sincerely yours,
Mike.
