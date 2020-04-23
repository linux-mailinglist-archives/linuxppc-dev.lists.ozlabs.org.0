Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 656471B546C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 07:52:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4975zd5KcYzDr2k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 15:52:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=LMVthoZA; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4975xt5WVFzDqCH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 15:50:42 +1000 (AEST)
Received: from kernel.org (unknown [77.127.79.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 316B72075A;
 Thu, 23 Apr 2020 05:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587621040;
 bh=eyVZp9j3F/Xq/nb8E7flj/7Td5RXEkEohgXGHGzzyBg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LMVthoZAtv0rZAA611yWF87SJbTuYjwkEzlivL15gwv1pTfmKz6qcSkPj9g6tdK3X
 3vKyJlA0AvQUGT1DCH7fpW3AEGHKGhgMYeM3USLfon8nQe86zcU1QzD9IFXYoeaLr8
 3uHfGYSWfNKi0n+hHvp4Yj3/WIVE9+1jq2UW/40o=
Date: Thu, 23 Apr 2020 08:50:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH 16/21] mm: remove early_pfn_in_nid() and
 CONFIG_NODES_SPAN_OTHER_NODES
Message-ID: <20200423055022.GE14260@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-17-rppt@kernel.org>
 <20200423011312.GY4247@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423011312.GY4247@MiWiFi-R3L-srv>
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

On Thu, Apr 23, 2020 at 09:13:12AM +0800, Baoquan He wrote:
> On 04/12/20 at 10:48pm, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > The commit f47ac088c406 ("mm: memmap_init: iterate over memblock regions
> 
> This commit id should be a temporary one, will be changed when merged
> into maintainer's tree and linus's tree. Only saying last patch plus the
> patch subject is OK?

Right, the commit id here is not stable. I'll update the changelog.
 
> > rather that check each PFN") made early_pfn_in_nid() obsolete and since
> > CONFIG_NODES_SPAN_OTHER_NODES is only used to pick a stub or a real
> > implementation of early_pfn_in_nid() it is also not needed anymore.
> > 
> > Remove both early_pfn_in_nid() and the CONFIG_NODES_SPAN_OTHER_NODES.
> > 
> > Co-developed-by: Hoan Tran <Hoan@os.amperecomputing.com>
> > Signed-off-by: Hoan Tran <Hoan@os.amperecomputing.com>
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > ---
> >  arch/powerpc/Kconfig |  9 ---------
> >  arch/sparc/Kconfig   |  9 ---------
> >  arch/x86/Kconfig     |  9 ---------
> >  mm/page_alloc.c      | 20 --------------------
> >  4 files changed, 47 deletions(-)
> > 
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index 5f86b22b7d2c..74f316deeae1 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -685,15 +685,6 @@ config ARCH_MEMORY_PROBE
> >  	def_bool y
> >  	depends on MEMORY_HOTPLUG
> >  
> > -# Some NUMA nodes have memory ranges that span
> > -# other nodes.  Even though a pfn is valid and
> > -# between a node's start and end pfns, it may not
> > -# reside on that node.  See memmap_init_zone()
> > -# for details.
> > -config NODES_SPAN_OTHER_NODES
> > -	def_bool y
> > -	depends on NEED_MULTIPLE_NODES
> > -
> >  config STDBINUTILS
> >  	bool "Using standard binutils settings"
> >  	depends on 44x
> > diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
> > index 795206b7b552..0e4f3891b904 100644
> > --- a/arch/sparc/Kconfig
> > +++ b/arch/sparc/Kconfig
> > @@ -286,15 +286,6 @@ config NODES_SHIFT
> >  	  Specify the maximum number of NUMA Nodes available on the target
> >  	  system.  Increases memory reserved to accommodate various tables.
> >  
> > -# Some NUMA nodes have memory ranges that span
> > -# other nodes.  Even though a pfn is valid and
> > -# between a node's start and end pfns, it may not
> > -# reside on that node.  See memmap_init_zone()
> > -# for details.
> > -config NODES_SPAN_OTHER_NODES
> > -	def_bool y
> > -	depends on NEED_MULTIPLE_NODES
> > -
> >  config ARCH_SPARSEMEM_ENABLE
> >  	def_bool y if SPARC64
> >  	select SPARSEMEM_VMEMMAP_ENABLE
> > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> > index 9d3e95b4fb85..37dac095659e 100644
> > --- a/arch/x86/Kconfig
> > +++ b/arch/x86/Kconfig
> > @@ -1581,15 +1581,6 @@ config X86_64_ACPI_NUMA
> >  	---help---
> >  	  Enable ACPI SRAT based node topology detection.
> >  
> > -# Some NUMA nodes have memory ranges that span
> > -# other nodes.  Even though a pfn is valid and
> > -# between a node's start and end pfns, it may not
> > -# reside on that node.  See memmap_init_zone()
> > -# for details.
> > -config NODES_SPAN_OTHER_NODES
> > -	def_bool y
> > -	depends on X86_64_ACPI_NUMA
> > -
> >  config NUMA_EMU
> >  	bool "NUMA emulation"
> >  	depends on NUMA
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index c43ce8709457..343d87b8697d 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -1541,26 +1541,6 @@ int __meminit early_pfn_to_nid(unsigned long pfn)
> >  }
> >  #endif /* CONFIG_NEED_MULTIPLE_NODES */
> >  
> > -#ifdef CONFIG_NODES_SPAN_OTHER_NODES
> > -/* Only safe to use early in boot when initialisation is single-threaded */
> > -static inline bool __meminit early_pfn_in_nid(unsigned long pfn, int node)
> > -{
> > -	int nid;
> > -
> > -	nid = __early_pfn_to_nid(pfn, &early_pfnnid_cache);
> > -	if (nid >= 0 && nid != node)
> > -		return false;
> > -	return true;
> > -}
> > -
> > -#else
> > -static inline bool __meminit early_pfn_in_nid(unsigned long pfn, int node)
> > -{
> > -	return true;
> > -}
> > -#endif
> 
> And macro early_pfn_valid() is not needed either, we may need remove it
> too. 

Ok.

> Otherwise, removing NODES_SPAN_OTHER_NODES in this patch looks good.
> 
> Reviewed-by: Baoquan He <bhe@redhat.com>
> 
> > -
> > -
> >  void __init memblock_free_pages(struct page *page, unsigned long pfn,
> >  							unsigned int order)
> >  {
> > -- 
> > 2.25.1
> > 
> 

-- 
Sincerely yours,
Mike.
