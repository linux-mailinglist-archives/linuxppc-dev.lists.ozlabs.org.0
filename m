Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5F867849C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 19:25:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0z6S4hm1z3cFY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 05:25:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=GTYwYH7n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=GTYwYH7n;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0z5T3T8Gz2ynD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 05:24:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=B+yzq/Z0e8jumLGKSlhRVExf8hQcAkabvnjcTYI9KiY=; b=GTYwYH7nNq+4sMY3Vk3QgXskdG
	2L0ANeqflfK/jWWxB3yA/UDdJse/cePbqp6JZ8LYI+ze4uQ2DiYVBbpxRZqbnNpgx7+PiwTdZAWQA
	SPQ8VEgtJD+rLax4CdxZofnTxPHlBnCYqKh2woEwBT70dhcwKjgs/lXEeBXNZqJJqrbREEMkZCIOC
	eUu/2OzjQqN0hU4Otc/g+SXPiM42qqmVRB3hjb21IaWZjIZNTf9WW/47lCPpArGf0Iosgqs1mCKFf
	0wABKYADlN5xm08SG1OokKkWTXE5xfSYdcp7g2ktegETsutXNqTGIlbKeQljQR19PgiMGAq4KA1NB
	eZTb8cWA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK1TI-004R6r-TB; Mon, 23 Jan 2023 18:23:09 +0000
Date: Mon, 23 Jan 2023 18:23:08 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 39/41] kernel/fork: throttle call_rcu() calls in
 vm_area_free
Message-ID: <Y87QjHH2aDG5XCGv@casper.infradead.org>
References: <20230120170815.yuylbs27r6xcjpq5@revolver>
 <CAJuCfpH4o-iCmzdUcYD9bKieJ6-k-MZYLuHFhH+bN9yE07sibw@mail.gmail.com>
 <Y8rQNj5dVyuxRBOf@casper.infradead.org>
 <CAJuCfpG3YaExGkzsSSm0tXjMiSoM6rVf0JQgfrWu4UY5gsw=-w@mail.gmail.com>
 <Y85Z0Ovl68o4cz2j@dhcp22.suse.cz>
 <CAJuCfpG86qc4odkpUbzuROb+jThQgXGWjcFXb0e-c2i0wEGg4g@mail.gmail.com>
 <Y868Fadajv27QMXh@dhcp22.suse.cz>
 <CAJuCfpGSCHpnZwwVV_922fmMBpFPZL0HAHMABuDzMfuURF2sWg@mail.gmail.com>
 <Y87A2CEKAugfgfHC@dhcp22.suse.cz>
 <CAJuCfpGJRZATfc8eUurvV5kGkSNkG=vK=sfwJbU72PESOyATSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpGJRZATfc8eUurvV5kGkSNkG=vK=sfwJbU72PESOyATSw@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, Michal Hocko <mhocko@suse.com>, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, "Liam R. Howlett" <Liam.Howlett@oracle.com>, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.
 com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 23, 2023 at 09:46:20AM -0800, Suren Baghdasaryan wrote:
> On Mon, Jan 23, 2023 at 9:16 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> > On Mon 23-01-23 09:07:34, Suren Baghdasaryan wrote:
> > > On Mon, Jan 23, 2023 at 8:55 AM Michal Hocko <mhocko@suse.com> wrote:
> > > >
> > > > On Mon 23-01-23 08:22:53, Suren Baghdasaryan wrote:
> > > > > On Mon, Jan 23, 2023 at 1:56 AM Michal Hocko <mhocko@suse.com> wrote:
> > > > > >
> > > > > > On Fri 20-01-23 09:50:01, Suren Baghdasaryan wrote:
> > > > > > > On Fri, Jan 20, 2023 at 9:32 AM Matthew Wilcox <willy@infradead.org> wrote:
> > > > > > [...]
> > > > > > > > The page fault handler (or whatever other reader -- ptrace, proc, etc)
> > > > > > > > should have a refcount on the mm_struct, so we can't be in this path
> > > > > > > > trying to free VMAs.  Right?
> > > > > > >
> > > > > > > Hmm. That sounds right. I checked process_mrelease() as well, which
> > > > > > > operated on mm with only mmgrab()+mmap_read_lock() but it only unmaps
> > > > > > > VMAs without freeing them, so we are still good. Michal, do you agree
> > > > > > > this is ok?
> > > > > >
> > > > > > Don't we need RCU procetions for the vma life time assurance? Jann has
> > > > > > already shown how rwsem is not safe wrt to unlock and free without RCU.
> > > > >
> > > > > Jann's case requires a thread freeing the VMA to be blocked on vma
> > > > > write lock waiting for the vma real lock to be released by a page
> > > > > fault handler. However exit_mmap() means mm->mm_users==0, which in
> > > > > turn suggests that there are no racing page fault handlers and no new
> > > > > page fault handlers will appear. Is that a correct assumption? If so,
> > > > > then races with page fault handlers can't happen while in exit_mmap().
> > > > > Any other path (other than page fault handlers), accesses vma->lock
> > > > > under protection of mmap_lock (for read or write, does not matter).
> > > > > One exception is when we operate on an isolated VMA, then we don't
> > > > > need mmap_lock protection, but exit_mmap() does not deal with isolated
> > > > > VMAs, so out of scope here. exit_mmap() frees vm_area_structs under
> > > > > protection of mmap_lock in write mode, so races with anything other
> > > > > than page fault handler should be safe as they are today.
> > > >
> > > > I do not see you talking about #PF (RCU + vma read lock protected) with
> > > > munmap. It is my understanding that the latter will synchronize over per
> > > > vma lock (along with mmap_lock exclusive locking). But then we are back
> > > > to the lifetime guarantees, or do I miss anything.
> > >
> > > munmap() or any VMA-freeing operation other than exit_mmap() will free
> > > using call_rcu(), as implemented today. The suggestion is to free VMAs
> > > directly, without RCU grace period only when done from exit_mmap().
> >
> > OK, I have clearly missed that. This makes more sense but it also adds
> > some more complexity and assumptions - a harder to maintain code in the
> > end. Whoever wants to touch this scheme in future would have to
> > re-evaluate all of them. So, I would just avoid that special casing if
> > that is feasible.
> 
> Ok, I understand your point.
> 
> >
> > Dealing with the flood of call_rcu during exit_mmap is a trivial thing
> > to deal with as proposed elsewhere (just batch all of them in a single
> > run). This will surely add some more code but at least the locking would
> > consistent.
> 
> Yes, batching the vmas into a list and draining it in remove_mt() and
> exit_mmap() as you suggested makes sense to me and is quite simple.
> Let's do that if nobody has objections.

I object.  We *know* nobody has a reference to any of the VMAs because
you have to have a refcount on the mm before you can get a reference
to a VMA.  If Michal is saying that somebody could do:

	mmget(mm);
	vma = find_vma(mm);
	lock_vma(vma);
	mmput(mm);
	vma->a = b;
	unlock_vma(mm, vma);

then that's something we'd catch in review -- you obviously can't use
the mm after you've dropped your reference to it.

Having all this extra code to solve two problems badly is a very poor
choice.  We have two distinct problems, each of which has a simple,
efficient solution.

