Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA52866E664
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 19:49:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxHxG4dl2z3fC3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 05:49:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=If96WMO3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=If96WMO3;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxHwL4W1Fz3c6X
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 05:48:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4ei8DN4xoI7q+Mi7aRIGqiZxm7UY0w7vz3mLthbLe1k=; b=If96WMO3JL8wGi0lqkg9YBuOMp
	I4zZJGeOQc1TG1UTINhSSp8ySLEyWyptBt7FUi6oFTm+mqgs0UcHZ0EdmhQm4dodBKS/Hw0sGBqu+
	x+DkT2XT6XoF7Sp+pB5nZOas+8Xj7PHMLT8W4BKJgVeQkih9A6yTFcFl2iBJ0BCqulbU9UYfAvc4J
	FAaV71OVDApfKIXMPOMCP599ea+PdvJDIWfefrljmE8M7ThB5aS1OgX+GPqNnuvoufc4xuIX/Lq30
	NrVXQYo9o8RA3Vf/FPIZ/rkvTDYN9W8whGkyy7EaTaqK34jJoBgHVBLgA4Y7ymU1ThrKjNAA7eZG5
	LJAWEwzg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHr04-009vFr-26; Tue, 17 Jan 2023 18:48:00 +0000
Date: Tue, 17 Jan 2023 18:48:00 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 41/41] mm: replace rw_semaphore with atomic_t in vma_lock
Message-ID: <Y8btYASD3jmdCf5n@casper.infradead.org>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-42-surenb@google.com>
 <CAG48ez3ZNt+B3XvAMP1OaeEYuwpXJ1epmT9YtNonFLEJ6yANVQ@mail.gmail.com>
 <CAJuCfpFruHecz9NssGGFrG-RqbJFHCfRuZ7c6GbTBD4x4AU8aA@mail.gmail.com>
 <Y8bpfzYvWq/3ttr+@casper.infradead.org>
 <CAJuCfpHkgRDpMJXd6vnCmB50PnSOwDY9pjhW5LcdR+fU5JUseA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpHkgRDpMJXd6vnCmB50PnSOwDY9pjhW5LcdR+fU5JUseA@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, Jann Horn <jannh@google.com>, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingul
 arity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 10:36:42AM -0800, Suren Baghdasaryan wrote:
> On Tue, Jan 17, 2023 at 10:31 AM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Tue, Jan 17, 2023 at 10:26:32AM -0800, Suren Baghdasaryan wrote:
> > > On Tue, Jan 17, 2023 at 10:12 AM Jann Horn <jannh@google.com> wrote:
> > > >
> > > > On Mon, Jan 9, 2023 at 9:55 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > > > > rw_semaphore is a sizable structure of 40 bytes and consumes
> > > > > considerable space for each vm_area_struct. However vma_lock has
> > > > > two important specifics which can be used to replace rw_semaphore
> > > > > with a simpler structure:
> > > > [...]
> > > > >  static inline void vma_read_unlock(struct vm_area_struct *vma)
> > > > >  {
> > > > > -       up_read(&vma->vm_lock->lock);
> > > > > +       if (atomic_dec_and_test(&vma->vm_lock->count))
> > > > > +               wake_up(&vma->vm_mm->vma_writer_wait);
> > > > >  }
> > > >
> > > > I haven't properly reviewed this, but this bit looks like a
> > > > use-after-free because you're accessing the vma after dropping your
> > > > reference on it. You'd have to first look up the vma->vm_mm, then do
> > > > the atomic_dec_and_test(), and afterwards do the wake_up() without
> > > > touching the vma. Or alternatively wrap the whole thing in an RCU
> > > > read-side critical section if the VMA is freed with RCU delay.
> > >
> > > vm_lock->count does not control the lifetime of the VMA, it's a
> > > counter of how many readers took the lock or it's negative if the lock
> > > is write-locked.
> >
> > Yes, but ...
> >
> >         Task A:
> >         atomic_dec_and_test(&vma->vm_lock->count)
> >                         Task B:
> >                         munmap()
> >                         write lock
> >                         free VMA
> >                         synchronize_rcu()
> >                         VMA is really freed
> >         wake_up(&vma->vm_mm->vma_writer_wait);
> >
> > ... vma is freed.
> >
> > Now, I think this doesn't occur.  I'm pretty sure that every caller of
> > vma_read_unlock() is holding the RCU read lock.  But maybe we should
> > have that assertion?
> 
> Yep, that's what this patch is doing
> https://lore.kernel.org/all/20230109205336.3665937-27-surenb@google.com/
> by calling vma_assert_no_reader() from __vm_area_free().

That's not enough though.  Task A still has a pointer to vma after it
has called atomic_dec_and_test(), even after vma has been freed by
Task B, and before Task A dereferences vma->vm_mm.
