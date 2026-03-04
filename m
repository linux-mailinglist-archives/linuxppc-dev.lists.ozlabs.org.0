Return-Path: <linuxppc-dev+bounces-17756-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGOQJ1KPqGmzvgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17756-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 21:00:18 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2082075AE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 21:00:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fR3Ry4HRgz3c95;
	Thu, 05 Mar 2026 07:00:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772643513;
	cv=none; b=o2tzADsD+JvB5QHrzKnWf1TdgN9tiUjs/cG9Eus8fpSsSu2+EeqYL7ttp67zk8J4uoWRmakB2BJfD5iBSpZ5Kzpea0m9gvfOMh5JrkvUj6VonEXaq5iLxXNnwzqmJUSh0ptvCb63A8Ye9UEZqzjIRl5lnpRIq7oBbpKuOO2wTIqNeIVItsCcZZW8XpaRTEP5WgnhfEa3huLgl+yAZHNqwXb1h2tDy7cMwg39vn//GxLpXxKMwRKapMBjpjLr36bryeDlW9lCZ1DMMdhQKPWSMC0UBD9A7Yhyb0yky8v/prFl26DGr9adjyU9qRr6O2w34XFQcYnQ1tNG413DmiHpKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772643513; c=relaxed/relaxed;
	bh=LTRiBmtioRmvl45WVMSHIEfgjr5Fv3KMawEauwx9ciI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ch9iWmgvddP7S8N9eMcVtdLjFuOUer98r+EB55QhLHrS7BrtwFo9klBB3jUDyT2vxF8xUKkV2Tqb2JFNAws5grfqZFSuXNAoDx+SFLiKS8Fc22wlCUdTEbdmaz6SMd/Tco4Q4LMbBvhFOfAGXpmASP+HCjwb/SNcRBLiHUuzdRrhIcEFU3tuTnwLjHUUQenDwkxSK9YYtD4hlGbKhvb4ScXabpPxHJaUV9lqu4xJZuDngN/vPF42ADfjZ7ERKtoBJg5sntkETRIHycFYqhehh+0on5M54xzN4rcCFhGzxfE/oD/T+MTfUJ2sF/bogQqRHVUbuqeC6weGY5tQ+ei76Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LE39/pb7; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LE39/pb7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQzQJ5w6Mz3bt9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 03:58:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 118D2444CB;
	Wed,  4 Mar 2026 16:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506DAC2BC87;
	Wed,  4 Mar 2026 16:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772643510;
	bh=gt8PqqovFf1xLv4Q1zVMfYqYqUK+EQak4A80Hc02NSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LE39/pb7RAXXwTk/mO6o0YD6l/cJEy06Z7h9wmDYPF0vzF96PCX1vxT/dVeD0yVen
	 flpPxEgM8VbsEJseiAcr5h93ppXp+39Rm3wfGgoW96u812DuLAcCDud9UGBiKa9UGV
	 GMKh+UPgO4HVRyZOefc10YdzRFG4R6yY/DtZdVbD2mffN0kB2flzFUfyFdGmG/dRcC
	 YjRBJ2pD24GGvbkaGYriHDmS5BjdlgV51L3irEmEiLhB19/ssE6lg7LRIbF+QIPrru
	 uzPgIRDr2PNuSWqrRpXSKUmqvPPeL0RBbYudyrtxV7IxIJjPex2gHSaJOGpEH527vv
	 W+suMeggt8Bqw==
Date: Wed, 4 Mar 2026 16:58:27 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	akpm@linux-foundation.org, willy@infradead.org, david@kernel.org, ziy@nvidia.com, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	gourry@gourry.net, ying.huang@linux.alibaba.com, apopple@nvidia.com, 
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz, 
	jannh@google.com, rppt@kernel.org, mhocko@suse.com, pfalcato@suse.de, 
	kees@kernel.org, maddy@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au, 
	chleroy@kernel.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	svens@linux.ibm.com, gerald.schaefer@linux.ibm.com, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mm: use vma_start_write_killable() in
 process_vma_walk_lock()
