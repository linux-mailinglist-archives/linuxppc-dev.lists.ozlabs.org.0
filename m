Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA9B2A2DE3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 16:16:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPxLw6x10zDqRr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 02:15:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=U5iA6iZ+; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPxHs3L5RzDqQj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 02:13:13 +1100 (AEDT)
Received: from kernel.org (unknown [87.71.17.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97C3A22258;
 Mon,  2 Nov 2020 15:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604329990;
 bh=pQm13rJ0TtLsoFHOZA52H/TzTWUyG6xri7XGlle4HPo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U5iA6iZ+4RrbBTruBVP23DAtPFm6+kceLiKQw3J0W+zg1uOK+4S4JJxuhMMUqU1YR
 AbaxuhUr3wcVgMFL7UiNf9Rgt38tsM1oxGu8FMS5KMZthwA6c6ykTjZZtEvaQ3kHdo
 qOQc20cDKQCRHjZYM2XM4fU6aSAxgj4DgVoNXSRU=
Date: Mon, 2 Nov 2020 17:12:56 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 2/4] PM: hibernate: make direct map manipulations more
 explicit
Message-ID: <20201102151256.GA4879@kernel.org>
References: <20201101170815.9795-1-rppt@kernel.org>
 <20201101170815.9795-3-rppt@kernel.org>
 <55cd2a4a-cfa8-d420-66b3-a25fcdd9b876@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55cd2a4a-cfa8-d420-66b3-a25fcdd9b876@redhat.com>
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
 Peter Zijlstra <peterz@infradead.org>,
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

On Mon, Nov 02, 2020 at 10:19:36AM +0100, David Hildenbrand wrote:
> On 01.11.20 18:08, Mike Rapoport wrote:
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
> > Still, add a WARN_ON() so that future changes in set_memory APIs will not
> > silently break hibernation.
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >   include/linux/mm.h      | 12 ------------
> >   kernel/power/snapshot.c | 30 ++++++++++++++++++++++++++++--
> >   2 files changed, 28 insertions(+), 14 deletions(-)
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
> > index 46b1804c1ddf..054c8cce4236 100644
> > --- a/kernel/power/snapshot.c
> > +++ b/kernel/power/snapshot.c
> > @@ -76,6 +76,32 @@ static inline void hibernate_restore_protect_page(void *page_address) {}
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
> > +		 * It is still worth to have WARN_ON() here if something
> > +		 * changes and this will no longer be the case.
> > +		 */
> > +		if (enable)
> > +			ret = set_direct_map_default_noflush(page);
> > +		else
> > +			ret = set_direct_map_invalid_noflush(page);
> > +
> > +		if (WARN_ON(ret))
> > +			return;
> 
> People seem to prefer pr_warn() now that production kernels have panic on
> warn enabled. It's weird.

Weird indeed as the whole point of WARN to yell without causing a
crash...
I can change to pr_warn though...

> > +
> > +		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> > +	} else {
> > +		debug_pagealloc_map_pages(page, 1, enable);
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
