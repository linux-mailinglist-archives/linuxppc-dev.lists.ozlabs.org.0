Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6ED5AF406
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 21:01:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMZVq61t5z3bXG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 05:01:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=IJClkJZA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=IJClkJZA;
	dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMZV90Nxlz2xHM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 05:01:03 +1000 (AEST)
Received: by mail-io1-xd31.google.com with SMTP id n202so9688576iod.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Sep 2022 12:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=VZWfKkBjgWu+gLzzTMPZReTUPnxocF2s2gADqtxYuc4=;
        b=IJClkJZA2ci9X9YudNpotHQ2jHP9kri5ddYGJUdBbxArAYAFuAVNpwyi0s3x2GDssE
         wKlyoqG+UBUO81USH5es0irAMzX6EFRrghUs1JE+MnRT/e+EpqHnfVk4E9YlsCNYKSZR
         Xl/zBXPiLh9E3zBsrJo+zynSOWH0uE160CEF9eobQTk+DSbznkbFMDIZX6ryEvldAITQ
         rGd7A4QdHAe65SeKpekqDuZxrEzMMNC8Uh0XEMVhqGWbIum8wwMgpRB0uFJeatcHhbst
         7ZYGUBjpSVmToOuJcW+bSV+1ks9AULpHqc28iGBCjEreYwuWq9VPoAmFhemRoaSqPBCN
         1QYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=VZWfKkBjgWu+gLzzTMPZReTUPnxocF2s2gADqtxYuc4=;
        b=mZqT7b6MFKI/Yj0xVt+BjHadh6HqEdwW32UTOOXdYAMcfp7BCoDFlt4RT5dPnhBNU8
         B2xHmWiZz8Xd1uLmE2H5aI6Onqu2kMSsj9Bsg3A+HR+2Asr894SbeZSEUAhJJ6ydsife
         SA/i0TB0Lak1okLbKCu6yo5ypSQIUbdSCPfh5KXLQQ8EjXs+ZtvdaXs5cPqVaixIm9wb
         BrEts1HJu0oeljJ8qh2fatpLLPxRFuZhYckPGVLWWl+Kc1NNy67bREdMdefOWUXC0zOz
         iwuYCh54H6ODlxNGd+auK5jRT5PsCG/Tf5vrSx0BK9Rel4M9KXxhi8Wedz/2kqF5U+pt
         IIRg==
X-Gm-Message-State: ACgBeo2i7vssQ4k4C5tazZTMpcitj6BjT2CcdEJNboSR5hhiMuhvrxnB
	f6UY+/9Xeowe/6KGt1AquoY71YsYM+WNjw4qn3uKDg==
X-Google-Smtp-Source: AA6agR7xDh5HT5Y9eMResmshIM/DOvn/mOOq2ia7QJOQf/o2UTiVbl/Ns26hFBPH0Ki7mcr19c0jix+nJSfeWWZE0GE=
X-Received: by 2002:a6b:2a88:0:b0:68a:e898:2822 with SMTP id
 q130-20020a6b2a88000000b0068ae8982822mr24499577ioq.75.1662490858786; Tue, 06
 Sep 2022 12:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901173516.702122-7-surenb@google.com>
 <1624be86-4c17-46e5-fafc-eb8afb7b9b4a@linux.ibm.com>
In-Reply-To: <1624be86-4c17-46e5-fafc-eb8afb7b9b4a@linux.ibm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 6 Sep 2022 12:00:47 -0700
Message-ID: <CAJuCfpFi07ZpAuSLwADGO0mfu2Hon9jWb0hsCytorchQ=cgK3Q@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 06/28] mm: mark VMA as locked whenever
 vma->vm_flags are modified
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
Cc: Michel Lespinasse <michel@lespinasse.org>, Joel Fernandes <joelaf@google.com>, Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Xu <peterx@redhat.com>, dhowells@redhat.com, linux-mm <linux-mm@kvack.org>, Jerome Glisse <jglisse@google.com>, Davidlohr Bueso <dave@stgolabs.net>, Minchan Kim <minchan@google.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Mel Gorman <mgorman@suse.de>, David Rientjes <rientjes@google.com>, Axel Rasmussen <axelrasmussen@google.com>, kernel-team <kernel-team@android.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, Andy Lutomirski <luto@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Kent Overstreet <kent.overstreet@linux.dev>, LKML <linux-
 kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 6, 2022 at 7:27 AM Laurent Dufour <ldufour@linux.ibm.com> wrote=
