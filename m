Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D51816A1149
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 21:35:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN4XR4nTmz3f3L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 07:35:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Bjdh4smk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Bjdh4smk;
	dkim-atps=neutral
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN4WS5Lhlz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 07:34:27 +1100 (AEDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5384ff97993so92898147b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 12:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f5E7QcOom432WfEB2tmrrxUq3oMwXLGBGrJE5okH/nk=;
        b=Bjdh4smkRYXHxyJxf+ZPmX1mSDOmm08FE7XfZXgXnwbjIj0Tr92u5+3ShwG8tiACzc
         Pof9mljBUaqOQTUVIM1dPEXeIO1n+vfqVjaajcfSb8uDjDpKkcLttKpyU2C/2S7lm+mf
         q42lTgGSPo9zGGLJRWqST8W0nNri4Cxbg2MLkL5MQ6ukmU00c89ISaqbm900QLcuYhEk
         e1er6rludgb8W/NHr6xfiascVRAJzEMxgbqRxRdgHwX2szDjjBMtfu1HahnMjBS55yLo
         r4VLNPUnUIUZes9CuFCJgSxvTSuqgxT8D/GUbu3fifQqAgmc+BacynLKLTXkq8fdqCqW
         2X6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f5E7QcOom432WfEB2tmrrxUq3oMwXLGBGrJE5okH/nk=;
        b=dgEgQQ/piI9GnWIrAsf3CopnCIX8VrwMaWOlcgA7QyV9MfxZ8y9ZeLMN93X03Db9x6
         PgnjXCFlcoJJOL8Wa9kIWQuEDaV6zgHOVqNcw8n+ZiYcB7ldUJEZNaMYISNu8Wt0gEtv
         B5uqwKL8zIy1TL8HS3a3cqqZqORLOU0G7bZDmbXepbqMnb5wj+PFQmaip75cGXzjezIQ
         0LN14F+ZyKw7OFTEeXPVy9mJqsK327vIy8e0bp2GqgFGrHjG1EPa0ck2KzohsW30eu6A
         qJ26u7BKHLTycB6YNfDUYbMQj3i/A++9JcrKOPsyobg2sDUuSo9UKYbm5yE4JipTd5pW
         rdLQ==
X-Gm-Message-State: AO0yUKUWE/n8f0c0aC1d4PjCS+/gix7fYuLijitUEkfXcsdxzLXbWXjg
	gp3Dj4R8s7qweSyNCvIqMNvqFU2k+dLttZ0M6x6lbw==
X-Google-Smtp-Source: AK7set9Te/5uWtt5zt1fQaHwXqFRJISgrOCqlFEddaHqmIZQDT7I+U9PTLYweByzGpk4rUIUZlowo03Z5xLHHDmLpLE=
X-Received: by 2002:a5b:b07:0:b0:9fe:1493:8b8 with SMTP id z7-20020a5b0b07000000b009fe149308b8mr2417322ybp.6.1677184464289;
 Thu, 23 Feb 2023 12:34:24 -0800 (PST)
MIME-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com> <20230216051750.3125598-25-surenb@google.com>
 <20230223200800.5cydej7s2ybafuaf@revolver>
In-Reply-To: <20230223200800.5cydej7s2ybafuaf@revolver>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 23 Feb 2023 12:34:13 -0800
Message-ID: <CAJuCfpFaDA6vW1MwbCSM8xoUoVMiERiLtTZd-u7Jc4qn0a-w0w@mail.gmail.com>
Subject: Re: [PATCH v3 24/35] mm: introduce vma detached flag
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	akpm@linux-foundation.org, michel@lespinasse.org, jglisse@google.com, 
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, 
	mgorman@techsingularity.net, dave@stgolabs.net, willy@infradead.org, 
	peterz@infradead.org, ldufour@linux.ibm.com, paulmck@kernel.org, 
	mingo@redhat.com, will@kernel.org, luto@kernel.org, songliubraving@fb.com, 
	peterx@redhat.com, david@redhat.com, dhowells@redhat.com, hughd@google.com, 
	bigeasy@linutronix.de, kent.overstreet@linux.dev, punit.agrawal@bytedance.com, 
	lstoakes@gmail.com, peterjung1337@gmail.com, rientjes@google.com, 
	chriscli@google.com, axelrasmussen@google.com, joelaf@google.com, 
	minchan@google.com, rppt@kernel.org, jannh@google.com, shakeelb@google.com, 
	tatashin@google.com, edumazet@google.com, gthelen@google.com, 
	gurua@google.com, arjunroy@google.com, soheil@google.com, leewalsh@google.com, 
	posk@google.com, michalechner92@googlemail.com, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 23, 2023 at 12:08 PM Liam R. Howlett
<Liam.Howlett@oracle.com> wrote:
>
>
> Can we change this to active/inactive?  I think there is potential for
> reusing this functionality to even larger degrees and that name would
> fit better and would still make sense in this context.
>
> ie: vma_mark_active() and vma_mark_inactive() ?

Those names sound too generic (not obvious what active/inactive
means), while detached/isolated I think is more clear and specific.
Does not really make a huge difference to me but maybe you can come up
with better naming that addresses my concern and meets your usecase?

>
> * Suren Baghdasaryan <surenb@google.com> [230216 00:18]:
> > Per-vma locking mechanism will search for VMA under RCU protection and
> > then after locking it, has to ensure it was not removed from the VMA
> > tree after we found it. To make this check efficient, introduce a
> > vma->detached flag to mark VMAs which were removed from the VMA tree.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  include/linux/mm.h       | 11 +++++++++++
> >  include/linux/mm_types.h |  3 +++
> >  mm/mmap.c                |  2 ++
> >  3 files changed, 16 insertions(+)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index f4f702224ec5..3f98344f829c 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -693,6 +693,14 @@ static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> >       VM_BUG_ON_VMA(vma->vm_lock_seq != READ_ONCE(vma->vm_mm->mm_lock_seq), vma);
> >  }
> >
> > +static inline void vma_mark_detached(struct vm_area_struct *vma, bool detached)
> > +{
> > +     /* When detaching vma should be write-locked */
> > +     if (detached)
> > +             vma_assert_write_locked(vma);
> > +     vma->detached = detached;
> > +}
> > +
> >  #else /* CONFIG_PER_VMA_LOCK */
> >
> >  static inline void vma_init_lock(struct vm_area_struct *vma) {}
> > @@ -701,6 +709,8 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
> >  static inline void vma_end_read(struct vm_area_struct *vma) {}
> >  static inline void vma_start_write(struct vm_area_struct *vma) {}
> >  static inline void vma_assert_write_locked(struct vm_area_struct *vma) {}
> > +static inline void vma_mark_detached(struct vm_area_struct *vma,
> > +                                  bool detached) {}
> >
> >  #endif /* CONFIG_PER_VMA_LOCK */
> >
> > @@ -712,6 +722,7 @@ static inline void vma_init(struct vm_area_struct *vma, struct mm_struct *mm)
> >       vma->vm_mm = mm;
> >       vma->vm_ops = &dummy_vm_ops;
> >       INIT_LIST_HEAD(&vma->anon_vma_chain);
> > +     vma_mark_detached(vma, false);
> >       vma_init_lock(vma);
> >  }
> >
> > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > index e268723eaf44..939f4f5a1115 100644
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -511,6 +511,9 @@ struct vm_area_struct {
> >  #ifdef CONFIG_PER_VMA_LOCK
> >       int vm_lock_seq;
> >       struct rw_semaphore lock;
> > +
> > +     /* Flag to indicate areas detached from the mm->mm_mt tree */
> > +     bool detached;
> >  #endif
> >
> >       /*
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 801608726be8..adf40177e68f 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -593,6 +593,7 @@ static inline void vma_complete(struct vma_prepare *vp,
> >
> >       if (vp->remove) {
> >  again:
> > +             vma_mark_detached(vp->remove, true);
> >               if (vp->file) {
> >                       uprobe_munmap(vp->remove, vp->remove->vm_start,
> >                                     vp->remove->vm_end);
> > @@ -2267,6 +2268,7 @@ static inline int munmap_sidetree(struct vm_area_struct *vma,
> >       if (mas_store_gfp(mas_detach, vma, GFP_KERNEL))
> >               return -ENOMEM;
> >
> > +     vma_mark_detached(vma, true);
> >       if (vma->vm_flags & VM_LOCKED)
> >               vma->vm_mm->locked_vm -= vma_pages(vma);
> >
> > --
> > 2.39.1
> >
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
