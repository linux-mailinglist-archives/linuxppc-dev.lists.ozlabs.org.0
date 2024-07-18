Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C08B934895
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 09:06:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kUgbLYcY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPkPV2VPXz3dL7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 17:06:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kUgbLYcY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPkNp0Zfcz3cSP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 17:06:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0DBCD619FF;
	Thu, 18 Jul 2024 07:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD529C116B1;
	Thu, 18 Jul 2024 07:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721286357;
	bh=whHsob4RS5v2GdrWHkkMKcRLrbELb7YOdJDyppVzr6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kUgbLYcYkFi+yM5DNGWYkc6mZnNnUffrZs2ftic6RoJlQJ7E8d8XWB5uF1VxaloMN
	 2pI7IBqElMjV0qmk4el5sVZlUVx1UwdD/P/sQY2CWDd738D2psQymoIvRySGsgmXuk
	 ZUck602iq5YkHci1Vyu9rFtlsvRJpdSEkMm+v+2VIQWc/AzrdgqrSUiCL4vEDXKVee
	 8A9PZCK5pqB7fQmK9zQfZYL2C8lRMzESmGfyxSOLFBGVMQZpNwRh+NK+wlWHkdZfdM
	 jaUarx/bIXxsaGX38yt2XwW4s4VTuawsNrk9K8J+JTbrZLoL9aVyqQB8FzZnTP9IQn
	 +gP4pgv5FiIEw==
Date: Thu, 18 Jul 2024 10:02:52 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 05/17] arch, mm: pull out allocation of NODE_DATA to
 generic code
Message-ID: <Zpi-HAb7EBxrZBtK@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-6-rppt@kernel.org>
 <220da8ed-337a-4b1e-badf-2bff1d36e6c3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <220da8ed-337a-4b1e-badf-2bff1d36e6c3@redhat.com>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 17, 2024 at 04:42:48PM +0200, David Hildenbrand wrote:
> On 16.07.24 13:13, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Architectures that support NUMA duplicate the code that allocates
> > NODE_DATA on the node-local memory with slight variations in reporting
> > of the addresses where the memory was allocated.
> > 
> > Use x86 version as the basis for the generic alloc_node_data() function
> > and call this function in architecture specific numa initialization.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> 
> [...]
> 
> > diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> > index 9208eaadf690..909f6cec3a26 100644
> > --- a/arch/mips/loongson64/numa.c
> > +++ b/arch/mips/loongson64/numa.c
> > @@ -81,12 +81,8 @@ static void __init init_topology_matrix(void)
> >   static void __init node_mem_init(unsigned int node)
> >   {
> > -	struct pglist_data *nd;
> >   	unsigned long node_addrspace_offset;
> >   	unsigned long start_pfn, end_pfn;
> > -	unsigned long nd_pa;
> > -	int tnid;
> > -	const size_t nd_size = roundup(sizeof(pg_data_t), SMP_CACHE_BYTES);
> 
> One interesting change is that we now always round up to full pages on
> architectures where we previously rounded up to SMP_CACHE_BYTES.

On my workstation struct pglist_data take 174400, cachelines: 2725, members: 43 */
 
> I assume we don't really expect a significant growth in memory consumption
> that we care about, especially because most systems with many nodes also
> have  quite some memory around.

With Debian kernel configuration for 6.5 struct pglist data takes 174400
bytes so the increase here is below 1%.

For NUMA systems with a lot of nodes that shouldn't be a problem.

> > -/* Allocate NODE_DATA for a node on the local memory */
> > -static void __init alloc_node_data(int nid)
> > -{
> > -	const size_t nd_size = roundup(sizeof(pg_data_t), PAGE_SIZE);
> > -	u64 nd_pa;
> > -	void *nd;
> > -	int tnid;
> > -
> > -	/*
> > -	 * Allocate node data.  Try node-local memory and then any node.
> > -	 * Never allocate in DMA zone.
> > -	 */
> > -	nd_pa = memblock_phys_alloc_try_nid(nd_size, SMP_CACHE_BYTES, nid);
> > -	if (!nd_pa) {
> > -		pr_err("Cannot find %zu bytes in any node (initial node: %d)\n",
> > -		       nd_size, nid);
> > -		return;
> > -	}
> > -	nd = __va(nd_pa);
> > -
> > -	/* report and initialize */
> > -	printk(KERN_INFO "NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,
> > -	       nd_pa, nd_pa + nd_size - 1);
> > -	tnid = early_pfn_to_nid(nd_pa >> PAGE_SHIFT);
> > -	if (tnid != nid)
> > -		printk(KERN_INFO "    NODE_DATA(%d) on node %d\n", nid, tnid);
> > -
> > -	node_data[nid] = nd;
> > -	memset(NODE_DATA(nid), 0, sizeof(pg_data_t));
> > -
> > -	node_set_online(nid);
> > -}
> > -
> >   /**
> >    * numa_cleanup_meminfo - Cleanup a numa_meminfo
> >    * @mi: numa_meminfo to clean up
> > @@ -571,6 +538,7 @@ static int __init numa_register_memblks(struct numa_meminfo *mi)
> >   			continue;
> >   		alloc_node_data(nid);
> > +		node_set_online(nid);
> >   	}
> 
> I can spot that we only remove a single node_set_online() call from x86.
> 
> What about all the other architectures? Will there be any change in behavior
> for them? Or do we simply set the nodes online later once more?

On x86 node_set_online() was a part of alloc_node_data() and I moved it
outside so it's called right after alloc_node_data(). On other
architectures the allocation didn't include that call, so there should be
no difference there.
 
> -- 
> Cheers,
> 
> David / dhildenb
> 
> 

-- 
Sincerely yours,
Mike.
