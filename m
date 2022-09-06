Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EFD5AF25C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 19:25:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMXMf32xPz30L5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 03:25:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=heO9Twwq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=heO9Twwq;
	dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMXM13pjVz2xGS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 03:24:44 +1000 (AEST)
Received: by mail-io1-xd2d.google.com with SMTP id 62so9485998iov.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Sep 2022 10:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=Ld2JxcymypOPOgywLT44PW2Ikbrb1VzeoM48fRlHsTI=;
        b=heO9Twwqp33yzFcE5GLSFZY/U8zaJZ4J28uFyeewexljvXECNpeJ2YeThC56sC2T1Z
         FSkdQqIVbh/cqsKT5Y0t8iIePnxPuCevJ8ZrOfdNvQiWBmPcnuOTAMMzUWnWFRjh069U
         2SXZ6m6FQBjFi6mdlCo7dKjS53jGhfxzzRBbp3o0goQTVEZefTtFJinepqc7gwdA76Zn
         wWWp4f8k5XGZje2LlOIKk4oVmjduAoZAwWtXy3GPKeN4mt5BZrcg7cPtj/js/QvqGJHf
         DTscr+is3SnIENf6zzTDVRxrFNZQ12O+RxDP9vtCrN8voGYy2HMXqkCLYp+loBr1u5fW
         yK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Ld2JxcymypOPOgywLT44PW2Ikbrb1VzeoM48fRlHsTI=;
        b=i9lFM/gRdfFAKF7gghYPXzN3STEAB9lZu69x8zm9TRpFmAuAEa8kmTIi6vgN9cnNXU
         oQYgqkS1K2pRZIuw/v0s3xYBx98kF9Arkx4G5heLNtlaRX6DGNPwlreVHqCqagCqxte7
         w98SpFuGLhgQeI/xmjjHxLJRPt2pOxkYhT6TGAGkWfuxtA+OVI5OKViyeeRq8HGG48+3
         uukI5obD+61XeK/PdataopEqLa5LKPsQTlJG6TvqrPYx2/+299eDMBI77HLcNs9Im0oc
         p49nmS69ilqhhvFfAoZEmIaM+KVi4bQyF9bIf4f2R+3o3pBFBid0+SRtaYIAgo3vZH1r
         U0AA==
X-Gm-Message-State: ACgBeo1ECswJNpsDTzZmCpxPfFbeMOP0PBcda0YUG635bdIZoLzIYpnW
	KTX+7EZPq84sTFTzc0ePoli7FI/2xUL3Z+w78HqzPO50dtGR+GVwZNJM7gkPCEovusbop1T1NRB
	pJNblQ+8MEoRZA2In4MJNyfdU+Foy5cFv
X-Google-Smtp-Source: AA6agR44YTmLzCV+I+JaNpT4N0gLu2+UsZktpd1YNE7QssF1dAl8b+3/7PUu8k7UutO/GpnVhbMgZRcHYblP//qHDQY=
X-Received: by 2002:a02:740b:0:b0:349:bcdd:ca20 with SMTP id
 o11-20020a02740b000000b00349bcddca20mr30908418jac.110.1662485080617; Tue, 06
 Sep 2022 10:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901173516.702122-6-surenb@google.com>
 <c84136d3-703a-0e57-20ce-59f6b5823999@linux.ibm.com>
In-Reply-To: <c84136d3-703a-0e57-20ce-59f6b5823999@linux.ibm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 6 Sep 2022 10:24:29 -0700
Message-ID: <CAJuCfpFZ_E0wuA+0Xsavk+hnGDA-H0SdcZGUr31_u-cXyR6b7Q@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 05/28] mm: add per-VMA lock and helper
 functions to control it
To: Laurent Dufour <ldufour@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ccpol: medium
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
Cc: Michel Lespinasse <michel@lespinasse.org>, Joel Fernandes <joelaf@google.com>, Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Xu <peterx@redhat.com>, dhowells@redhat.com, linux-mm <linux-mm@kvack.org>, Jerome Glisse <jglisse@google.com>, Davidlohr Bueso <dave@stgolabs.net>, Minchan Kim <minchan@google.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Mel Gorman <mgorman@suse.de>, David Rientjes <rientjes@google.com>, Axel Rasmussen <axelrasmussen@google.com>, kernel-team <kernel-team@android.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, Andy Lutomirski <luto@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Kent Overstreet <kent.overstreet@linux.dev>, LKML <linux-
 kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 6, 2022 at 6:47 AM Laurent Dufour <ldufour@linux.ibm.com> wrote=
:
>
> Le 01/09/2022 =C3=A0 19:34, Suren Baghdasaryan a =C3=A9crit :
> > Introduce a per-VMA rw_semaphore to be used during page fault handling
> > instead of mmap_lock. Because there are cases when multiple VMAs need
> > to be exclusively locked during VMA tree modifications, instead of the
> > usual lock/unlock patter we mark a VMA as locked by taking per-VMA lock
> > exclusively and setting vma->lock_seq to the current mm->lock_seq. When
> > mmap_write_lock holder is done with all modifications and drops mmap_lo=
ck,
> > it will increment mm->lock_seq, effectively unlocking all VMAs marked a=
s
> > locked.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Despite a minor comment below,
>
> Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>

