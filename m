Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2205B3CB1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 18:10:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPLZR1Gw5z3c5B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 02:10:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=BiyE3pbF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=BiyE3pbF;
	dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPLYq6mT2z30FQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 02:10:22 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id p200so3404393yba.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Sep 2022 09:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=f+8N/y8y23UZcEEw+aQnyU3DKfX0ieX6O82IRCC4HdM=;
        b=BiyE3pbFzAwYEbflQaZphZUwAl6tFqEKoxOSeraxpHXAycNAP3ER6hKVN7zFxfnZYI
         dmbHBcE6XaXCDmJB0eURxyjOS/LYAdTSVJQQgbSxedvGxksEGEwo8bnxbUL8mqNSiS0I
         HQyjMm7qR28Cy5F5ljGna6zDh1IiUsm0e6MqXa3HuxfjplJN7dSZ/Qs1dLgbietr0qPm
         aaeYBKFqiZMof8mnns8VIkOIM2RsE/1SOEkhSnGyg23sOandSiJu5QHwmXR0GZ62ahYH
         XGvfGR0+GC7EgWkb3KjP0ya0ZAmSu88fnl+kiUpJwLjqxUD63YfqwYHj3h/U+xX2yvGr
         3QZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=f+8N/y8y23UZcEEw+aQnyU3DKfX0ieX6O82IRCC4HdM=;
        b=aE2VrUNdPDXHDiRTqVtyF7gZu7NG1XCmDfAuaiRsbrQthIkhx/59NGii22A4sSNkWx
         o0Mt24xDoJlT5xcElIiTmzPfy+NgSNb4RbbPAuHdwAgqktZMn8iPcmA1yE5pZVKEg4c9
         400j9M1JTn1PxLWDbx1MMYPHh6f6PfbyScjXIPyiJ8+/voVve3NStm2h5+VrcFwP7WqK
         58Qpxh+zEvvsQqvIkEcIKR9Z906lTpOLlVIdtzunAseFwcXPjrmZKbMF+k0JxpN/mqN+
         mNAQldtQiYWwdBdfjojtfzgL21SBvU4WlaEC5x75iTGxnAAZ0Te+pIWPXrTkIZ48Sz7Y
         bNbg==
X-Gm-Message-State: ACgBeo2p3UIU6FHzjHBCvHvTVRV3tPZ9KhPUbuAN6ZVgBROlkzDlwLM7
	dLNzKlF9FenrwYDITbl9tEcONIm5QTeKA2mbBl3WDw==
X-Google-Smtp-Source: AA6agR5mnVSQ1qQ+aIdXXXGAhOTMvHt8B37xrRYeRcCRdY1CnsLY6FiKvNQ4vPY3G6eYgyMHbEmwJurPorP8bkXzM8s=
X-Received: by 2002:a25:424a:0:b0:6a9:2954:87fd with SMTP id
 p71-20020a25424a000000b006a9295487fdmr12075530yba.340.1662739819203; Fri, 09
 Sep 2022 09:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901173516.702122-22-surenb@google.com>
 <630714df-dec1-4a41-6af3-380181d11669@linux.ibm.com>
In-Reply-To: <630714df-dec1-4a41-6af3-380181d11669@linux.ibm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 9 Sep 2022 09:10:08 -0700
Message-ID: <CAJuCfpFtsP6s+pgus4RjFdwasg69hQ-LOSOL8XV4zUMey0zS9g@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 21/28] mm: introduce find_and_lock_anon_vma to
 be used from arch-specific code
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

On Fri, Sep 9, 2022 at 7:38 AM Laurent Dufour <ldufour@linux.ibm.com> wrote=
:
>
> Le 01/09/2022 =C3=A0 19:35, Suren Baghdasaryan a =C3=A9crit :
> > Introduce find_and_lock_anon_vma function to lookup and lock an anonymo=
us
> > VMA during page fault handling. When VMA is not found, can't be locked
> > or changes after being locked, the function returns NULL. The lookup is
> > performed under RCU protection to prevent the found VMA from being
> > destroyed before the VMA lock is acquired. VMA lock statistics are
> > updated according to the results.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  include/linux/mm.h |  3 +++
> >  mm/memory.c        | 45 +++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 48 insertions(+)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 7c3190eaabd7..a3cbaa7b9119 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -684,6 +684,9 @@ static inline void vma_assert_no_reader(struct vm_a=
rea_struct *vma)
> >                     vma);
> >  }
> >
> > +struct vm_area_struct *find_and_lock_anon_vma(struct mm_struct *mm,
> > +                                           unsigned long address);
> > +
> >  #else /* CONFIG_PER_VMA_LOCK */
> >
> >  static inline void vma_init_lock(struct vm_area_struct *vma) {}
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 29d2f49f922a..bf557f7056de 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -5183,6 +5183,51 @@ vm_fault_t handle_mm_fault(struct vm_area_struct=
 *vma, unsigned long address,
> >  }
> >  EXPORT_SYMBOL_GPL(handle_mm_fault);
> >
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +static inline struct vm_area_struct *find_vma_under_rcu(struct mm_stru=
ct *mm,
> > +                                                     unsigned long add=
ress)
> > +{
> > +     struct vm_area_struct *vma =3D __find_vma(mm, address);
> > +
> > +     if (!vma || vma->vm_start > address)
> > +             return NULL;
> > +
> > +     if (!vma_is_anonymous(vma))
> > +             return NULL;
> > +
>
> It looks to me more natural to first check that the VMA is part of the RB
> tree before try read locking it.

I think we want to check that the VMA is still part of the mm _after_
we locked it. Otherwise we might pass the check, then some other
thread does (lock->isolate->unlock) and then we lock the VMA. We would
end up with a VMA that is not part of mm anymore but we assume it is.

>
> > +     if (!vma_read_trylock(vma)) {
> > +             count_vm_vma_lock_event(VMA_LOCK_ABORT);
> > +             return NULL;
> > +     }
> > +
> > +     /* Check if the VMA got isolated after we found it */
> > +     if (RB_EMPTY_NODE(&vma->vm_rb)) {
> > +             vma_read_unlock(vma);
> > +             count_vm_vma_lock_event(VMA_LOCK_MISS);
> > +             return NULL;
> > +     }
> > +
> > +     return vma;
> > +}
> > +
> > +/*
> > + * Lookup and lock and anonymous VMA. Returned VMA is guaranteed to be=
 stable
> > + * and not isolated. If the VMA is not found of is being modified the =
function
> > + * returns NULL.
> > + */
> > +struct vm_area_struct *find_and_lock_anon_vma(struct mm_struct *mm,
> > +                                           unsigned long address)
> > +{
> > +     struct vm_area_struct *vma;
> > +
> > +     rcu_read_lock();
> > +     vma =3D find_vma_under_rcu(mm, address);
> > +     rcu_read_unlock();
> > +
> > +     return vma;
> > +}
> > +#endif /* CONFIG_PER_VMA_LOCK */
> > +
> >  #ifndef __PAGETABLE_P4D_FOLDED
> >  /*
> >   * Allocate p4d page table.
>
