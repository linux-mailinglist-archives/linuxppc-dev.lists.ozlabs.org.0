Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FF5671752
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 10:19:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxgDw1Vmpz3cD9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 20:19:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=g0sbYN+b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=mhocko@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=g0sbYN+b;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxgCx341vz3bTk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 20:18:19 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E7FF321018;
	Wed, 18 Jan 2023 09:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674033496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=438nt7jo257JN0NDxWdsUaukIUI34KHbTWX932uaDtE=;
	b=g0sbYN+brR7TQ3n0vUl1nEJKdgAcwgOWuLvnlLuh4Ljm8yKKlyqyRzYGHHlJ5G4hSinscU
	ZwP8lIlnwOEaHQfwZADHptX9kCosF1BY1oVLj3MPqBe8P2Z04nTaF1g+yfLgx9dN97jLsY
	EwMwLYb1PZKQWvPDR+TlDdUSo2KdsOI=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1C1E3139D2;
	Wed, 18 Jan 2023 09:18:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ThJ9Ble5x2OpMgAAMHmgww
	(envelope-from <mhocko@suse.com>); Wed, 18 Jan 2023 09:18:15 +0000
Date: Wed, 18 Jan 2023 10:18:08 +0100
From: Michal Hocko <mhocko@suse.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 12/41] mm: add per-VMA lock and helper functions to
 control it
Message-ID: <Y8e5UNrjMWPuragY@dhcp22.suse.cz>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-13-surenb@google.com>
 <Y8a4+bV1dYNAiUkD@dhcp22.suse.cz>
 <Y8a66gshQkkhC1cT@dhcp22.suse.cz>
 <CAJuCfpF2ciMbMFgqa4GqYqg8zjpnmBoNZDG23V0+w017LXeU3w@mail.gmail.com>
 <Y8cZMt01Z1FvVFXh@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8cZMt01Z1FvVFXh@casper.infradead.org>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman
 @techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 17-01-23 21:54:58, Matthew Wilcox wrote:
> On Tue, Jan 17, 2023 at 01:21:47PM -0800, Suren Baghdasaryan wrote:
> > On Tue, Jan 17, 2023 at 7:12 AM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Tue 17-01-23 16:04:26, Michal Hocko wrote:
> > > > On Mon 09-01-23 12:53:07, Suren Baghdasaryan wrote:
> > > > > Introduce a per-VMA rw_semaphore to be used during page fault handling
> > > > > instead of mmap_lock. Because there are cases when multiple VMAs need
> > > > > to be exclusively locked during VMA tree modifications, instead of the
> > > > > usual lock/unlock patter we mark a VMA as locked by taking per-VMA lock
> > > > > exclusively and setting vma->lock_seq to the current mm->lock_seq. When
> > > > > mmap_write_lock holder is done with all modifications and drops mmap_lock,
> > > > > it will increment mm->lock_seq, effectively unlocking all VMAs marked as
> > > > > locked.
> > > >
> > > > I have to say I was struggling a bit with the above and only understood
> > > > what you mean by reading the patch several times. I would phrase it like
> > > > this (feel free to use if you consider this to be an improvement).
> > > >
> > > > Introduce a per-VMA rw_semaphore. The lock implementation relies on a
> > > > per-vma and per-mm sequence counters to note exclusive locking:
> > > >         - read lock - (implemented by vma_read_trylock) requires the the
> > > >           vma (vm_lock_seq) and mm (mm_lock_seq) sequence counters to
> > > >           differ. If they match then there must be a vma exclusive lock
> > > >           held somewhere.
> > > >         - read unlock - (implemented by vma_read_unlock) is a trivial
> > > >           vma->lock unlock.
> > > >         - write lock - (vma_write_lock) requires the mmap_lock to be
> > > >           held exclusively and the current mm counter is noted to the vma
> > > >           side. This will allow multiple vmas to be locked under a single
> > > >           mmap_lock write lock (e.g. during vma merging). The vma counter
> > > >           is modified under exclusive vma lock.
> > >
> > > Didn't realize one more thing.
> > >             Unlike standard write lock this implementation allows to be
> > >             called multiple times under a single mmap_lock. In a sense
> > >             it is more of mark_vma_potentially_modified than a lock.
> > 
> > In the RFC it was called vma_mark_locked() originally and renames were
> > discussed in the email thread ending here:
> > https://lore.kernel.org/all/621612d7-c537-3971-9520-a3dec7b43cb4@suse.cz/.
> > If other names are preferable I'm open to changing them.
> 
> I don't want to bikeshed this, but rather than locking it seems to be
> more:
> 
> 	vma_start_read()
> 	vma_end_read()
> 	vma_start_write()
> 	vma_end_write()
> 	vma_downgrade_write()
> 
> ... and that these are _implemented_ with locks (in part) is an
> implementation detail?

Agreed!

> Would that reduce people's confusion?

Yes I believe that naming it less like a locking primitive will clarify
it. vma_{start,end}_[try]read is better indeed. I am wondering about the
write side of things because that is where things get confusing. There
is no explicit write lock nor unlock. vma_start_write sounds better than
the vma_write_lock but it still lacks that pairing with vma_end_write
which is never the right thing to call. Wouldn't vma_mark_modified and
vma_publish_changes describe the scheme better?

Downgrade case is probably the least interesting one because that is
just one off thing that can be completely hidden from any code besides
mmap_write_downgrade so I wouldn't be too concern about that one.

But as you say, no need to bikeshed this too much. Great naming is hard
and if the scheme is documented properly we can live with a suboptimal
naming as well.
-- 
Michal Hocko
SUSE Labs
