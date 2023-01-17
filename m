Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D809670BB0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 23:34:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxNwk1Tcdz3c6n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 09:34:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WXapkaaU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WXapkaaU;
	dkim-atps=neutral
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxNvm5Xz5z2ym7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 09:33:23 +1100 (AEDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-4d13cb4bbffso323404437b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 14:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l6Pu7+4aPnAnLv5bWCRJUVspIRgH9CCgCfRjxyIMzEU=;
        b=WXapkaaU4Iq6lFD3/jgzkfqjRX6r4ZbOdG53AqnSWkJqcj+NABq+nFQQ97h3/iDE4W
         Za0ialnTuq4r2yl1WpFAAX2CMaDZ9tJyVM1HDZmoCBeJpFIJUuVXTFCHRRFAc3POaO1X
         y1PPSFI4MOlhK4eGFhPMSua/cuf4D+PEZjgBkV413b3KBeTpOuLyAIsaZKslzIbmFUMe
         k7vQoybQvOGIqXEwEFhsURvnlRThGcGKTRI8uwhgN9T+niHiObTfbgU32joQ07OrF3k1
         kOpzjvFCBeIneShTfDzdhfIhRUdsEtGGvd2zanDGDf1gk/nIkJI9tGKmQ4HePeYjEUfm
         ACMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6Pu7+4aPnAnLv5bWCRJUVspIRgH9CCgCfRjxyIMzEU=;
        b=AVHiyVuKL6setGC5iOtBO+7KV26TWpbS5WKx5YV//lGpbPTtptjEcweN6sdTIBnIMa
         5FYeUMFI4XjORRkdevz98WxFh7NXEnRY0Bw3wHC8IYHtWsW/1+rR8fSeBi9GiYthId04
         eCGXFJVTVBuuHBakIU8Gr6iW4Yjtifg0aY2QE1q9uBGRxbAoVZOHDAFBJ/b2Py87m7gU
         IGYFeuTh907pEzhBDrBPezXI1PaipnGmTfKcAuTAcBaE0AZPB0pFc1Qu+5w5U1DV7aqB
         6hafvL85YyZ/j4oNCGEvjn/1sZlR0YvXkHQuTMHZlCT1g2MKIq0UxEEbGxZhcY3eNX17
         Hnxw==
X-Gm-Message-State: AFqh2kr+172EvGpDUg/zYJt1VYDE0dUgb2JK1qWTwHkiW4uIvdHvWMO6
	u2Anfquu+241WEulzg2gvHe3+IXGc+n5JDOyNsbGZQ==
X-Google-Smtp-Source: AMrXdXtPEWGhfFtAZyaB6FCmy/ElQF0QS8mVbjf/1PWGddpXj66ZQtHOzMYnavA7o2Coxw4Jydy4LOOdnf1j6/Ecn7I=
X-Received: by 2002:a0d:d484:0:b0:4dc:4113:f224 with SMTP id
 w126-20020a0dd484000000b004dc4113f224mr688104ywd.455.1673994799864; Tue, 17
 Jan 2023 14:33:19 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-13-surenb@google.com>
 <Y8a4+bV1dYNAiUkD@dhcp22.suse.cz> <Y8a66gshQkkhC1cT@dhcp22.suse.cz>
 <CAJuCfpF2ciMbMFgqa4GqYqg8zjpnmBoNZDG23V0+w017LXeU3w@mail.gmail.com> <Y8cZMt01Z1FvVFXh@casper.infradead.org>
In-Reply-To: <Y8cZMt01Z1FvVFXh@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Jan 2023 14:33:08 -0800
Message-ID: <CAJuCfpEV_-=19KWqXvYO4-VgUDwgpkT2xDC4zTZ-XS4iaSH=Qw@mail.gmail.com>
Subject: Re: [PATCH 12/41] mm: add per-VMA lock and helper functions to
 control it
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, Michal Hocko <mhocko@suse.com>, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsin
 gularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 1:54 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Jan 17, 2023 at 01:21:47PM -0800, Suren Baghdasaryan wrote:
> > On Tue, Jan 17, 2023 at 7:12 AM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Tue 17-01-23 16:04:26, Michal Hocko wrote:
> > > > On Mon 09-01-23 12:53:07, Suren Baghdasaryan wrote:
> > > > > Introduce a per-VMA rw_semaphore to be used during page fault handling
> > > > > instead of mmap_lock. Because there are cases when multiple VMAs need
> > > > > to be exclusively locked during VMA tree modifications, instead of the
> > > > > usual lock/unlock patter we mark a VMA as locked by taking per-VMA lock
> > > > > exclusively and setting vma->lock_seq to the current mm->lock_seq. When
> > > > > mmap_write_lock holder is done with all modifications and drops mmap_lock,
> > > > > it will increment mm->lock_seq, effectively unlocking all VMAs marked as
> > > > > locked.
> > > >
> > > > I have to say I was struggling a bit with the above and only understood
> > > > what you mean by reading the patch several times. I would phrase it like
> > > > this (feel free to use if you consider this to be an improvement).
> > > >
> > > > Introduce a per-VMA rw_semaphore. The lock implementation relies on a
> > > > per-vma and per-mm sequence counters to note exclusive locking:
> > > >         - read lock - (implemented by vma_read_trylock) requires the the
> > > >           vma (vm_lock_seq) and mm (mm_lock_seq) sequence counters to
> > > >           differ. If they match then there must be a vma exclusive lock
> > > >           held somewhere.
> > > >         - read unlock - (implemented by vma_read_unlock) is a trivial
> > > >           vma->lock unlock.
> > > >         - write lock - (vma_write_lock) requires the mmap_lock to be
> > > >           held exclusively and the current mm counter is noted to the vma
> > > >           side. This will allow multiple vmas to be locked under a single
> > > >           mmap_lock write lock (e.g. during vma merging). The vma counter
> > > >           is modified under exclusive vma lock.
> > >
> > > Didn't realize one more thing.
> > >             Unlike standard write lock this implementation allows to be
> > >             called multiple times under a single mmap_lock. In a sense
> > >             it is more of mark_vma_potentially_modified than a lock.
> >
> > In the RFC it was called vma_mark_locked() originally and renames were
> > discussed in the email thread ending here:
> > https://lore.kernel.org/all/621612d7-c537-3971-9520-a3dec7b43cb4@suse.cz/.
> > If other names are preferable I'm open to changing them.
>
> I don't want to bikeshed this, but rather than locking it seems to be
> more:
>
>         vma_start_read()
>         vma_end_read()
>         vma_start_write()
>         vma_end_write()
>         vma_downgrade_write()

Couple corrections, we would have to have vma_start_tryread() and
vma_end_write_all(). Also there is no vma_downgrade_write().
mmap_write_downgrade() simply does vma_end_write_all().

>
> ... and that these are _implemented_ with locks (in part) is an
> implementation detail?
>
> Would that reduce people's confusion?
>
> > >
> > > >         - write unlock - (vma_write_unlock_mm) is a batch release of all
> > > >           vma locks held. It doesn't pair with a specific
> > > >           vma_write_lock! It is done before exclusive mmap_lock is
> > > >           released by incrementing mm sequence counter (mm_lock_seq).
> > > >       - write downgrade - if the mmap_lock is downgraded to the read
> > > >         lock all vma write locks are released as well (effectivelly
> > > >         same as write unlock).
> > > --
> > > Michal Hocko
> > > SUSE Labs
