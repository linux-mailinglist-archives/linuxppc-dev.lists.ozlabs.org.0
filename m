Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72889937C56
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2024 20:17:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQdDn33Rtz3dTx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2024 04:17:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQdDP2D1Hz2xPc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jul 2024 04:16:53 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WQdBj2QNxz6JBGZ;
	Sat, 20 Jul 2024 02:15:25 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 158871408FE;
	Sat, 20 Jul 2024 02:16:50 +0800 (CST)
Received: from localhost (10.48.157.16) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 19 Jul
 2024 19:16:48 +0100
Date: Fri, 19 Jul 2024 19:16:47 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 12/17] mm: introduce numa_memblks
Message-ID: <20240719191647.000072f6@Huawei.com>
In-Reply-To: <20240716111346.3676969-13-rppt@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
	<20240716111346.3676969-13-rppt@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.157.16]
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav
 Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian
 Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 16 Jul 2024 14:13:41 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Move code dealing with numa_memblks from arch/x86 to mm/ and add Kconfig
> options to let x86 select it in its Kconfig.
> 
> This code will be later reused by arch_numa.
> 
> No functional changes.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Hi Mike,

My only real concern in here is there are a few places where
the lifted code makes changes to memblocks that are x86 only today.
I need to do some more digging to work out if those are safe
in all cases.

Jonathan



> +/**
> + * numa_cleanup_meminfo - Cleanup a numa_meminfo
> + * @mi: numa_meminfo to clean up
> + *
> + * Sanitize @mi by merging and removing unnecessary memblks.  Also check for
> + * conflicts and clear unused memblks.
> + *
> + * RETURNS:
> + * 0 on success, -errno on failure.
> + */
> +int __init numa_cleanup_meminfo(struct numa_meminfo *mi)
> +{
> +	const u64 low = 0;

Given always zero, why not just use that value inline?

> +	const u64 high = PFN_PHYS(max_pfn);
> +	int i, j, k;
> +
> +	/* first, trim all entries */
> +	for (i = 0; i < mi->nr_blks; i++) {
> +		struct numa_memblk *bi = &mi->blk[i];
> +
> +		/* move / save reserved memory ranges */
> +		if (!memblock_overlaps_region(&memblock.memory,
> +					bi->start, bi->end - bi->start)) {
> +			numa_move_tail_memblk(&numa_reserved_meminfo, i--, mi);
> +			continue;
> +		}
> +
> +		/* make sure all non-reserved blocks are inside the limits */
> +		bi->start = max(bi->start, low);
> +
> +		/* preserve info for non-RAM areas above 'max_pfn': */
> +		if (bi->end > high) {
> +			numa_add_memblk_to(bi->nid, high, bi->end,
> +					   &numa_reserved_meminfo);
> +			bi->end = high;
> +		}
> +
> +		/* and there's no empty block */
> +		if (bi->start >= bi->end)
> +			numa_remove_memblk_from(i--, mi);
> +	}
> +
> +	/* merge neighboring / overlapping entries */
> +	for (i = 0; i < mi->nr_blks; i++) {
> +		struct numa_memblk *bi = &mi->blk[i];
> +
> +		for (j = i + 1; j < mi->nr_blks; j++) {
> +			struct numa_memblk *bj = &mi->blk[j];
> +			u64 start, end;
> +
> +			/*
> +			 * See whether there are overlapping blocks.  Whine
> +			 * about but allow overlaps of the same nid.  They
> +			 * will be merged below.
> +			 */
> +			if (bi->end > bj->start && bi->start < bj->end) {
> +				if (bi->nid != bj->nid) {
> +					pr_err("node %d [mem %#010Lx-%#010Lx] overlaps with node %d [mem %#010Lx-%#010Lx]\n",
> +					       bi->nid, bi->start, bi->end - 1,
> +					       bj->nid, bj->start, bj->end - 1);
> +					return -EINVAL;
> +				}
> +				pr_warn("Warning: node %d [mem %#010Lx-%#010Lx] overlaps with itself [mem %#010Lx-%#010Lx]\n",
> +					bi->nid, bi->start, bi->end - 1,
> +					bj->start, bj->end - 1);
> +			}
> +
> +			/*
> +			 * Join together blocks on the same node, holes
> +			 * between which don't overlap with memory on other
> +			 * nodes.
> +			 */
> +			if (bi->nid != bj->nid)
> +				continue;
> +			start = min(bi->start, bj->start);
> +			end = max(bi->end, bj->end);
> +			for (k = 0; k < mi->nr_blks; k++) {
> +				struct numa_memblk *bk = &mi->blk[k];
> +
> +				if (bi->nid == bk->nid)
> +					continue;
> +				if (start < bk->end && end > bk->start)
> +					break;
> +			}
> +			if (k < mi->nr_blks)
> +				continue;
> +			pr_info("NUMA: Node %d [mem %#010Lx-%#010Lx] + [mem %#010Lx-%#010Lx] -> [mem %#010Lx-%#010Lx]\n",
> +			       bi->nid, bi->start, bi->end - 1, bj->start,
> +			       bj->end - 1, start, end - 1);
> +			bi->start = start;
> +			bi->end = end;
> +			numa_remove_memblk_from(j--, mi);
> +		}
> +	}
> +
> +	/* clear unused ones */
> +	for (i = mi->nr_blks; i < ARRAY_SIZE(mi->blk); i++) {
> +		mi->blk[i].start = mi->blk[i].end = 0;
> +		mi->blk[i].nid = NUMA_NO_NODE;
> +	}
> +
> +	return 0;
> +}