Thanks for the reviews Laurent! I'll need some time to double-check
all the VMA locking locations that you spotted as potentially
unnecessary. Admittedly I was a bit paranoid when writing this
patchset and trying not to miss any potential race, so some of them
might indeed be unnecessary. Will reply to each of your comments once
I confirm the need for locking in each case.
Thanks,
Suren.

>
> > ---
> >  include/linux/mm.h        | 78 +++++++++++++++++++++++++++++++++++++++
> >  include/linux/mm_types.h  |  7 ++++
> >  include/linux/mmap_lock.h | 13 +++++++
> >  kernel/fork.c             |  4 ++
> >  mm/init-mm.c              |  3 ++
> >  5 files changed, 105 insertions(+)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 7d322a979455..476bf936c5f0 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -611,6 +611,83 @@ struct vm_operations_struct {
> >                                         unsigned long addr);
> >  };
> >
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +static inline void vma_init_lock(struct vm_area_struct *vma)
> > +{
> > +     init_rwsem(&vma->lock);
> > +     vma->vm_lock_seq =3D -1;
> > +}
> > +
> > +static inline void vma_mark_locked(struct vm_area_struct *vma)
> > +{
> > +     int mm_lock_seq;
> > +
> > +     mmap_assert_write_locked(vma->vm_mm);
> > +
> > +     /*
> > +      * current task is holding mmap_write_lock, both vma->vm_lock_seq=
 and
> > +      * mm->mm_lock_seq can't be concurrently modified.
> > +      */
> > +     mm_lock_seq =3D READ_ONCE(vma->vm_mm->mm_lock_seq);
> > +     if (vma->vm_lock_seq =3D=3D mm_lock_seq)
> > +             return;
> > +
> > +     down_write(&vma->lock);
> > +     vma->vm_lock_seq =3D mm_lock_seq;
> > +     up_write(&vma->lock);
> > +}
> > +
> > +static inline bool vma_read_trylock(struct vm_area_struct *vma)
> > +{
> > +     if (unlikely(down_read_trylock(&vma->lock) =3D=3D 0))
> > +             return false;
> > +
> > +     /*
> > +      * Overflow might produce false locked result but it's not critic=
al.
>
> It might be good to precise here that in the case of false locked, the
> caller is assumed to fallback read locking the mm entirely before doing i=
ts
> change relative to that VMA.

Ack.

>
> > +      * False unlocked result is critical but is impossible because we
> > +      * modify and check vma->vm_lock_seq under vma->lock protection a=
nd
> > +      * mm->mm_lock_seq modification invalidates all existing locks.
> > +      */
> > +     if (vma->vm_lock_seq =3D=3D READ_ONCE(vma->vm_mm->mm_lock_seq)) {
> > +             up_read(&vma->lock);
> > +             return false;
> > +     }
> > +     return true;
> > +}
> > +
> > +static inline void vma_read_unlock(struct vm_area_struct *vma)
> > +{
> > +     up_read(&vma->lock);
> > +}
> > +
> > +static inline void vma_assert_locked(struct vm_area_struct *vma)
> > +{
> > +     lockdep_assert_held(&vma->lock);
> > +     VM_BUG_ON_VMA(!rwsem_is_locked(&vma->lock), vma);
> > +}
> > +
> > +static inline void vma_assert_write_locked(struct vm_area_struct *vma,=
 int pos)
> > +{
> > +     mmap_assert_write_locked(vma->vm_mm);
> > +     /*
> > +      * current task is holding mmap_write_lock, both vma->vm_lock_seq=
 and
> > +      * mm->mm_lock_seq can't be concurrently modified.
> > +      */
> > +     VM_BUG_ON_VMA(vma->vm_lock_seq !=3D READ_ONCE(vma->vm_mm->mm_lock=
_seq), vma);
> > +}
> > +
> > +#else /* CONFIG_PER_VMA_LOCK */
> > +
> > +static inline void vma_init_lock(struct vm_area_struct *vma) {}
> > +static inline void vma_mark_locked(struct vm_area_struct *vma) {}
> > +static inline bool vma_read_trylock(struct vm_area_struct *vma)
> > +             { return false; }
> > +static inline void vma_read_unlock(struct vm_area_struct *vma) {}
> > +static inline void vma_assert_locked(struct vm_area_struct *vma) {}
> > +static inline void vma_assert_write_locked(struct vm_area_struct *vma,=
 int pos) {}
