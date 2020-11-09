Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE77E2ABF1E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 15:46:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVDMZ5jpHzDqgF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 01:46:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=AACidaKd; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVDGh4kDkzDqcV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 01:42:04 +1100 (AEDT)
Received: from kernel.org (unknown [77.125.7.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D215206E3;
 Mon,  9 Nov 2020 14:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604932922;
 bh=XyH/OGSoZtwKFi7Dr6r4PbxrZ95WCPZt6ITMBGRDbT8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AACidaKdvM9fjww+sp/aLxSmuCgmX5y5VInfhx0TIj5OjJteJpSMpOU9k+cy2ANao
 bPCbw8OTl+tQ2hkhXviYnObTrxDMTytkrEn70tTATzIjRMFL7twkjoJg60mbELrRtH
 jrhu4hO9i4CTCZoHNJYPLc9KZT9JgGfbJFGI+3OU=
Date: Mon, 9 Nov 2020 16:41:48 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH v5 1/5] mm: introduce debug_pagealloc_{map, unmap}_pages()
 helpers
Message-ID: <20201109144148.GE301837@kernel.org>
References: <20201108065758.1815-1-rppt@kernel.org>
 <20201108065758.1815-2-rppt@kernel.org>
 <4bd5ae2b-4fc6-73dc-b83b-e71826990946@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bd5ae2b-4fc6-73dc-b83b-e71826990946@suse.cz>
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
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

On Mon, Nov 09, 2020 at 12:33:46PM +0100, Vlastimil Babka wrote:
> On 11/8/20 7:57 AM, Mike Rapoport wrote:
> > --- a/mm/slab.c
> > +++ b/mm/slab.c
> > @@ -1428,21 +1428,19 @@ static bool is_debug_pagealloc_cache(struct kmem_cache *cachep)
> >   	return false;
> >   }
> > -#ifdef CONFIG_DEBUG_PAGEALLOC
> >   static void slab_kernel_map(struct kmem_cache *cachep, void *objp, int map)
> >   {
> >   	if (!is_debug_pagealloc_cache(cachep))
> >   		return;
> 
> Hmm, I didn't notice earlier, sorry.
> The is_debug_pagealloc_cache() above includes a
> debug_pagealloc_enabled_static() check, so it should be fine to use
> __kernel_map_pages() directly below. Otherwise we generate two static key
> checks for the same key needlessly.

Ok, I'll revert slab changes.

> > -	kernel_map_pages(virt_to_page(objp), cachep->size / PAGE_SIZE, map);
> > +	if (map)
> > +		debug_pagealloc_map_pages(virt_to_page(objp),
> > +					  cachep->size / PAGE_SIZE);
> > +	else
> > +		debug_pagealloc_unmap_pages(virt_to_page(objp),
> > +					    cachep->size / PAGE_SIZE);
> >   }
> > -#else
> > -static inline void slab_kernel_map(struct kmem_cache *cachep, void *objp,
> > -				int map) {}
> > -
> > -#endif
> > -
> >   static void poison_obj(struct kmem_cache *cachep, void *addr, unsigned char val)
> >   {
> >   	int size = cachep->object_size;
> > @@ -2062,7 +2060,7 @@ int __kmem_cache_create(struct kmem_cache *cachep, slab_flags_t flags)
> >   #if DEBUG
> >   	/*
> > -	 * If we're going to use the generic kernel_map_pages()
> > +	 * If we're going to use the generic debug_pagealloc_map_pages()
> >   	 * poisoning, then it's going to smash the contents of
> >   	 * the redzone and userword anyhow, so switch them off.
> >   	 */
> > 
> 

-- 
Sincerely yours,
Mike.
