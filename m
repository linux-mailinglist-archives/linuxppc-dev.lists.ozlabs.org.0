Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B845B3C92
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 18:02:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPLP31JXvz3c8W
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 02:02:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ZGrlqpty;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ZGrlqpty;
	dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPLNS26K4z2xYy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 02:02:15 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id b136so3360679yba.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Sep 2022 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=DQbTmUrdrgDTvMmvyU9EuQQznosHCNDpYSf+XCcrSrw=;
        b=ZGrlqpty6dTHcA0AGjeGbNjw2MRTqt5szBBhpVQ4dkAsz27E+xJBinSUjpum6sOJ74
         KUZIDyDTlEwKWlVEOqzVoPwsgYo6xRs2omL0jr9x673C7t9bWdmM231kaPxOkEpsERNk
         sUlQeM1/QWZrA4nzRANgMA3UJkLeBZnQOHmgqtekadzWeed3VlEw+rQY6cYq9FkJGlyk
         eS/uEeop/qmLnkiU9Ys8shAx2VjqIgYTIQI6dvC+LcponoNKz/e7KU3mEKjps86U/s0V
         EW2m8zRsZ3OQ1M1GTcpCTPJF6NkaKVoEl9GprcuZylB1npUnqKSwkuU5ir52s1OYBMdH
         XORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=DQbTmUrdrgDTvMmvyU9EuQQznosHCNDpYSf+XCcrSrw=;
        b=zRTGPLEOXceU8m/VZ3HVrzza6YXuMRvc5a4wUUfZdMbTod8LKtZMsxDgyR5hDMPV6p
         w9q6u23SR1+coszxbHEvjtOz22j7aY3PTyDMzsJTlAnsZyd91L1alpppxnlhDF0zBs7+
         g+r1VbMBy9k/4dT3pw3UO+MUCtthPh8pgnr3QCejZ64dpNI8RjsiQxOESnRyLXNNhtNo
         EPOVsTcCqCW3wKqgDvYE56huLNzUZY+vJC8TIBdPzsKW8JWdilXx5fRRUrsDbo/MVpDl
         qa7ev6Qde2I3Ycyz3veweWbrjDl1QMOtEO4LoIG+VpFeCbqVmrwr40jQZ7IP2RAQU5Dq
         eYzQ==
X-Gm-Message-State: ACgBeo2olYVt+jBuhMQjVRw98omfoS5TsLaLo3rXC1dSA/NGaWMZo7ow
	qUC0wmHvUu6e5NvrNVxc5F2KeXCcwDWuGWbWak346g==
X-Google-Smtp-Source: AA6agR5Nq64ZM2y3FbQ4HLpbzNHvKJZ/Snb2eh+Dl0Jr1a7cLwUO5zAkkKuGlWLxpWXb/VD567UKIjM3qf4+35Bz7gg=
X-Received: by 2002:a25:cc8d:0:b0:6a8:40cb:d730 with SMTP id
 l135-20020a25cc8d000000b006a840cbd730mr12446545ybf.119.1662739332705; Fri, 09
 Sep 2022 09:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901173516.702122-29-surenb@google.com>
 <34dd5656-dc3c-6a20-5390-04d05c619fdc@linux.ibm.com>
In-Reply-To: <34dd5656-dc3c-6a20-5390-04d05c619fdc@linux.ibm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 9 Sep 2022 09:02:01 -0700
Message-ID: <CAJuCfpGn=Xhc3SnrK2ei1WPoFPaW00xZkS9MebN9Zxfv9joPoA@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 28/28] kernel/fork: throttle call_rcu() calls
 in vm_area_free
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

