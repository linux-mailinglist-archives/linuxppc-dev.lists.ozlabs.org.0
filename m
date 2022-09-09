Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B665B3CBD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 18:13:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPLcy5QbPz3cCY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 02:13:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Qz+PTfYU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Qz+PTfYU;
	dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPLcJ0q45z30FQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 02:12:32 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id 11so3448483ybu.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Sep 2022 09:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=4hh2G7MdxNZ+MNcmp102ZgutWolekJca53oozXb1sk4=;
        b=Qz+PTfYUZ79Xk4WnkdDqNZ4LLUCR8EFVYsF/0fY0lUuEsl2IZGJVTFFrd89L26Oz5t
         tviGlyIdWFrik28BaRuFfzuXznzHhsJl5HOMC66jw2DryGYXp1mIyshHHWoUXqpWPJN+
         /6x0NDeafG1PPSym6XJ8bPSiGtE2517SAMZZ9AnTxspCwwhQcdA6k843LDIw/8yFsNcZ
         a5Rnaiqj1Zbr1RtrNT1Mk2NmNRgK+ybLbCflE2Htc/OZZ1CtP2ZKVyOagC0vKUQgde1Z
         SYvIrJRQRBevTglXhJiI4YfodtdB1WWv2cIrSQpWLFxSnK/0hooiuIgLalhL8RZnZ6T5
         kXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4hh2G7MdxNZ+MNcmp102ZgutWolekJca53oozXb1sk4=;
        b=TwUreSTKgA6uIWHaA3EkywrweeKdNZialYyjp698XR6k2y1XCHeKxyr3q5ikT/4XlJ
         MXbz9qA5iB63qllpLWb5AayNl4igIo35jON2+Juqh3ZxPozYrpxtsOfVDkC9ipVzrcu+
         zGBMDX8QU+jyM3L840zLH/es4lxdOG9sPQsT4JXrNwLYY1opviMXHDjXU+ng7+5QFG4X
         8oeii9zH8AOXAk4To5lTBRe5UzyJ0HiwUwclviS/NQwcn6UCaL2WY5lQJq7uurt6+pU/
         /A4vluGfxzKAZUtkLGx8fJqciclVBq6VGlsa861C1c03G2+rUnN6bfvKulbSY8lemgMh
         sWzg==
X-Gm-Message-State: ACgBeo042QMm8eEkOm9MGgelXVmLbyIEwlqyicITjMNpo9CMbAZuKem/
	9CCkZ1UQWtUaZ+PmhcmMmFyRvkgi2E9Jo9MVeYzdaA==
X-Google-Smtp-Source: AA6agR6D9Q1KW4KNYp0SHpJ/6Fcy2IRN04G63Erd6aJSK5K6Qex+RENoU//CqGiMsVMEqkzoAOqqrGTYWrT4sPeb+8g=
X-Received: by 2002:a25:cc8d:0:b0:6a8:40cb:d730 with SMTP id
 l135-20020a25cc8d000000b006a840cbd730mr12492178ybf.119.1662739948562; Fri, 09
 Sep 2022 09:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901173516.702122-18-surenb@google.com>
 <70a7d9cd-e64b-db49-e418-b4de7fcf8692@linux.ibm.com>
In-Reply-To: <70a7d9cd-e64b-db49-e418-b4de7fcf8692@linux.ibm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 9 Sep 2022 09:12:17 -0700
Message-ID: <CAJuCfpGAt3K51JfaEZxUtJc_h5c5Nj6XYQvdF4x+SbC6teFS0g@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 17/28] mm/mmap: prevent pagefault handler from
 racing with mmu_notifier registration
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

On Fri, Sep 9, 2022 at 7:20 AM Laurent Dufour <ldufour@linux.ibm.com> wrote=
:
>
> Le 01/09/2022 =C3=A0 19:35, Suren Baghdasaryan a =C3=A9crit :
> > Pagefault handlers might need to fire MMU notifications while a new
> > notifier is being registered. Modify mm_take_all_locks to mark all VMAs
> > as locked and prevent this race with fault handlers that would hold VMA
> > locks.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  mm/mmap.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index b31cc97c2803..1edfcd384f5e 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -3538,6 +3538,7 @@ static void vm_lock_mapping(struct mm_struct *mm,=
 struct address_space *mapping)
> >   *     hugetlb mapping);
> >   *   - all i_mmap_rwsem locks;
> >   *   - all anon_vma->rwseml
> > + *   - all vmas marked locked
>
> IIRC, the anon_vma may be locked during the page fault handling, and this
> happens after the VMA is read lock. I think the same applies to
> i_mmap_rwsem lock.
>
> Thus, the VMA should be marked locked first.

I see. I'll double check and move the locking order. Thanks!

>
> >   *
> >   * We can take all locks within these types randomly because the VM co=
de
> >   * doesn't nest them and we protected from parallel mm_take_all_locks(=
) by
> > @@ -3579,6 +3580,7 @@ int mm_take_all_locks(struct mm_struct *mm)
> >               if (vma->anon_vma)
> >                       list_for_each_entry(avc, &vma->anon_vma_chain, sa=
me_vma)
> >                               vm_lock_anon_vma(mm, avc->anon_vma);
> > +             vma_mark_locked(vma);
> >       }
> >
> >       return 0;
> > @@ -3636,6 +3638,7 @@ void mm_drop_all_locks(struct mm_struct *mm)
> >       mmap_assert_write_locked(mm);
> >       BUG_ON(!mutex_is_locked(&mm_all_locks_mutex));
> >
> > +     vma_mark_unlocked_all(mm);
> >       for (vma =3D mm->mmap; vma; vma =3D vma->vm_next) {
> >               if (vma->anon_vma)
> >                       list_for_each_entry(avc, &vma->anon_vma_chain, sa=
me_vma)
>
