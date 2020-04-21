Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8141B1B8B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 04:08:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495n5x058kzDqy1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 12:08:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=SaCdoY7l; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yts57b+q; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495n44049ZzDqtG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 12:06:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587434782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NeOgQkZsDdoMNz10q5IMbsxGpqUOFvMFdq6FjujHkZg=;
 b=SaCdoY7l299J9vjZ35BwGG6/62d0fDj48GmbWnFzq8cbXVK4pHkiJuhl7lc0OPUUtZ54GO
 jZsHZi8lSDwXNHAQqfQ+G8D8qG2Cn4EccagjrkE1Z3kjpxURi9+h1QfMVrCG6VEqWrhKGf
 Ke73MnEvD7BL9e0prQg4TkD4PfLzWgA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587434783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NeOgQkZsDdoMNz10q5IMbsxGpqUOFvMFdq6FjujHkZg=;
 b=Yts57b+qMbp4XHdYrKEkztzhO1SEjstsyJwHFNQKncTQ8muYKGx7N6fALqbTiLI6FQxG3X
 ABl1uD3DmYEdORV5pzywf+b3YksXjTOGZZ/hMN6X/V5qbr0ZLFOKfPUvaJQ5mED1NQyd/v
 8R5LYD38TDpoc86aywGITjXMrgN72MY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-MsTbvPRrM-CWA6xKfn_0bw-1; Mon, 20 Apr 2020 22:06:20 -0400
X-MC-Unique: MsTbvPRrM-CWA6xKfn_0bw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E29813FE;
 Tue, 21 Apr 2020 02:06:14 +0000 (UTC)
Received: from localhost (ovpn-12-34.pek2.redhat.com [10.72.12.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9AE6A18A0;
 Tue, 21 Apr 2020 02:06:05 +0000 (UTC)
Date: Tue, 21 Apr 2020 10:06:03 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 01/21] mm: memblock: replace dereferences of
 memblock_region.nid with API calls
Message-ID: <20200421020603.GO4247@MiWiFi-R3L-srv>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-2-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200412194859.12663-2-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

On 04/12/20 at 10:48pm, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> There are several places in the code that directly dereference
> memblock_region.nid despite this field being defined only when
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=y.
> 
> Replace these with calls to memblock_get_region_nid() to improve code
> robustness and to avoid possible breakage when
> CONFIG_HAVE_MEMBLOCK_NODE_MAP will be removed.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/arm64/mm/numa.c | 9 ++++++---
>  arch/x86/mm/numa.c   | 6 ++++--
>  mm/memblock.c        | 8 +++++---
>  mm/page_alloc.c      | 4 ++--
>  4 files changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
> index 4decf1659700..aafcee3e3f7e 100644
> --- a/arch/arm64/mm/numa.c
> +++ b/arch/arm64/mm/numa.c
> @@ -350,13 +350,16 @@ static int __init numa_register_nodes(void)
>  	struct memblock_region *mblk;
>  
>  	/* Check that valid nid is set to memblks */
> -	for_each_memblock(memory, mblk)
> -		if (mblk->nid == NUMA_NO_NODE || mblk->nid >= MAX_NUMNODES) {
> +	for_each_memblock(memory, mblk) {
> +		int mblk_nid = memblock_get_region_node(mblk);
> +
> +		if (mblk_nid == NUMA_NO_NODE || mblk_nid >= MAX_NUMNODES) {
>  			pr_warn("Warning: invalid memblk node %d [mem %#010Lx-%#010Lx]\n",
> -				mblk->nid, mblk->base,
> +				mblk_nid, mblk->base,
>  				mblk->base + mblk->size - 1);
>  			return -EINVAL;
>  		}
> +	}
>  
>  	/* Finally register nodes. */
>  	for_each_node_mask(nid, numa_nodes_parsed) {
> diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> index 59ba008504dc..fe024b2ac796 100644
> --- a/arch/x86/mm/numa.c
> +++ b/arch/x86/mm/numa.c
> @@ -517,8 +517,10 @@ static void __init numa_clear_kernel_node_hotplug(void)
>  	 *   reserve specific pages for Sandy Bridge graphics. ]
>  	 */
>  	for_each_memblock(reserved, mb_region) {
> -		if (mb_region->nid != MAX_NUMNODES)
> -			node_set(mb_region->nid, reserved_nodemask);
> +		int nid = memblock_get_region_node(mb_region);
> +
> +		if (nid != MAX_NUMNODES)
> +			node_set(nid, reserved_nodemask);
>  	}
>  
>  	/*
> diff --git a/mm/memblock.c b/mm/memblock.c
> index c79ba6f9920c..43e2fd3006c1 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -1207,13 +1207,15 @@ void __init_memblock __next_mem_pfn_range(int *idx, int nid,
>  {
>  	struct memblock_type *type = &memblock.memory;
>  	struct memblock_region *r;
> +	int r_nid;
>  
>  	while (++*idx < type->cnt) {
>  		r = &type->regions[*idx];
> +		r_nid = memblock_get_region_node(r);
>  
>  		if (PFN_UP(r->base) >= PFN_DOWN(r->base + r->size))
>  			continue;
> -		if (nid == MAX_NUMNODES || nid == r->nid)
> +		if (nid == MAX_NUMNODES || nid == r_nid)
>  			break;
>  	}
>  	if (*idx >= type->cnt) {
> @@ -1226,7 +1228,7 @@ void __init_memblock __next_mem_pfn_range(int *idx, int nid,
>  	if (out_end_pfn)
>  		*out_end_pfn = PFN_DOWN(r->base + r->size);
>  	if (out_nid)
> -		*out_nid = r->nid;
> +		*out_nid = r_nid;
>  }
>  
>  /**
> @@ -1810,7 +1812,7 @@ int __init_memblock memblock_search_pfn_nid(unsigned long pfn,
>  	*start_pfn = PFN_DOWN(type->regions[mid].base);
>  	*end_pfn = PFN_DOWN(type->regions[mid].base + type->regions[mid].size);
>  
> -	return type->regions[mid].nid;
> +	return memblock_get_region_node(&type->regions[mid]);
>  }
>  #endif
>  
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 69827d4fa052..0d012eda1694 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -7208,7 +7208,7 @@ static void __init find_zone_movable_pfns_for_nodes(void)
>  			if (!memblock_is_hotpluggable(r))
>  				continue;
>  
> -			nid = r->nid;
> +			nid = memblock_get_region_node(r);
>  
>  			usable_startpfn = PFN_DOWN(r->base);
>  			zone_movable_pfn[nid] = zone_movable_pfn[nid] ?
> @@ -7229,7 +7229,7 @@ static void __init find_zone_movable_pfns_for_nodes(void)
>  			if (memblock_is_mirror(r))
>  				continue;
>  
> -			nid = r->nid;
> +			nid = memblock_get_region_node(r);
>  
>  			usable_startpfn = memblock_region_memory_base_pfn(r);

Looks good to me.

Reviewed-by: Baoquan He <bhe@redhat.com>