:
>
> Le 01/09/2022 =C3=A0 19:34, Suren Baghdasaryan a =C3=A9crit :
> > VMA flag modifications should be done under VMA lock to prevent concurr=
ent
> > page fault handling in that area.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  fs/proc/task_mmu.c | 1 +
> >  fs/userfaultfd.c   | 6 ++++++
> >  mm/madvise.c       | 1 +
> >  mm/mlock.c         | 2 ++
> >  mm/mmap.c          | 1 +
> >  mm/mprotect.c      | 1 +
> >  6 files changed, 12 insertions(+)
>
> There are few changes also done in the driver's space, for instance:
>
> *** arch/x86/kernel/cpu/sgx/driver.c:
> sgx_mmap[98]                   vma->vm_flags |=3D VM_PFNMAP | VM_DONTEXPA=
ND |
> VM_DONTDUMP | VM_IO;
> *** arch/x86/kernel/cpu/sgx/virt.c:
> sgx_vepc_mmap[108]             vma->vm_flags |=3D VM_PFNMAP | VM_IO |
> VM_DONTDUMP | VM_DONTCOPY;
> *** drivers/dax/device.c:
> dax_mmap[311]                  vma->vm_flags |=3D VM_HUGEPAGE;
>
> I guess these changes to vm_flags should be protected as well, or to be
> checked one by one.

Thanks for noting these! I'll add necessary locking here and will look
for other places I might have missed.

