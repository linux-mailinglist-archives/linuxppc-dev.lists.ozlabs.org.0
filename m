Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7F51B547E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 07:58:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49767B20WFzDr4C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 15:58:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=INFl55p9; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49764Y1df0zDr3D
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 15:56:29 +1000 (AEST)
Received: from kernel.org (unknown [77.127.79.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B0EA52075A;
 Thu, 23 Apr 2020 05:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587621386;
 bh=wsia7xJe5mA6+RbZ1pkgs/TCh7UHqhYePo+JZPQ+4Vc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=INFl55p97IITRRpkLSiHEvBI0DW8K+kNLVVtjZLTv1mHgZs2RZcWWZbod4SkDiQ7g
 cxZ53c78HbQMs+UJqRwZROai9iYeFm/bc2yC5c5hW3au11XYCr7jN1p91ytVBAP+an
 YCPzBcwxwgnj2N71CQdKWwX8yO2zRR/qES5m+wIc=
Date: Thu, 23 Apr 2020 08:55:59 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH 17/21] mm: free_area_init: allow defining max_zone_pfn in
 descending order
Message-ID: <20200423055559.GF14260@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-18-rppt@kernel.org>
 <20200423025311.GZ4247@MiWiFi-R3L-srv>
 <20200423025720.GA4247@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423025720.GA4247@MiWiFi-R3L-srv>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 23, 2020 at 10:57:20AM +0800, Baoquan He wrote:
> On 04/23/20 at 10:53am, Baoquan He wrote:
> > On 04/12/20 at 10:48pm, Mike Rapoport wrote:
> > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > 
> > > Some architectures (e.g. ARC) have the ZONE_HIGHMEM zone below the
> > > ZONE_NORMAL. Allowing free_area_init() parse max_zone_pfn array even it is
> > > sorted in descending order allows using free_area_init() on such
> > > architectures.
> > > 
> > > Add top -> down traversal of max_zone_pfn array in free_area_init() and use
> > > the latter in ARC node/zone initialization.
> > 
> > Or maybe leave ARC as is. The change in this patchset doesn't impact
> > ARC's handling about zone initialization, leaving it as is can reduce
> > the complication in implementation of free_area_init(), which is a
> > common function. So I personally don't see a strong motivation to have
> > this patch.
> 
> OK, seems this patch is prepared to simplify free_area_init_node(), so
> take back what I said at above.
> 
> Then this looks necessary, even though it introduces special case into
> common function free_area_init().

The idea is to have a single free_area_init() for all architectures
without keeping two completely different ways of calculating the zone
extents.
Another thing, is that with this we could eventually switch ARC from
DISCONTIGMEM.

> Reviewed-by: Baoquan He <bhe@redhat.com>
> 
> > 
> > > 
> > > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > > ---
> > >  arch/arc/mm/init.c | 36 +++++++-----------------------------
> > >  mm/page_alloc.c    | 24 +++++++++++++++++++-----
> > >  2 files changed, 26 insertions(+), 34 deletions(-)
> > > 
> > > diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
> > > index 0920c969c466..41eb9be1653c 100644
> > > --- a/arch/arc/mm/init.c
> > > +++ b/arch/arc/mm/init.c
> > > @@ -63,11 +63,13 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
> > >  
> > >  		low_mem_sz = size;
> > >  		in_use = 1;
> > > +		memblock_add_node(base, size, 0);
> > >  	} else {
> > >  #ifdef CONFIG_HIGHMEM
> > >  		high_mem_start = base;
> > >  		high_mem_sz = size;
> > >  		in_use = 1;
> > > +		memblock_add_node(base, size, 1);
> > >  #endif
> > >  	}
> > >  
> > > @@ -83,8 +85,7 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
> > >   */
> > >  void __init setup_arch_memory(void)
> > >  {
> > > -	unsigned long zones_size[MAX_NR_ZONES];
> > > -	unsigned long zones_holes[MAX_NR_ZONES];
> > > +	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
> > >  
> > >  	init_mm.start_code = (unsigned long)_text;
> > >  	init_mm.end_code = (unsigned long)_etext;
> > > @@ -115,7 +116,6 @@ void __init setup_arch_memory(void)
> > >  	 * the crash
> > >  	 */
> > >  
> > > -	memblock_add_node(low_mem_start, low_mem_sz, 0);
> > >  	memblock_reserve(CONFIG_LINUX_LINK_BASE,
> > >  			 __pa(_end) - CONFIG_LINUX_LINK_BASE);
> > >  
> > > @@ -133,22 +133,7 @@ void __init setup_arch_memory(void)
> > >  	memblock_dump_all();
> > >  
> > >  	/*----------------- node/zones setup --------------------------*/
> > > -	memset(zones_size, 0, sizeof(zones_size));
> > > -	memset(zones_holes, 0, sizeof(zones_holes));
> > > -
> > > -	zones_size[ZONE_NORMAL] = max_low_pfn - min_low_pfn;
> > > -	zones_holes[ZONE_NORMAL] = 0;
> > > -
> > > -	/*
> > > -	 * We can't use the helper free_area_init(zones[]) because it uses
> > > -	 * PAGE_OFFSET to compute the @min_low_pfn which would be wrong
> > > -	 * when our kernel doesn't start at PAGE_OFFSET, i.e.
> > > -	 * PAGE_OFFSET != CONFIG_LINUX_RAM_BASE
> > > -	 */
> > > -	free_area_init_node(0,			/* node-id */
> > > -			    zones_size,		/* num pages per zone */
> > > -			    min_low_pfn,	/* first pfn of node */
> > > -			    zones_holes);	/* holes */
> > > +	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
> > >  
> > >  #ifdef CONFIG_HIGHMEM
> > >  	/*
> > > @@ -168,20 +153,13 @@ void __init setup_arch_memory(void)
> > >  	min_high_pfn = PFN_DOWN(high_mem_start);
> > >  	max_high_pfn = PFN_DOWN(high_mem_start + high_mem_sz);
> > >  
> > > -	zones_size[ZONE_NORMAL] = 0;
> > > -	zones_holes[ZONE_NORMAL] = 0;
> > > -
> > > -	zones_size[ZONE_HIGHMEM] = max_high_pfn - min_high_pfn;
> > > -	zones_holes[ZONE_HIGHMEM] = 0;
> > > -
> > > -	free_area_init_node(1,			/* node-id */
> > > -			    zones_size,		/* num pages per zone */
> > > -			    min_high_pfn,	/* first pfn of node */
> > > -			    zones_holes);	/* holes */
> > > +	max_zone_pfn[ZONE_HIGHMEM] = max_high_pfn;
> > >  
> > >  	high_memory = (void *)(min_high_pfn << PAGE_SHIFT);
> > >  	kmap_init();
> > >  #endif
> > > +
> > > +	free_area_init(max_zone_pfn);
> > >  }
> > >  
> > >  /*
> > > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > > index 343d87b8697d..376434c7a78b 100644
> > > --- a/mm/page_alloc.c
> > > +++ b/mm/page_alloc.c
> > > @@ -7429,7 +7429,8 @@ static void check_for_memory(pg_data_t *pgdat, int nid)
> > >  void __init free_area_init(unsigned long *max_zone_pfn)
> > >  {
> > >  	unsigned long start_pfn, end_pfn;
> > > -	int i, nid;
> > > +	int i, nid, zone;
> > > +	bool descending = false;
> > >  
> > >  	/* Record where the zone boundaries are */
> > >  	memset(arch_zone_lowest_possible_pfn, 0,
> > > @@ -7439,13 +7440,26 @@ void __init free_area_init(unsigned long *max_zone_pfn)
> > >  
> > >  	start_pfn = find_min_pfn_with_active_regions();
> > >  
> > > +	/*
> > > +	 * Some architecturs, e.g. ARC may have ZONE_HIGHMEM below
> > > +	 * ZONE_NORMAL. For such cases we allow max_zone_pfn sorted in the
> > > +	 * descending order
> > > +	 */
> > > +	if (MAX_NR_ZONES > 1 && max_zone_pfn[0] > max_zone_pfn[1])
> > > +		descending = true;
> > > +
> > >  	for (i = 0; i < MAX_NR_ZONES; i++) {
> > > -		if (i == ZONE_MOVABLE)
> > > +		if (descending)
> > > +			zone = MAX_NR_ZONES - i - 1;
> > > +		else
> > > +			zone = i;
> > > +
> > > +		if (zone == ZONE_MOVABLE)
> > >  			continue;
> > >  
> > > -		end_pfn = max(max_zone_pfn[i], start_pfn);
> > > -		arch_zone_lowest_possible_pfn[i] = start_pfn;
> > > -		arch_zone_highest_possible_pfn[i] = end_pfn;
> > > +		end_pfn = max(max_zone_pfn[zone], start_pfn);
> > > +		arch_zone_lowest_possible_pfn[zone] = start_pfn;
> > > +		arch_zone_highest_possible_pfn[zone] = end_pfn;
> > >  
> > >  		start_pfn = end_pfn;
> > >  	}
> > > -- 
> > > 2.25.1
> > > 
> 

-- 
Sincerely yours,
Mike.
