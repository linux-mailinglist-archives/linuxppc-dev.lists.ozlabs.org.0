Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9E866E62E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 19:37:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxHgc2nQyz3fBY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 05:37:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hdtpgggm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com; envelope-from=jannh@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hdtpgggm;
	dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxHfj6s6Hz3cdB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 05:36:45 +1100 (AEDT)
Received: by mail-io1-xd31.google.com with SMTP id r71so6336834iod.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 10:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jj3U7X8MKNKls/ApV8M/SIHb1JIZAnMiTroClnO0tIA=;
        b=hdtpgggmeza9Z3pLGAnK9eWNRXRJ8TuOMpGGF8K/Ox2wLV+5aJK/pkS6I3WCDgcd1w
         cznonG/IHQEkdT4zLXwgi/XwivWOA7xaKUkD0ALnxDSc5zCmIpzCzUPk7akauP5ckopU
         crdQLpL4Vr0IVV/WwRoT4uWiQ9hBDyVeELqlF8FMmOsEdlYEj5g0Q771x/Cx3u8tZqX9
         TEXAX7OWsom5ymUdM/T9wOReXyCQkLnYkT3qKAvu6JiYDLBNZtewDyPRH3r444BsByVZ
         lHoUoSdJtGorfD8w3TrWg2anPLMdnJ2U+fGfyJE2XZjfcvVnx6fIzUPuqKDopozwtpui
         KL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jj3U7X8MKNKls/ApV8M/SIHb1JIZAnMiTroClnO0tIA=;
        b=mViMSsMJfr8j6rroYVLoJIR6bjmmuK2u8D55mWHvnNcey8IIIjqsYKD0GbpmU4djHb
         5uYwLg/RmMgjyScFlAt61V/7kZMOcE/bTxIlonOvxgUYc7XULbRxUHS6b/aXz1O9uf1o
         ELrGlqXSlvKR9I/G0VZc9S2RaWCDuxoNEl6LyrWNB5UR8GktCE28Lgg1scSjQdY3UHwr
         b+npScg6rtAyVLa33QCZ/sPNfib9VkAH8EgDRXB8P1jUNR9zqR702MYqzFvk0nta54g6
         WjOrh8kwWvS8x0JIcekeffTQPu8C632YO/77YnM6WsGnz8hIAEzTArEfY38BOfbUargF
         59PQ==
X-Gm-Message-State: AFqh2kqBl1nKnrIDN7abdJGp7UsLgkslDamjPIUzzZUp4lv754rxMnxO
	hZTP+VjPCjfuHTa5mdSIaWAxOJd6HWw8JGTNewEfXg==
X-Google-Smtp-Source: AMrXdXvCH+b5CERll6lmutHDNNFVayFzrE8mxmTDaMWhbUfTorpT1Hz8BgbCIPElX7EZcrJh5yYvliMsy3/p4P0XO8Q=
X-Received: by 2002:a02:c884:0:b0:39e:9d33:a47 with SMTP id
 m4-20020a02c884000000b0039e9d330a47mr271546jao.58.1673980603471; Tue, 17 Jan
 2023 10:36:43 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-42-surenb@google.com>
 <CAG48ez3ZNt+B3XvAMP1OaeEYuwpXJ1epmT9YtNonFLEJ6yANVQ@mail.gmail.com>
 <CAJuCfpFruHecz9NssGGFrG-RqbJFHCfRuZ7c6GbTBD4x4AU8aA@mail.gmail.com> <Y8bpfzYvWq/3ttr+@casper.infradead.org>
In-Reply-To: <Y8bpfzYvWq/3ttr+@casper.infradead.org>
From: Jann Horn <jannh@google.com>
Date: Tue, 17 Jan 2023 19:36:07 +0100
Message-ID: <CAG48ez0ScQMc_5Ch-d63pX4vT6L7=peQjnpneooGcXfyddXc8A@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@
 techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 7:31 PM Matthew Wilcox <willy@infradead.org> wrote:
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

I don't see that. When do_user_addr_fault() is calling
vma_read_unlock(), there's no RCU read lock held, right?
