Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A118566E5E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 19:24:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxHP43qqcz3ch0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 05:24:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=mEluEUKE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=mEluEUKE;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxHN31sWxz3c6f
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 05:24:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XSVCY3skPmpUfyMO6XuiNShJAohbJi5MJ+0Tl/OQUuk=; b=mEluEUKEDZTyyDRpL261mqgUP9
	+oWDZVX/939c909IkEujz+5khCUlk0qOmmCBOOt8jtKddSVusCBFb9ScfvddAieediYlWLsZGvbPU
	gGGXDadE03QIEDHX5V7yGFQsW7tadIpolftpzK+aHNUrxUhONvsFXMWrupAS+vHfu2z7nIdDpPLnr
	sUr6vc584V1N2NE72pohE5J1oRqScKE6VlFtORFuIFpAcUiPgUB+duQxe9dZ7JbgOqu24MFvdIZpo
	06YDcK8usO6+UsjwIgUQzhshHBEVMboByXpfHEdkep+Eov/2x34RXGz4SHfdJiNQc/QTDhwNOULG5
	FkfgV8aQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHqcQ-009uA2-Oe; Tue, 17 Jan 2023 18:23:34 +0000
Date: Tue, 17 Jan 2023 18:23:34 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 41/41] mm: replace rw_semaphore with atomic_t in vma_lock
Message-ID: <Y8bnpqw134CHenz/@casper.infradead.org>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-42-surenb@google.com>
 <Y8UxnqPCTLbbD+2F@localhost>
 <Y8YgomKF189vmgLz@casper.infradead.org>
 <CAJuCfpECJhUu3fvWbBzmAkEA3+1LTkKqJOVadQB_-_mEHME=xg@mail.gmail.com>
 <Y8Y2JErbNQOhL8ee@casper.infradead.org>
 <CAJuCfpEx6FJpm0Js=cvcHw6mY3izPfoskxseSMyxFAxLX97X_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpEx6FJpm0Js=cvcHw6mY3izPfoskxseSMyxFAxLX97X_w@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, Hyeonggon Yoo <42.hyeyoo@gmail.com>, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@googl
 e.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 16, 2023 at 09:58:35PM -0800, Suren Baghdasaryan wrote:
> On Mon, Jan 16, 2023 at 9:46 PM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Mon, Jan 16, 2023 at 08:34:36PM -0800, Suren Baghdasaryan wrote:
> > > On Mon, Jan 16, 2023 at 8:14 PM Matthew Wilcox <willy@infradead.org> wrote:
> > > >
> > > > On Mon, Jan 16, 2023 at 11:14:38AM +0000, Hyeonggon Yoo wrote:
> > > > > > @@ -643,20 +647,28 @@ static inline void vma_write_lock(struct vm_area_struct *vma)
> > > > > >  static inline bool vma_read_trylock(struct vm_area_struct *vma)
> > > > > >  {
> > > > > >     /* Check before locking. A race might cause false locked result. */
> > > > > > -   if (vma->vm_lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))
> > > > > > +   if (vma->vm_lock->lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))
> > > > > >             return false;
> > > > > >
> > > > > > -   if (unlikely(down_read_trylock(&vma->vm_lock->lock) == 0))
> > > > > > +   if (unlikely(!atomic_inc_unless_negative(&vma->vm_lock->count)))
> > > > > >             return false;
> > > > > >
> > > > > > +   /* If atomic_t overflows, restore and fail to lock. */
> > > > > > +   if (unlikely(atomic_read(&vma->vm_lock->count) < 0)) {
> > > > > > +           if (atomic_dec_and_test(&vma->vm_lock->count))
> > > > > > +                   wake_up(&vma->vm_mm->vma_writer_wait);
> > > > > > +           return false;
> > > > > > +   }
> > > > > > +
> > > > > >     /*
> > > > > >      * Overflow might produce false locked result.
> > > > > >      * False unlocked result is impossible because we modify and check
> > > > > >      * vma->vm_lock_seq under vma->vm_lock protection and mm->mm_lock_seq
> > > > > >      * modification invalidates all existing locks.
> > > > > >      */
> > > > > > -   if (unlikely(vma->vm_lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))) {
> > > > > > -           up_read(&vma->vm_lock->lock);
> > > > > > +   if (unlikely(vma->vm_lock->lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))) {
> > > > > > +           if (atomic_dec_and_test(&vma->vm_lock->count))
> > > > > > +                   wake_up(&vma->vm_mm->vma_writer_wait);
> > > > > >             return false;
> > > > > >     }
> > > > >
> > > > > With this change readers can cause writers to starve.
> > > > > What about checking waitqueue_active() before or after increasing
> > > > > vma->vm_lock->count?
> > > >
> > > > I don't understand how readers can starve a writer.  Readers do
> > > > atomic_inc_unless_negative() so a writer can always force readers
> > > > to fail.
> > >
> > > I think the point here was that if page faults keep occuring and they
> > > prevent vm_lock->count from reaching 0 then a writer will be blocked
> > > and there is no reader throttling mechanism (no max time that writer
> > > will be waiting).
> >
> > Perhaps I misunderstood your description; I thought that a _waiting_
> > writer would make the count negative, not a successfully acquiring
> > writer.
> 
> A waiting writer does not modify the counter, instead it's placed on
> the wait queue and the last reader which sets the count to 0 while
> releasing its read lock will wake it up. Once the writer is woken it
> will try to set the count to negative and if successful will own the
> lock, otherwise it goes back to sleep.

Then yes, that's a starvable lock.  Preventing starvation on the mmap
sem was the original motivation for making rwsems non-starvable, so
changing that behaviour now seems like a bad idea.  For efficiency, I'd
suggest that a waiting writer set the top bit of the counter.  That way,
all new readers will back off without needing to check a second variable
and old readers will know that they *may* need to do the wakeup when
atomic_sub_return_release() is negative.

(rwsem.c has a more complex bitfield, but I don't think we need to go
that far; the important point is that the waiting writer indicates its
presence in the count field so that readers can modify their behaviour)
