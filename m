Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F59F66E5FA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 19:29:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxHVY3M4Bz3cdL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 05:29:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=TugNNA6I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=TugNNA6I;
	dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxHTf6kq3z3c6f
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 05:28:54 +1100 (AEDT)
Received: by mail-yb1-xb32.google.com with SMTP id d62so19008376ybh.8
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 10:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xJ9a5k62K2ffRLYGDnXiEVgAqCOpETFmSpdpD6ZFTEU=;
        b=TugNNA6IW3kjjXC0UB9Q4zYArPnczNcobp3A2tpyLPyt4MtQKyr6zzhhrfsm7d8XZz
         plZwibra7wIvfScF9ZMs3g3vVO8FjrRNHdle/svQaIXQsOx9qxV3vfbolg5PUUICJ3Kf
         d7qgMgVGJnBSkAUqbq6g1OreLXwU+87l5mwXQwW706kG5xO5+05EIi5bOXg79nz32Qrw
         dsQMNA/Gw2YTnH7r5UvQ4jWIKQWbtUYH+IOPS2OMLDSqBX7I9IH8i+VuO9kGuLBAVeFC
         nOreMEr4mt8weNwZnB7rkFh3VQKPCypGe5gwLoMmY+xBGfo+wxqPOBVJpImescmSooeA
         4IFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJ9a5k62K2ffRLYGDnXiEVgAqCOpETFmSpdpD6ZFTEU=;
        b=yQvCFL4LGbU9FfU0ETGo7nA8xXjPmDA+tV5+1mbIGCm0Yt2GFfdV8zXjugO9hDN6qs
         eNaguN9TH48q6EZfsG0eyfQOWFnn4qUF16+4r7lbAy2EbsSolPLTu+c90D7nETbJLCRo
         yzyNe4AI8cZPygxn+KBi6xOfKfKr/NL6G9Cwga85yshzQ/2y567CUm89XfvXZ7IXnN2N
         rF3kXA0uDA1rpNaEOOVyFWp1xPKaAvMEAlMtiL2La10lqkpcl7xQZpf3dazhHTtM0KEx
         430QD33J7fpbsLgUXrGI8PguhZ7y+XSI+2JzlfIj3vaFUfegOEo69/Xewr9JueVfLSda
         hb9Q==
X-Gm-Message-State: AFqh2kqAbsGuAIyaltOZ0sURpNWrdsVIWWTGnZfVcUWaB4R9xvTWQOKT
	/Yddqeh6cGB08eKwpMbEOOmAPmHf63pOnihoNwp1IQ==
X-Google-Smtp-Source: AMrXdXul+ds4BnedPHTIDuUTPwQ9kRruzqOz+sh02Z6/mQHpytATwg44fNmM1minbyCreXoEm6RuK7SuXwA7MwL42W8=
X-Received: by 2002:a25:f305:0:b0:7b8:6d00:ef23 with SMTP id
 c5-20020a25f305000000b007b86d00ef23mr555146ybs.119.1673980131146; Tue, 17 Jan
 2023 10:28:51 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-42-surenb@google.com>
 <Y8UxnqPCTLbbD+2F@localhost> <Y8YgomKF189vmgLz@casper.infradead.org>
 <CAJuCfpECJhUu3fvWbBzmAkEA3+1LTkKqJOVadQB_-_mEHME=xg@mail.gmail.com>
 <Y8Y2JErbNQOhL8ee@casper.infradead.org> <CAJuCfpEx6FJpm0Js=cvcHw6mY3izPfoskxseSMyxFAxLX97X_w@mail.gmail.com>
 <Y8bnpqw134CHenz/@casper.infradead.org>
In-Reply-To: <Y8bnpqw134CHenz/@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Jan 2023 10:28:40 -0800
Message-ID: <CAJuCfpGKRLshk1oWf1Nz4jhDrMGnkWs7qtWYaj=j_iQwPq0THQ@mail.gmail.com>
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