Message-ID: <50987b7f-39ec-479d-9700-317cb0b95e6e@lucifer.local>
References: <20260226070609.3072570-1-surenb@google.com>
 <20260226070609.3072570-4-surenb@google.com>
 <72ff2fc0-07fe-4964-9a1e-eccf8c7ed6a7@lucifer.local>
 <CAJuCfpG_bekxrHd49qyUBR2K7V8o7DrOvc-ZR7M8dAC-Hyp5ng@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpG_bekxrHd49qyUBR2K7V8o7DrOvc-ZR7M8dAC-Hyp5ng@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 7D2082075AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17756-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:surenb@google.com,m:lorenzo.stoakes@oracle.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.
 kernel.org,m:joshuahahnjy@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	FORGED_SENDER(0.00)[ljs@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[oracle.com,linux-foundation.org,infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,oracle.com:email,lucifer.local:mid]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 03:59:17PM -0800, Suren Baghdasaryan wrote:
> On Mon, Mar 2, 2026 at 7:25 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > On Wed, Feb 25, 2026 at 11:06:09PM -0800, Suren Baghdasaryan wrote:
> > > Replace vma_start_write() with vma_start_write_killable() when
> > > process_vma_walk_lock() is used with PGWALK_WRLOCK option.
> > > Adjust its direct and indirect users to check for a possible error
> > > and handle it. Ensure users handle EINTR correctly and do not ignore
> > > it.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >
> > Have raised concerns below but also this feels like you're trying to do a bit
> > too much in one patch here, probably worth splitting out based on the different
> > parts you changed.
> >
> > > ---
> > >  arch/s390/kvm/kvm-s390.c |  2 +-
> > >  fs/proc/task_mmu.c       |  5 ++++-
> > >  mm/mempolicy.c           | 14 +++++++++++---
> > >  mm/pagewalk.c            | 20 ++++++++++++++------
> > >  mm/vma.c                 | 22 ++++++++++++++--------
> > >  mm/vma.h                 |  6 ++++++
> > >  6 files changed, 50 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> > > index 7a175d86cef0..337e4f7db63a 100644
> > > --- a/arch/s390/kvm/kvm-s390.c
> > > +++ b/arch/s390/kvm/kvm-s390.c
> > > @@ -2948,7 +2948,7 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
> > >               }
> > >               /* must be called without kvm->lock */
> > >               r = kvm_s390_handle_pv(kvm, &args);
> > > -             if (copy_to_user(argp, &args, sizeof(args))) {
> > > +             if (r != -EINTR && copy_to_user(argp, &args, sizeof(args))) {
> >
> > This is horribly ugly, and if we were already filtering any other instance of
> > -EINTR (if they're even possible from copy_to_user()) why is -EINTR being
> > treated in a special way?
> >
> > I honestly _hate_ this if (errcode != -EINTR) { ... } pattern in general, I'd
> > really rather we didn't.
> >
> > It's going to bitrot and people are going to assume it's for some _very good
> > reason_ and nobody will understand why it's getting special treatment...
> >
> > Surely a fatal signal would have previously resulted in -EFAULT before which is
> > a similar situation so most consistent would be to keep filtering no?
>
> Current code ignores any error coming from kvm_s390_handle_pv() and
> proceeds with copy_to_user(), possibly overriding the former error. I
> don't really know if this is an oversight or an intentional behavior,
> so I wanted to minimize possible side effects. I guess I should try to
> fix it properly (or learn why this was done this way). I'll post a
> separate patch to error out immediately if kvm_s390_handle_pv() fails
> and will ask s390 experts for review.

Thanks!

>
> >
> > >                       r = -EFAULT;
> > >                       break;
> > >               }
> > > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > > index e091931d7ca1..1238a2988eb6 100644
> > > --- a/fs/proc/task_mmu.c
> > > +++ b/fs/proc/task_mmu.c
> > > @@ -1797,6 +1797,7 @@ static ssize_t clear_refs_write(struct file *file, const char __user *buf,
> > >               struct clear_refs_private cp = {
> > >                       .type = type,
> > >               };
> > > +             int err;
> > >
> > >               if (mmap_write_lock_killable(mm)) {
> > >                       count = -EINTR;
> > > @@ -1824,7 +1825,9 @@ static ssize_t clear_refs_write(struct file *file, const char __user *buf,
> > >                                               0, mm, 0, -1UL);
> > >                       mmu_notifier_invalidate_range_start(&range);
> > >               }
> > > -             walk_page_range(mm, 0, -1, &clear_refs_walk_ops, &cp);
> > > +             err = walk_page_range(mm, 0, -1, &clear_refs_walk_ops, &cp);
> > > +             if (err < 0)
> >
> > Again with this < 0 :) let's be consistent, if (err).
>
> Ack.

Thanks!

>
> >
> > > +                     count = err;
> > >               if (type == CLEAR_REFS_SOFT_DIRTY) {
> > >                       mmu_notifier_invalidate_range_end(&range);
> > >                       flush_tlb_mm(mm);
> > > diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> > > index 90939f5bde02..3c8b3dfc9c56 100644
> > > --- a/mm/mempolicy.c
> > > +++ b/mm/mempolicy.c
> > > @@ -988,6 +988,8 @@ queue_pages_range(struct mm_struct *mm, unsigned long start, unsigned long end,
> > >                       &queue_pages_lock_vma_walk_ops : &queue_pages_walk_ops;
> >
> > There's a comment above:
> >
> >  * queue_pages_range() may return:
> >  * 0 - all pages already on the right node, or successfully queued for moving
> >  *     (or neither strict checking nor moving requested: only range checking).
> >  * >0 - this number of misplaced folios could not be queued for moving
> >  *      (a hugetlbfs page or a transparent huge page being counted as 1).
> >  * -EIO - a misplaced page found, when MPOL_MF_STRICT specified without MOVEs.
> >  * -EFAULT - a hole in the memory range, when MPOL_MF_DISCONTIG_OK unspecified.
> >  */
> >
> > You should add the -EINTR to it.
>
> Ack.

Thanks!

>
> >
> > >
> > >       err = walk_page_range(mm, start, end, ops, &qp);
> > > +     if (err == -EINTR)
> > > +             return err;
> >
> > Again, you're special casing without really any justification here. Let's please
> > not special case -EINTR unless you have a _really good_ reason to.
> >
> > And also - if we fail to walk the page range because we couldn't get a VMA write
> > lock, that's ok. The walk failed. There's nothing to unlock, because we didn't
> > even get the write lock in the first place, so there's no broken state, it's as
> > if we failed at some other point right?
> >
> > So I don't see why we're special casing this _at all_.
>
> I want to avoid possible -EINTR code override with -EFAULT in the code below.
> walk_page_range() can return -EINVAL and any other error that
> ops->pte_hole or ops->test_walk might return. We might be fine
> treating all of them as -EFAULT but masking -EINTR seems wrong to me.
> I don't really know a better way to deal with this but if you have a
> good alternative I would really appreciate it.

As per Matthew we needn't worry, and in any case if we want to check for fatal
signal early exit we can do if (fatal_signal_pending(current)) {} I think?

>
> >
> > >
> > >       if (!qp.first)
> > >               /* whole range in hole */
> > > @@ -1309,9 +1311,14 @@ static long migrate_to_node(struct mm_struct *mm, int source, int dest,
> > >                                     flags | MPOL_MF_DISCONTIG_OK, &pagelist);
> > >       mmap_read_unlock(mm);
> >
> >
> > >
> > > +     if (nr_failed == -EINTR)
> > > +             err = nr_failed;
> >
> > Ugh please don't, that's REALLY horrible.
> >
> > Actually the only way you'd get a write lock happening in the walk_page_range()
> > is if flags & MPOL_MF_WRLOCK, menaing queue_pages_lock_vma_walk_ops are used
> > which specifies .walk_lock = PGWALK_WRLOCK.
> >
> > And this flag is only set in do_mbind(), not in migrate_to_node().
> >
> > So this check is actually totally unnecessary. You'll never get -EINTR here.
>
> Ah, good point. I'll drop this part.

Thanks!

>
> >
> > Maybe this code needs some refactoring though in general... yikes.
>
> Right.
>
> >
> > > +
> > >       if (!list_empty(&pagelist)) {
> > > -             err = migrate_pages(&pagelist, alloc_migration_target, NULL,
> > > -                     (unsigned long)&mtc, MIGRATE_SYNC, MR_SYSCALL, NULL);
> > > +             if (!err)
> > > +                     err = migrate_pages(&pagelist, alloc_migration_target,
> > > +                                         NULL, (unsigned long)&mtc,
> > > +                                         MIGRATE_SYNC, MR_SYSCALL, NULL);
> >
> > Given the above, this is unnecessary too.
>
> Ack. Will drop.

Thanks!

>
> >
> > >               if (err)
> > >                       putback_movable_pages(&pagelist);
> > >       }
> > > @@ -1611,7 +1618,8 @@ static long do_mbind(unsigned long start, unsigned long len,
> > >                               MR_MEMPOLICY_MBIND, NULL);
> > >       }
> > >
> > > -     if (nr_failed && (flags & MPOL_MF_STRICT))
> > > +     /* Do not mask EINTR */
> >
> > Useless comment... You're not explaining why, and it's obvious what you're doing.
> >
> > > +     if ((err != -EINTR) && (nr_failed && (flags & MPOL_MF_STRICT)))
> >
> > Weird use of parens...
> >
> > And again why are we treating -EINTR in a special way?
>
> Ah, actually I don't think I need this here. If queue_pages_range()
> fails nr_failed gets reset to 0, so the original error won't be masked
> as -EIO. I'll drop this part.

Thanks!

>
> >
> > >               err = -EIO;
> > >       if (!list_empty(&pagelist))
> > >               putback_movable_pages(&pagelist);
> > > diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> > > index a94c401ab2cf..dc9f7a7709c6 100644
> > > --- a/mm/pagewalk.c
> > > +++ b/mm/pagewalk.c
> > > @@ -425,14 +425,13 @@ static inline void process_mm_walk_lock(struct mm_struct *mm,
> > >               mmap_assert_write_locked(mm);
> > >  }
> > >
> > > -static inline void process_vma_walk_lock(struct vm_area_struct *vma,
> > > +static inline int process_vma_walk_lock(struct vm_area_struct *vma,
> > >                                        enum page_walk_lock walk_lock)
> > >  {
> > >  #ifdef CONFIG_PER_VMA_LOCK
> > >       switch (walk_lock) {
> > >       case PGWALK_WRLOCK:
> > > -             vma_start_write(vma);
> > > -             break;
> > > +             return vma_start_write_killable(vma);
> > >       case PGWALK_WRLOCK_VERIFY:
> > >               vma_assert_write_locked(vma);
> > >               break;
> > > @@ -444,6 +443,7 @@ static inline void process_vma_walk_lock(struct vm_area_struct *vma,
> > >               break;
> > >       }
> > >  #endif
> > > +     return 0;
> > >  }
> > >
> > >  /*
> > > @@ -487,7 +487,9 @@ int walk_page_range_mm_unsafe(struct mm_struct *mm, unsigned long start,
> > >                       if (ops->pte_hole)
> > >                               err = ops->pte_hole(start, next, -1, &walk);
> > >               } else { /* inside vma */
> > > -                     process_vma_walk_lock(vma, ops->walk_lock);
> > > +                     err = process_vma_walk_lock(vma, ops->walk_lock);
> > > +                     if (err)
> > > +                             break;
> > >                       walk.vma = vma;
> > >                       next = min(end, vma->vm_end);
> > >                       vma = find_vma(mm, vma->vm_end);
> > > @@ -704,6 +706,7 @@ int walk_page_range_vma_unsafe(struct vm_area_struct *vma, unsigned long start,
> > >               .vma            = vma,
> > >               .private        = private,
> > >       };
> > > +     int err;
> > >
> > >       if (start >= end || !walk.mm)
> > >               return -EINVAL;
> > > @@ -711,7 +714,9 @@ int walk_page_range_vma_unsafe(struct vm_area_struct *vma, unsigned long start,
> > >               return -EINVAL;
> > >
> > >       process_mm_walk_lock(walk.mm, ops->walk_lock);
> > > -     process_vma_walk_lock(vma, ops->walk_lock);
> > > +     err = process_vma_walk_lock(vma, ops->walk_lock);
> > > +     if (err)
> > > +             return err;
> > >       return __walk_page_range(start, end, &walk);
> > >  }
> > >
> > > @@ -734,6 +739,7 @@ int walk_page_vma(struct vm_area_struct *vma, const struct mm_walk_ops *ops,
> > >               .vma            = vma,
> > >               .private        = private,
> > >       };
> > > +     int err;
> > >
> > >       if (!walk.mm)
> > >               return -EINVAL;
> > > @@ -741,7 +747,9 @@ int walk_page_vma(struct vm_area_struct *vma, const struct mm_walk_ops *ops,
> > >               return -EINVAL;
> > >
> > >       process_mm_walk_lock(walk.mm, ops->walk_lock);
> > > -     process_vma_walk_lock(vma, ops->walk_lock);
> > > +     err = process_vma_walk_lock(vma, ops->walk_lock);
> > > +     if (err)
> > > +             return err;
> > >       return __walk_page_range(vma->vm_start, vma->vm_end, &walk);
> > >  }
> > >
> > > diff --git a/mm/vma.c b/mm/vma.c
> > > index 9f2664f1d078..46bbad6e64a4 100644
> > > --- a/mm/vma.c
> > > +++ b/mm/vma.c
> > > @@ -998,14 +998,18 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
> > >       if (anon_dup)
> > >               unlink_anon_vmas(anon_dup);
> > >
> > > -     /*
> > > -      * This means we have failed to clone anon_vma's correctly, but no
> > > -      * actual changes to VMAs have occurred, so no harm no foul - if the
> > > -      * user doesn't want this reported and instead just wants to give up on
> > > -      * the merge, allow it.
> > > -      */
> > > -     if (!vmg->give_up_on_oom)
> > > -             vmg->state = VMA_MERGE_ERROR_NOMEM;
> > > +     if (err == -EINTR) {
> > > +             vmg->state = VMA_MERGE_ERROR_INTR;
> >
> > Yeah this is incorrect. You seem adament in passing through -EINTR _no
> > matter what_ :)
>
> You got me figured out ;)
>
> >
> > There are callers that don't care at all if the merge failed, whether through
> > oom or VMA write lock not being acquired.
>
> Ah, I see. I was a bit puzzled by this vmg->give_up_on_oom flag. I
> think what you are saying is that errors from
> vma_merge_existing_range() are ignored unless this flag is set and
> even then the only possible error is ENOMEM.
>
> >
> > There's really no benefit in exiting early here I don't think, the subsequent
> > split will call vma_start_write_killable() anyway.
>
> But are we always calling split after the merge?

We wouldn't if start == vma->vm_start and end == vma->vm_end but that'd be a nop
anyway :) [in vma_modify(), the only caller].

>
> >
> > So I think this adds a lot of complexity and mess for nothing.
> >
> > So can we drop all this change to the merge logic please?
>
> Ok but is there a good reason for this unusual error handling logic in
> vma_merge_existing_range()?

It's specifically so we can indicate _why_ the merge didn't succeed, because the
function returns NULL. Is checked in vma_modify().

Better this way than an ERR_PTR().


>
> >
> > > +     } else {
> > > +             /*
> > > +              * This means we have failed to clone anon_vma's correctly,
> > > +              * but no actual changes to VMAs have occurred, so no harm no
> > > +              * foul - if the user doesn't want this reported and instead
> > > +              * just wants to give up on the merge, allow it.
> > > +              */
> > > +             if (!vmg->give_up_on_oom)
> > > +                     vmg->state = VMA_MERGE_ERROR_NOMEM;
> > > +     }
> > >       return NULL;
> > >  }
> > >
> > > @@ -1681,6 +1685,8 @@ static struct vm_area_struct *vma_modify(struct vma_merge_struct *vmg)
> > >       merged = vma_merge_existing_range(vmg);
> > >       if (merged)
> > >               return merged;
> > > +     if (vmg_intr(vmg))
> > > +             return ERR_PTR(-EINTR);
> > >       if (vmg_nomem(vmg))
> > >               return ERR_PTR(-ENOMEM);
> > >
> > > diff --git a/mm/vma.h b/mm/vma.h
> > > index eba388c61ef4..fe4560f81f4f 100644
> > > --- a/mm/vma.h
> > > +++ b/mm/vma.h
> > > @@ -56,6 +56,7 @@ struct vma_munmap_struct {
> > >  enum vma_merge_state {
> > >       VMA_MERGE_START,
> > >       VMA_MERGE_ERROR_NOMEM,
> > > +     VMA_MERGE_ERROR_INTR,
> > >       VMA_MERGE_NOMERGE,
> > >       VMA_MERGE_SUCCESS,
> > >  };
> > > @@ -226,6 +227,11 @@ static inline bool vmg_nomem(struct vma_merge_struct *vmg)
> > >       return vmg->state == VMA_MERGE_ERROR_NOMEM;
> > >  }
> > >
> > > +static inline bool vmg_intr(struct vma_merge_struct *vmg)
> > > +{
> > > +     return vmg->state == VMA_MERGE_ERROR_INTR;
> > > +}
> > > +
> > >  /* Assumes addr >= vma->vm_start. */
> > >  static inline pgoff_t vma_pgoff_offset(struct vm_area_struct *vma,
> > >                                      unsigned long addr)
> > > --
> > > 2.53.0.414.gf7e9f6c205-goog
> > >
> >

Cheers, Lorenzo

