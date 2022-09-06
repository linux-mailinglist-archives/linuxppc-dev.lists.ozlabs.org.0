Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 777FB5AEF3F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 17:47:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMVBY3BDFz3c2s
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 01:47:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=o7ZUoR1k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=o7ZUoR1k;
	dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMV9x2NCfz2yp5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 01:46:44 +1000 (AEST)
Received: by mail-io1-xd33.google.com with SMTP id 62so9244330iov.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Sep 2022 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=01CsnEEQfLK1uOpVQ+HH6686vEI9WQZhnhn7tltGMc4=;
        b=o7ZUoR1kIbCZSNNyLbvrwwtPxnTYEllaZY9cFNDDCCA7TAcp0hkIs2NMKLazX0j/Wb
         AWxxBk+k5G23dVl64yevMX+VdSw/FzkljOCmS/xASd595atoUnaTjkJmrmR9WjiCsxKE
         VuyYGhKnfagDzQZ6sGO0kr/wninknslufsnoLThmyJZSuYTU38KSG2qsTZT0WtI8/TFp
         LX/qK2c50VdG2SVsnEj1+xTC+UMWubZMyMO7uNilERQu9uv4D2aQqwP7+M8bGR8KWyFm
         OnnkvtEInWpmkIYk4qBKTNg02wGwVlJLJMtpY5HIQ1/Z8WKMbLgAbK2PJvysrvsqnBR+
         epoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=01CsnEEQfLK1uOpVQ+HH6686vEI9WQZhnhn7tltGMc4=;
        b=WxJiPDcAiyUEWPQvaNBvp5e6eEdcMnw4L1csP3R//WylSZe+J5UCvsCJe/0elKdnjD
         m77/iTK/bJE5pK3jypq5lcyZdRE7xJL6vC7X5ZFq6WVNjGxBjNtgqzJ2wiG6X06d9OK4
         PJ3fliCrT2sGezgy/bl21RGE0LUca9FEF/eSnB83cC0rAdV4j3f25EyPG+JPPKY1u2CS
         X5CAAxj0HbdAC3FTD2xD7qS4uLyYXLEW4rDg6d+S5EDhtrS4aI5bgGhm2pW5na5Py3mu
         OBF4nq5s1Tx4tafcFhW/zxxXzpVZULjG9AabH+7VfAjVV2h9lCI4E2qsMZol1UQ6dvIJ
         Z5VA==
X-Gm-Message-State: ACgBeo2JGgyM2UwvpCbHx4hniIaiMu3/sqwwYgeJn7jhxSgHIbUG37oh
	+G2sD+9F2LfAX+zAzogKzPaB77TudeuwfNDN1qcCVg==
X-Google-Smtp-Source: AA6agR4npg7xYhO3jV9bPgCe/qZLaBiwpkb5NlSVTaZJNdUAJnVvwtlRJpA1bjafBWAWUuAzLEiUFw/4MgDT30cQhzs=
X-Received: by 2002:a05:6638:1492:b0:34c:d42:ac2f with SMTP id
 j18-20020a056638149200b0034c0d42ac2fmr16182031jak.305.1662479199238; Tue, 06
 Sep 2022 08:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <YxXsQKoQ0URIRuKi@dhcp22.suse.cz>
 <CAJuCfpG3bMLzNhP5wt8my8j7_9wW=darLegd6WPV6tddtCKGAA@mail.gmail.com> <20220905203503.tqtr36fsfg4guk4j@moria.home.lan>
In-Reply-To: <20220905203503.tqtr36fsfg4guk4j@moria.home.lan>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 6 Sep 2022 08:46:28 -0700
Message-ID: <CAJuCfpF+mmDSsUT87HmXNhpoN=dzpxxx6S9RF8H6uz12hc2bJg@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 00/28] per-VMA locks proposal
To: Kent Overstreet <kent.overstreet@linux.dev>
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
Cc: Michel Lespinasse <michel@lespinasse.org>, Joel Fernandes <joelaf@google.com>, Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Xu <peterx@redhat.com>, dhowells@redhat.com, linux-mm <linux-mm@kvack.org>, Jerome Glisse <jglisse@google.com>, Davidlohr Bueso <dave@stgolabs.net>, Minchan Kim <minchan@google.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Mel Gorman <mgorman@suse.de>, David Rientjes <rientjes@google.com>, Axel Rasmussen <axelrasmussen@google.com>, kernel-team <kernel-team@android.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, Andy Lutomirski <luto@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, LKML <linux-kerne
 l@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 5, 2022 at 1:35 PM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Mon, Sep 05, 2022 at 11:32:48AM -0700, Suren Baghdasaryan wrote:
> > On Mon, Sep 5, 2022 at 5:32 AM 'Michal Hocko' via kernel-team
> > <kernel-team@android.com> wrote:
> > >
> > > Unless I am missing something, this is not based on the Maple tree
> > > rewrite, right? Does the change in the data structure makes any
> > > difference to the approach? I remember discussions at LSFMM where it has
> > > been pointed out that some issues with the vma tree are considerably
> > > simpler to handle with the maple tree.
> >
> > Correct, this does not use the Maple tree yet but once Maple tree
> > transition happens and it supports RCU-safe lookups, my code in
> > find_vma_under_rcu() becomes really simple.
> >
> > >
> > > On Thu 01-09-22 10:34:48, Suren Baghdasaryan wrote:
> > > [...]
> > > > One notable way the implementation deviates from the proposal is the way
> > > > VMAs are marked as locked. Because during some of mm updates multiple
> > > > VMAs need to be locked until the end of the update (e.g. vma_merge,
> > > > split_vma, etc).
> > >
> > > I think it would be really helpful to spell out those issues in a greater
> > > detail. Not everybody is aware of those vma related subtleties.
> >
> > Ack. I'll expand the description of the cases when multiple VMAs need
> > to be locked in the same update. The main difficulties are:
> > 1. Multiple VMAs might need to be locked within one
> > mmap_write_lock/mmap_write_unlock session (will call it an update
> > transaction).
> > 2. Figuring out when it's safe to unlock a previously locked VMA is
> > tricky because that might be happening in different functions and at
> > different call levels.
> >
> > So, instead of the usual lock/unlock pattern, the proposed solution
> > marks a VMA as locked and provides an efficient way to:
> > 1. Identify locked VMAs.
> > 2. Unlock all locked VMAs in bulk.
> >
> > We also postpone unlocking the locked VMAs until the end of the update
> > transaction, when we do mmap_write_unlock. Potentially this keeps a
> > VMA locked for longer than is absolutely necessary but it results in a
> > big reduction of code complexity.
>
> Correct me if I'm wrong, but it looks like any time multiple VMAs need to be
> locked we need mmap_lock anyways, which is what makes your approach so sweet.

That is correct. Anytime we need to take VMA's write lock we have to
be holding the write side of the mmap_lock as well. That's what allows
me to skip locking in cases like checking if the VMA is already
locked.

>
> If however we ever want to lock multiple VMAs without taking mmap_lock, then
> deadlock avoidance algorithms aren't that bad - there's the ww_mutex approach,
> which is simple and works well when there isn't much expected contention (the
> advantage of the ww_mutex approach is that it doesn't have to track all held
> locks). I've also written full cycle detection; that approcah gets you fewer
> restarts, at the cost of needing a list of all currently held locks.

Thanks for the tip! I'll take a closer look at ww_mutex.

>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
