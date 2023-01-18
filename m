Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1879C670F8E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 02:08:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxSLD6vy7z3fCD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 12:08:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=HR7OBma7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=HR7OBma7;
	dkim-atps=neutral
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxSKG4ZWFz3bbc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 12:07:13 +1100 (AEDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-4d4303c9de6so297081437b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 17:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+UzsDlXlC7t5BIJkt4S1C9pOgCAtRZ1rD2tVfs3+9vM=;
        b=HR7OBma7oNcSAgyQdahWkS/+GYEiMo2K7u7SH7XKaEtDUcUden1EUbI6LD9VVF7J1x
         W7lI2euLfggvfs2V0JWHWkHe3qxzN6ohS9ExKzTaJMGOQSZuOKR9RScixndA7s2QYaQ6
         HfUWv9VD3eHjySCGt6xoaLyVVtj2EEONzfERHlbh0iPGw2sCO/lcesCY2eTVPQRoMJb+
         gqR21sjs3J+x5zerViL5YkWvVAzNFkjnCi2vD95FzbGwg3CJYzMrtPoGRP4w9LZjSUIu
         gRLpF7+BYQnoKYJBu29968t+KMhHg8v34Cty12VpH/W2gIUx8Z32jLwQzC5wkSaXhVBr
         /4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+UzsDlXlC7t5BIJkt4S1C9pOgCAtRZ1rD2tVfs3+9vM=;
        b=pWrd3SPuz+vyQvJOCVN5HHhGa9ZsjaKVrB07T8FHHNpSrQwWYvJPimUSXvpLXpQ9wP
         3MplqyImJKEAucd7mpGSk4C1EyVCSmPOrXJRqTR7q2PSpdkybVTZkEjOn8AmKuDhKpKo
         QQrqPO4Ym9T9GsORfx1GcvPx8Q7OJLAozGXotfT+dw9SWiyISSELIzqgbJGSHha+td9p
         cyLfVgaN3SVAe65Io4annXCCYPFQbnvm+O4RiSmyyX315FqU/2hiDDaPZLOxBF7EmAho
         VWy22KqJuvL7Q/J4AZq6jtnxy3ksEPCyD3Jvw8oOmZ4AWYzpoi2nBTsMr+piFtLEvad7
         AgJA==
X-Gm-Message-State: AFqh2kppJ7A5MXBFeaeW+Ur8Wav/ycqtpaot6jy4Ua4/vS5521Q5NnQZ
	CxTDViY6ITLk87PzW0yskqEXyitU5S0KCe2M/XwmjA==
X-Google-Smtp-Source: AMrXdXt1di0oM/b6morQivkbcXm4Ky5z3zOnzmSbWPfTQh0c+LbBSHcKZuP95W8tXfA3+CxNeZNf17AZY9H5yMUDV7E=
X-Received: by 2002:a81:6d8d:0:b0:490:89c3:21b0 with SMTP id
 i135-20020a816d8d000000b0049089c321b0mr672398ywc.132.1674004028426; Tue, 17
 Jan 2023 17:07:08 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-29-surenb@google.com>
 <Y8bDAVC/aiL9tCyz@dhcp22.suse.cz>
In-Reply-To: <Y8bDAVC/aiL9tCyz@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Jan 2023 17:06:57 -0800
Message-ID: <CAJuCfpHRRsUMNHp2H3UiB4EZbe9CXTVcAC+oOR1dscENjp1Jbw@mail.gmail.com>
Subject: Re: [PATCH 28/41] mm: introduce lock_vma_under_rcu to be used from
 arch-specific code
To: Michal Hocko <mhocko@suse.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.ne
 t
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 7:47 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Mon 09-01-23 12:53:23, Suren Baghdasaryan wrote:
> > Introduce lock_vma_under_rcu function to lookup and lock a VMA during
> > page fault handling. When VMA is not found, can't be locked or changes
> > after being locked, the function returns NULL. The lookup is performed
> > under RCU protection to prevent the found VMA from being destroyed before
> > the VMA lock is acquired. VMA lock statistics are updated according to
> > the results.
> > For now only anonymous VMAs can be searched this way. In other cases the
> > function returns NULL.
>
> Could you describe why only anonymous vmas are handled at this stage and
> what (roughly) has to be done to support other vmas? lock_vma_under_rcu
> doesn't seem to have any anonymous vma specific requirements AFAICS.

TBH I haven't spent too much time looking into file-backed page faults
yet but a couple of tasks I can think of are:
- Ensure that all vma->vm_ops->fault() handlers do not rely on
mmap_lock being read-locked;
- vma->vm_file freeing like VMA freeing will need to be done after RCU
grace period since page fault handlers use it. This will require some
caution because simply adding it into __vm_area_free() called via
call_rcu()  will cause corresponding fops->release() to be called
asynchronously. I had to solve this issue with out-of-tree SPF
implementation when asynchronously called snd_pcm_release() was
problematic.

I'm sure I'm missing more potential issues and maybe Matthew and
Michel can pinpoint more things to resolve here?

>
> Also isn't lock_vma_under_rcu effectively find_read_lock_vma? Not that
> the naming is really the most important part but the rcu locking is
> internal to the function so why should we spread this implementation
> detail to the world...

I wanted the name to indicate that the lookup is done with no locks
held. But I'm open to suggestions.

>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  include/linux/mm.h |  3 +++
> >  mm/memory.c        | 51 ++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 54 insertions(+)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index c464fc8a514c..d0fddf6a1de9 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -687,6 +687,9 @@ static inline void vma_assert_no_reader(struct vm_area_struct *vma)
> >                     vma);
> >  }
> >
> > +struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> > +                                       unsigned long address);
> > +
> >  #else /* CONFIG_PER_VMA_LOCK */
> >
> >  static inline void vma_init_lock(struct vm_area_struct *vma) {}
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 9ece18548db1..a658e26d965d 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -5242,6 +5242,57 @@ vm_fault_t handle_mm_fault(struct vm_area_struct *vma, unsigned long address,
> >  }
> >  EXPORT_SYMBOL_GPL(handle_mm_fault);
> >
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +/*
> > + * Lookup and lock a VMA under RCU protection. Returned VMA is guaranteed to be
> > + * stable and not isolated. If the VMA is not found or is being modified the
> > + * function returns NULL.
> > + */
> > +struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> > +                                       unsigned long address)
> > +{
> > +     MA_STATE(mas, &mm->mm_mt, address, address);
> > +     struct vm_area_struct *vma, *validate;
> > +
> > +     rcu_read_lock();
> > +     vma = mas_walk(&mas);
> > +retry:
> > +     if (!vma)
> > +             goto inval;
> > +
> > +     /* Only anonymous vmas are supported for now */
> > +     if (!vma_is_anonymous(vma))
> > +             goto inval;
> > +
> > +     if (!vma_read_trylock(vma))
> > +             goto inval;
> > +
> > +     /* Check since vm_start/vm_end might change before we lock the VMA */
> > +     if (unlikely(address < vma->vm_start || address >= vma->vm_end)) {
> > +             vma_read_unlock(vma);
> > +             goto inval;
> > +     }
> > +
> > +     /* Check if the VMA got isolated after we found it */
> > +     mas.index = address;
> > +     validate = mas_walk(&mas);
> > +     if (validate != vma) {
> > +             vma_read_unlock(vma);
> > +             count_vm_vma_lock_event(VMA_LOCK_MISS);
> > +             /* The area was replaced with another one. */
> > +             vma = validate;
> > +             goto retry;
> > +     }
> > +
> > +     rcu_read_unlock();
> > +     return vma;
> > +inval:
> > +     rcu_read_unlock();
> > +     count_vm_vma_lock_event(VMA_LOCK_ABORT);
> > +     return NULL;
> > +}
> > +#endif /* CONFIG_PER_VMA_LOCK */
> > +
> >  #ifndef __PAGETABLE_P4D_FOLDED
> >  /*
> >   * Allocate p4d page table.
> > --
> > 2.39.0
>
> --
> Michal Hocko
> SUSE Labs
