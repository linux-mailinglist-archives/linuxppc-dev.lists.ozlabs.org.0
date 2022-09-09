Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8AE5B3D3C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 18:44:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPMK26ckXz3c5q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 02:44:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=c67hYDuq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=c67hYDuq;
	dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPMJN1D76z30D0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 02:43:46 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id 202so3472060ybe.13
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Sep 2022 09:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=zVo1N+OZnFVfIJwv+ipJHgwVNWm7KzUfzI45rGYLygU=;
        b=c67hYDuq5m4Qp+tVTZPRjetoFVWgzJ0WIEDHxLCTqCZTHrC8mxvCnHBn6STi0dsMZI
         96Hl+qc/ASrPMenhd3AwqU1xJjZGt0xQBbJo5sf+lImH7e2GrkHQiyfjART8rkzJoli4
         KvwghLvJAfA5ltuMBynJuWRARUTd97IoY4SHI38ZenZzcnWQwQkrq3lT9OHAFMc+Hp0a
         6oH5dUoKtz2OXk2nQnXRgioEbo4wS1OOSCIO4H0KEtxFxnwda/JBUxORLvfXSD8ahP6b
         t+b96r21QzKVe7mncMY/f75LIjrJZ4sgpJhqD8bsyFPD/UQncGd2NN+elMsH9jsropS6
         kG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zVo1N+OZnFVfIJwv+ipJHgwVNWm7KzUfzI45rGYLygU=;
        b=3Phfq9A1pLFArr/SHGoIgXHeyL99tBXglqRmgcXY/WbWchttyHR2/pL/aMEOJsTrA2
         0sn0pHpVR8e0q9YVubL9Am2mRSELWIo/AsA9ReAjtVt2SmINOKS7E7XXJOm8bpS65kM/
         0HJfrlrYqZnen1V8Z4wt7Ny3OwgL6jkkPhsjWJTtknpJ63Fajz/6j9IswpPc/ap3ZyUJ
         953CiZaWuKZ4uGxbvhNBMzESAs6e6O74EYV4kGwdGXy9cysefU7k8aFOov1noH2tWbIT
         wFDOixQJ31AQkteY4SMPhp7jQuqd6Z9BymS8AilMq3g7c0b54wGwqSgLmCPm9eQ1PVAw
         1gAA==
X-Gm-Message-State: ACgBeo1zwZWL+iyrYSSD28taSnwbXuyQcQ2uehtqqX2Mtn/TfLQOrZuw
	6jF7CmSMDmYrRvI2JEof9b8gJ5bYOPPgnDAna4/n6Q==
X-Google-Smtp-Source: AA6agR7nTf8A5/zXGRgH1lekU9FxJDnZpPQlgXDMhKy17CEDV6S1HsU/0EZV+xk8pFn3q0OBSF97u29G8Q8QzuDTRfY=
X-Received: by 2002:a25:424a:0:b0:6a9:2954:87fd with SMTP id
 p71-20020a25424a000000b006a9295487fdmr12200222yba.340.1662741823433; Fri, 09
 Sep 2022 09:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901173516.702122-14-surenb@google.com>
 <667ad41f-21af-ccc8-be7b-7e6c49930195@linux.ibm.com>
In-Reply-To: <667ad41f-21af-ccc8-be7b-7e6c49930195@linux.ibm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 9 Sep 2022 09:43:32 -0700
Message-ID: <CAJuCfpFsWDhCjvL=Ru8-OMRRnis7sZNZ6h5M7=iUKaZm9Z9Nyg@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 13/28] mm: conditionally mark VMA as locked in
 free_pgtables and unmap_page_range
