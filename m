Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A26B52A7D5C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 12:42:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRhSv48hBzDqv4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 22:42:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=O5NamY7Z; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRhHT6W7RzDqtZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 22:33:57 +1100 (AEDT)
Received: from kernel.org (unknown [2.55.183.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B88CD2078E;
 Thu,  5 Nov 2020 11:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604576034;
 bh=XF8AFYO6bCr4yR/xfLGLwsLQBboi2XjYzZ3lYdi07mQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O5NamY7Z8bpeRF5e27pgfGmymIeBQK9j8XG2gMXDjk8aw+eMLitnhVpAzHAcLwHhk
 Sau6clNChqmtpHyfG8qukI1nlUaCTcmwOyX21+Rglf3ECyVc+/suIMbLHw9rP9no/V
 w2/7NKEKvUcFmM9Q4PjHmX+gHCO2wRPhSdhuvRyw=
Date: Thu, 5 Nov 2020 13:33:33 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH v4 2/4] PM: hibernate: make direct map manipulations more
 explicit
Message-ID: <20201105113333.GY4879@kernel.org>
References: <20201103162057.22916-1-rppt@kernel.org>
 <20201103162057.22916-3-rppt@kernel.org>
 <9a0780b4-35f8-0ded-c473-d8ab4a26ade5@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a0780b4-35f8-0ded-c473-d8ab4a26ade5@suse.cz>
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
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
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 04, 2020 at 06:40:28PM +0100, Vlastimil Babka wrote:
> On 11/3/20 5:20 PM, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > When DEBUG_PAGEALLOC or ARCH_HAS_SET_DIRECT_MAP is enabled a page may be
> > not present in the direct map and has to be explicitly mapped before it
> > could be copied.
> > 
> > Introduce hibernate_map_page() that will explicitly use
> > set_direct_map_{default,invalid}_noflush() for ARCH_HAS_SET_DIRECT_MAP case
> > and debug_pagealloc_map_pages() for DEBUG_PAGEALLOC case.
> > 
> > The remapping of the pages in safe_copy_page() presumes that it only
> > changes protection bits in an existing PTE and so it is safe to ignore
> > return value of set_direct_map_{default,invalid}_noflush().
> > 
> > Still, add a pr_warn() so that future changes in set_memory APIs will not
> > silently break hibernation.
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Reviewed-by: David Hildenbrand <david@redhat.com>
> > Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> 
> Acked-by: Vlastimil Babka <vbabka@suse.cz>
> 
> The bool param is a bit more acceptable here, being a private API. But if
> debug_pagealloc_map_pages() becomes split, then it might be easier to split
> this one too...

Let's split here as well.

> > ---
> >   include/linux/mm.h      | 12 ------------
> >   kernel/power/snapshot.c | 32 ++++++++++++++++++++++++++++++--
> >   2 files changed, 30 insertions(+), 14 deletions(-)
> > 
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 1fc0609056dc..14e397f3752c 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -2927,16 +2927,6 @@ static inline bool debug_pagealloc_enabled_static(void)
> >   #if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_ARCH_HAS_SET_DIRECT_MAP)
> >   extern void __kernel_map_pages(struct page *page, int numpages, int enable);
> > -/*
> > - * When called in DEBUG_PAGEALLOC context, the call should most likely be
> > - * guarded by debug_pagealloc_enabled() or debug_pagealloc_enabled_static()
> > - */
> > -static inline void
> > -kernel_map_pages(struct page *page, int numpages, int enable)
> > -{
> > -	__kernel_map_pages(page, numpages, enable);
> > -}
> > -
> >   static inline void debug_pagealloc_map_pages(struct page *page,
> >   					     int numpages, int enable)
> >   {
> > @@ -2948,8 +2938,6 @@ static inline void debug_pagealloc_map_pages(struct page *page,
> >   extern bool kernel_page_present(struct page *page);
> >   #endif	/* CONFIG_HIBERNATION */
> >   #else	/* CONFIG_DEBUG_PAGEALLOC || CONFIG_ARCH_HAS_SET_DIRECT_MAP */
> > -static inline void
> > -kernel_map_pages(struct page *page, int numpages, int enable) {}
> >   static inline void debug_pagealloc_map_pages(struct page *page,
> >   					     int numpages, int enable) {}
> >   #ifdef CONFIG_HIBERNATION
> > diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
> > index 46b1804c1ddf..57d54b9d84bb 100644
> > --- a/kernel/power/snapshot.c
> > +++ b/kernel/power/snapshot.c
> > @@ -76,6 +76,34 @@ static inline void hibernate_restore_protect_page(void *page_address) {}
> >   static inline void hibernate_restore_unprotect_page(void *page_address) {}
> >   #endif /* CONFIG_STRICT_KERNEL_RWX  && CONFIG_ARCH_HAS_SET_MEMORY */
> > +static inline void hibernate_map_page(struct page *page, int enable)
> > +{
> > +	if (IS_ENABLED(CONFIG_ARCH_HAS_SET_DIRECT_MAP)) {
> > +		unsigned long addr = (unsigned long)page_address(page);
> > +		int ret;
> > +
> > +		/*
> > +		 * This should not fail because remapping a page here means
> > +		 * that we only update protection bits in an existing PTE.
> > +		 * It is still worth to have a warning here if something
> > +		 * changes and this will no longer be the case.
> > +		 */
> > +		if (enable)
> > +			ret = set_direct_map_default_noflush(page);
> > +		else
> > +			ret = set_direct_map_invalid_noflush(page);
> > +
> > +		if (ret) {
> > +			pr_warn_once("Failed to remap page\n");
> > +			return;
> > +		}
> > +
> > +		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> > +	} else {
> > +		debug_pagealloc_map_pages(page, 1, enable);
> > +	}
> > +}
> > +
> >   static int swsusp_page_is_free(struct page *);
> >   static void swsusp_set_page_forbidden(struct page *);
> >   static void swsusp_unset_page_forbidden(struct page *);
> > @@ -1355,9 +1383,9 @@ static void safe_copy_page(void *dst, struct page *s_page)
> >   	if (kernel_page_present(s_page)) {
> >   		do_copy_page(dst, page_address(s_page));
> >   	} else {
> > -		kernel_map_pages(s_page, 1, 1);
> > +		hibernate_map_page(s_page, 1);
> >   		do_copy_page(dst, page_address(s_page));
> > -		kernel_map_pages(s_page, 1, 0);
> > +		hibernate_map_page(s_page, 0);
> >   	}
> >   }
> > 
> 

-- 
Sincerely yours,
Mike.
