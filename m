Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 364DE66E66F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 19:50:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxHyr0h38z3cdd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 05:50:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=p5fs5mLS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=p5fs5mLS;
	dkim-atps=neutral
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxHxs3MZWz3c6X
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 05:49:52 +1100 (AEDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-4bf16baa865so434721377b3.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 10:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iz0GQ7/w+mu6oDV5bKCsXpIO0gDrI/zJCZBxc6dizOg=;
        b=p5fs5mLSVpER0JzqnFPms6ksIHjMhLnm0fGre8E+U/jXlE/W8pYmcWl5PGr886PDTB
         CCtdYmfgkYM4JMRjESQanIWyjIXlWHd/PxJFHITaVdlfn58FQ+NW2Zko5H4cXnDNBWke
         B565WEhHRxl6a6x1P63VIIsrRmgO45GgxGY3ttWlZkSOOq/tHi+ZkQ7B774p7YBhqesy
         u9cHULCi5YYM0ERasMFJ406wprrlp7om3hAtpCSPuwVEYfi6fMljV2/XAdpKw5OWsFJm
         yhC71JdRdTRRBJm9wugmwnlk8Z9bibkosJiO3CiDBD5UQ4mwnK82JkF8Too4UeebtXG7
         Ckmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iz0GQ7/w+mu6oDV5bKCsXpIO0gDrI/zJCZBxc6dizOg=;
        b=QpAtx0cQP64zq9HiwUmSToXOINf7v8k8RZM1SWjYdJKzMJDGdxgbZ//GXAxaY2jYw5
         8CHThjwrpJhR2vpHVnO7nNaaPL89y265XnxU4Q+yysHTPNt52HZ4FinVDT/iJ/m6rMhk
         UpPgjdJ5dujgH0YbPxQZ1nOdQGArPC2QDdpqY373ryLbaAR6VMjBSge5I6OtdvRB3fz6
         v8T2DV9RFJKBmAoj7Fq7TXvZ3p1tgsHeWT7CundDX/kTv42wXYZxl5Vbr1vd1IKLBdc2
         8VxPcWR6qtKDxAPEGVq7s7AgL1796k2G2xz1KsQTfIR53solRWjDwLMHjLAICTIulUSi
         8KDA==
X-Gm-Message-State: AFqh2kqHWWrSUz0P25OQ3n7Tiep27SPVTgFmJTZ05pYcMIVKas0snWdM
	1OCRoK8pl3asrPHNX9x85jlecZf/iIprhV22O8eLrw==
X-Google-Smtp-Source: AMrXdXvI+MOkNBHOikckkXfQawDP5Ir9tQ5z55WvACj8+QlkWO3+VNjLWrjFnu2fznZ7jncOPRR0JlSu1xdrpp+UO5Y=
X-Received: by 2002:a81:784c:0:b0:4e1:5013:6da1 with SMTP id
 t73-20020a81784c000000b004e150136da1mr617572ywc.218.1673981388803; Tue, 17
 Jan 2023 10:49:48 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-42-surenb@google.com>
 <CAG48ez3ZNt+B3XvAMP1OaeEYuwpXJ1epmT9YtNonFLEJ6yANVQ@mail.gmail.com>
 <CAJuCfpFruHecz9NssGGFrG-RqbJFHCfRuZ7c6GbTBD4x4AU8aA@mail.gmail.com>
 <Y8bpfzYvWq/3ttr+@casper.infradead.org> <CAG48ez0ScQMc_5Ch-d63pX4vT6L7=peQjnpneooGcXfyddXc8A@mail.gmail.com>
In-Reply-To: <CAG48ez0ScQMc_5Ch-d63pX4vT6L7=peQjnpneooGcXfyddXc8A@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Jan 2023 10:49:37 -0800
Message-ID: <CAJuCfpF3R_cggziBkfsccmgSoQoF3mqppov67jpBhtpStyhyTQ@mail.gmail.com>
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

On Tue, Jan 17, 2023 at 10:36 AM Jann Horn <jannh@google.com> wrote:
>
> On Tue, Jan 17, 2023 at 7:31 PM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Tue, Jan 17, 2023 at 10:26:32AM -0800, Suren Baghdasaryan wrote:
> > > On Tue, Jan 17, 2023 at 10:12 AM Jann Horn <jannh@google.com> wrote:
> > > >
> > > > On Mon, Jan 9, 2023 at 9:55 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > > > > rw_semaphore is a sizable structure of 40 bytes and consumes
> > > > > considerable space for each vm_area_struct. However vma_lock has
> > > > > two important specifics which can be used to replace rw_semaphore
> > > > > with a simpler structure:
> > > > [...]
> > > > >  static inline void vma_read_unlock(struct vm_area_struct *vma)
> > > > >  {
> > > > > -       up_read(&vma->vm_lock->lock);
> > > > > +       if (atomic_dec_and_test(&vma->vm_lock->count))
> > > > > +               wake_up(&vma->vm_mm->vma_writer_wait);
> > > > >  }
> > > >
> > > > I haven't properly reviewed this, but this bit looks like a
> > > > use-after-free because you're accessing the vma after dropping your
> > > > reference on it. You'd have to first look up the vma->vm_mm, then do
> > > > the atomic_dec_and_test(), and afterwards do the wake_up() without
> > > > touching the vma. Or alternatively wrap the whole thing in an RCU
> > > > read-side critical section if the VMA is freed with RCU delay.
> > >
> > > vm_lock->count does not control the lifetime of the VMA, it's a
> > > counter of how many readers took the lock or it's negative if the lock
> > > is write-locked.
> >
> > Yes, but ...
> >
> >         Task A:
> >         atomic_dec_and_test(&vma->vm_lock->count)
> >                         Task B:
> >                         munmap()
> >                         write lock
> >                         free VMA
> >                         synchronize_rcu()
> >                         VMA is really freed
> >         wake_up(&vma->vm_mm->vma_writer_wait);
> >
> > ... vma is freed.
> >
> > Now, I think this doesn't occur.  I'm pretty sure that every caller of
> > vma_read_unlock() is holding the RCU read lock.  But maybe we should
> > have that assertion?
>
> I don't see that. When do_user_addr_fault() is calling
> vma_read_unlock(), there's no RCU read lock held, right?

We free VMAs using call_rcu() after removing them from VMA tree. OTOH
page fault handlers are searching for VMAs from inside RCU read
section and calling vma_read_unlock() from there, see
https://lore.kernel.org/all/20230109205336.3665937-29-surenb@google.com/.
Once we take the VMA read-lock, it ensures that it can't be
write-locked and if someone is destroying or isolating the VMA, it
needs to write-lock it first.