On Fri, Sep 9, 2022 at 8:19 AM Laurent Dufour <ldufour@linux.ibm.com> wrote=
:
>
> Le 01/09/2022 =C3=A0 19:35, Suren Baghdasaryan a =C3=A9crit :
> > call_rcu() can take a long time when callback offloading is enabled.
> > Its use in the vm_area_free can cause regressions in the exit path when
> > multiple VMAs are being freed. To minimize that impact, place VMAs into
> > a list and free them in groups using one call_rcu() call per group.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  include/linux/mm.h       |  1 +
> >  include/linux/mm_types.h | 11 ++++++-
> >  kernel/fork.c            | 68 +++++++++++++++++++++++++++++++++++-----
> >  mm/init-mm.c             |  3 ++
> >  mm/mmap.c                |  1 +
> >  5 files changed, 75 insertions(+), 9 deletions(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index a3cbaa7b9119..81dff694ac14 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -249,6 +249,7 @@ void setup_initial_init_mm(void *start_code, void *=
end_code,
> >  struct vm_area_struct *vm_area_alloc(struct mm_struct *);
> >  struct vm_area_struct *vm_area_dup(struct vm_area_struct *);
> >  void vm_area_free(struct vm_area_struct *);
> > +void drain_free_vmas(struct mm_struct *mm);
> >
> >  #ifndef CONFIG_MMU
> >  extern struct rb_root nommu_region_tree;
> > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > index 36562e702baf..6f3effc493b1 100644
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -412,7 +412,11 @@ struct vm_area_struct {
> >                       struct vm_area_struct *vm_next, *vm_prev;
> >               };
> >  #ifdef CONFIG_PER_VMA_LOCK
> > -             struct rcu_head vm_rcu; /* Used for deferred freeing. */
> > +             struct {
> > +                     struct list_head vm_free_list;
> > +                     /* Used for deferred freeing. */
> > +                     struct rcu_head vm_rcu;
> > +             };
> >  #endif
> >       };
> >
> > @@ -573,6 +577,11 @@ struct mm_struct {
> >                                         */
> >  #ifdef CONFIG_PER_VMA_LOCK
> >               int mm_lock_seq;
> > +             struct {
> > +                     struct list_head head;
> > +                     spinlock_t lock;
> > +                     int size;
> > +             } vma_free_list;
> >  #endif
> >
> >
> > diff --git a/kernel/fork.c b/kernel/fork.c
> > index b443ba3a247a..7c88710aed72 100644
> > --- a/kernel/fork.c
> > +++ b/kernel/fork.c
> > @@ -483,26 +483,75 @@ struct vm_area_struct *vm_area_dup(struct vm_area=
_struct *orig)
> >  }
> >
> >  #ifdef CONFIG_PER_VMA_LOCK
> > -static void __vm_area_free(struct rcu_head *head)
> > +static inline void __vm_area_free(struct vm_area_struct *vma)
> >  {
> > -     struct vm_area_struct *vma =3D container_of(head, struct vm_area_=
struct,
> > -                                               vm_rcu);
> >       /* The vma should either have no lock holders or be write-locked.=
 */
> >       vma_assert_no_reader(vma);
> >       kmem_cache_free(vm_area_cachep, vma);
> >  }
> > -#endif
> > +
> > +static void vma_free_rcu_callback(struct rcu_head *head)
> > +{
> > +     struct vm_area_struct *first_vma;
> > +     struct vm_area_struct *vma, *vma2;
> > +
> > +     first_vma =3D container_of(head, struct vm_area_struct, vm_rcu);
> > +     list_for_each_entry_safe(vma, vma2, &first_vma->vm_free_list, vm_=
free_list)
>
> Is that safe to walk the list against concurrent calls to
> list_splice_init(), or list_add()?

I think it is. drain_free_vmas() moves the to-be-destroyed and already
isolated VMAs from mm->vma_free_list into to_destroy list and then
passes that list to vma_free_rcu_callback(). At this point the list of
VMAs passed to vma_free_rcu_callback() is not accessible either from
mm (VMAs were isolated before vm_area_free() was called) or from
drain_free_vmas() since they were already removed from
mm->vma_free_list. Does that make sense?

>
> > +             __vm_area_free(vma);
> > +     __vm_area_free(first_vma);
> > +}
> > +
> > +void drain_free_vmas(struct mm_struct *mm)
> > +{
> > +     struct vm_area_struct *first_vma;
> > +     LIST_HEAD(to_destroy);
> > +
> > +     spin_lock(&mm->vma_free_list.lock);
> > +     list_splice_init(&mm->vma_free_list.head, &to_destroy);
> > +     mm->vma_free_list.size =3D 0;
> > +     spin_unlock(&mm->vma_free_list.lock);
> > +
> > +     if (list_empty(&to_destroy))
> > +             return;
> > +
> > +     first_vma =3D list_first_entry(&to_destroy, struct vm_area_struct=
, vm_free_list);
> > +     /* Remove the head which is allocated on the stack */
> > +     list_del(&to_destroy);
> > +
> > +     call_rcu(&first_vma->vm_rcu, vma_free_rcu_callback);
> > +}
> > +
> > +#define VM_AREA_FREE_LIST_MAX        32
> > +
> > +void vm_area_free(struct vm_area_struct *vma)
> > +{
> > +     struct mm_struct *mm =3D vma->vm_mm;
> > +     bool drain;
> > +
> > +     free_anon_vma_name(vma);
> > +
> > +     spin_lock(&mm->vma_free_list.lock);
> > +     list_add(&vma->vm_free_list, &mm->vma_free_list.head);
> > +     mm->vma_free_list.size++;
> > +     drain =3D mm->vma_free_list.size > VM_AREA_FREE_LIST_MAX;
> > +     spin_unlock(&mm->vma_free_list.lock);
> > +
> > +     if (drain)
> > +             drain_free_vmas(mm);
> > +}
> > +
> > +#else /* CONFIG_PER_VMA_LOCK */
> > +
> > +void drain_free_vmas(struct mm_struct *mm) {}
> >
> >  void vm_area_free(struct vm_area_struct *vma)
> >  {
> >       free_anon_vma_name(vma);
> > -#ifdef CONFIG_PER_VMA_LOCK
> > -     call_rcu(&vma->vm_rcu, __vm_area_free);
> > -#else
> >       kmem_cache_free(vm_area_cachep, vma);
> > -#endif
> >  }
> >
> > +#endif /* CONFIG_PER_VMA_LOCK */
> > +
> >  static void account_kernel_stack(struct task_struct *tsk, int account)
> >  {
> >       if (IS_ENABLED(CONFIG_VMAP_STACK)) {
> > @@ -1137,6 +1186,9 @@ static struct mm_struct *mm_init(struct mm_struct=
 *mm, struct task_struct *p,
> >       INIT_LIST_HEAD(&mm->mmlist);
> >  #ifdef CONFIG_PER_VMA_LOCK
> >       WRITE_ONCE(mm->mm_lock_seq, 0);
> > +     INIT_LIST_HEAD(&mm->vma_free_list.head);
> > +     spin_lock_init(&mm->vma_free_list.lock);
> > +     mm->vma_free_list.size =3D 0;
> >  #endif
> >       mm_pgtables_bytes_init(mm);
> >       mm->map_count =3D 0;
> > diff --git a/mm/init-mm.c b/mm/init-mm.c
> > index 8399f90d631c..7b6d2460545f 100644
> > --- a/mm/init-mm.c
> > +++ b/mm/init-mm.c
> > @@ -39,6 +39,9 @@ struct mm_struct init_mm =3D {
> >       .mmlist         =3D LIST_HEAD_INIT(init_mm.mmlist),
> >  #ifdef CONFIG_PER_VMA_LOCK
> >       .mm_lock_seq    =3D 0,
> > +     .vma_free_list.head =3D LIST_HEAD_INIT(init_mm.vma_free_list.head=
),
> > +     .vma_free_list.lock =3D  __SPIN_LOCK_UNLOCKED(init_mm.vma_free_li=
st.lock),
> > +     .vma_free_list.size =3D 0,
> >  #endif
> >       .user_ns        =3D &init_user_ns,
> >       .cpu_bitmap     =3D CPU_BITS_NONE,
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 1edfcd384f5e..d61b7ef84ba6 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -3149,6 +3149,7 @@ void exit_mmap(struct mm_struct *mm)
> >       }
> >       mm->mmap =3D NULL;
> >       mmap_write_unlock(mm);
> > +     drain_free_vmas(mm);
> >       vm_unacct_memory(nr_accounted);
> >  }
> >
>
