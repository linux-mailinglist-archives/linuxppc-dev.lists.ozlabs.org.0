Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1562A66D5BC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 06:47:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nwyb56Lb4z3cDD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 16:47:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=P5cLpNHv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=P5cLpNHv;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwyZ72Rxxz3bNg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 16:46:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Y+G3RMYpPUCpeVuUHshColV5JZSGDtGhPdizzIP2wms=; b=P5cLpNHv6wO/jMH62R5ivyuODF
	9VsvXC8b/excwArNe/KRkxWV2mLKsX2xgsbEwt66Kpn346Prm3dUGTZPNLMImD+nitRxhxo3xsvrJ
	mfWg3QFSX5Pnkn3FwXGIL0mp4sWpaCgjBACW/+8RJtWIR3s1pBjFwfBDXT+otbyR6bwQonX/+BNxd
	m4lbN1/gZznRAQ0EpxpP7GMJZxelmPWujsE6/6vtlABgFHE/nyJ+bG6wPajtevQ+GbMdPYR+7Tt7o
	zrVDxwqxl2pwLVtaerw4OF9cO5ys5rZNxm/Sm8Y2+JIni90YzxmlfVcFMmeuOLlaAh3xxs8PtamWR
	Fca2JJYQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHenU-009Pje-4O; Tue, 17 Jan 2023 05:46:12 +0000
Date: Tue, 17 Jan 2023 05:46:12 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 41/41] mm: replace rw_semaphore with atomic_t in vma_lock
Message-ID: <Y8Y2JErbNQOhL8ee@casper.infradead.org>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-42-surenb@google.com>
 <Y8UxnqPCTLbbD+2F@localhost>
 <Y8YgomKF189vmgLz@casper.infradead.org>
 <CAJuCfpECJhUu3fvWbBzmAkEA3+1LTkKqJOVadQB_-_mEHME=xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpECJhUu3fvWbBzmAkEA3+1LTkKqJOVadQB_-_mEHME=xg@mail.gmail.com>
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

On Mon, Jan 16, 2023 at 08:34:36PM -0800, Suren Baghdasaryan wrote:
> On Mon, Jan 16, 2023 at 8:14 PM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Mon, Jan 16, 2023 at 11:14:38AM +0000, Hyeonggon Yoo wrote:
> > > > @@ -643,20 +647,28 @@ static inline void vma_write_lock(struct vm_area_struct *vma)
> > > >  static inline bool vma_read_trylock(struct vm_area_struct *vma)
> > > >  {
> > > >     /* Check before locking. A race might cause false locked result. */
> > > > -   if (vma->vm_lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))
> > > > +   if (vma->vm_lock->lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))
> > > >             return false;
> > > >
> > > > -   if (unlikely(down_read_trylock(&vma->vm_lock->lock) == 0))
> > > > +   if (unlikely(!atomic_inc_unless_negative(&vma->vm_lock->count)))
> > > >             return false;
> > > >
> > > > +   /* If atomic_t overflows, restore and fail to lock. */
> > > > +   if (unlikely(atomic_read(&vma->vm_lock->count) < 0)) {
> > > > +           if (atomic_dec_and_test(&vma->vm_lock->count))
> > > > +                   wake_up(&vma->vm_mm->vma_writer_wait);
> > > > +           return false;
> > > > +   }
> > > > +
> > > >     /*
> > > >      * Overflow might produce false locked result.
> > > >      * False unlocked result is impossible because we modify and check
> > > >      * vma->vm_lock_seq under vma->vm_lock protection and mm->mm_lock_seq
> > > >      * modification invalidates all existing locks.
> > > >      */
> > > > -   if (unlikely(vma->vm_lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))) {
> > > > -           up_read(&vma->vm_lock->lock);
> > > > +   if (unlikely(vma->vm_lock->lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))) {
> > > > +           if (atomic_dec_and_test(&vma->vm_lock->count))
> > > > +                   wake_up(&vma->vm_mm->vma_writer_wait);
> > > >             return false;
> > > >     }
> > >
> > > With this change readers can cause writers to starve.
> > > What about checking waitqueue_active() before or after increasing
> > > vma->vm_lock->count?
> >
> > I don't understand how readers can starve a writer.  Readers do
> > atomic_inc_unless_negative() so a writer can always force readers
> > to fail.
> 
> I think the point here was that if page faults keep occuring and they
> prevent vm_lock->count from reaching 0 then a writer will be blocked
> and there is no reader throttling mechanism (no max time that writer
> will be waiting).

Perhaps I misunderstood your description; I thought that a _waiting_
writer would make the count negative, not a successfully acquiring
writer.