>
> >
> > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > index 4e0023643f8b..ceffa5c2c650 100644
> > --- a/fs/proc/task_mmu.c
> > +++ b/fs/proc/task_mmu.c
> > @@ -1285,6 +1285,7 @@ static ssize_t clear_refs_write(struct file *file=
, const char __user *buf,
> >                       for (vma =3D mm->mmap; vma; vma =3D vma->vm_next)=
 {
> >                               if (!(vma->vm_flags & VM_SOFTDIRTY))
> >                                       continue;
> > +                             vma_mark_locked(vma);
> >                               vma->vm_flags &=3D ~VM_SOFTDIRTY;
> >                               vma_set_page_prot(vma);
> >                       }
> > diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
> > index 175de70e3adf..fe557b3d1c07 100644
> > --- a/fs/userfaultfd.c
> > +++ b/fs/userfaultfd.c
> > @@ -620,6 +620,7 @@ static void userfaultfd_event_wait_completion(struc=
t userfaultfd_ctx *ctx,
> >               mmap_write_lock(mm);
> >               for (vma =3D mm->mmap; vma; vma =3D vma->vm_next)
> >                       if (vma->vm_userfaultfd_ctx.ctx =3D=3D release_ne=
w_ctx) {
> > +                             vma_mark_locked(vma);
> >                               vma->vm_userfaultfd_ctx =3D NULL_VM_UFFD_=
CTX;
> >                               vma->vm_flags &=3D ~__VM_UFFD_FLAGS;
> >                       }
> > @@ -653,6 +654,7 @@ int dup_userfaultfd(struct vm_area_struct *vma, str=
uct list_head *fcs)
> >
> >       octx =3D vma->vm_userfaultfd_ctx.ctx;
> >       if (!octx || !(octx->features & UFFD_FEATURE_EVENT_FORK)) {
> > +             vma_mark_locked(vma);
> >               vma->vm_userfaultfd_ctx =3D NULL_VM_UFFD_CTX;
> >               vma->vm_flags &=3D ~__VM_UFFD_FLAGS;
> >               return 0;
> > @@ -734,6 +736,7 @@ void mremap_userfaultfd_prep(struct vm_area_struct =
*vma,
> >               atomic_inc(&ctx->mmap_changing);
> >       } else {
> >               /* Drop uffd context if remap feature not enabled */
> > +             vma_mark_locked(vma);
> >               vma->vm_userfaultfd_ctx =3D NULL_VM_UFFD_CTX;
> >               vma->vm_flags &=3D ~__VM_UFFD_FLAGS;
> >       }
> > @@ -891,6 +894,7 @@ static int userfaultfd_release(struct inode *inode,=
 struct file *file)
> >                       vma =3D prev;
> >               else
> >                       prev =3D vma;
> > +             vma_mark_locked(vma);
> >               vma->vm_flags =3D new_flags;
> >               vma->vm_userfaultfd_ctx =3D NULL_VM_UFFD_CTX;
> >       }
> > @@ -1449,6 +1453,7 @@ static int userfaultfd_register(struct userfaultf=
d_ctx *ctx,
> >                * the next vma was merged into the current one and
> >                * the current one has not been updated yet.
> >                */
> > +             vma_mark_locked(vma);
> >               vma->vm_flags =3D new_flags;
> >               vma->vm_userfaultfd_ctx.ctx =3D ctx;
> >
> > @@ -1630,6 +1635,7 @@ static int userfaultfd_unregister(struct userfaul=
tfd_ctx *ctx,
> >                * the next vma was merged into the current one and
> >                * the current one has not been updated yet.
> >                */
> > +             vma_mark_locked(vma);
> >               vma->vm_flags =3D new_flags;
> >               vma->vm_userfaultfd_ctx =3D NULL_VM_UFFD_CTX;
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 5f0f0948a50e..a173f0025abd 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -181,6 +181,7 @@ static int madvise_update_vma(struct vm_area_struct=
 *vma,
> >       /*
> >        * vm_flags is protected by the mmap_lock held in write mode.
> >        */
> > +     vma_mark_locked(vma);
> >       vma->vm_flags =3D new_flags;
> >       if (!vma->vm_file) {
> >               error =3D replace_anon_vma_name(vma, anon_name);
> > diff --git a/mm/mlock.c b/mm/mlock.c
> > index b14e929084cc..f62e1a4d05f2 100644
> > --- a/mm/mlock.c
> > +++ b/mm/mlock.c
> > @@ -380,6 +380,7 @@ static void mlock_vma_pages_range(struct vm_area_st=
ruct *vma,
> >        */
> >       if (newflags & VM_LOCKED)
> >               newflags |=3D VM_IO;
> > +     vma_mark_locked(vma);
> >       WRITE_ONCE(vma->vm_flags, newflags);
> >
> >       lru_add_drain();
> > @@ -456,6 +457,7 @@ static int mlock_fixup(struct vm_area_struct *vma, =
struct vm_area_struct **prev,
> >
> >       if ((newflags & VM_LOCKED) && (oldflags & VM_LOCKED)) {
> >               /* No work to do, and mlocking twice would be wrong */
> > +             vma_mark_locked(vma);
> >               vma->vm_flags =3D newflags;
> >       } else {
> >               mlock_vma_pages_range(vma, start, end, newflags);
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 693e6776be39..f89c9b058105 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -1818,6 +1818,7 @@ unsigned long mmap_region(struct file *file, unsi=
gned long addr,
> >  out:
> >       perf_event_mmap(vma);
> >
> > +     vma_mark_locked(vma);
> >       vm_stat_account(mm, vm_flags, len >> PAGE_SHIFT);
> >       if (vm_flags & VM_LOCKED) {
> >               if ((vm_flags & VM_SPECIAL) || vma_is_dax(vma) ||
>
> I guess, this doesn't really impact, but the call to vma_mark_locked(vma)
> may be done only in the case the vm_flags field is touched.
> Something like this:
>
>         vm_stat_account(mm, vm_flags, len >> PAGE_SHIFT);
>         if (vm_flags & VM_LOCKED) {
>                 if ((vm_flags & VM_SPECIAL) || vma_is_dax(vma) ||
>                                         is_vm_hugetlb_page(vma) ||
> -                                       vma =3D=3D get_gate_vma(current->=
mm))
> +                                       vma =3D=3D get_gate_vma(current->=
mm)) {
> +                       vma_mark_locked(vma);
>                         vma->vm_flags &=3D VM_LOCKED_CLEAR_MASK;
> -               else
> +               } else
>                         mm->locked_vm +=3D (len >> PAGE_SHIFT);
>         }
>
>
> > diff --git a/mm/mprotect.c b/mm/mprotect.c
> > index bc6bddd156ca..df47fc21b0e4 100644
> > --- a/mm/mprotect.c
> > +++ b/mm/mprotect.c
> > @@ -621,6 +621,7 @@ mprotect_fixup(struct mmu_gather *tlb, struct vm_ar=
ea_struct *vma,
> >        * vm_flags and vm_page_prot are protected by the mmap_lock
> >        * held in write mode.
> >        */
> > +     vma_mark_locked(vma);
> >       vma->vm_flags =3D newflags;
> >       /*
> >        * We want to check manually if we can change individual PTEs wri=
table
>
