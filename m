Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E63298C82
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 12:58:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKYJd1y7yzDqPS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 22:58:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=beAfxtxV; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKYDP1fdczDqMd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Oct 2020 22:55:01 +1100 (AEDT)
Received: from kernel.org (unknown [87.70.96.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5891822265;
 Mon, 26 Oct 2020 11:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603713297;
 bh=JL5L+tjAdTtgTIzF1IyLb8dhJjCHzTjL2OJ0c6FU4w4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=beAfxtxVzIWG7/PQSB9oT8HrWkddsR0PDdaGNijlEC3AuMvcZUXxJY9R8puB77jj0
 rPlZw+P1uGuAIqPmVzWmAkw1wLYd5tKrK+EpdZCOH48DMhCjDSmOkzAPgP4u1ZC3/i
 Sc+DoqTEeolhEbCvCJLclcbZXLgz0JV5qw710moE=
Date: Mon, 26 Oct 2020 13:54:43 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 1/4] mm: introduce debug_pagealloc_map_pages() helper
Message-ID: <20201026115443.GF1154158@kernel.org>
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-2-rppt@kernel.org>
 <8720c067-7dc5-2b02-918b-e54dd642bfd6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8720c067-7dc5-2b02-918b-e54dd642bfd6@redhat.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Pekka Enberg <penberg@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 26, 2020 at 12:05:13PM +0100, David Hildenbrand wrote:
> On 25.10.20 11:15, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > When CONFIG_DEBUG_PAGEALLOC is enabled, it unmaps pages from the
> > kernel direct mapping after free_pages(). The pages than need to be
> > mapped back before they could be used. Theese mapping operations use 
> > __kernel_map_pages() guarded with with debug_pagealloc_enabled().
> > 
> > The only place that calls __kernel_map_pages() without checking
> > whether DEBUG_PAGEALLOC is enabled is the hibernation code that
> > presumes availability of this function when ARCH_HAS_SET_DIRECT_MAP
> > is set. Still, on arm64, __kernel_map_pages() will bail out when
> > DEBUG_PAGEALLOC is not enabled but set_direct_map_invalid_noflush()
> > may render some pages not present in the direct map and hibernation
> > code won't be able to save such pages.
> > 
> > To make page allocation debugging and hibernation interaction more
> > robust, the dependency on DEBUG_PAGEALLOC or ARCH_HAS_SET_DIRECT_MAP
> > has to be made more explicit.
> > 
> > Start with combining the guard condition and the call to 
> > __kernel_map_pages() into a single debug_pagealloc_map_pages()
> > function to emphasize that __kernel_map_pages() should not be called
> > without DEBUG_PAGEALLOC and use this new function to map/unmap pages
> > when page allocation debug is enabled.
> > 
> > As the only remaining user of kernel_map_pages() is the hibernation
> > code, mode that function into kernel/power/snapshot.c closer to a
> > caller.
> 
> s/mode/move/
> 
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com> --- 
> > include/linux/mm.h      | 16 +++++++--------- kernel/power/snapshot.c
> > | 11 +++++++++++ mm/memory_hotplug.c     |  3 +-- mm/page_alloc.c
> > |  6 ++---- mm/slab.c               |  8 +++----- 5 files changed, 24
> > insertions(+), 20 deletions(-)
> > 
> > diff --git a/include/linux/mm.h b/include/linux/mm.h index
> > ef360fe70aaf..14e397f3752c 100644 --- a/include/linux/mm.h +++
> > b/include/linux/mm.h @@ -2927,21 +2927,19 @@ static inline bool
> > debug_pagealloc_enabled_static(void) #if
> > defined(CONFIG_DEBUG_PAGEALLOC) ||
> > defined(CONFIG_ARCH_HAS_SET_DIRECT_MAP) extern void
> > __kernel_map_pages(struct page *page, int numpages, int enable);
> > 
> > -/* - * When called in DEBUG_PAGEALLOC context, the call should most
> > likely be - * guarded by debug_pagealloc_enabled() or
> > debug_pagealloc_enabled_static() - */ -static inline void 
> > -kernel_map_pages(struct page *page, int numpages, int enable) 
> > +static inline void debug_pagealloc_map_pages(struct page *page, +
> > int numpages, int enable) { -	__kernel_map_pages(page, numpages,
> > enable); +	if (debug_pagealloc_enabled_static()) +
> > __kernel_map_pages(page, numpages, enable); } + #ifdef
> > CONFIG_HIBERNATION extern bool kernel_page_present(struct page
> > *page); #endif	/* CONFIG_HIBERNATION */ #else	/*
> > CONFIG_DEBUG_PAGEALLOC || CONFIG_ARCH_HAS_SET_DIRECT_MAP */ -static
> > inline void -kernel_map_pages(struct page *page, int numpages, int
> > enable) {} +static inline void debug_pagealloc_map_pages(struct page
> > *page, +					     int numpages, int enable) {} #ifdef
> > CONFIG_HIBERNATION static inline bool kernel_page_present(struct page
> > *page) { return true; } #endif	/* CONFIG_HIBERNATION */ diff --git
> > a/kernel/power/snapshot.c b/kernel/power/snapshot.c index
> > 46b1804c1ddf..fa499466f645 100644 --- a/kernel/power/snapshot.c +++
> > b/kernel/power/snapshot.c @@ -76,6 +76,17 @@ static inline void
> > hibernate_restore_protect_page(void *page_address) {} static inline
> > void hibernate_restore_unprotect_page(void *page_address) {} #endif
> > /* CONFIG_STRICT_KERNEL_RWX  && CONFIG_ARCH_HAS_SET_MEMORY */
> > 
> > +#if defined(CONFIG_DEBUG_PAGEALLOC) ||
> > defined(CONFIG_ARCH_HAS_SET_DIRECT_MAP) +static inline void 
> > +kernel_map_pages(struct page *page, int numpages, int enable) +{ +
> > __kernel_map_pages(page, numpages, enable); +} +#else +static inline
> > void +kernel_map_pages(struct page *page, int numpages, int enable)
> > {} +#endif +
> 
> That change should go into a separate patch.
 
Hmm, I beleive you refer to moving kernel_map_pages() to snapshot.c,
right?

> For the debug_pagealloc_map_pages() parts
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
 
Thanks!

> -- 
> Thanks,
> 
> David / dhildenb
> 

-- 
Sincerely yours,
Mike.
