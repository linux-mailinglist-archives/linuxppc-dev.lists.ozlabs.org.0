Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8A9230C4B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 16:21:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGJlP6qNwzDqb0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 00:21:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=QgGc4X7Y; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGJc74SHGzDqDm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 00:15:35 +1000 (AEST)
Received: from kernel.org (unknown [87.71.40.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7BC04206F5;
 Tue, 28 Jul 2020 14:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595945719;
 bh=lUPY2x+FC7QKHEsbHiDvmWaDq+mpMmmwkd+OggYom1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QgGc4X7YUZ1ckDx2DS7TV0wJ9kprJKWkAHEon+OMgHl2R1sb+tkMTAcVnCBfWfbCy
 0OtC+wiVDREvJNkkA1XcIE7jDME0kzNs1q63GPOaIsM59WTD15P6atSjYRp+nh+npo
 fGSf3gFWEKzBxONEs1GYYDPsR5qUaUEQHRNOUSzo=
Date: Tue, 28 Jul 2020 17:15:04 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH 14/15] x86/numa: remove redundant iteration over
 memblock.reserved
Message-ID: <20200728141504.GC3655207@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-15-rppt@kernel.org>
 <20200728110254.GA14854@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728110254.GA14854@MiWiFi-R3L-srv>
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 28, 2020 at 07:02:54PM +0800, Baoquan He wrote:
> On 07/28/20 at 08:11am, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > numa_clear_kernel_node_hotplug() function first traverses numa_meminfo
> > regions to set node ID in memblock.reserved and than traverses
> > memblock.reserved to update reserved_nodemask to include node IDs that were
> > set in the first loop.
> > 
> > Remove redundant traversal over memblock.reserved and update
> > reserved_nodemask while iterating over numa_meminfo.
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > ---
> >  arch/x86/mm/numa.c | 26 ++++++++++----------------
> >  1 file changed, 10 insertions(+), 16 deletions(-)
> > 
> > diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> > index 8ee952038c80..4078abd33938 100644
> > --- a/arch/x86/mm/numa.c
> > +++ b/arch/x86/mm/numa.c
> > @@ -498,31 +498,25 @@ static void __init numa_clear_kernel_node_hotplug(void)
> >  	 * and use those ranges to set the nid in memblock.reserved.
> >  	 * This will split up the memblock regions along node
> >  	 * boundaries and will set the node IDs as well.
> > +	 *
> > +	 * The nid will also be set in reserved_nodemask which is later
> > +	 * used to clear MEMBLOCK_HOTPLUG flag.
> > +	 *
> > +	 * [ Note, when booting with mem=nn[kMG] or in a kdump kernel,
> > +	 *   numa_meminfo might not include all memblock.reserved
> > +	 *   memory ranges, because quirks such as trim_snb_memory()
> > +	 *   reserve specific pages for Sandy Bridge graphics.
> > +	 *   These ranges will remain with nid == MAX_NUMNODES. ]
> >  	 */
> >  	for (i = 0; i < numa_meminfo.nr_blks; i++) {
> >  		struct numa_memblk *mb = numa_meminfo.blk + i;
> >  		int ret;
> >  
> >  		ret = memblock_set_node(mb->start, mb->end - mb->start, &memblock.reserved, mb->nid);
> > +		node_set(mb->nid, reserved_nodemask);
> 
> Really? This will set all node id into reserved_nodemask. But in the
> current code, it's setting nid into memblock reserved region which
> interleaves with numa_memoinfo, then get those nid and set it in
> reserved_nodemask. This is so different, with my understanding. Please
> correct me if I am wrong.

You are right, I've missed the intersections of numa_meminfo with
memblock.reserved.

x86 interaction with membock is so, hmm, interesting...
 
> Thanks
> Baoquan
> 
> >  		WARN_ON_ONCE(ret);
> >  	}
> >  
> > -	/*
> > -	 * Now go over all reserved memblock regions, to construct a
> > -	 * node mask of all kernel reserved memory areas.
> > -	 *
> > -	 * [ Note, when booting with mem=nn[kMG] or in a kdump kernel,
> > -	 *   numa_meminfo might not include all memblock.reserved
> > -	 *   memory ranges, because quirks such as trim_snb_memory()
> > -	 *   reserve specific pages for Sandy Bridge graphics. ]
> > -	 */
> > -	for_each_memblock(reserved, mb_region) {
> > -		int nid = memblock_get_region_node(mb_region);
> > -
> > -		if (nid != MAX_NUMNODES)
> > -			node_set(nid, reserved_nodemask);
> > -	}
> > -
> >  	/*
> >  	 * Finally, clear the MEMBLOCK_HOTPLUG flag for all memory
> >  	 * belonging to the reserved node mask.
> > -- 
> > 2.26.2
> > 
> > 
> 

-- 
Sincerely yours,
Mike.
