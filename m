Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD156A7976
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 03:23:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRvyn64WMz3cJg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 13:22:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ICNzManC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ICNzManC;
	dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRvxs3P8sz3cDp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 13:22:08 +1100 (AEDT)
Received: by mail-yb1-xb2c.google.com with SMTP id v101so2303156ybi.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Mar 2023 18:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677723725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icYcAz4iENgGguq1MUlInM5/6GsRcXFU+8O5VO7eInA=;
        b=ICNzManCzUgms4+COGza4gk5YsyseuO5Ijt4EWhpqNEDkAg12yxO+M+x6EF7wlGyGp
         18xfcjTQdZvnANZNl2A9rF7rCOHTU3O7UgOEldBj8JFxYXSdYiuqfdORdbYK3a8OzBha
         GPx1R+762t651JyT8Cj6YRDfJYCZzRhsZnsEISTad9RtLN+lwUYObGJty8p+v5C9AyGP
         3XXAHVdDVphOLPBe2/6syAoOKCOBT/gqoC22awkzHgd0AJ3EE9WzeagQuz79d2V/uPYP
         8Lqoil99Y13JGIIeKOkn5jKR1Pgy1Y4lYmhZVpRrJLR83i3rnovCLcQAjwV4uywIdJzG
         i4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677723725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icYcAz4iENgGguq1MUlInM5/6GsRcXFU+8O5VO7eInA=;
        b=aY/QkjnNT+xNZxfs1G+6j0SI8VIQht4A8u2Qd0RYZrnhP/f59P8AV4ic+PB8lA7h/n
         qGsQsab9hqYFpuB1mAvpYQs3I0i15PrhAS3B8/USIIHAcjFb3ULljdrGX5wwu7we4p+S
         +f1QKpCnmgMH5YSvdvrx/RMQG6tLASwSjl8vVUPmpxFutxkFGd90EimHHwbsbDhL1xRP
         OehufyuUN7SE+Gp0YDqT2DqVCty469EM44WhDNOo8g8l9wa2peNxcpdFfoAQo877HfrN
         e7rGV3Earie1tZItyB7CrSIgfwA2v7sGGs8mVe6IFrhMvl5U4IWItMgHoceK2DJcRgdN
         B2Iw==
X-Gm-Message-State: AO0yUKXtv5AWiwDreRQ2/tKbpkEl2oFn8lyd4suuk4kY/z62NsiXCZAS
	2TIbPbxQWgI/cDz98co/kT7mxtevspRZI1L1qtGzwQ==
X-Google-Smtp-Source: AK7set8f8UCPLp9V1R6/ru3EOI4J1mkBQgV1T32GNF0OvprkrFWWd8Ter81Ipe29QBKiksN2yO0CRLf6M0naPga3SGQ=
X-Received: by 2002:a25:aa03:0:b0:a06:538f:265f with SMTP id
 s3-20020a25aa03000000b00a06538f265fmr407354ybi.4.1677723724623; Wed, 01 Mar
 2023 18:22:04 -0800 (PST)
MIME-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com> <20230227173632.3292573-19-surenb@google.com>
 <Y/8CJQGNuMUTdLwP@localhost> <Y/8FNM9czzPHb5eG@localhost> <CAJuCfpHYT++MBC6T-p80n_m5hHWRRC4Y1bO9J-bFFZZDqNX-BQ@mail.gmail.com>
 <CAJuCfpFax8LSdcq1qiz3sp0XPLaNZnkFFky2tQekG2_Azvw9_g@mail.gmail.com> <Y//zmYeu6uexiyOY@localhost>
In-Reply-To: <Y//zmYeu6uexiyOY@localhost>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 1 Mar 2023 18:21:53 -0800
Message-ID: <CAJuCfpEhwye9dn3eUaYE1gSHt+8M5ztBR3ZMoTYyBR7+uSL5aQ@mail.gmail.com>
Subject: Re: [PATCH v4 18/33] mm: write-lock VMAs before removing them from
 VMA tree
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundati
 on.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 1, 2023 at 4:54 PM Hyeonggon Yoo <42.hyeyoo@gmail.com> wrote:
