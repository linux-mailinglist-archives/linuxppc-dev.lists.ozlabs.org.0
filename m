Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 902FA938158
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2024 14:36:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cu7ixXhd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WR5d93LdNz30WX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2024 22:36:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cu7ixXhd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WR5cS0vc9z30VX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jul 2024 22:35:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D66260BC8;
	Sat, 20 Jul 2024 12:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 907FAC2BD10;
	Sat, 20 Jul 2024 12:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721478949;
	bh=V1Mnl7GTUOfk7ipXzRO+FVNDqKlKteMfA0VSzXpSXNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cu7ixXhdpKHX3WYl+oqtYrBp4FSGOrMfYS7JdXXFb+TW6Nk+7hUsvPSx3dhiTlklx
	 eISAI9h3FnpKkm3821iYqQYW+t5vM3j/rQSfaM2c5ZSvkOS0dtVgUTa7UFD6+6Fd+V
	 Swzw7lpBQ3cR8gtADz0+ZYCaj8cVNbhDnVWIeoGj2CAcdZJxya924itwrRRURR8D7p
	 gdO9A2rVCcGxCsCfqgN6GjXc2Q+wsd6OQeVFtI5v6JPBQOlHrsAizNhEVEwpmqQI8J
	 i+jsVT9EkWlzCyda1fYMGW9njAt5+hODmpTx/amSTJslyC8uufTXXBFDjlNyKbHrDE
	 CHtZSP6W18ryg==
Date: Sat, 20 Jul 2024 15:32:34 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 15/17] mm: make numa_memblks more self-contained
Message-ID: <ZpuuYnMCd8RRZEcH@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-16-rppt@kernel.org>
 <20240719190712.00001307@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719190712.00001307@Huawei.com>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 19, 2024 at 07:07:12PM +0100, Jonathan Cameron wrote:
> On Tue, 16 Jul 2024 14:13:44 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Introduce numa_memblks_init() and move some code around to avoid several
> > global variables in numa_memblks.
> 
> Hi Mike,
> 
> Adding the effectively always on memblock_force_top_down
> deserves a comment on why. I assume because you are going to do
> something with it later? 

Yes, arch_numa sets it to false. I'll add a note in the changelog.

> There also seems to be more going on in here such as the change to
> get_pfn_range_for_nid()  Perhaps break this up so each
> change can have an explanation. 
 
Ok.
 
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  arch/x86/mm/numa.c           | 53 ++++---------------------
> >  include/linux/numa_memblks.h |  9 +----
> >  mm/numa_memblks.c            | 77 +++++++++++++++++++++++++++---------
> >  3 files changed, 68 insertions(+), 71 deletions(-)
> > 
> > diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> > index 3848e68d771a..16bc703c9272 100644
> > --- a/arch/x86/mm/numa.c
> > +++ b/arch/x86/mm/numa.c
> > @@ -115,30 +115,19 @@ void __init setup_node_to_cpumask_map(void)
> >  	pr_debug("Node to cpumask map for %u nodes\n", nr_node_ids);
> >  }
> >  
> > -static int __init numa_register_memblks(struct numa_meminfo *mi)
> > +static int __init numa_register_nodes(void)
> >  {
> > -	int i, nid, err;
> > -
> > -	err = numa_register_meminfo(mi);
> > -	if (err)
> > -		return err;
> > +	int nid;
> >  
> >  	if (!memblock_validate_numa_coverage(SZ_1M))
> >  		return -EINVAL;
> >  
> >  	/* Finally register nodes. */
> >  	for_each_node_mask(nid, node_possible_map) {
> > -		u64 start = PFN_PHYS(max_pfn);
> > -		u64 end = 0;
> > -
> > -		for (i = 0; i < mi->nr_blks; i++) {
> > -			if (nid != mi->blk[i].nid)
> > -				continue;
> > -			start = min(mi->blk[i].start, start);
> > -			end = max(mi->blk[i].end, end);
> > -		}
> > +		unsigned long start_pfn, end_pfn;
> >  
> > -		if (start >= end)
> > +		get_pfn_range_for_nid(nid, &start_pfn, &end_pfn);
> 
> It's not immediately obvious to me that this code is equivalent so I'd
> prefer it in a separate patch with some description of why
> it is a valid change.

Will do.
 
> > +		if (start_pfn >= end_pfn)
> >  			continue;
> >  
> >  		alloc_node_data(nid);
> > @@ -178,39 +167,11 @@ static int __init numa_init(int (*init_func)(void))
> >  	for (i = 0; i < MAX_LOCAL_APIC; i++)
> >  		set_apicid_to_node(i, NUMA_NO_NODE);
> >  
> > -	nodes_clear(numa_nodes_parsed);
> > -	nodes_clear(node_possible_map);
> > -	nodes_clear(node_online_map);
> > -	memset(&numa_meminfo, 0, sizeof(numa_meminfo));
> > -	WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.memory,
> > -				  NUMA_NO_NODE));
> > -	WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.reserved,
> > -				  NUMA_NO_NODE));
> > -	/* In case that parsing SRAT failed. */
> > -	WARN_ON(memblock_clear_hotplug(0, ULLONG_MAX));
> > -	numa_reset_distance();
> > -
> > -	ret = init_func();
> > -	if (ret < 0)
> > -		return ret;
> > -
> > -	/*
> > -	 * We reset memblock back to the top-down direction
> > -	 * here because if we configured ACPI_NUMA, we have
> > -	 * parsed SRAT in init_func(). It is ok to have the
> > -	 * reset here even if we did't configure ACPI_NUMA
> > -	 * or acpi numa init fails and fallbacks to dummy
> > -	 * numa init.
> > -	 */
> > -	memblock_set_bottom_up(false);
> > -
> > -	ret = numa_cleanup_meminfo(&numa_meminfo);
> > +	ret = numa_memblks_init(init_func, /* memblock_force_top_down */ true);
> The comment in parameter list seems unnecessary.
> Maybe add a comment above the call instead if need to call that out?

I'll drop it for now.
 
> >  	if (ret < 0)
> >  		return ret;
> >  
> > -	numa_emulation(&numa_meminfo, numa_distance_cnt);
> > -
> > -	ret = numa_register_memblks(&numa_meminfo);
> > +	ret = numa_register_nodes();
> >  	if (ret < 0)
> >  		return ret;
> >  
> 
> > diff --git a/mm/numa_memblks.c b/mm/numa_memblks.c
> > index e0039549aaac..640f3a3ce0ee 100644
> > --- a/mm/numa_memblks.c
> > +++ b/mm/numa_memblks.c
> > @@ -7,13 +7,27 @@
> >  #include <linux/numa.h>
> >  #include <linux/numa_memblks.h>
> >  
> 
> > +/*
> > + * Set nodes, which have memory in @mi, in *@nodemask.
> > + */
> > +static void __init numa_nodemask_from_meminfo(nodemask_t *nodemask,
> > +					      const struct numa_meminfo *mi)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(mi->blk); i++)
> > +		if (mi->blk[i].start != mi->blk[i].end &&
> > +		    mi->blk[i].nid != NUMA_NO_NODE)
> > +			node_set(mi->blk[i].nid, *nodemask);
> > +}
> 
> The code move doesn't have an obvious purpose. Maybe call that
> out in the patch description if it is needed for a future patch.
> Or do it in two goes so first just adds the static, 2nd shuffles
> the code.
 
Before the move numa_nodemask_from_meminfo() was global so it was ok to
define it after its callers.
I'll split this into a separate commit.

-- 
Sincerely yours,
Mike.
