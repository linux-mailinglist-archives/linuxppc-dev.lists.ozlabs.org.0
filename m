Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ECC5B2B3E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 02:52:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNyBP1TS4z3c4j
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 10:52:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=L4r1/zM0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=L4r1/zM0;
	dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNy9k4dDYz2yyT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 10:51:37 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id 130so459479ybz.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Sep 2022 17:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=LBNHsgANfOuYwqoZHaxODMzZ7UA+U8+5hufwxCbYv44=;
        b=L4r1/zM0OJVEeznCxkFeDmzDJp0IcMmbKN2OvdW9zrSpQ1s5Kdty/1rkvqWo33TMhT
         xWV4jNGh+PbGvXm0RJQ/3GpSL8k3kkDWsQF1guPOx0QIt2B1p6UW/G2dGSAhnz6g0J3G
         aCbemhwYTPosRuwZH2Cn9ZVgTqZfSGP+OkF8xPq4LUSXcNwj3wBeXn3dSPUF2TrfIRpN
         JQVL/x1hFZ6eG+8WyfHTfUzx9yazN5pP/4MU/Ug9tlPrBw51u68/InTGeJUXAmTQ46F7
         6ZwC93ANh6AAupdl3kfj2t2GfNBg9A4jCF4ximO4iROdJ/9dV1Q4vF+NqMLn6BAhU5rt
         CPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LBNHsgANfOuYwqoZHaxODMzZ7UA+U8+5hufwxCbYv44=;
        b=0bRl0IfEiT9hETSYX0ltetGTVlb9JUB15NCurnFBS1pIBIBwn9gZADs9DcNci4nCQT
         GC7xmA9Djisbgi2iw4E50PA3Suzj+m+NReGJBPMKCWi8sQc1/6kaTygIGB+SncTaUq+M
         7V7FhTWauxfS2af68Z5712XQG2vwv9xMCyx1n3nT6ET3YC97PLRtU2K5JU7yNwhONF14
         YU5CSbNaY22KMw0i4gmSlEdwZEbTu5VDInuaII1CouLLf6U7OqsZ2u70a0sGzYqB00l3
         +RuUr7r2ESgkHp8hbB7vPoR/7tJlT0tDs79Wv+oHVHBIthGuqLhe3JA6DH5F3X4phO4h
         0WGw==
X-Gm-Message-State: ACgBeo1MxG89mAHuKv/7E5n1eW5pzggnjCCy7agbVnMyiMfZqktRtG1/
	YgQJP7gFpoUnl8LW6N4L70s83mgV9TxoOIpGOnkezQ==
X-Google-Smtp-Source: AA6agR5aiD/mHNLJf/uZTrUlH+sUk3m6QYGueoAr4dyZUEHwTfC+FSD4X8APTDBjLx4o2R6CQUyPXRoAsWEaWYZ1kA0=
X-Received: by 2002:a25:d209:0:b0:6a8:e5f1:f179 with SMTP id
 j9-20020a25d209000000b006a8e5f1f179mr9413490ybg.380.1662684694045; Thu, 08
 Sep 2022 17:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901173516.702122-11-surenb@google.com>
 <bb5e3ab8-9c47-7d01-cdaa-1b4231312f67@linux.ibm.com>
In-Reply-To: <bb5e3ab8-9c47-7d01-cdaa-1b4231312f67@linux.ibm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 8 Sep 2022 17:51:23 -0700
Message-ID: <CAJuCfpFm8irJyhzn-22QR+_4BmU+yDZM97T4S8pPKotxZUmjBg@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 10/28] mm/mmap: mark VMAs as locked in vma_adjust
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

On Tue, Sep 6, 2022 at 8:35 AM Laurent Dufour <ldufour@linux.ibm.com> wrote=
:
>
> Le 01/09/2022 =C3=A0 19:34, Suren Baghdasaryan a =C3=A9crit :
> > vma_adjust modifies a VMA and possibly its neighbors. Mark them as lock=
ed
> > before making the modifications.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  mm/mmap.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index f89c9b058105..ed58cf0689b2 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -710,6 +710,10 @@ int __vma_adjust(struct vm_area_struct *vma, unsig=
ned long start,
> >       long adjust_next =3D 0;
> >       int remove_next =3D 0;
> >
> > +     vma_mark_locked(vma);
> > +     if (next)
> > +             vma_mark_locked(next);
> > +
>
> I was wondering if the VMAs insert and expand should be locked too.
>
> For expand, I can't see any valid reason, but for insert, I'm puzzled.
> I would think that it is better to lock the VMA to be inserted but I can'=
t
> really justify that.
>
> It may be nice to detail why this is not need to lock insert and expand h=
ere.

'expand' is always locked before it's passed to __vma_adjust() by
vma_merge(). It has to be locked before we decide "Can it merge with
the predecessor?" here
https://elixir.bootlin.com/linux/latest/source/mm/mmap.c#L1201 because
a change in VMA can affect that decision. I spent many hours tracking
the issue caused by not locking the VMA before making this decision.
It might be good to add a comment about this...

AFAIKT 'insert' is only used by __split_vma() and it's always a brand
new VMA which is not yet linked into mm->mmap. Any reason
__vma_adjust() should lock it?

>
> >       if (next && !insert) {
> >               struct vm_area_struct *exporter =3D NULL, *importer =3D N=
ULL;
> >
> > @@ -754,8 +758,11 @@ int __vma_adjust(struct vm_area_struct *vma, unsig=
ned long start,
> >                        * If next doesn't have anon_vma, import from vma=
 after
> >                        * next, if the vma overlaps with it.
> >                        */
> > -                     if (remove_next =3D=3D 2 && !next->anon_vma)
> > +                     if (remove_next =3D=3D 2 && !next->anon_vma) {
> >                               exporter =3D next->vm_next;
> > +                             if (exporter)
> > +                                     vma_mark_locked(exporter);
> > +                     }
> >
> >               } else if (end > next->vm_start) {
> >                       /*
> > @@ -931,6 +938,8 @@ int __vma_adjust(struct vm_area_struct *vma, unsign=
ed long start,
> >                        * "vma->vm_next" gap must be updated.
> >                        */
> >                       next =3D vma->vm_next;
> > +                     if (next)
> > +                             vma_mark_locked(next);
> >               } else {
> >                       /*
> >                        * For the scope of the comment "next" and
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>
