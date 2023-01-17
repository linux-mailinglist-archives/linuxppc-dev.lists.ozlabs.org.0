Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C0E66E80E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 21:58:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxLpj66Xxz3fBw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 07:58:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UJW1FUoX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UJW1FUoX;
	dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxLnk3fRqz3cDT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 07:58:01 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id 203so35666015yby.10
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 12:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nNX5YwNB62Cr4mPdPksUy7ZFxJz80e5EP+vDe3CToes=;
        b=UJW1FUoXBMJDeWsaN1k6oDrmr67QWLZqnIBJQh4PRlEesBk3tMiIkorIvA8FJBfO3J
         2yfftCQymRobA0fqZ3eS51nFr5UzM2Cq8hseu0uwO24QqY6pttuPkfNz3B0D2bM+8cQJ
         hrr8t4f0iV2D0N+JFF6eJ9UdDbJAw07cN0sEOCaUwAveqe9Qasg0WIQ4AQvZjbCNFRFf
         n7ADIVjMgqK9ddiVy7LpnVId2Ph4+X+JMGhSvCvPPeRbvgwz5zXyZeESZBnXaszCtyKP
         AM4f/andSFYwbNHDumyMa1HT7RMe/o5/qOtc+sxFbvcQj4VZud5TTfMFUGXr1wMMcRtQ
         Yriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNX5YwNB62Cr4mPdPksUy7ZFxJz80e5EP+vDe3CToes=;
        b=EBthDQJGlK92/A8C39nPfDf3knUxx5K8bqz5bM0S75MpNfYRA6JI80g3bTxgjexpcd
         RchYYC08rejOrywi0Ovw2VvdzfXmOpiW3uaY7PIp3pbaJuinzCjgs0Zv7AS97gxYGEdE
         cSwCYSCXUBRt1m0OArX30rKNCWSD1Z38/cqW85qFca+5WtSsaJk6lk757Wq8WoaC4RYT
         47ilEoiR2ktFwBgD97w8UberzG4/w4fVv/7ZsyLTTtBiBLAQbMvO6TrvxQ8oEQWmt91u
         pnmHwAoLzJb9gTm69atHSwpXCnC6iy6rEwblkdp0WVHRLwOwv8UrGbS2RscWDpArFynO
         LMog==
X-Gm-Message-State: AFqh2kp8ChXg6eov+YEaSyMDIlol5vgRAGp6zPqPy6LropOkcIpP7IIH
	O+UhLZ4/YXF68jeARq7J8PLFHCmVvymKcPQphnNuEw==
X-Google-Smtp-Source: AMrXdXs706D7/Bu5iVfntQjoEJSNf8iye2tX48bplVHdlFbOfH7GJJD8B26WAHLzz8/nxZjbM/p4TlPO6wtoFHaiJ6w=
X-Received: by 2002:a25:ceca:0:b0:7e4:115c:9cf6 with SMTP id
 x193-20020a25ceca000000b007e4115c9cf6mr586280ybe.316.1673989078773; Tue, 17
 Jan 2023 12:57:58 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-33-surenb@google.com>
 <CAG48ez0Z-wnBLzCNDHgTviV0Ws+s4grX-sFRZ-43dxhJg+GzfA@mail.gmail.com> <CAG48ez1J2YC=_wu82p1BCgR+igd3aF_rwi5WmLJX9MjYM-BUsw@mail.gmail.com>
In-Reply-To: <CAG48ez1J2YC=_wu82p1BCgR+igd3aF_rwi5WmLJX9MjYM-BUsw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Jan 2023 12:57:47 -0800
Message-ID: <CAJuCfpHfJaowYqz9Ls-S_FwR1JUOsZ1XPwvj6m-CVUnFX_us6Q@mail.gmail.com>
Subject: Re: [PATCH 32/41] mm: prevent userfaults to be handled under per-vma lock
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 12:36 PM Jann Horn <jannh@google.com> wrote:
>
> On Tue, Jan 17, 2023 at 8:51 PM Jann Horn <jannh@google.com> wrote:
> > On Mon, Jan 9, 2023 at 9:55 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > > Due to the possibility of handle_userfault dropping mmap_lock, avoid fault
> > > handling under VMA lock and retry holding mmap_lock. This can be handled
> > > more gracefully in the future.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > Suggested-by: Peter Xu <peterx@redhat.com>
> > > ---
> > >  mm/memory.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/mm/memory.c b/mm/memory.c
> > > index 20806bc8b4eb..12508f4d845a 100644
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -5273,6 +5273,13 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> > >         if (!vma->anon_vma)
> > >                 goto inval;
> > >
> > > +       /*
> > > +        * Due to the possibility of userfault handler dropping mmap_lock, avoid
> > > +        * it for now and fall back to page fault handling under mmap_lock.
> > > +        */
> > > +       if (userfaultfd_armed(vma))
> > > +               goto inval;
> >
> > This looks racy wrt concurrent userfaultfd_register(). I think you'll
> > want to do the userfaultfd_armed(vma) check _after_ locking the VMA,
>
> I still think this change is needed...

Yes, I think you are right. I'll move the check after locking the VMA. Thanks!

>
> > and ensure that the userfaultfd code write-locks the VMA before
> > changing the __VM_UFFD_FLAGS in vma->vm_flags.
>
> Ah, but now I see you already took care of this half of the issue with
> the reset_vm_flags() change in
> https://lore.kernel.org/linux-mm/20230109205336.3665937-16-surenb@google.com/
> .
>
>
> > >         if (!vma_read_trylock(vma))
> > >                 goto inval;
> > >
> > > --
> > > 2.39.0
> > >
