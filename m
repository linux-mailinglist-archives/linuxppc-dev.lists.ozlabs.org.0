Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 277935B3CF8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 18:29:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPLzJ6W7Rz3c6W
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 02:29:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=cYytpVKX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=cYytpVKX;
	dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPLyh5Rr8z30FQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 02:28:28 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id 202so3409104ybe.13
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Sep 2022 09:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=BtrcDF/wsi4Mz50C9AtmB+94fMD35zW5o5lMMRnL+ts=;
        b=cYytpVKXeuoA9XTPipx92LXKUuqKLMkrk5Aj4EsXo3m6xCDrmFCV96avGVoJSwKUyI
         IJ+8XyfbhH2xCVoEfmvWp2hmz7qVLqJdi/h9AG/ziv6PiNLTxkPqPIEl1TKgn1Sjnu7V
         HJC/79fqa6qt3xs+aYFVN8Fi6Jr3++m+jsUPGfbrrlmhm1dnwdm6q+tTo+2vypqDgQ4p
         SDtTcwo3wuwldJxt/nUGS8qS7+xPZCEA8kmSQ8jh+W2uU3Iix1LhCJQKhtjvM2Rg7zmR
         C5XH6ocqrK/bPxfVvegO5VJmRFOTFlbDw/quPQFAEBZ/2zG/u+ha7UILuQML8c0Ui/zR
         5D/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BtrcDF/wsi4Mz50C9AtmB+94fMD35zW5o5lMMRnL+ts=;
        b=tk4H+SQTJPbRv22bTudcYVhPm+VxXr1EMhJaWAn53/eYQm/nkY0QcJcOFulsNWzjks
         yD/qEuBlXAlcQZLxRdNbat6VXCzGH3SAu2IsyyX+mDSam+MfVDKfi3M4gmB4dNr+QFm9
         mZWaTbmZKaTf6H26wyNXA3x0QnpzF1C4U4tu/LtJcFBrJZ7pj2Uxh+PsIYX08IOr62I5
         J7y9Ab6RtshNBNh7tkIsfNMsTujf4fPSx93eQCzRo3D6C4rsCxoClREhmUqWj7Y0GLRn
         5HsnzJBHbme3KNJZQPo6gEtlDu//C/pFfrcS0tes/weIWmWPBir/fQ+F/sLNPzHKPkdN
         2QSQ==
X-Gm-Message-State: ACgBeo0oyPtreqWD3Wa6yEoMjjNksf2pMiEod3M5iYEBtFO36Co9pKrz
	RvDMfglEWyxntpHCXeRQ2ihKHYIRFVx+A45JlNIhog==
X-Google-Smtp-Source: AA6agR6VwZjHnx3/k4MmEwX2PHQzkWitOBKlKZUri6A+36oevF8WeczM6CeLc2fJXgQcdWaTJpN0N4HZQQ/3z0n9XqU=
X-Received: by 2002:a25:d209:0:b0:6a8:e5f1:f179 with SMTP id
 j9-20020a25d209000000b006a8e5f1f179mr11954900ybg.380.1662740904957; Fri, 09
 Sep 2022 09:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901173516.702122-15-surenb@google.com>
 <7fcc871c-fcc2-e993-fe88-f0da49ff227a@linux.ibm.com>
In-Reply-To: <7fcc871c-fcc2-e993-fe88-f0da49ff227a@linux.ibm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 9 Sep 2022 09:28:13 -0700
Message-ID: <CAJuCfpH-YQYCQtzWdR9rGfXBD53ZSawXnj-FbuEGqTSd4Y1zmg@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 14/28] mm: mark VMAs as locked before isolating them
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

On Fri, Sep 9, 2022 at 6:35 AM Laurent Dufour <ldufour@linux.ibm.com> wrote=
:
>
> Le 01/09/2022 =C3=A0 19:35, Suren Baghdasaryan a =C3=A9crit :
> > Mark VMAs as locked before isolating them and clear their tree node so
> > that isolated VMAs are easily identifiable. In the later patches page
> > fault handlers will try locking the found VMA and will check whether
> > the VMA was isolated. Locking VMAs before isolating them ensures that
> > page fault handlers don't operate on isolated VMAs.
>
> Found another place where the VMA should probably mark locked:
> *** drivers/gpu/drm/drm_vma_manager.c:
> drm_vma_node_revoke[338]       rb_erase(&entry->vm_rb, &node->vm_files);

Thanks! I'll add the necessary locking.

>
> There are 2 others entries in nommu.c but I guess this is not supported,
> isn't it?

Yes, PER_VMA_LOCK config depends on MMU but for completeness we could
add locking there as well (it will be compiled out).

>
>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  mm/mmap.c  | 2 ++
> >  mm/nommu.c | 2 ++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 094678b4434b..b0d78bdc0de0 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -421,12 +421,14 @@ static inline void vma_rb_insert(struct vm_area_s=
truct *vma,
> >
> >  static void __vma_rb_erase(struct vm_area_struct *vma, struct rb_root =
*root)
> >  {
> > +     vma_mark_locked(vma);
> >       /*
> >        * Note rb_erase_augmented is a fairly large inline function,
> >        * so make sure we instantiate it only once with our desired
> >        * augmented rbtree callbacks.
> >        */
> >       rb_erase_augmented(&vma->vm_rb, root, &vma_gap_callbacks);
> > +     RB_CLEAR_NODE(&vma->vm_rb);
> >  }
> >
> >  static __always_inline void vma_rb_erase_ignore(struct vm_area_struct =
*vma,
> > diff --git a/mm/nommu.c b/mm/nommu.c
> > index e819cbc21b39..ff9933e57501 100644
> > --- a/mm/nommu.c
> > +++ b/mm/nommu.c
> > @@ -622,6 +622,7 @@ static void delete_vma_from_mm(struct vm_area_struc=
t *vma)
> >       struct mm_struct *mm =3D vma->vm_mm;
> >       struct task_struct *curr =3D current;
> >
> > +     vma_mark_locked(vma);
> >       mm->map_count--;
> >       for (i =3D 0; i < VMACACHE_SIZE; i++) {
> >               /* if the vma is cached, invalidate the entire cache */
> > @@ -644,6 +645,7 @@ static void delete_vma_from_mm(struct vm_area_struc=
t *vma)
> >
> >       /* remove from the MM's tree and list */
> >       rb_erase(&vma->vm_rb, &mm->mm_rb);
> > +     RB_CLEAR_NODE(&vma->vm_rb);
> >
> >       __vma_unlink_list(mm, vma);
> >  }
>
