Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9E466D5C8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 06:59:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nwys935b5z3cd6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 16:59:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=szFCOms0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=szFCOms0;
	dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwyrC2gLDz3c6C
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 16:58:50 +1100 (AEDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 20so13674195ybl.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 21:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B1UEa3M1jP3y0W29RzNqF9B+ZNIIlo3tNbOA7FKp7Wg=;
        b=szFCOms07Q53JQEnknyv2QcVn4fy3vBXVmKKspUTNnPlLtZTRF0d428TYfV9jDTsLX
         ycdeb1Skm451H4kEb5YktOhQk47tSUAqY6ZKdXDHxntmfT/T2YvRnXr8768wBLUZQYsf
         NloTHm46j/BZ7LoTaIJJF+P9tpVsuTHp1412qVOeK43J5yJ5SNABR1ITdDod7FabVFjH
         0vuzHwBnFOhDtgJLMxLErKRZrVlCIUNa6khChg4g51rInsOaIMS3n4wIXMdHkkz6p02s
         pbHk2LcOHyoWkStGKc3E4jxHxQYWx4SfSGVVdA9DloQ/MHNTDm37A6udp1IgHDbr11kS
         kSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1UEa3M1jP3y0W29RzNqF9B+ZNIIlo3tNbOA7FKp7Wg=;
        b=oP/xGjKSbEPPxOKvYkZ7MqXF3bDR5zdLe1WatyFlAs4bGKDTXLOWJZBzPQjVCe/wal
         TXOh3pSG/1N09u0dKZcU+aS8NrPn7A0G/DHi6P4Gqr1Rxkc0iZyorO9v6YJ4MUpjyJ62
         +lgccuqBcjgnvG1no7TYFnqmd5KBY9G9ehi6hBszDKiGk1EZPgbeJjgafDan9eyv3IX9
         gJvzYpdBKavGM5T33myz9QZsRlJfoLKfgMuFwmKqKkUzDjQgXTPag/zEzKZUY78m106/
         2gpHn+F+32AqG6h3IO5Fz0fYyS90c6wSRhelS1GOvSpqVb/jRADv4P2h7w7ZhJVuvKuX
         IIJw==
X-Gm-Message-State: AFqh2krt5kAsiXSe2K68XPamj79Vaf6e2BXrUlqjc6nXjsSI0FSPpwuj
	odr9UVK79NSrt1DvaNOK7Ck7xGNsQPLXS3cpnW4IdA==
X-Google-Smtp-Source: AMrXdXvdHf1+toW/1/obAcs98q3sqrmqpnAvEMhZ2E5TLuL8tC57gEqh2hzxqreEm8uMFGnaV8bTWU/bWAWqALbg44k=
X-Received: by 2002:a25:f305:0:b0:7b8:6d00:ef23 with SMTP id
 c5-20020a25f305000000b007b86d00ef23mr296920ybs.119.1673935126396; Mon, 16 Jan
 2023 21:58:46 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-42-surenb@google.com>
 <Y8UxnqPCTLbbD+2F@localhost> <Y8YgomKF189vmgLz@casper.infradead.org>
 <CAJuCfpECJhUu3fvWbBzmAkEA3+1LTkKqJOVadQB_-_mEHME=xg@mail.gmail.com> <Y8Y2JErbNQOhL8ee@casper.infradead.org>
In-Reply-To: <Y8Y2JErbNQOhL8ee@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Jan 2023 21:58:35 -0800
Message-ID: <CAJuCfpEx6FJpm0Js=cvcHw6mY3izPfoskxseSMyxFAxLX97X_w@mail.gmail.com>
Subject: Re: [PATCH 41/41] mm: replace rw_semaphore with atomic_t in vma_lock
To: Matthew Wilcox <willy@infradead.org>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, Hyeonggon Yoo <42.hyeyoo@gmail.com>, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@googl
 e.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 16, 2023 at 9:46 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Jan 16, 2023 at 08:34:36PM -0800, Suren Baghdasaryan wrote:
> > On Mon, Jan 16, 2023 at 8:14 PM Matthew Wilcox <willy@infradead.org> wrote:
> > >
> > > On Mon, Jan 16, 2023 at 11:14:38AM +0000, Hyeonggon Yoo wrote:
> > > > > @@ -643,20 +647,28 @@ static inline void vma_write_lock(struct vm_area_struct *vma)
> > > > >  static inline bool vma_read_trylock(struct vm_area_struct *vma)
> > > > >  {
> > > > >     /* Check before locking. A race might cause false locked result. */
> > > > > -   if (vma->vm_lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))
> > > > > +   if (vma->vm_lock->lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))
> > > > >             return false;
> > > > >
> > > > > -   if (unlikely(down_read_trylock(&vma->vm_lock->lock) == 0))
> > > > > +   if (unlikely(!atomic_inc_unless_negative(&vma->vm_lock->count)))
> > > > >             return false;
> > > > >
> > > > > +   /* If atomic_t overflows, restore and fail to lock. */
> > > > > +   if (unlikely(atomic_read(&vma->vm_lock->count) < 0)) {
> > > > > +           if (atomic_dec_and_test(&vma->vm_lock->count))
> > > > > +                   wake_up(&vma->vm_mm->vma_writer_wait);
> > > > > +           return false;
> > > > > +   }
> > > > > +
> > > > >     /*
> > > > >      * Overflow might produce false locked result.
> > > > >      * False unlocked result is impossible because we modify and check
> > > > >      * vma->vm_lock_seq under vma->vm_lock protection and mm->mm_lock_seq
> > > > >      * modification invalidates all existing locks.
> > > > >      */
> > > > > -   if (unlikely(vma->vm_lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))) {
> > > > > -           up_read(&vma->vm_lock->lock);
> > > > > +   if (unlikely(vma->vm_lock->lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))) {
> > > > > +           if (atomic_dec_and_test(&vma->vm_lock->count))
> > > > > +                   wake_up(&vma->vm_mm->vma_writer_wait);
> > > > >             return false;
> > > > >     }
> > > >
> > > > With this change readers can cause writers to starve.
> > > > What about checking waitqueue_active() before or after increasing
> > > > vma->vm_lock->count?
> > >
> > > I don't understand how readers can starve a writer.  Readers do
> > > atomic_inc_unless_negative() so a writer can always force readers
> > > to fail.
> >
> > I think the point here was that if page faults keep occuring and they
> > prevent vm_lock->count from reaching 0 then a writer will be blocked
> > and there is no reader throttling mechanism (no max time that writer
> > will be waiting).
>
> Perhaps I misunderstood your description; I thought that a _waiting_
> writer would make the count negative, not a successfully acquiring
> writer.

A waiting writer does not modify the counter, instead it's placed on
the wait queue and the last reader which sets the count to 0 while
releasing its read lock will wake it up. Once the writer is woken it
will try to set the count to negative and if successful will own the
lock, otherwise it goes back to sleep.
