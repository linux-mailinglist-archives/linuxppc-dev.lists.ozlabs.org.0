Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB74E66D1D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 23:37:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nwn2h5RzCz3c8y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 09:37:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=IRTe23cB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=IRTe23cB;
	dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nwn1l2j4Wz3bZh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 09:36:26 +1100 (AEDT)
Received: by mail-yb1-xb29.google.com with SMTP id 20so12811642ybl.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 14:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8x0ax+CrpRdZ474UKgbbkMQWa7fnkqGkNbkY5YDvYN8=;
        b=IRTe23cB9H6aTVRzS1VkJBbWS3kWAKwm81ESOnh/qvhUb91AYaNRSUNI0S8RUGxEZ3
         h4S6eATYVs38FAo2PWtdhGYY4OfXPvM9N4v6Wb5k6QuoWadoD/eIFLn/skx21/ok2jhv
         SXuEvjJrgFW4RQktr6Ez2nYap+wI5Q5Gr6EcfObHYt0vJs8pEbXEDearImg0E0rzVBAR
         fjgi4ZzPiPVYLGqkgpdYEU2e530Z0oGeGhXnTFK9GhkK5BpGt4kpwDZtWwalj2LQp3s2
         5PC/suWXHjKBxFS9/UvFQjQYa+Pxmg7aD9vbI2IK0nKaNteQTKuPNqnJjAUfXI7dQFcC
         426w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8x0ax+CrpRdZ474UKgbbkMQWa7fnkqGkNbkY5YDvYN8=;
        b=kDoDwf81OUmDOyDictF7vt7z3zffcj5HsW6sEvZKg9ItaXw2HWvZ477Iqnp/xHHDXM
         SvdeNNSpxR4kh4LJVTEKoD6ox5goi7DRfU3w67S1xk+NA0/hEyvt1nRIwHgyj4Gorzqf
         H/nARzQNQ+6NfQzAykdUzeCl0yvy5IaoUk9ppmJ2bKrrNvse3hd5fj7p65HOk0j+KCCW
         NuAavXOMMaZdRib41K56lrIPkJJ6Rarn2DdmcKew+jZG/Lgkj3W6k33FYeiZzWcZWF4j
         J8TDH8fMmdYUS0K4xeguATXCWiuHP9pEnZfQpbdlP4HshZ9ySF4NYFsCv0gtAnHKn8th
         R+1Q==
X-Gm-Message-State: AFqh2kr5bIWcMdwOzlACoJKZqzcXOsYrIjqEwnKCli1s4+7SGiUE9S1r
	YuiTFPCYpK+3cR+0jgrR/DZa7/AHH/KfvdvVqZGqbw==
X-Google-Smtp-Source: AMrXdXvljgHOV/UoOcOikWC1/3qvS04jHBKBkL3Vl0H3O9rQK82hflXcJ4xxJZi7iin1IEWYklAFhv7wq6FpD+eNUG8=
X-Received: by 2002:a25:ceca:0:b0:7e4:115c:9cf6 with SMTP id
 x193-20020a25ceca000000b007e4115c9cf6mr160919ybe.316.1673908583348; Mon, 16
 Jan 2023 14:36:23 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-42-surenb@google.com>
 <Y8UxnqPCTLbbD+2F@localhost>
In-Reply-To: <Y8UxnqPCTLbbD+2F@localhost>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Jan 2023 14:36:12 -0800
Message-ID: <CAJuCfpGmYNYxCrbCsvhgsXDt1patKSHib32te1Mwx+wducuPAA@mail.gmail.com>
Subject: Re: [PATCH 41/41] mm: replace rw_semaphore with atomic_t in vma_lock
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@t
 echsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 16, 2023 at 3:15 AM Hyeonggon Yoo <42.hyeyoo@gmail.com> wrote:
>
> On Mon, Jan 09, 2023 at 12:53:36PM -0800, Suren Baghdasaryan wrote:
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index d40bf8a5e19e..294dd44b2198 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -627,12 +627,16 @@ static inline void vma_write_lock(struct vm_area_struct *vma)
> >        * mm->mm_lock_seq can't be concurrently modified.
> >        */
> >       mm_lock_seq = READ_ONCE(vma->vm_mm->mm_lock_seq);
> > -     if (vma->vm_lock_seq == mm_lock_seq)
> > +     if (vma->vm_lock->lock_seq == mm_lock_seq)
> >               return;
> >
> > -     down_write(&vma->vm_lock->lock);
> > -     vma->vm_lock_seq = mm_lock_seq;
> > -     up_write(&vma->vm_lock->lock);
> > +     if (atomic_cmpxchg(&vma->vm_lock->count, 0, -1))
> > +             wait_event(vma->vm_mm->vma_writer_wait,
> > +                        atomic_cmpxchg(&vma->vm_lock->count, 0, -1) == 0);
> > +     vma->vm_lock->lock_seq = mm_lock_seq;
> > +     /* Write barrier to ensure lock_seq change is visible before count */
> > +     smp_wmb();
> > +     atomic_set(&vma->vm_lock->count, 0);
> >  }
> >
> >  /*
> > @@ -643,20 +647,28 @@ static inline void vma_write_lock(struct vm_area_struct *vma)
> >  static inline bool vma_read_trylock(struct vm_area_struct *vma)
> >  {
> >       /* Check before locking. A race might cause false locked result. */
> > -     if (vma->vm_lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))
> > +     if (vma->vm_lock->lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))
> >               return false;
> >
> > -     if (unlikely(down_read_trylock(&vma->vm_lock->lock) == 0))
> > +     if (unlikely(!atomic_inc_unless_negative(&vma->vm_lock->count)))
> >               return false;
> >
> > +     /* If atomic_t overflows, restore and fail to lock. */
> > +     if (unlikely(atomic_read(&vma->vm_lock->count) < 0)) {
> > +             if (atomic_dec_and_test(&vma->vm_lock->count))
> > +                     wake_up(&vma->vm_mm->vma_writer_wait);
> > +             return false;
> > +     }
> > +
> >       /*
> >        * Overflow might produce false locked result.
> >        * False unlocked result is impossible because we modify and check
> >        * vma->vm_lock_seq under vma->vm_lock protection and mm->mm_lock_seq
> >        * modification invalidates all existing locks.
> >        */
> > -     if (unlikely(vma->vm_lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))) {
> > -             up_read(&vma->vm_lock->lock);
> > +     if (unlikely(vma->vm_lock->lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))) {
> > +             if (atomic_dec_and_test(&vma->vm_lock->count))
> > +                     wake_up(&vma->vm_mm->vma_writer_wait);
> >               return false;
> >       }
>
> With this change readers can cause writers to starve.
> What about checking waitqueue_active() before or after increasing
> vma->vm_lock->count?

The readers are in page fault path, which is the fast path, while
writers performing updates are in slow path. Therefore I *think*
starving writers should not be a big issue. So far in benchmarks I
haven't seen issues with that but maybe there is such a case?

>
> --
> Thanks,
> Hyeonggon
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