> > +
> > +#endif /* CONFIG_PER_VMA_LOCK */
> > +
> >  static inline void vma_init(struct vm_area_struct *vma, struct mm_stru=
ct *mm)
> >  {
> >       static const struct vm_operations_struct dummy_vm_ops =3D {};
> > @@ -619,6 +696,7 @@ static inline void vma_init(struct vm_area_struct *=
vma, struct mm_struct *mm)
> >       vma->vm_mm =3D mm;
> >       vma->vm_ops =3D &dummy_vm_ops;
> >       INIT_LIST_HEAD(&vma->anon_vma_chain);
> > +     vma_init_lock(vma);
> >  }
> >
> >  static inline void vma_set_anonymous(struct vm_area_struct *vma)
> > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > index bed25ef7c994..6a03f59c1e78 100644
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -486,6 +486,10 @@ struct vm_area_struct {
> >       struct mempolicy *vm_policy;    /* NUMA policy for the VMA */
> >  #endif
> >       struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +     struct rw_semaphore lock;
> > +     int vm_lock_seq;
> > +#endif
> >  } __randomize_layout;
> >
> >  struct kioctx_table;
> > @@ -567,6 +571,9 @@ struct mm_struct {
> >                                         * init_mm.mmlist, and are prote=
cted
> >                                         * by mmlist_lock
> >                                         */
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +             int mm_lock_seq;
> > +#endif
> >
> >
> >               unsigned long hiwater_rss; /* High-watermark of RSS usage=
 */
> > diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> > index e49ba91bb1f0..a391ae226564 100644
> > --- a/include/linux/mmap_lock.h
> > +++ b/include/linux/mmap_lock.h
> > @@ -72,6 +72,17 @@ static inline void mmap_assert_write_locked(struct m=
m_struct *mm)
> >       VM_BUG_ON_MM(!rwsem_is_locked(&mm->mmap_lock), mm);
> >  }
> >
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +static inline void vma_mark_unlocked_all(struct mm_struct *mm)
> > +{
> > +     mmap_assert_write_locked(mm);
> > +     /* No races during update due to exclusive mmap_lock being held *=
/
> > +     WRITE_ONCE(mm->mm_lock_seq, mm->mm_lock_seq + 1);
> > +}
> > +#else
> > +static inline void vma_mark_unlocked_all(struct mm_struct *mm) {}
> > +#endif
> > +
> >  static inline void mmap_init_lock(struct mm_struct *mm)
> >  {
> >       init_rwsem(&mm->mmap_lock);
> > @@ -114,12 +125,14 @@ static inline bool mmap_write_trylock(struct mm_s=
truct *mm)
> >  static inline void mmap_write_unlock(struct mm_struct *mm)
> >  {
> >       __mmap_lock_trace_released(mm, true);
> > +     vma_mark_unlocked_all(mm);
> >       up_write(&mm->mmap_lock);
> >  }
> >
> >  static inline void mmap_write_downgrade(struct mm_struct *mm)
> >  {
> >       __mmap_lock_trace_acquire_returned(mm, false, true);
> > +     vma_mark_unlocked_all(mm);
> >       downgrade_write(&mm->mmap_lock);
> >  }
> >
> > diff --git a/kernel/fork.c b/kernel/fork.c
> > index 614872438393..bfab31ecd11e 100644
> > --- a/kernel/fork.c
> > +++ b/kernel/fork.c
> > @@ -475,6 +475,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_s=
truct *orig)
> >                */
> >               *new =3D data_race(*orig);
> >               INIT_LIST_HEAD(&new->anon_vma_chain);
> > +             vma_init_lock(new);
> >               new->vm_next =3D new->vm_prev =3D NULL;
> >               dup_anon_vma_name(orig, new);
> >       }
> > @@ -1130,6 +1131,9 @@ static struct mm_struct *mm_init(struct mm_struct=
 *mm, struct task_struct *p,
> >       seqcount_init(&mm->write_protect_seq);
> >       mmap_init_lock(mm);
> >       INIT_LIST_HEAD(&mm->mmlist);
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +     WRITE_ONCE(mm->mm_lock_seq, 0);
> > +#endif
> >       mm_pgtables_bytes_init(mm);
> >       mm->map_count =3D 0;
> >       mm->locked_vm =3D 0;
> > diff --git a/mm/init-mm.c b/mm/init-mm.c
> > index fbe7844d0912..8399f90d631c 100644
> > --- a/mm/init-mm.c
> > +++ b/mm/init-mm.c
> > @@ -37,6 +37,9 @@ struct mm_struct init_mm =3D {
> >       .page_table_lock =3D  __SPIN_LOCK_UNLOCKED(init_mm.page_table_loc=
k),
> >       .arg_lock       =3D  __SPIN_LOCK_UNLOCKED(init_mm.arg_lock),
> >       .mmlist         =3D LIST_HEAD_INIT(init_mm.mmlist),
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +     .mm_lock_seq    =3D 0,
> > +#endif
> >       .user_ns        =3D &init_user_ns,
> >       .cpu_bitmap     =3D CPU_BITS_NONE,
> >  #ifdef CONFIG_IOMMU_SVA
>
