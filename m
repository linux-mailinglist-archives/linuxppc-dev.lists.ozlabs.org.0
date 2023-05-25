Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C0B711894
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 22:58:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QS0kn5l0dz3fHN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 06:58:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=jz222m+q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=jz222m+q;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QS0jm48YXz3fKX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 06:57:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=w/nv11jmZL//tzZgnsZQ422wtTnnU+GBTr8mcjZt+5o=; b=jz222m+qmkx46CtsL2SK6imku3
	qq2pJIrpZYwwtoNlBcZF7Fk0xlPqceK3lGx9yfcEP5je3dxHl9hetkE+18QuDijP55CEPQoODBYNI
	uvYKUPiKzBlONmhR187tH+srkvPeqkL343XpLTCXJPsX8gyRZRXys5FShMS4Kw48PvGIyNIrdiJob
	qzWNUEmQ7TjGXaPWTNoBqzaR0fCIqDhz5vX5aceLEg5RLyYCA0NTJNp94Q35H+/kQzQkdBPbuLfU0
	BUQp3kv2YpGE9fMQX8b3xVpJANGw8phzZpM8mq6dy60BHa+pYvxVMkKbTWE80Y8Sdq1m5IiayRsFG
	t/mQy7HA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q2I19-00DAXr-9n; Thu, 25 May 2023 20:57:03 +0000
Date: Thu, 25 May 2023 21:57:03 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Vishal Moola <vishal.moola@gmail.com>
Subject: Re: [PATCH v2 01/34] mm: Add PAGE_TYPE_OP folio functions
Message-ID: <ZG/Ln0Nf/Zx//EQk@casper.infradead.org>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-2-vishal.moola@gmail.com>
 <20230525085555.GV4967@kernel.org>
 <CAOzc2pxx489C26NnS9NHkUQY9PYiagzt-nYK6LnkJ1N3NYQWzg@mail.gmail.com>
 <20230525202011.GZ4967@kernel.org>
 <CAOzc2pzGPBYL3S=noc1AAEtep04GexRmn2f_T3BPgVFZKaqXTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOzc2pzGPBYL3S=noc1AAEtep04GexRmn2f_T3BPgVFZKaqXTg@mail.gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Mike Rapoport <rppt@kernel.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 25, 2023 at 01:38:54PM -0700, Vishal Moola wrote:
> On Thu, May 25, 2023 at 1:20 PM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > On Thu, May 25, 2023 at 10:00:23AM -0700, Vishal Moola wrote:
> > > On Thu, May 25, 2023 at 1:56 AM Mike Rapoport <rppt@kernel.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Mon, May 01, 2023 at 12:27:56PM -0700, Vishal Moola (Oracle) wrote:
> > > > > No folio equivalents for page type operations have been defined, so
> > > > > define them for later folio conversions.
> > > >
> > > > Can you please elaborate why would we need folios for page table descriptors?
> > >
> > > Thanks for the review!
> > >
> > > These macros are for callers that care about the page type, i.e. Table and
> > > Buddy. Aside from accounting for those cases, the page tables don't use folios.
> > > These are more for the cleanliness of those callers.
> >
> > But why using folio APIs for PageType will be cleaner than using page APIs?
> > Do you have an example?
> 
> Ah, for example in mm/memory-failure.c there are a couple uses of PageTable.
> Like the line :
> if (folio_test_slab(folio) || PageTable(&folio->page) ||
> folio_test_reserved(folio))
> where that PageTable(&folio->page) can now be written as folio_test_table(folio)
> instead.
> 
> Also there are numerous uses of PageBuddy in mm/compaction.c that will
> likely need to be converted to folios as well.

... and you can currently call PageTable() on the second/third/... page
of an allocation and it will return false, regardless of what the
first page is typed as.  For most architectures, this doesn't matter,
but /proc/kpageflags will underreport the amount of memory allocated
as page tables on architectures which use multi-page allocations for
their page tables as there's currently absolutely nothing to indicate
the size of the allocation.

To fix this, we need to use __GFP_COMP.
