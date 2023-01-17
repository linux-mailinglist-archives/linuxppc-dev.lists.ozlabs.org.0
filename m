Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1622566E630
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 19:38:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxHhm6VhVz3cg0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 05:38:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gxjnHvj8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gxjnHvj8;
	dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxHfw6Hspz3chL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 05:36:56 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id e130so5690085yba.7
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 10:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V1H5fXM2fL2DdrWpyoXMBctTJAS8jb7T6PCl+Qy5zOw=;
        b=gxjnHvj8cVe25xe+zX4WRnwKZ/brVkr5NAQvQhig97cn/WdPwEKXJ0CcxWDRdQjTgL
         CXjwieZIUVlSTyILqrTiUbDRF+ea1UDehvweav5P1CuJOVEyBuDTsE3qvQqobL8xO6AP
         hCH0dgiIRYxBj6IumfW7TGL56+UaWnuSKlqJ21JgE0enoNkA++ErvEnjd5UB4xrMV6Jf
         uG/GUaOWc80u2H1KfcKnHUfrKMiW/71Ep2ENhqfcG0DCYRUSZUZbjGFDfpgzNkbmGKzW
         a+pu7tysx22k06eWclORI9cJLUxOPOxAJoVnZ1Td/WfLw2pThNtKXmCaWj7fKFEdQY0p
         MTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1H5fXM2fL2DdrWpyoXMBctTJAS8jb7T6PCl+Qy5zOw=;
        b=sT0Q2ZH3U+xghIZVwu63cVUv8YXCwSBKiFCUg6q76X4DD7Ds3yN1k4fTtNdiqlP4Yi
         cZb4reAXDIEJ0uzYo6xRwLeP/7m5p1qIqhpMV7xiMnJHhduIT3vRml9R1W1jY0bNx72J
         VjS5EUL7jHMvm5y1hUyk5te52YbwnhI4DhaXkYG452I4hXnkBb2sJ7RHLPQrj6dFrTDT
         23gwfS46s4PaqMJJoMbLNfbLXf5qCj+0Dsk4CXwHAsVfHiNo7yc9I72waYOm0Wxu4Crm
         wkOJOe6gXXS4UhFDnQ6N30C/U6KGMz1Yf1HVEQEQRJQH9qHfpSwp1cDRkC7CK+34M+b8
         LxRQ==
X-Gm-Message-State: AFqh2kqN366RxIcDkYkamY+IILfz1z+ihEoMmPv7tkZi1SsvyW3ttfPY
	8gQqaJpNTvj2ovbnERAvUKqi3oLlzIBKoFmfOl4fpg==
X-Google-Smtp-Source: AMrXdXtyj7e8dbA/BNCU251BtN/VoE0bK1PziTZuFr/9sT9i9A5FERt6459sIvPd/PApW3XUSMSS+TJrm1BvJY90WKw=
X-Received: by 2002:a25:ceca:0:b0:7e4:115c:9cf6 with SMTP id
 x193-20020a25ceca000000b007e4115c9cf6mr540428ybe.316.1673980613192; Tue, 17
 Jan 2023 10:36:53 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-42-surenb@google.com>
 <CAG48ez3ZNt+B3XvAMP1OaeEYuwpXJ1epmT9YtNonFLEJ6yANVQ@mail.gmail.com>
 <CAJuCfpFruHecz9NssGGFrG-RqbJFHCfRuZ7c6GbTBD4x4AU8aA@mail.gmail.com> <Y8bpfzYvWq/3ttr+@casper.infradead.org>
In-Reply-To: <Y8bpfzYvWq/3ttr+@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Jan 2023 10:36:42 -0800
Message-ID: <CAJuCfpHkgRDpMJXd6vnCmB50PnSOwDY9pjhW5LcdR+fU5JUseA@mail.gmail.com>
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

On Tue, Jan 17, 2023 at 10:31 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Jan 17, 2023 at 10:26:32AM -0800, Suren Baghdasaryan wrote:
> > On Tue, Jan 17, 2023 at 10:12 AM Jann Horn <jannh@google.com> wrote:
> > >
> > > On Mon, Jan 9, 2023 at 9:55 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > > > rw_semaphore is a sizable structure of 40 bytes and consumes
> > > > considerable space for each vm_area_struct. However vma_lock has
> > > > two important specifics which can be used to replace rw_semaphore
> > > > with a simpler structure:
> > > [...]
> > > >  static inline void vma_read_unlock(struct vm_area_struct *vma)
> > > >  {
> > > > -       up_read(&vma->vm_lock->lock);
> > > > +       if (atomic_dec_and_test(&vma->vm_lock->count))
> > > > +               wake_up(&vma->vm_mm->vma_writer_wait);
> > > >  }
> > >
> > > I haven't properly reviewed this, but this bit looks like a
> > > use-after-free because you're accessing the vma after dropping your
> > > reference on it. You'd have to first look up the vma->vm_mm, then do
> > > the atomic_dec_and_test(), and afterwards do the wake_up() without
> > > touching the vma. Or alternatively wrap the whole thing in an RCU
> > > read-side critical section if the VMA is freed with RCU delay.
> >
> > vm_lock->count does not control the lifetime of the VMA, it's a
> > counter of how many readers took the lock or it's negative if the lock
> > is write-locked.
>
> Yes, but ...
>
>         Task A:
>         atomic_dec_and_test(&vma->vm_lock->count)
>                         Task B:
>                         munmap()
>                         write lock
>                         free VMA
>                         synchronize_rcu()
>                         VMA is really freed
>         wake_up(&vma->vm_mm->vma_writer_wait);
>
> ... vma is freed.
>
> Now, I think this doesn't occur.  I'm pretty sure that every caller of
> vma_read_unlock() is holding the RCU read lock.  But maybe we should
> have that assertion?

Yep, that's what this patch is doing
https://lore.kernel.org/all/20230109205336.3665937-27-surenb@google.com/
by calling vma_assert_no_reader() from __vm_area_free().

>