...


> +/*
> + * Mark all currently memblock-reserved physical memory (which covers the
> + * kernel's own memory ranges) as hot-unswappable.
> + */
> +static void __init numa_clear_kernel_node_hotplug(void)

This will be a change for non x86 architectures.  'should' be fine
but I'm not 100% sure.

> +{
> +	nodemask_t reserved_nodemask = NODE_MASK_NONE;
> +	struct memblock_region *mb_region;
> +	int i;
> +
> +	/*
> +	 * We have to do some preprocessing of memblock regions, to
> +	 * make them suitable for reservation.
> +	 *
> +	 * At this time, all memory regions reserved by memblock are
> +	 * used by the kernel, but those regions are not split up
> +	 * along node boundaries yet, and don't necessarily have their
> +	 * node ID set yet either.
> +	 *
> +	 * So iterate over all memory known to the x86 architecture,

Comment needs an update at least given not x86 specific any more.

> +	 * and use those ranges to set the nid in memblock.reserved.
> +	 * This will split up the memblock regions along node
> +	 * boundaries and will set the node IDs as well.
> +	 */
> +	for (i = 0; i < numa_meminfo.nr_blks; i++) {
> +		struct numa_memblk *mb = numa_meminfo.blk + i;
> +		int ret;
> +
> +		ret = memblock_set_node(mb->start, mb->end - mb->start,
> +					&memblock.reserved, mb->nid);
> +		WARN_ON_ONCE(ret);
> +	}
> +
> +	/*
> +	 * Now go over all reserved memblock regions, to construct a
> +	 * node mask of all kernel reserved memory areas.
> +	 *
> +	 * [ Note, when booting with mem=nn[kMG] or in a kdump kernel,
> +	 *   numa_meminfo might not include all memblock.reserved
> +	 *   memory ranges, because quirks such as trim_snb_memory()
> +	 *   reserve specific pages for Sandy Bridge graphics. ]
> +	 */
> +	for_each_reserved_mem_region(mb_region) {
> +		int nid = memblock_get_region_node(mb_region);
> +
> +		if (nid != MAX_NUMNODES)
> +			node_set(nid, reserved_nodemask);
> +	}
> +
> +	/*
> +	 * Finally, clear the MEMBLOCK_HOTPLUG flag for all memory
> +	 * belonging to the reserved node mask.
> +	 *
> +	 * Note that this will include memory regions that reside
> +	 * on nodes that contain kernel memory - entire nodes
> +	 * become hot-unpluggable:
> +	 */
> +	for (i = 0; i < numa_meminfo.nr_blks; i++) {
> +		struct numa_memblk *mb = numa_meminfo.blk + i;
> +
> +		if (!node_isset(mb->nid, reserved_nodemask))
> +			continue;
> +
> +		memblock_clear_hotplug(mb->start, mb->end - mb->start);
> +	}
> +}
