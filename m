Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC59E66E67A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 19:56:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxJ5d5ZrSz3fBw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 05:56:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Mt+sJp5d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Mt+sJp5d;
	dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxJ4j5ppsz3c7l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 05:55:48 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id 123so2097010ybv.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 10:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hjk26ZZoZCfL6kjko8l/pSHnRgndFb4Mk147LRzA91E=;
        b=Mt+sJp5dwuIsL+Ko5cT1XtmvNX0+vXcya9w3KxCAGiP5wEFud5o530HskF9og8ZMkd
         ljvA9NKCih7KjYskMBb5clv4araVsgVH8bivehaUbVs1zXmC/Q33zJ2WQgBH8wLEh0Ww
         LO52zNPDud7WwXKOiScqFdlxb/HA84LcUefakhGKNdWzRjfSLYoc+FzRvi5aIbasr4/1
         iGt43X07P5GiJPZJVy/5QSn6qq+xCbFLi962ogszxOLly8aqpiMkM3flx1tsWJ3TC+lM
         JwJqwtVwEAaEziK1WoW3RHASnzImrfdF+niEuev4vFd01otF7C+PJQGmm/v884HYR4zi
         v9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hjk26ZZoZCfL6kjko8l/pSHnRgndFb4Mk147LRzA91E=;
        b=il2zz5EnnuiOJmgp8VY8u56OucrEf/svobcmNfykCNW3R8w6Wqhoq9I2rDt9QrjLXl
         PcPpz93/0AwdW04P+ilb2D5ddFQLY7qeSixpGMC04s5GHNvef8LZ8om1wQofqh9Sy8Yy
         0CJ7v+g9O4LdbXrgbcANnO3IPiyl6sda4SO4IfjC+vZ29MA/7p15ujkV6i1jIikZUNKM
         Vrydf0u+p6h2a+FYI6zf5Y+37UHey01ycdGY/HwpV6lqtwEN5yYSgfrFz7oyasILvKuJ
         wKym+Xvbdm7Yrz3KjfjWGNIJoHXOvwd4nE8T+z+D58m9VGySgIP8g7QS9Q8F12loXjxj
         /I2Q==
X-Gm-Message-State: AFqh2kruFdVNri+oeMFfkHBmFkmM+glKUX/adZFeydYL38bloHBdD4KQ
	lScpQnijP/Ds5xOwWG4CNdJBElOLQSaIORoYCU48Uw==
X-Google-Smtp-Source: AMrXdXsB68dzuUro7SI9IrfjHxCTvw8eBu3xk1m8gxflhvDRkqqF3qc7tx3EmnQTV75nr092zIYy1Q+gFJMC6cvTzv8=
X-Received: by 2002:a5b:cc8:0:b0:7ba:78b1:9fcc with SMTP id
 e8-20020a5b0cc8000000b007ba78b19fccmr507280ybr.593.1673981745113; Tue, 17 Jan
 2023 10:55:45 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-42-surenb@google.com>
 <CAG48ez3ZNt+B3XvAMP1OaeEYuwpXJ1epmT9YtNonFLEJ6yANVQ@mail.gmail.com>
 <CAJuCfpFruHecz9NssGGFrG-RqbJFHCfRuZ7c6GbTBD4x4AU8aA@mail.gmail.com>
 <Y8bpfzYvWq/3ttr+@casper.infradead.org> <CAJuCfpHkgRDpMJXd6vnCmB50PnSOwDY9pjhW5LcdR+fU5JUseA@mail.gmail.com>
 <Y8btYASD3jmdCf5n@casper.infradead.org>
In-Reply-To: <Y8btYASD3jmdCf5n@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Jan 2023 10:55:33 -0800
Message-ID: <CAJuCfpGcufxmL7A-ea_JDKU2pxrTQJ7Sez7C6zcVyFK9q1CXUg@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, Jann Horn <jannh@google.com>, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingul
 arity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 10:47 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Jan 17, 2023 at 10:36:42AM -0800, Suren Baghdasaryan wrote:
> > On Tue, Jan 17, 2023 at 10:31 AM Matthew Wilcox <willy@infradead.org> wrote:
> > >
> > > On Tue, Jan 17, 2023 at 10:26:32AM -0800, Suren Baghdasaryan wrote:
> > > > On Tue, Jan 17, 2023 at 10:12 AM Jann Horn <jannh@google.com> wrote:
> > > > >
> > > > > On Mon, Jan 9, 2023 at 9:55 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > > > > > rw_semaphore is a sizable structure of 40 bytes and consumes
> > > > > > considerable space for each vm_area_struct. However vma_lock has
> > > > > > two important specifics which can be used to replace rw_semaphore
> > > > > > with a simpler structure:
> > > > > [...]
> > > > > >  static inline void vma_read_unlock(struct vm_area_struct *vma)
> > > > > >  {
> > > > > > -       up_read(&vma->vm_lock->lock);
> > > > > > +       if (atomic_dec_and_test(&vma->vm_lock->count))
> > > > > > +               wake_up(&vma->vm_mm->vma_writer_wait);
> > > > > >  }
> > > > >
> > > > > I haven't properly reviewed this, but this bit looks like a
> > > > > use-after-free because you're accessing the vma after dropping your
> > > > > reference on it. You'd have to first look up the vma->vm_mm, then do
> > > > > the atomic_dec_and_test(), and afterwards do the wake_up() without
> > > > > touching the vma. Or alternatively wrap the whole thing in an RCU
> > > > > read-side critical section if the VMA is freed with RCU delay.
> > > >
> > > > vm_lock->count does not control the lifetime of the VMA, it's a
> > > > counter of how many readers took the lock or it's negative if the lock
> > > > is write-locked.
> > >
> > > Yes, but ...
> > >
> > >         Task A:
> > >         atomic_dec_and_test(&vma->vm_lock->count)
> > >                         Task B:
> > >                         munmap()
> > >                         write lock
> > >                         free VMA
> > >                         synchronize_rcu()
> > >                         VMA is really freed
> > >         wake_up(&vma->vm_mm->vma_writer_wait);
> > >
> > > ... vma is freed.
> > >
> > > Now, I think this doesn't occur.  I'm pretty sure that every caller of
> > > vma_read_unlock() is holding the RCU read lock.  But maybe we should
> > > have that assertion?
> >
> > Yep, that's what this patch is doing
> > https://lore.kernel.org/all/20230109205336.3665937-27-surenb@google.com/
> > by calling vma_assert_no_reader() from __vm_area_free().
>
> That's not enough though.  Task A still has a pointer to vma after it
> has called atomic_dec_and_test(), even after vma has been freed by
> Task B, and before Task A dereferences vma->vm_mm.

Ah, I see your point now. I guess I'll have to store vma->vm_mm in a
local variable and call mmgrab() before atomic_dec_and_test(), then
use it in wake_up() and call mmdrop(). Is that what you are thinking?
