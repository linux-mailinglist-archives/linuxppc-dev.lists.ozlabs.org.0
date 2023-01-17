Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F7666E8C7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 22:56:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxN5206mnz2yg5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 08:56:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=O6tZSHHz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=O6tZSHHz;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxN452kBgz2yg5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 08:55:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dYK7QHEqGROj9cTFeHvfSuKosaNcqMrUb865g495bOk=; b=O6tZSHHzGKJZX1iAYHUlbpNdcq
	ZxrxvmTmmsbqr936EiEWOWMMqob8GgiHmdccZoQjFy2M7JSHlbZzbvs2TchncI+j0k3viYTmseIPC
	SRjOwRtExn9hUARvpUyEETZYLIXkShGyDfwMwJ/WYav3L6y7Iyc00H+U3nCuYm8W5n4LDo5BjuZ9p
	+4aRxAyoACCM8sQessBpBPk+zQMyvZ5Hh/ve5p02fFVP7yXt2nK4sqO5wiKupykfS5P04QW3XJyeU
	2jtbz1crNDA/cVwMfi6Bbdl8kHWAt1s79upbuw/UbeV07ohd0sPjx5OZI3OnS4vNsVmqG228akiwH
	AVrAhxbQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHtv0-00A4f1-Fg; Tue, 17 Jan 2023 21:54:58 +0000
Date: Tue, 17 Jan 2023 21:54:58 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 12/41] mm: add per-VMA lock and helper functions to
 control it
Message-ID: <Y8cZMt01Z1FvVFXh@casper.infradead.org>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-13-surenb@google.com>
 <Y8a4+bV1dYNAiUkD@dhcp22.suse.cz>
 <Y8a66gshQkkhC1cT@dhcp22.suse.cz>
 <CAJuCfpF2ciMbMFgqa4GqYqg8zjpnmBoNZDG23V0+w017LXeU3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpF2ciMbMFgqa4GqYqg8zjpnmBoNZDG23V0+w017LXeU3w@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, Michal Hocko <mhocko@suse.com>, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsin
 gularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 01:21:47PM -0800, Suren Baghdasaryan wrote:
> On Tue, Jan 17, 2023 at 7:12 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> > On Tue 17-01-23 16:04:26, Michal Hocko wrote:
> > > On Mon 09-01-23 12:53:07, Suren Baghdasaryan wrote:
> > > > Introduce a per-VMA rw_semaphore to be used during page fault handling
> > > > instead of mmap_lock. Because there are cases when multiple VMAs need
> > > > to be exclusively locked during VMA tree modifications, instead of the
> > > > usual lock/unlock patter we mark a VMA as locked by taking per-VMA lock
> > > > exclusively and setting vma->lock_seq to the current mm->lock_seq. When
> > > > mmap_write_lock holder is done with all modifications and drops mmap_lock,
> > > > it will increment mm->lock_seq, effectively unlocking all VMAs marked as
> > > > locked.
> > >
> > > I have to say I was struggling a bit with the above and only understood
> > > what you mean by reading the patch several times. I would phrase it like
> > > this (feel free to use if you consider this to be an improvement).
> > >
> > > Introduce a per-VMA rw_semaphore. The lock implementation relies on a
> > > per-vma and per-mm sequence counters to note exclusive locking:
> > >         - read lock - (implemented by vma_read_trylock) requires the the
> > >           vma (vm_lock_seq) and mm (mm_lock_seq) sequence counters to
> > >           differ. If they match then there must be a vma exclusive lock
> > >           held somewhere.
> > >         - read unlock - (implemented by vma_read_unlock) is a trivial
> > >           vma->lock unlock.
> > >         - write lock - (vma_write_lock) requires the mmap_lock to be
> > >           held exclusively and the current mm counter is noted to the vma
> > >           side. This will allow multiple vmas to be locked under a single
> > >           mmap_lock write lock (e.g. during vma merging). The vma counter
> > >           is modified under exclusive vma lock.
> >
> > Didn't realize one more thing.
> >             Unlike standard write lock this implementation allows to be
> >             called multiple times under a single mmap_lock. In a sense
> >             it is more of mark_vma_potentially_modified than a lock.
> 
> In the RFC it was called vma_mark_locked() originally and renames were
> discussed in the email thread ending here:
> https://lore.kernel.org/all/621612d7-c537-3971-9520-a3dec7b43cb4@suse.cz/.
> If other names are preferable I'm open to changing them.

I don't want to bikeshed this, but rather than locking it seems to be
more:

	vma_start_read()
	vma_end_read()
	vma_start_write()
	vma_end_write()
	vma_downgrade_write()

... and that these are _implemented_ with locks (in part) is an
implementation detail?

Would that reduce people's confusion?

> >
> > >         - write unlock - (vma_write_unlock_mm) is a batch release of all
> > >           vma locks held. It doesn't pair with a specific
> > >           vma_write_lock! It is done before exclusive mmap_lock is
> > >           released by incrementing mm sequence counter (mm_lock_seq).
> > >       - write downgrade - if the mmap_lock is downgraded to the read
> > >         lock all vma write locks are released as well (effectivelly
> > >         same as write unlock).
> > --
> > Michal Hocko
> > SUSE Labs
