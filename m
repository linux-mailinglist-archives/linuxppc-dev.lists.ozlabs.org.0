Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4BE6D5193
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Apr 2023 21:51:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pr1jV50cCz3cMs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 05:51:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=X60NF2vi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=X60NF2vi;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pr1hY0tzzz3cCD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Apr 2023 05:50:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HGctQB0MsRBtisRk2++z/+GWlNTueM1Ui8YvixFhQlY=; b=X60NF2viHjNcrKZmmtR7mlOIcZ
	1Y36Pe07ymKNMV3a8raWrlb4MRrCcrdjoAvIbIQjODociXLvioH6LYHzwVlwfWsvJq+Coq+a/0z/B
	cslo4SZh7ylCbnShU+ddLnjAk0nBSLoWs32ZKkGIAbvH2yttKqc7lXMcYSOWSd/dkFhurl+0xKNX0
	2gzCwU/YVPspZTaLjZf6xB7foALpxqVWfVraXkGPwiT1Nn/4ptB2CYzNFQb9qpeeVUrymrRKh9Tt0
	2WSTo+eQKqG+msljYC8OzkjMwNhCnm+5sQ4ESwLx/A81NxHyIciWE+1QzEz+kzcR0GJ0bZUGMIsmV
	QcRYx6yg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pjQB8-00ES6a-Ln; Mon, 03 Apr 2023 19:49:22 +0000
Date: Mon, 3 Apr 2023 20:49:22 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v3 26/35] mm: fall back to mmap_lock if vma->anon_vma is
 not yet set
Message-ID: <ZCstwjKhn76/mxIa@casper.infradead.org>
References: <20230216051750.3125598-1-surenb@google.com>
 <20230216051750.3125598-27-surenb@google.com>
 <Y+5Pb4hGmV1YtNQp@casper.infradead.org>
 <CAJuCfpHR8k0GsrYPMjSBVLAbu3EZgDU081+5CnR1td0cLEyDFw@mail.gmail.com>
 <CAJuCfpHODBAV=riSPyvcmLbZVtXSdxrw2GMy8VOjvDV9yCyX8A@mail.gmail.com>
 <Y++l181MMw+T70yt@casper.infradead.org>
 <CAJuCfpG_ZWJs3mZkL0z7m-bBe1SmeoTZydfFocZaRbHob_89Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpG_ZWJs3mZkL0z7m-bBe1SmeoTZydfFocZaRbHob_89Hg@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@goog
 le.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 17, 2023 at 08:10:35AM -0800, Suren Baghdasaryan wrote:
> On Fri, Feb 17, 2023 at 8:05 AM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Thu, Feb 16, 2023 at 06:14:59PM -0800, Suren Baghdasaryan wrote:
> > > On Thu, Feb 16, 2023 at 11:43 AM Suren Baghdasaryan <surenb@google.com> wrote:
> > > >
> > > > On Thu, Feb 16, 2023 at 7:44 AM Matthew Wilcox <willy@infradead.org> wrote:
> > > > >
> > > > > On Wed, Feb 15, 2023 at 09:17:41PM -0800, Suren Baghdasaryan wrote:
> > > > > > When vma->anon_vma is not set, page fault handler will set it by either
> > > > > > reusing anon_vma of an adjacent VMA if VMAs are compatible or by
> > > > > > allocating a new one. find_mergeable_anon_vma() walks VMA tree to find
> > > > > > a compatible adjacent VMA and that requires not only the faulting VMA
> > > > > > to be stable but also the tree structure and other VMAs inside that tree.
> > > > > > Therefore locking just the faulting VMA is not enough for this search.
> > > > > > Fall back to taking mmap_lock when vma->anon_vma is not set. This
> > > > > > situation happens only on the first page fault and should not affect
> > > > > > overall performance.
> > > > >
> > > > > I think I asked this before, but don't remember getting an aswer.
> > > > > Why do we defer setting anon_vma to the first fault?  Why don't we
> > > > > set it up at mmap time?
> > > >
> > > > Yeah, I remember that conversation Matthew and I could not find the
> > > > definitive answer at the time. I'll look into that again or maybe
> > > > someone can answer it here.
> > >
> > > After looking into it again I'm still under the impression that
> > > vma->anon_vma is populated lazily (during the first page fault rather
> > > than at mmap time) to avoid doing extra work for areas which are never
> > > faulted. Though I might be missing some important detail here.
> >
> > How often does userspace call mmap() and then _never_ fault on it?
> > I appreciate that userspace might mmap() gigabytes of address space and
> > then only end up using a small amount of it, so populating it lazily
> > makes sense.  But creating a region and never faulting on it?  The only
> > use-case I can think of is loading shared libraries:
> >
> > openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
> > (...)
> > mmap(NULL, 1970000, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f0ce612e000
> > mmap(0x7f0ce6154000, 1396736, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x26000) = 0x7f0ce6154000
> > mmap(0x7f0ce62a9000, 339968, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x17b000) = 0x7f0ce62a9000
> > mmap(0x7f0ce62fc000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1ce000) = 0x7f0ce62fc000
> > mmap(0x7f0ce6302000, 53072, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f0ce6302000
> >
> > but that's a file-backed VMA, not an anon VMA.
> 
> Might the case of dup_mmap() while forking be the reason why a VMA in
> the child process might be never used while parent uses it (or visa
> versa)? Again, I'm not sure this is the reason but I can find no other
> good explanation.

I found an explanation!  Well, a partial one.  If we MAP_PRIVATE a file
mapping (like, er those ones up there) and only take read faults on it,
we can postpone allocation of the anon_vma indefinitely.  But once we
take a write fault in that VMA, we need to allocate an anon_vma for it
so that we can track the anonymous pages that have been allocated to
satisfy the copy-on-write (see do_cow_fault()).

However, I think in that caase, we could probably skip the
find_mergeable_anon_vma() step.  We don't today; we check whether
a->vm_file == b->vm_file in anon_vma_compatible, but I wonder if that
triggers often.

