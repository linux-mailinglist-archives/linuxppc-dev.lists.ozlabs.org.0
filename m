Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FE85B2B1A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 02:27:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNxfN0D1Vz3c4B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 10:27:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=crQ36UMH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=crQ36UMH;
	dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNxdk3MNdz2xfS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 10:27:21 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id a67so441133ybb.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Sep 2022 17:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=KtLw4C6VhVX+NvaGxIgELiy/zqMzxZXxqnnlbY2OKmo=;
        b=crQ36UMHUqt61smHrlkBEpUd9i45+PgLY5J9fqfxhS5xFt+dCvkP4on4PdtNki3lCz
         jM3i4We244MxzTcElsXWAr4ziy26d4HtGs1NYCrV4xa+QMChQpVMk4+s4kWhnDii1Pkq
         yYzeKV/nWRkdftx9rY3IB4MT+wQ9wCh094Kp0vVZXw/48yA0cwlfWhLtGuaSLY8c5re5
         9AGxg9RjHE2y5qcsqP3sIfonr94qxE4z65S4RNPfz7z+epLJQ9CDfp8pOawXS7ODD5Rs
         kWyWoTv5WYqA6M7n+wk8eECV/QUIZsewZkXxm5axMe5CRivTrrka1Y3sdLZZWgIumVtu
         oYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=KtLw4C6VhVX+NvaGxIgELiy/zqMzxZXxqnnlbY2OKmo=;
        b=QhJcUIfmJ1KH8+HrkiRuvoiJCkLGzyDVq7NZqpuOXDChopztRUqeE8nm5I99nK8LPm
         IMAkmGG6ZY+f++iOffIa0ahMyGW5cGxigybhbEGHFc3dj+6yo0cZGNAMUZONl0FDJovW
         IAadUuErBLy/e8iRbf/9vbzczS4pba8XmDbd23CvgA25nYEh+1guRu+gEsDOXh+Acxqm
         tjZtKqAge/AUM7uBcIpNu/9nPE+d3m1raEAoWKo3Rlbp5ttCpTChyqCJn3j+zK38zuLJ
         J0f3yuxPYuwI+rgXBI+rS0KKXiZC7zWWPMb5Ro/XeChv+YR/iKmyZHB7Pc8KMG9a3yI2
         hAoQ==
X-Gm-Message-State: ACgBeo2YCmgPaWQIzpE+QHdVe+CRkCTlNmSLlewpNmsgjkAMEbltu4+l
	1A1tLKYIsja+r6cpTO0lX5R533bPRSAn2ZAvK4haYQ==
X-Google-Smtp-Source: AA6agR6FKEIXt4Le+vLLG6frjvQmxHhi7IpkWph1Sqqg5DDpP37KZzCFD7SHe2MzUi799BfLdccL/mK6LPn2rgcWHb8=
X-Received: by 2002:a05:6902:2d0:b0:694:d257:4c4b with SMTP id
 w16-20020a05690202d000b00694d2574c4bmr9751150ybh.316.1662683237776; Thu, 08
 Sep 2022 17:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901173516.702122-10-surenb@google.com>
 <98d5f462-c4dc-a967-0ab0-f24dd3e37dff@linux.ibm.com>
In-Reply-To: <98d5f462-c4dc-a967-0ab0-f24dd3e37dff@linux.ibm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 8 Sep 2022 17:27:06 -0700
Message-ID: <CAJuCfpFoJmiGYXBLwOjW36iB302=V2_vvbRwQbftr_ix_92uuQ@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 09/28] mm/mempolicy: mark VMA as locked when
 changing protection policy
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

On Tue, Sep 6, 2022 at 7:48 AM Laurent Dufour <ldufour@linux.ibm.com> wrote=
:
>
> Le 01/09/2022 =C3=A0 19:34, Suren Baghdasaryan a =C3=A9crit :
> > Protect VMA from concurrent page fault handler while performing VMA
> > protection policy changes.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  mm/mempolicy.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> > index b73d3248d976..6be1e5c75556 100644
> > --- a/mm/mempolicy.c
> > +++ b/mm/mempolicy.c
> > @@ -383,8 +383,10 @@ void mpol_rebind_mm(struct mm_struct *mm, nodemask=
_t *new)
> >       struct vm_area_struct *vma;
> >
> >       mmap_write_lock(mm);
> > -     for (vma =3D mm->mmap; vma; vma =3D vma->vm_next)
> > +     for (vma =3D mm->mmap; vma; vma =3D vma->vm_next) {
> > +             vma_mark_locked(vma);
> >               mpol_rebind_policy(vma->vm_policy, new);
> > +     }
> >       mmap_write_unlock(mm);
> >  }
> >
> > @@ -632,6 +634,7 @@ unsigned long change_prot_numa(struct vm_area_struc=
t *vma,
> >       struct mmu_gather tlb;
> >       int nr_updated;
> >
> > +     vma_mark_locked(vma);
>
> If I understand that corretly, the VMA itself is not impacted, only the
> PMDs/PTEs, and they are protected using the page table locks.
>
> Am I missing something?

I thought we would not want pages faulting in the VMA for which we are
changing the protection. However I think what you are saying is that
page table locks would already provide a more granular synchronization
with page fault handlers, which makes sense to me. Sounds like we can
skip locking the VMA here as well. Nice!

>
> >       tlb_gather_mmu(&tlb, vma->vm_mm);
> >
> >       nr_updated =3D change_protection(&tlb, vma, addr, end, PAGE_NONE,
> > @@ -765,6 +768,7 @@ static int vma_replace_policy(struct vm_area_struct=
 *vma,
> >       if (IS_ERR(new))
> >               return PTR_ERR(new);
> >
> > +     vma_mark_locked(vma);
> >       if (vma->vm_ops && vma->vm_ops->set_policy) {
> >               err =3D vma->vm_ops->set_policy(vma, new);
> >               if (err)
>
