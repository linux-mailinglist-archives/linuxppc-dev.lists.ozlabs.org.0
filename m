Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3209379FE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2024 17:38:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DlreXkvj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQYjq0b7Rz3cJl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2024 01:38:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DlreXkvj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQYj80tj4z3c58
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jul 2024 01:38:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B1D3961C55;
	Fri, 19 Jul 2024 15:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13C5C32782;
	Fri, 19 Jul 2024 15:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721403479;
	bh=tVgNxMmAQWvU1FxBOgdFor7NMUPhhxY2uJhGjcWiisk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DlreXkvjsjdzHII3wrHEJX7xIvJtPh9sNl+PiEO4zziJHXT5L7qnqPt0W8Df87Z3f
	 68krH52A7kA5g1aa2XJv0roBndIEDg+cY8XsA+iWOIUm0CIjdZSUm1/AIR5wTZqSFF
	 ZPu7x311PvUpqpHwS7LKafCeg27rQek1LBnjCMCamVxdVjcv8NtScBCUdOQzaiCEoR
	 BqTsYabPbb92QT7cEQlh1F4nxwrHD6TrQWmcHk+zGXys8vhSWoRgXRyJExhg3qYStE
	 9kFSfb2sX7fKVVh0sACIwo3xjKCXDs62FfEmcrj+oNSNOGhNW1e1gj4yvau1AjZlG4
	 IOqx+qPRg9jcQ==
Date: Fri, 19 Jul 2024 18:34:54 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 05/17] arch, mm: pull out allocation of NODE_DATA to
 generic code
Message-ID: <ZpqHniqaMxj-iDfw@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-6-rppt@kernel.org>
 <220da8ed-337a-4b1e-badf-2bff1d36e6c3@redhat.com>
 <Zpi-HAb7EBxrZBtK@kernel.org>
 <96850252-a49f-4d78-a94b-a9a25e3f2bd5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96850252-a49f-4d78-a94b-a9a25e3f2bd5@redhat.com>
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

On Fri, Jul 19, 2024 at 05:07:35PM +0200, David Hildenbrand wrote:
> > > > -	 * Allocate node data.  Try node-local memory and then any node.
> > > > -	 * Never allocate in DMA zone.
> > > > -	 */
> > > > -	nd_pa = memblock_phys_alloc_try_nid(nd_size, SMP_CACHE_BYTES, nid);
> > > > -	if (!nd_pa) {
> > > > -		pr_err("Cannot find %zu bytes in any node (initial node: %d)\n",
> > > > -		       nd_size, nid);
> > > > -		return;
> > > > -	}
> > > > -	nd = __va(nd_pa);
> > > > -
> > > > -	/* report and initialize */
> > > > -	printk(KERN_INFO "NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,
> > > > -	       nd_pa, nd_pa + nd_size - 1);
> > > > -	tnid = early_pfn_to_nid(nd_pa >> PAGE_SHIFT);
> > > > -	if (tnid != nid)
> > > > -		printk(KERN_INFO "    NODE_DATA(%d) on node %d\n", nid, tnid);
> > > > -
> > > > -	node_data[nid] = nd;
> > > > -	memset(NODE_DATA(nid), 0, sizeof(pg_data_t));
> > > > -
> > > > -	node_set_online(nid);
> > > > -}
> > > > -
> > > >    /**
> > > >     * numa_cleanup_meminfo - Cleanup a numa_meminfo
> > > >     * @mi: numa_meminfo to clean up
> > > > @@ -571,6 +538,7 @@ static int __init numa_register_memblks(struct numa_meminfo *mi)
> > > >    			continue;
> > > >    		alloc_node_data(nid);
> > > > +		node_set_online(nid);
> > > >    	}
> > > 
> > > I can spot that we only remove a single node_set_online() call from x86.
> > > 
> > > What about all the other architectures? Will there be any change in behavior
> > > for them? Or do we simply set the nodes online later once more?
> > 
> > On x86 node_set_online() was a part of alloc_node_data() and I moved it
> > outside so it's called right after alloc_node_data(). On other
> > architectures the allocation didn't include that call, so there should be
> > no difference there.
> 
> But won't their arch code try setting the nodes online at a later stage?
> 
> And I think, some architectures only set nodes online conditionally
> (see most other node_set_online() calls).
> 
> Sorry if I'm confused here, but with now unconditional node_set_online(), won't
> we change the behavior of other architectures?

The generic alloc_node_data() does not set the node online:

+/* Allocate NODE_DATA for a node on the local memory */
+void __init alloc_node_data(int nid)
+{
+	const size_t nd_size = roundup(sizeof(pg_data_t), PAGE_SIZE);
+	u64 nd_pa;
+	void *nd;
+	int tnid;
+
+	/* Allocate node data.  Try node-local memory and then any node. */
+	nd_pa = memblock_phys_alloc_try_nid(nd_size, SMP_CACHE_BYTES, nid);
+	if (!nd_pa)
+		panic("Cannot allocate %zu bytes for node %d data\n",
+		      nd_size, nid);
+	nd = __va(nd_pa);
+
+	/* report and initialize */
+	pr_info("NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,
+		nd_pa, nd_pa + nd_size - 1);
+	tnid = early_pfn_to_nid(nd_pa >> PAGE_SHIFT);
+	if (tnid != nid)
+		pr_info("    NODE_DATA(%d) on node %d\n", nid, tnid);
+
+	node_data[nid] = nd;
+	memset(NODE_DATA(nid), 0, sizeof(pg_data_t));
+}

I might have missed some architecture except x86 that calls
node_set_online() in its alloc_node_data(), but the intention was to leave
that call outside the alloc and explicitly add it after the call to
alloc_node_data() if needed like in x86.

> -- 
> Cheers,
> 
> David / dhildenb
> 
> 

-- 
Sincerely yours,
Mike.