To: Laurent Dufour <ldufour@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 9, 2022 at 3:33 AM Laurent Dufour <ldufour@linux.ibm.com> wrote=
:
>
> Le 01/09/2022 =C3=A0 19:35, Suren Baghdasaryan a =C3=A9crit :
> > free_pgtables and unmap_page_range functions can be called with mmap_lo=
ck
> > held for write (e.g. in mmap_region), held for read (e.g in
> > madvise_pageout) or not held at all (e.g in madvise_remove might
> > drop mmap_lock before calling vfs_fallocate, which ends up calling
> > unmap_page_range).
> > Provide free_pgtables and unmap_page_range with additional argument
> > indicating whether to mark the VMA as locked or not based on the usage.
> > The parameter is set based on whether mmap_lock is held in write mode
> > during the call. This ensures no change in behavior between mmap_lock
> > and per-vma locks.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  include/linux/mm.h |  2 +-
> >  mm/internal.h      |  4 ++--
> >  mm/memory.c        | 32 +++++++++++++++++++++-----------
> >  mm/mmap.c          | 17 +++++++++--------
> >  mm/oom_kill.c      |  3 ++-
> >  5 files changed, 35 insertions(+), 23 deletions(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 476bf936c5f0..dc72be923e5b 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -1874,7 +1874,7 @@ void zap_vma_ptes(struct vm_area_struct *vma, uns=
igned long address,
> >  void zap_page_range(struct vm_area_struct *vma, unsigned long address,
> >                   unsigned long size);
> >  void unmap_vmas(struct mmu_gather *tlb, struct vm_area_struct *start_v=
ma,
> > -             unsigned long start, unsigned long end);
> > +             unsigned long start, unsigned long end, bool lock_vma);
> >
> >  struct mmu_notifier_range;
> >
> > diff --git a/mm/internal.h b/mm/internal.h
> > index 785409805ed7..e6c0f999e0cb 100644
> > --- a/mm/internal.h
> > +++ b/mm/internal.h
> > @@ -85,14 +85,14 @@ bool __folio_end_writeback(struct folio *folio);
> >  void deactivate_file_folio(struct folio *folio);
> >
> >  void free_pgtables(struct mmu_gather *tlb, struct vm_area_struct *star=
t_vma,
> > -             unsigned long floor, unsigned long ceiling);
> > +             unsigned long floor, unsigned long ceiling, bool lock_vma=
);
> >  void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte);
> >
> >  struct zap_details;
> >  void unmap_page_range(struct mmu_gather *tlb,
> >                            struct vm_area_struct *vma,
> >                            unsigned long addr, unsigned long end,
> > -                          struct zap_details *details);
> > +                          struct zap_details *details, bool lock_vma);
> >
> >  void page_cache_ra_order(struct readahead_control *, struct file_ra_st=
ate *,
> >               unsigned int order);
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 4ba73f5aa8bb..9ac9944e8c62 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -403,7 +403,7 @@ void free_pgd_range(struct mmu_gather *tlb,
> >  }
> >
> >  void free_pgtables(struct mmu_gather *tlb, struct vm_area_struct *vma,
> > -             unsigned long floor, unsigned long ceiling)
> > +             unsigned long floor, unsigned long ceiling, bool lock_vma=
)
> >  {
> >       while (vma) {
> >               struct vm_area_struct *next =3D vma->vm_next;
> > @@ -413,6 +413,8 @@ void free_pgtables(struct mmu_gather *tlb, struct v=
m_area_struct *vma,
> >                * Hide vma from rmap and truncate_pagecache before freei=
ng
> >                * pgtables
> >                */
> > +             if (lock_vma)
> > +                     vma_mark_locked(vma);
> >               unlink_anon_vmas(vma);
> >               unlink_file_vma(vma);
> >
> > @@ -427,6 +429,8 @@ void free_pgtables(struct mmu_gather *tlb, struct v=
m_area_struct *vma,
> >                              && !is_vm_hugetlb_page(next)) {
> >                               vma =3D next;
> >                               next =3D vma->vm_next;
> > +                             if (lock_vma)
> > +                                     vma_mark_locked(vma);
> >                               unlink_anon_vmas(vma);
> >                               unlink_file_vma(vma);
> >                       }
> > @@ -1631,12 +1635,16 @@ static inline unsigned long zap_p4d_range(struc=
t mmu_gather *tlb,
> >  void unmap_page_range(struct mmu_gather *tlb,
> >                            struct vm_area_struct *vma,
> >                            unsigned long addr, unsigned long end,
> > -                          struct zap_details *details)
> > +                          struct zap_details *details,
> > +                          bool lock_vma)
> >  {
> >       pgd_t *pgd;
> >       unsigned long next;
> >
> >       BUG_ON(addr >=3D end);
> > +     if (lock_vma)
> > +             vma_mark_locked(vma);
>
> I'm wondering if that is really needed here.
> The following processing is only dealing with the page table entries.
> Today, if that could be called without holding the mmap_lock, that should
> be safe to not mark the VMA locked (indeed the VMA itself is not impacted=
).
>
> Thus unmap_single_vma() below no need to be touched, and its callers.
>
> In the case a locking is required, I think there is a real potential issu=
e
> in the current kernel.

IIUC you are suggesting to do the locking at the callers who need it?
If so, I'll need to carefully review the callers before changing this
because the timing when we lock might make a difference here.

>
> > +
> >       tlb_start_vma(tlb, vma);
> >       pgd =3D pgd_offset(vma->vm_mm, addr);
> >       do {
> > @@ -1652,7 +1660,7 @@ void unmap_page_range(struct mmu_gather *tlb,
> >  static void unmap_single_vma(struct mmu_gather *tlb,
> >               struct vm_area_struct *vma, unsigned long start_addr,
> >               unsigned long end_addr,
> > -             struct zap_details *details)
> > +             struct zap_details *details, bool lock_vma)
> >  {
> >       unsigned long start =3D max(vma->vm_start, start_addr);
> >       unsigned long end;
> > @@ -1691,7 +1699,7 @@ static void unmap_single_vma(struct mmu_gather *t=
lb,
> >                               i_mmap_unlock_write(vma->vm_file->f_mappi=
ng);
> >                       }
> >               } else
> > -                     unmap_page_range(tlb, vma, start, end, details);
> > +                     unmap_page_range(tlb, vma, start, end, details, l=
ock_vma);
> >       }
> >  }
> >
> > @@ -1715,7 +1723,7 @@ static void unmap_single_vma(struct mmu_gather *t=
lb,
> >   */
> >  void unmap_vmas(struct mmu_gather *tlb,
> >               struct vm_area_struct *vma, unsigned long start_addr,
> > -             unsigned long end_addr)
> > +             unsigned long end_addr, bool lock_vma)
> >  {
> >       struct mmu_notifier_range range;
> >       struct zap_details details =3D {
> > @@ -1728,7 +1736,8 @@ void unmap_vmas(struct mmu_gather *tlb,
> >                               start_addr, end_addr);
> >       mmu_notifier_invalidate_range_start(&range);
> >       for ( ; vma && vma->vm_start < end_addr; vma =3D vma->vm_next)
> > -             unmap_single_vma(tlb, vma, start_addr, end_addr, &details=
);
> > +             unmap_single_vma(tlb, vma, start_addr, end_addr, &details=
,
> > +                              lock_vma);
> >       mmu_notifier_invalidate_range_end(&range);
> >  }
> >
> > @@ -1753,7 +1762,7 @@ void zap_page_range(struct vm_area_struct *vma, u=
nsigned long start,
> >       update_hiwater_rss(vma->vm_mm);
> >       mmu_notifier_invalidate_range_start(&range);
> >       for ( ; vma && vma->vm_start < range.end; vma =3D vma->vm_next)
> > -             unmap_single_vma(&tlb, vma, start, range.end, NULL);
> > +             unmap_single_vma(&tlb, vma, start, range.end, NULL, false=
);
> >       mmu_notifier_invalidate_range_end(&range);
> >       tlb_finish_mmu(&tlb);
> >  }
> > @@ -1768,7 +1777,7 @@ void zap_page_range(struct vm_area_struct *vma, u=
nsigned long start,
> >   * The range must fit into one VMA.
> >   */
> >  static void zap_page_range_single(struct vm_area_struct *vma, unsigned=
 long address,
> > -             unsigned long size, struct zap_details *details)
> > +             unsigned long size, struct zap_details *details, bool loc=
k_vma)
> >  {
> >       struct mmu_notifier_range range;
> >       struct mmu_gather tlb;
> > @@ -1779,7 +1788,7 @@ static void zap_page_range_single(struct vm_area_=
struct *vma, unsigned long addr
> >       tlb_gather_mmu(&tlb, vma->vm_mm);
> >       update_hiwater_rss(vma->vm_mm);
> >       mmu_notifier_invalidate_range_start(&range);
> > -     unmap_single_vma(&tlb, vma, address, range.end, details);
> > +     unmap_single_vma(&tlb, vma, address, range.end, details, lock_vma=
);
> >       mmu_notifier_invalidate_range_end(&range);
> >       tlb_finish_mmu(&tlb);
> >  }
> > @@ -1802,7 +1811,7 @@ void zap_vma_ptes(struct vm_area_struct *vma, uns=
igned long address,
> >                       !(vma->vm_flags & VM_PFNMAP))
> >               return;
> >
> > -     zap_page_range_single(vma, address, size, NULL);
> > +     zap_page_range_single(vma, address, size, NULL, true);
> >  }
> >  EXPORT_SYMBOL_GPL(zap_vma_ptes);
> >
> > @@ -3483,7 +3492,8 @@ static void unmap_mapping_range_vma(struct vm_are=
a_struct *vma,
> >               unsigned long start_addr, unsigned long end_addr,
> >               struct zap_details *details)
> >  {
> > -     zap_page_range_single(vma, start_addr, end_addr - start_addr, det=
ails);
> > +     zap_page_range_single(vma, start_addr, end_addr - start_addr, det=
ails,
> > +                           false);
> >  }
> >
> >  static inline void unmap_mapping_range_tree(struct rb_root_cached *roo=
t,
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 121544fd90de..094678b4434b 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -79,7 +79,7 @@ core_param(ignore_rlimit_data, ignore_rlimit_data, bo=
ol, 0644);
> >
> >  static void unmap_region(struct mm_struct *mm,
> >               struct vm_area_struct *vma, struct vm_area_struct *prev,
> > -             unsigned long start, unsigned long end);
> > +             unsigned long start, unsigned long end, bool lock_vma);
> >
> >  static pgprot_t vm_pgprot_modify(pgprot_t oldprot, unsigned long vm_fl=
ags)
> >  {
> > @@ -1866,7 +1866,7 @@ unsigned long mmap_region(struct file *file, unsi=
gned long addr,
> >       vma->vm_file =3D NULL;
> >
> >       /* Undo any partial mapping done by a device driver. */
> > -     unmap_region(mm, vma, prev, vma->vm_start, vma->vm_end);
> > +     unmap_region(mm, vma, prev, vma->vm_start, vma->vm_end, true);
> >       if (vm_flags & VM_SHARED)
> >               mapping_unmap_writable(file->f_mapping);
> >  free_vma:
> > @@ -2626,7 +2626,7 @@ static void remove_vma_list(struct mm_struct *mm,=
 struct vm_area_struct *vma)
> >   */
> >  static void unmap_region(struct mm_struct *mm,
> >               struct vm_area_struct *vma, struct vm_area_struct *prev,
> > -             unsigned long start, unsigned long end)
> > +             unsigned long start, unsigned long end, bool lock_vma)
> >  {
> >       struct vm_area_struct *next =3D vma_next(mm, prev);
> >       struct mmu_gather tlb;
> > @@ -2634,9 +2634,10 @@ static void unmap_region(struct mm_struct *mm,
> >       lru_add_drain();
> >       tlb_gather_mmu(&tlb, mm);
> >       update_hiwater_rss(mm);
> > -     unmap_vmas(&tlb, vma, start, end);
> > +     unmap_vmas(&tlb, vma, start, end, lock_vma);
> >       free_pgtables(&tlb, vma, prev ? prev->vm_end : FIRST_USER_ADDRESS=
,
> > -                              next ? next->vm_start : USER_PGTABLES_CE=
ILING);
> > +                              next ? next->vm_start : USER_PGTABLES_CE=
ILING,
> > +                              lock_vma);
> >       tlb_finish_mmu(&tlb);
> >  }
> >
> > @@ -2849,7 +2850,7 @@ int __do_munmap(struct mm_struct *mm, unsigned lo=
ng start, size_t len,
> >       if (downgrade)
> >               mmap_write_downgrade(mm);
> >
> > -     unmap_region(mm, vma, prev, start, end);
> > +     unmap_region(mm, vma, prev, start, end, !downgrade);
> >
> >       /* Fix up all other VM information */
> >       remove_vma_list(mm, vma);
> > @@ -3129,8 +3130,8 @@ void exit_mmap(struct mm_struct *mm)
> >       tlb_gather_mmu_fullmm(&tlb, mm);
> >       /* update_hiwater_rss(mm) here? but nobody should be looking */
> >       /* Use -1 here to ensure all VMAs in the mm are unmapped */
> > -     unmap_vmas(&tlb, vma, 0, -1);
> > -     free_pgtables(&tlb, vma, FIRST_USER_ADDRESS, USER_PGTABLES_CEILIN=
G);
> > +     unmap_vmas(&tlb, vma, 0, -1, true);
> > +     free_pgtables(&tlb, vma, FIRST_USER_ADDRESS, USER_PGTABLES_CEILIN=
G, true);
> >       tlb_finish_mmu(&tlb);
> >
> >       /* Walk the list again, actually closing and freeing it. */
> > diff --git a/mm/oom_kill.c b/mm/oom_kill.c
> > index 3c6cf9e3cd66..6ffa7c511aa3 100644
> > --- a/mm/oom_kill.c
> > +++ b/mm/oom_kill.c
> > @@ -549,7 +549,8 @@ bool __oom_reap_task_mm(struct mm_struct *mm)
> >                               ret =3D false;
> >                               continue;
> >                       }
> > -                     unmap_page_range(&tlb, vma, range.start, range.en=
d, NULL);
> > +                     unmap_page_range(&tlb, vma, range.start, range.en=
d,
> > +                                      NULL, false);
> >                       mmu_notifier_invalidate_range_end(&range);
> >                       tlb_finish_mmu(&tlb);
> >               }
>
> I'm wondering if the VMA locking should be done here instead of inside
> unmap_page_range() which is not really touching the VMA's fields.
>
> Here this would be needed because the page fault handler may check the
> MMF_UNSTABLE flag and the VMA's locking before this loop is entered by
> another thread.

Hmm. I'll double-check. Before my patchset __oom_reap_task_mm is
called with mmap_lock held for read, therefore technically it can race
with page fault handlers. There must be something that makes it safe.
Will try to find out what is that something...

>
> --
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>