>
> On Wed, Mar 01, 2023 at 10:42:48AM -0800, Suren Baghdasaryan wrote:
> > On Wed, Mar 1, 2023 at 10:34=E2=80=AFAM Suren Baghdasaryan <surenb@goog=
le.com> wrote:
> > >
> > > On Tue, Feb 28, 2023 at 11:57=E2=80=AFPM Hyeonggon Yoo <42.hyeyoo@gma=
il.com> wrote:
> > > >
> > > > On Wed, Mar 01, 2023 at 07:43:33AM +0000, Hyeonggon Yoo wrote:
> > > > > On Mon, Feb 27, 2023 at 09:36:17AM -0800, Suren Baghdasaryan wrot=
e:
> > > > > > Write-locking VMAs before isolating them ensures that page faul=
t
> > > > > > handlers don't operate on isolated VMAs.
> > > > > >
> > > > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > > > ---
> > > > > >  mm/mmap.c  | 1 +
> > > > > >  mm/nommu.c | 5 +++++
> > > > > >  2 files changed, 6 insertions(+)
> > > > > >
> > > > > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > > > > index 1f42b9a52b9b..f7ed357056c4 100644
> > > > > > --- a/mm/mmap.c
> > > > > > +++ b/mm/mmap.c
> > > > > > @@ -2255,6 +2255,7 @@ int split_vma(struct vma_iterator *vmi, s=
truct vm_area_struct *vma,
> > > > > >  static inline int munmap_sidetree(struct vm_area_struct *vma,
> > > > > >                                struct ma_state *mas_detach)
> > > > > >  {
> > > > > > +   vma_start_write(vma);
> > > > > >     mas_set_range(mas_detach, vma->vm_start, vma->vm_end - 1);
> > > > >
> > > > > I may be missing something, but have few questions:
> > > > >
> > > > >       1) Why does a writer need to both write-lock a VMA and mark=
 the VMA detached
> > > > >          when unmapping it, isn't it enough to just only write-lo=
ck a VMA?
> > >
> > > We need to mark the VMA detached to avoid handling page fault in a
> > > detached VMA. The possible scenario is:
> > >
> > > lock_vma_under_rcu
> > >   vma =3D mas_walk(&mas)
> > >                                                         munmap_sidetr=
ee
> > >                                                           vma_start_w=
rite(vma)
> > >
> > > mas_store_gfp() // remove VMA from the tree
> > >                                                           vma_end_wri=
te_all()
> > >   vma_start_read(vma)
> > >   // we locked the VMA but it is not part of the tree anymore.
> > >
> > > So, marking the VMA locked before vma_end_write_all() and checking
> >
> > Sorry, I should have said "marking the VMA *detached* before
> > vma_end_write_all() and checking vma->detached after vma_start_read()
> > helps us avoid handling faults in the detached VMA."
> >
> > > vma->detached after vma_start_read() helps us avoid handling faults i=
n
> > > the detached VMA.
>
> Thank you for explanation, that makes sense!
>
> By the way, if there are no 32bit users of Per-VMA lock (are there?),
> "detached" bool could be a VMA flag (i.e. making it depend on 64BIT
> and selecting ARCH_USES_HIGH_VMA_FLAGS)

Yeah, I thought about it but didn't want to make assumptions about
potential users just yet. Besides, I heard there are attempts to make
vm_flags to be always 64-bit (I think Matthew mentioned that to me
once). If that happens, we won't need any dependencies here. Either
way, this conversion into a flag can be done as an additional
optimization later on. I prefer to keep the main patchset as simple as
possible for now.
Thanks,
Suren.

>
> Thanks,
> Hyeonggon
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>