On Tue, Jan 17, 2023 at 10:23 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Jan 16, 2023 at 09:58:35PM -0800, Suren Baghdasaryan wrote:
> > On Mon, Jan 16, 2023 at 9:46 PM Matthew Wilcox <willy@infradead.org> wrote:
> > >
> > > On Mon, Jan 16, 2023 at 08:34:36PM -0800, Suren Baghdasaryan wrote:
> > > > On Mon, Jan 16, 2023 at 8:14 PM Matthew Wilcox <willy@infradead.org> wrote:
> > > > >
> > > > > On Mon, Jan 16, 2023 at 11:14:38AM +0000, Hyeonggon Yoo wrote:
> > > > > > > @@ -643,20 +647,28 @@ static inline void vma_write_lock(struct vm_area_struct *vma)
> > > > > > >  static inline bool vma_read_trylock(struct vm_area_struct *vma)
> > > > > > >  {
> > > > > > >     /* Check before locking. A race might cause false locked result. */
> > > > > > > -   if (vma->vm_lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))
> > > > > > > +   if (vma->vm_lock->lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))
> > > > > > >             return false;
> > > > > > >
> > > > > > > -   if (unlikely(down_read_trylock(&vma->vm_lock->lock) == 0))
> > > > > > > +   if (unlikely(!atomic_inc_unless_negative(&vma->vm_lock->count)))
> > > > > > >             return false;
> > > > > > >
> > > > > > > +   /* If atomic_t overflows, restore and fail to lock. */
> > > > > > > +   if (unlikely(atomic_read(&vma->vm_lock->count) < 0)) {
> > > > > > > +           if (atomic_dec_and_test(&vma->vm_lock->count))
> > > > > > > +                   wake_up(&vma->vm_mm->vma_writer_wait);
> > > > > > > +           return false;
> > > > > > > +   }
> > > > > > > +
> > > > > > >     /*
> > > > > > >      * Overflow might produce false locked result.
> > > > > > >      * False unlocked result is impossible because we modify and check
> > > > > > >      * vma->vm_lock_seq under vma->vm_lock protection and mm->mm_lock_seq
> > > > > > >      * modification invalidates all existing locks.
> > > > > > >      */
> > > > > > > -   if (unlikely(vma->vm_lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))) {
> > > > > > > -           up_read(&vma->vm_lock->lock);
> > > > > > > +   if (unlikely(vma->vm_lock->lock_seq == READ_ONCE(vma->vm_mm->mm_lock_seq))) {
> > > > > > > +           if (atomic_dec_and_test(&vma->vm_lock->count))
> > > > > > > +                   wake_up(&vma->vm_mm->vma_writer_wait);
> > > > > > >             return false;
> > > > > > >     }
> > > > > >
> > > > > > With this change readers can cause writers to starve.
> > > > > > What about checking waitqueue_active() before or after increasing
> > > > > > vma->vm_lock->count?
> > > > >
> > > > > I don't understand how readers can starve a writer.  Readers do
> > > > > atomic_inc_unless_negative() so a writer can always force readers
> > > > > to fail.
> > > >
> > > > I think the point here was that if page faults keep occuring and they
> > > > prevent vm_lock->count from reaching 0 then a writer will be blocked
> > > > and there is no reader throttling mechanism (no max time that writer
> > > > will be waiting).
> > >
> > > Perhaps I misunderstood your description; I thought that a _waiting_
> > > writer would make the count negative, not a successfully acquiring
> > > writer.
> >
> > A waiting writer does not modify the counter, instead it's placed on
> > the wait queue and the last reader which sets the count to 0 while
> > releasing its read lock will wake it up. Once the writer is woken it
> > will try to set the count to negative and if successful will own the
> > lock, otherwise it goes back to sleep.
>
> Then yes, that's a starvable lock.  Preventing starvation on the mmap
> sem was the original motivation for making rwsems non-starvable, so
> changing that behaviour now seems like a bad idea.  For efficiency, I'd
> suggest that a waiting writer set the top bit of the counter.  That way,
> all new readers will back off without needing to check a second variable
> and old readers will know that they *may* need to do the wakeup when
> atomic_sub_return_release() is negative.
>
> (rwsem.c has a more complex bitfield, but I don't think we need to go
> that far; the important point is that the waiting writer indicates its
> presence in the count field so that readers can modify their behaviour)

Got it. Ok, I think we can figure something out to check if there are
waiting write-lockers and prevent new readers from taking the lock.
