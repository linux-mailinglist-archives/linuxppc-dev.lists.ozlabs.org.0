Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74759937A36
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2024 17:52:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQZ1V32QNz3cgk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2024 01:52:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQZ156Ktsz3c44
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jul 2024 01:51:51 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WQYyl1P08z6J67T;
	Fri, 19 Jul 2024 23:49:51 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id BC470140517;
	Fri, 19 Jul 2024 23:51:45 +0800 (CST)
Received: from localhost (10.48.157.16) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 19 Jul
 2024 16:51:44 +0100
Date: Fri, 19 Jul 2024 16:51:43 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 05/17] arch, mm: pull out allocation of NODE_DATA to
 generic code
Message-ID: <20240719165143.0000002e@Huawei.com>
In-Reply-To: <96850252-a49f-4d78-a94b-a9a25e3f2bd5@redhat.com>
References: <20240716111346.3676969-1-rppt@kernel.org>
	<20240716111346.3676969-6-rppt@kernel.org>
	<220da8ed-337a-4b1e-badf-2bff1d36e6c3@redhat.com>
	<Zpi-HAb7EBxrZBtK@kernel.org>
	<96850252-a49f-4d78-a94b-a9a25e3f2bd5@redhat.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.157.16]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 Jul 2024 17:07:35 +0200
David Hildenbrand <david@redhat.com> wrote:

> >>> -	 * Allocate node data.  Try node-local memory and then any node.
> >>> -	 * Never allocate in DMA zone.
> >>> -	 */
> >>> -	nd_pa = memblock_phys_alloc_try_nid(nd_size, SMP_CACHE_BYTES, nid);
> >>> -	if (!nd_pa) {
> >>> -		pr_err("Cannot find %zu bytes in any node (initial node: %d)\n",
> >>> -		       nd_size, nid);
> >>> -		return;
> >>> -	}
> >>> -	nd = __va(nd_pa);
> >>> -
> >>> -	/* report and initialize */
> >>> -	printk(KERN_INFO "NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,
> >>> -	       nd_pa, nd_pa + nd_size - 1);
> >>> -	tnid = early_pfn_to_nid(nd_pa >> PAGE_SHIFT);
> >>> -	if (tnid != nid)
> >>> -		printk(KERN_INFO "    NODE_DATA(%d) on node %d\n", nid, tnid);
> >>> -
> >>> -	node_data[nid] = nd;
> >>> -	memset(NODE_DATA(nid), 0, sizeof(pg_data_t));
> >>> -
> >>> -	node_set_online(nid);
> >>> -}
> >>> -
> >>>    /**
> >>>     * numa_cleanup_meminfo - Cleanup a numa_meminfo
> >>>     * @mi: numa_meminfo to clean up
> >>> @@ -571,6 +538,7 @@ static int __init numa_register_memblks(struct numa_meminfo *mi)
> >>>    			continue;
> >>>    		alloc_node_data(nid);
> >>> +		node_set_online(nid);
> >>>    	}  
> >>
> >> I can spot that we only remove a single node_set_online() call from x86.
> >>
> >> What about all the other architectures? Will there be any change in behavior
> >> for them? Or do we simply set the nodes online later once more?  
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
This is moving x86 code to x86 code, not a generic location
so how would that affect anyone else? Their onlining should be same as
before.

The node onlining difference are a pain (I recall that fun from adding
generic initiators) as different ordering on x86 and arm64 at least.

Jonathan

> 

