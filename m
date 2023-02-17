Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD21069AFD7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 16:55:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJGbw5nZnz3fQW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 02:55:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=b3DiNrjl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=b3DiNrjl;
	dkim-atps=neutral
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJGb15YkKz3fHD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 02:54:20 +1100 (AEDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-53657970423so15258947b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 07:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lH86Zid2dZm5bnTlKuYHBL+UBFHGqixgoyFrzinN6Ms=;
        b=b3DiNrjlfqW1fEnQXBFb6r3/6ssYOYFmb07YdJ57aCoZgGF7z0cSlFp6LNvq0nlO9T
         h7MQwVLJHgbKiFwZZnwcEW43LlrllCq4xINr3/5ByMHFSkzVTwD0ec1uud4lk2QUxJJf
         S69FzFOpllxouNLN8H3PgzXaSkTdVhd46LsGMpHYh5L5MOJ97JDTrRU8MUhBzY/9ZNNz
         GtpgFyxBGBNhqKcVmCB7lXv7APqJKgNWYk+cgBG24fA+uR7dIeiMyU1HboAIFZEnBPuP
         ozgg4fNv6nMmWSBGnpWjhn36QNV5wp5RLqFu4rS04Uz2NPVfLutpOQHPA8Ea49wLkew+
         ljYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lH86Zid2dZm5bnTlKuYHBL+UBFHGqixgoyFrzinN6Ms=;
        b=aMPhHLbz3hUdx1/wBpLQ51Eo6qufeMKq5AhmnsN7XWAGp8LQJ+wtTUpKmuz7z2+pwU
         uV71IlDE3YgIlTamylX27oqrwSVDd1kygEsqnd1/JAFm5n0AsXCZPZ8kznC4sdUQwBex
         1lIcZWroIfgsxwzuAfYd2ji0jlLa1UHyR1zYWMLxnqdSLPAo+Mp7k1sbB3S1Siw3qCDy
         yDZMKSFGNGK+b3VZ5acckf6s37qsGm8opZ/o+sIm1KC4BUMkLgpnEaJsM4CWLLcDOwps
         Ml3kGmYMBKJkw5e7zt5WP+yW4ACe9r+jIdEZMYHEF3sIuEuKLxQLqWOWI3caLbiYSzSC
         5IGw==
X-Gm-Message-State: AO0yUKUFb1G7ZHPoflsiZWYIlwgDZYnjtPG+rVaw+uo4loRoi4P9j04+
	nr6ZSO/5ysmwP6dwi6qxaaIGX4GNuatuoMG9jevJOQ==
X-Google-Smtp-Source: AK7set8xo9es7N+pYGqxpm5ZGXh1uiEPHw0Au1RV6e1ob6blTwBLvHlxWY896OShiLQCNh8oO9NcmsY5tue+lwdwTZ8=
X-Received: by 2002:a05:690c:c90:b0:52f:184a:da09 with SMTP id
 cm16-20020a05690c0c9000b0052f184ada09mr323598ywb.2.1676649255794; Fri, 17 Feb
 2023 07:54:15 -0800 (PST)
MIME-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com> <20230216051750.3125598-22-surenb@google.com>
 <20230216153405.zo4l2lqpnc2agdzg@revolver> <CAJuCfpEkujbHNxNWcWr8bmrsMhXGcpDyraOfQaPAcOH=RQPv5A@mail.gmail.com>
 <20230217145052.y526nmjudi6t2ael@revolver>
In-Reply-To: <20230217145052.y526nmjudi6t2ael@revolver>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 17 Feb 2023 07:54:04 -0800
Message-ID: <CAJuCfpHJeO6L3HnsX8X=XwBSDbXfPubsWXcRdhm5SvT_u+doKg@mail.gmail.com>
Subject: Re: [PATCH v3 21/35] mm/mmap: write-lock adjacent VMAs if they can
 grow into unmapped area
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	akpm@linux-foundation.org, michel@lespinasse.org, jglisse@google.com, 
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, 
	mgorman@techsingularity.net, dave@stgolabs.net, willy@infradead.org, 
	peterz@infradead.org, ldufour@linux.ibm.com, paulmck@kernel.org, 
	mingo@redhat.com, will@kernel.org, luto@kernel.org, songliubraving@fb.com, 
	peterx@redhat.com, david@redhat.com, dhowells@redhat.com, hughd@google.com, 
	bigeasy@linutronix.de, kent.overstreet@linux.dev, punit.agrawal@bytedance.com, 
	lstoakes@gmail.com, peterjung1337@gmail.com, rientjes@google.com, 
	chriscli@google.com, axelrasmussen@google.com, joelaf@google.com, 
	minchan@google.com, rppt@kernel.org, jannh@google.com, shakeelb@google.com, 
	tatashin@google.com, edumazet@google.com, gthelen@google.com, 
	gurua@google.com, arjunroy@google.com, soheil@google.com, leewalsh@google.com, 
	posk@google.com, michalechner92@googlemail.com, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, kernel-team@android.com
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 17, 2023 at 6:51 AM Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
>
> * Suren Baghdasaryan <surenb@google.com> [230216 14:36]:
> > On Thu, Feb 16, 2023 at 7:34 AM Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> > >
> > >
> > > First, sorry I didn't see this before v3..
> >
> > Feedback at any time is highly appreciated!
> >
> > >
> > > * Suren Baghdasaryan <surenb@google.com> [230216 00:18]:
> > > > While unmapping VMAs, adjacent VMAs might be able to grow into the area
> > > > being unmapped. In such cases write-lock adjacent VMAs to prevent this
> > > > growth.
> > > >
> > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > ---
> > > >  mm/mmap.c | 8 +++++---
> > > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > > index 118b2246bba9..00f8c5798936 100644
> > > > --- a/mm/mmap.c
> > > > +++ b/mm/mmap.c
> > > > @@ -2399,11 +2399,13 @@ do_vmi_align_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
> > > >        * down_read(mmap_lock) and collide with the VMA we are about to unmap.
> > > >        */
> > > >       if (downgrade) {
> > > > -             if (next && (next->vm_flags & VM_GROWSDOWN))
> > > > +             if (next && (next->vm_flags & VM_GROWSDOWN)) {
> > > > +                     vma_start_write(next);
> > > >                       downgrade = false;
> > >
> > > If the mmap write lock is insufficient to protect us from next/prev
> > > modifications then we need to move *most* of this block above the maple
> > > tree write operation, otherwise we have a race here.  When I say most, I
> > > mean everything besides the call to mmap_write_downgrade() needs to be
> > > moved.
> >
> > Which prior maple tree write operation are you referring to? I see
> > __split_vma() and munmap_sidetree() which both already lock the VMAs
> > they operate on, so page faults can't happen in those VMAs.
>
> The write that removes the VMAs from the maple tree a few lines above..
> /* Point of no return */
>
> If the mmap lock is not sufficient, then we need to move the
> vma_start_write() of prev/next to above the call to
> vma_iter_clear_gfp() in do_vmi_align_munmap().
>
> But I still think it IS enough.
>
> >
> > >
> > > If the mmap write lock is sufficient to protect us from next/prev
> > > modifications then we don't need to write lock the vmas themselves.
> >
> > mmap write lock is not sufficient because with per-VMA locks we do not
> > take mmap lock at all.
>
> Understood, but it also does not expand VMAs.
>
> >
> > >
> > > I believe this is for expand_stack() protection, so I believe it's okay
> > > to not vma write lock these vmas.. I don't think there are other areas
> > > where we can modify the vmas without holding the mmap lock, but others
> > > on the CC list please chime in if I've forgotten something.
> > >
> > > So, if I am correct, then you shouldn't lock next/prev and allow the
> > > vma locking fault method on these vmas.  This will work because
> > > lock_vma_under_rcu() uses mas_walk() on the faulting address.  That is,
> > > your lock_vma_under_rcu() will fail to find anything that needs to be
> > > grown and go back to mmap lock protection.  As it is written today, the
> > > vma locking fault handler will fail and we will wait for the mmap lock
> > > to be released even when the vma isn't going to expand.
> >
> > So, let's consider a case when the next VMA is not being removed (so
> > it was neither removed nor locked by munmap_sidetree()) and it is
> > found by lock_vma_under_rcu() in the page fault handling path.
>
> By this point next VMA is either NULL or outside the munmap area, so
> what you said here is always true.
>
> >Page
> > fault handler can now expand it and push into the area we are
> > unmapping in unmap_region(). That is the race I'm trying to prevent
> > here by locking the next/prev VMAs which can be expanded before
> > unmap_region() unmaps them. Am I missing something?
>
> Yes, I think the part you are missing (or I am missing..) is that
> expand_stack() will never be called without the mmap lock.  We don't use
> the vma locking to expand the stack.

Ah, yes, you are absolutely right. I missed that when the VMA explands
as a result of a page fault, lock_vma_under_rcu() can't find the
faulting VMA (the fault is outside of the area and hence the need to
expand) and will fall back to mmap read locking. Since
do_vmi_align_munmap() holds the mmap write lock and does not downgrade
it, the race will be avoided and expansion will wait until we drop the
mmap write lock.
Good catch Liam! We can drop this patch completely from the series.
Thanks,
Suren.

>
> ...
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
