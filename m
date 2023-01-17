Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F28566E68D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 20:07:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxJKq615cz3chB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 06:07:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=b9kN9m9+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=b9kN9m9+;
	dkim-atps=neutral
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxJJt4ktdz3c9R
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 06:06:21 +1100 (AEDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-4bf16baa865so435380037b3.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 11:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=piMG1DuaESd4yy9T0vjqeBkSs2tcq+RGiCxRBd42BoU=;
        b=b9kN9m9+LabFupWBnO6H5aHhXpoHc5BSqt7en/Mb5CT4XEPZ4W6ihdsZ3Kt0NQdxbV
         FXlGQHOyL96F9u+bat4+2WfAeVL7mzvf+bfGCyJECTytFkyXDEA2sv8AO+kXuB9YMv5C
         y+JptZiatc2M/xTaI9ZdPokBb8M5mIHAV7SA8YUtwO6KojGENrqGQWHiofVHA7pRWHVa
         O/gxATF6aNNdKysBt4wffZjeepbmoA4mwMLVmtfnf75tHPxQw9MLhdpHp2ufGE8604Bz
         XVS+eSKEEZ//VK8aFHGIe9vam2ZiDCrz0+7L3uT1pn5crMRAf+bqYRQbSPbEvguZ4Hrc
         OG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=piMG1DuaESd4yy9T0vjqeBkSs2tcq+RGiCxRBd42BoU=;
        b=uLIyHLyjtDWL9ZoeO1V6RfCvM7KzUqQOnczBZglr38BOYdgkgqtw8CsmMUc7UAqQ1R
         0y/A2CrAZM1kiU2pq7Q5awFKIk1W9Ueu/Jt7lX+9mn/TSftRWn26bowNNinI0r0Sl0LX
         6ic3FQCpGkQWD/Asu33WWKmV7vZmdpWmtOXkqEL4lbgKe9I0KCdmqOu3tYMpa6Tl1nBl
         xMcL+jGwNAASZKM/QGdjtDuXRk12tc1zupIFTru4WqAAqUoTvU2+PuA0QTcjjpBqeNAF
         jO7XodL4iOoR2kz/XgT5d+UifYbAIO8jznSkzUPneAbRB60TSQPPHuvzGFbygWlWgqrb
         irqQ==
X-Gm-Message-State: AFqh2koQMiP4iD54YS6bO+hYKqXl0Uu2xYOIW0o77KoH+QZOtYt0D2A+
	q1xaTW7Wd18/KUC2o8916+aH5NAjrkBXv3GhdnTvTA==
X-Google-Smtp-Source: AMrXdXsHweBQHW7UKmgjom3Su1ShwZEHL2ksGWMc4WBurYbdzNOC4U9my8HdnEHW8tGQ814YZRnt9q0m/btBoe0x5Xw=
X-Received: by 2002:a81:9105:0:b0:3dc:fd91:ef89 with SMTP id
 i5-20020a819105000000b003dcfd91ef89mr462069ywg.347.1673982377776; Tue, 17 Jan
 2023 11:06:17 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-42-surenb@google.com>
 <CAG48ez3ZNt+B3XvAMP1OaeEYuwpXJ1epmT9YtNonFLEJ6yANVQ@mail.gmail.com>
 <CAJuCfpFruHecz9NssGGFrG-RqbJFHCfRuZ7c6GbTBD4x4AU8aA@mail.gmail.com>
 <Y8bpfzYvWq/3ttr+@casper.infradead.org> <CAJuCfpHkgRDpMJXd6vnCmB50PnSOwDY9pjhW5LcdR+fU5JUseA@mail.gmail.com>
 <Y8btYASD3jmdCf5n@casper.infradead.org> <CAJuCfpGcufxmL7A-ea_JDKU2pxrTQJ7Sez7C6zcVyFK9q1CXUg@mail.gmail.com>
 <CAG48ez3Je1Jht_vqJf-qQ5R=KDuE1gzmHy5wN8oYZTwr+0PwBA@mail.gmail.com>
In-Reply-To: <CAG48ez3Je1Jht_vqJf-qQ5R=KDuE1gzmHy5wN8oYZTwr+0PwBA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Jan 2023 11:06:06 -0800
Message-ID: <CAJuCfpGPjEz_aK41hFDmz8Fd=xyjfS8X0dgEAJWQMteL2=yebQ@mail.gmail.com>
Subject: Re: [PATCH 41/41] mm: replace rw_semaphore with atomic_t in vma_lock
To: Jann Horn <jannh@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, Matthew Wilcox <willy@infradead.org>, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@te
 chsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 11:00 AM Jann Horn <jannh@google.com> wrote:
>
> On Tue, Jan 17, 2023 at 7:55 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > On Tue, Jan 17, 2023 at 10:47 AM Matthew Wilcox <willy@infradead.org> wrote:
> > >
> > > On Tue, Jan 17, 2023 at 10:36:42AM -0800, Suren Baghdasaryan wrote:
> > > > On Tue, Jan 17, 2023 at 10:31 AM Matthew Wilcox <willy@infradead.org> wrote:
> > > > >
> > > > > On Tue, Jan 17, 2023 at 10:26:32AM -0800, Suren Baghdasaryan wrote:
> > > > > > On Tue, Jan 17, 2023 at 10:12 AM Jann Horn <jannh@google.com> wrote:
> > > > > > >
> > > > > > > On Mon, Jan 9, 2023 at 9:55 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > > > > > > > rw_semaphore is a sizable structure of 40 bytes and consumes
> > > > > > > > considerable space for each vm_area_struct. However vma_lock has
> > > > > > > > two important specifics which can be used to replace rw_semaphore
> > > > > > > > with a simpler structure:
> > > > > > > [...]
> > > > > > > >  static inline void vma_read_unlock(struct vm_area_struct *vma)
> > > > > > > >  {
> > > > > > > > -       up_read(&vma->vm_lock->lock);
> > > > > > > > +       if (atomic_dec_and_test(&vma->vm_lock->count))
> > > > > > > > +               wake_up(&vma->vm_mm->vma_writer_wait);
> > > > > > > >  }
> > > > > > >
> > > > > > > I haven't properly reviewed this, but this bit looks like a
> > > > > > > use-after-free because you're accessing the vma after dropping your
> > > > > > > reference on it. You'd have to first look up the vma->vm_mm, then do
> > > > > > > the atomic_dec_and_test(), and afterwards do the wake_up() without
> > > > > > > touching the vma. Or alternatively wrap the whole thing in an RCU
> > > > > > > read-side critical section if the VMA is freed with RCU delay.
> > > > > >
> > > > > > vm_lock->count does not control the lifetime of the VMA, it's a
> > > > > > counter of how many readers took the lock or it's negative if the lock
> > > > > > is write-locked.
> > > > >
> > > > > Yes, but ...
> > > > >
> > > > >         Task A:
> > > > >         atomic_dec_and_test(&vma->vm_lock->count)
> > > > >                         Task B:
> > > > >                         munmap()
> > > > >                         write lock
> > > > >                         free VMA
> > > > >                         synchronize_rcu()
> > > > >                         VMA is really freed
> > > > >         wake_up(&vma->vm_mm->vma_writer_wait);
> > > > >
> > > > > ... vma is freed.
> > > > >
> > > > > Now, I think this doesn't occur.  I'm pretty sure that every caller of
> > > > > vma_read_unlock() is holding the RCU read lock.  But maybe we should
> > > > > have that assertion?
> > > >
> > > > Yep, that's what this patch is doing
> > > > https://lore.kernel.org/all/20230109205336.3665937-27-surenb@google.com/
> > > > by calling vma_assert_no_reader() from __vm_area_free().
> > >
> > > That's not enough though.  Task A still has a pointer to vma after it
> > > has called atomic_dec_and_test(), even after vma has been freed by
> > > Task B, and before Task A dereferences vma->vm_mm.
> >
> > Ah, I see your point now. I guess I'll have to store vma->vm_mm in a
> > local variable and call mmgrab() before atomic_dec_and_test(), then
> > use it in wake_up() and call mmdrop(). Is that what you are thinking?
>
> You shouldn't need mmgrab()/mmdrop(), because whoever is calling you
> for page fault handling must be keeping the mm_struct alive.

Good point. Will update in the next revision to store mm before
dropping the count. Thanks for all the comments folks!
