Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E8C66D562
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 05:35:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nwx0D1p0bz3cdg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 15:35:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hM38RCzS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hM38RCzS;
	dkim-atps=neutral
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwwzK67Qgz3bYW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 15:34:52 +1100 (AEDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-4d59d518505so237880777b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 20:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yRWBrMnmbVU6x7T0LPdTvz2nVvy3IZspLp0UQMF1irY=;
        b=hM38RCzSZziAG4zDZljPcNKfKjFLxHw4U/hoqCGnc2uhhpiLyfSuGpOTWJdWIMlxUv
         KjjhlBQmiQD8oPmw8rC7puYkrtFzSPrLW3kUpLnqfZC4c3aQzBYS/77dZgZ3jxcmGSFw
         GIuig9k6wQaOTlDLxqIH8XTIgBM6dLPj+spsFwsvjdG67Vdq/GY9waM9rX8RSrpCp0x3
         8BaL/NOYp7Q0chsNamh7WaEtB2GnL40hJ1GgUHERDPj8PKO5UjxdqJIQNfLL/BykPZf1
         B0tiiASa/wxaXtgB66A7Qm1/fEYloC8AH7VIbm0aHwYy1hzVUqvaTtSyE9Wgwz9LlOij
         3bYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRWBrMnmbVU6x7T0LPdTvz2nVvy3IZspLp0UQMF1irY=;
        b=B4FVgsObxspDDRB+4of2vv/Xgg42RqESkPqBpVm6fr9cyjFAFBWsA9sqWvOY15OvLs
         YC7QQIWJMlOIuOKDye2rJpzK4i9cke4rOcmFei3nqMoZ4qAj7taCm5SU5QQq2ytXciaS
         udQSliLU2vy/OwwZq4Vt2xEgXXJ97UZ3JVu3waNBpWnEdzYBoENCZHXju+4vd2XM+B+0
         +3EoaivBnLiM+MjMYi4VDK7gGt8az3fk/4qgf88aFSgF1a9gn1zbRAwd/o11O+kL4NdD
         B9dTDg7bpBB+daWrnzgeyfFTYJG1Q8IQXPfC4bOmBPOrhgont2VnjC8Xz3PeGc5EBGOt
         3oeQ==
X-Gm-Message-State: AFqh2kpUMrwuU72IvcPxMykWZcjEHMWopOgyH9njEXQSqnk0inFB4k3K
	S2tt953EtpEW00XD+1gc68AKsvT1NHe2fkK34M2i4g==
X-Google-Smtp-Source: AMrXdXseXKT6jNFxFMT1V3/l2fB00iDOPtEl/NQbThFwW0Hm+cjzFDqP3MAncylx3ySdnaL+hEiuL1zL4iLHm5r9qaI=
X-Received: by 2002:a81:708c:0:b0:479:b6a1:d9a4 with SMTP id
 l134-20020a81708c000000b00479b6a1d9a4mr179033ywc.263.1673930087969; Mon, 16
 Jan 2023 20:34:47 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-42-surenb@google.com>
 <Y8UxnqPCTLbbD+2F@localhost> <Y8YgomKF189vmgLz@casper.infradead.org>
In-Reply-To: <Y8YgomKF189vmgLz@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Jan 2023 20:34:36 -0800
Message-ID: <CAJuCfpECJhUu3fvWbBzmAkEA3+1LTkKqJOVadQB_-_mEHME=xg@mail.gmail.com>
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

On Mon, Jan 16, 2023 at 8:14 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Jan 16, 2023 at 11:14:38AM +0000, Hyeonggon Yoo wrote:
> > > @@ -643,20 +647,28 @@ static inline void vma_write_lock(struct vm_area_struct *vma)
> > >  static inline bool vma_read_trylock(struct vm_area_struct *vma)
> > >  {
> > >     /* Check before locking. A race might cause false locked result. */
> > > -   if (vma->vm_lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))
> > > +   if (vma->vm_lock->lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))
> > >             return false;
> > >
> > > -   if (unlikely(down_read_trylock(&vma->vm_lock->lock) == 0))
> > > +   if (unlikely(!atomic_inc_unless_negative(&vma->vm_lock->count)))
> > >             return false;
> > >
> > > +   /* If atomic_t overflows, restore and fail to lock. */
> > > +   if (unlikely(atomic_read(&vma->vm_lock->count) < 0)) {
> > > +           if (atomic_dec_and_test(&vma->vm_lock->count))
> > > +                   wake_up(&vma->vm_mm->vma_writer_wait);
> > > +           return false;
> > > +   }
> > > +
> > >     /*
> > >      * Overflow might produce false locked result.
> > >      * False unlocked result is impossible because we modify and check
> > >      * vma->vm_lock_seq under vma->vm_lock protection and mm->mm_lock_seq
> > >      * modification invalidates all existing locks.
> > >      */
> > > -   if (unlikely(vma->vm_lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))) {
> > > -           up_read(&vma->vm_lock->lock);
> > > +   if (unlikely(vma->vm_lock->lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))) {
> > > +           if (atomic_dec_and_test(&vma->vm_lock->count))
> > > +                   wake_up(&vma->vm_mm->vma_writer_wait);
> > >             return false;
> > >     }
> >
> > With this change readers can cause writers to starve.
> > What about checking waitqueue_active() before or after increasing
> > vma->vm_lock->count?
>
> I don't understand how readers can starve a writer.  Readers do
> atomic_inc_unless_negative() so a writer can always force readers
> to fail.

I think the point here was that if page faults keep occuring and they
prevent vm_lock->count from reaching 0 then a writer will be blocked
and there is no reader throttling mechanism (no max time that writer
will be waiting).
