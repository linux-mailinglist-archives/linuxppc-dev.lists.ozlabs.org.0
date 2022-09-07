Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEB05AF946
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 02:59:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMkRJ5B26z3c6M
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 10:59:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=EAkdAoJF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=EAkdAoJF;
	dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMkQf1pzfz2xn5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 10:58:32 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id y82so11153448yby.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Sep 2022 17:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=UjaiWINnbTXgT+URtVXx1fGemLW7KAjAuDjBEcKQcpw=;
        b=EAkdAoJF93b/9wVcZWS/8Z33Wh8Eq7xG8wCxKPHNm0Lldc4C5bChxoQDfIHIPRDYax
         E+7oO+L2O6scu7V+5fNLALkC2gSW3KtuP3tfNpYEXGlOWDD2sTiTX6OWgeeJAcpYfcqc
         A7KFsvQIqZJC3pSoupGeVX3b2h2lXfNqXDDwmhewWl9SZYpSIQb+K3ijuHEHBKnlI5iN
         5YTs4xJNgeAVeEvcjs3kD0qLdfQNKm1QP8zoW0R448XpFNwDG9J12DbqDl3vZ1zKXm72
         +HSPLoCsmPAhUhpPj99b2yJIbwOsGllYC7rvCmcvKG+KcIcU1HoAeaosy/7TBlwl5auu
         e43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=UjaiWINnbTXgT+URtVXx1fGemLW7KAjAuDjBEcKQcpw=;
        b=RCu1RwoEgsrc+aJe0DmpCB2No++/Ja2+4PkjCWjEyrm59bxT2WC+awD0xLOOkDRPV1
         AfG0gobe7PWaiWIGjsclikruUHmpzu1cjj8nsOqypZuUB81tdV78d9UmX9fdooLNo46d
         Douf9782JGGNx3+8B2ZzoFIQ1NmgGo2BYFsxzi+TGa16+l/MIteUZu1TudeASbl9Cl0W
         M8H3XqBRgZDy3f2HlPQbzrI8gRk5iOZyBbDj9jGRsYzw+om737UuIWmAcCybC7Lg5JiB
         acqd6V83ZmPksd8B32OVJyeJKghfrmCFaSf3cJXjaRzwTKuNHEj4jeHgiS40EoeSzfIQ
         r0qg==
X-Gm-Message-State: ACgBeo2LVyK+6Dhi3FzVWFcAOyBvSV3Wf2PjCUhcQUQwS7HzQI9B6yn6
	rfH1KaQomMoP/+/y7oTfS3paNlWquXp5CX2Z6pXNIA==
X-Google-Smtp-Source: AA6agR7/aESfD9/NDPsDFtQ7YKYMRNuKLSwT1FUjw+G1bf9VJ00olfdLIYvwBbmvvuSYroc7vvTiDT6ZBY0OsHmp1Qc=
X-Received: by 2002:a25:9781:0:b0:6a9:561a:c143 with SMTP id
 i1-20020a259781000000b006a9561ac143mr995480ybo.59.1662512309570; Tue, 06 Sep
 2022 17:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901173516.702122-20-surenb@google.com>
 <YxeiB2la/9fZEzLO@xz-m1.local> <CAJuCfpHkjHAAmKAJH=cxhFmwMawUDQJccwKa8k=xXNZZ1knT7g@mail.gmail.com>
 <YxesBqZ+L+oeQv5e@xz-m1.local>
In-Reply-To: <YxesBqZ+L+oeQv5e@xz-m1.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 6 Sep 2022 17:58:18 -0700
Message-ID: <CAJuCfpFpOT3KOBCjcnTo9D3AWq_GT9bKNyQ4xcwLJh1UPF6FFA@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 19/28] mm: disallow do_swap_page to handle page
 faults under VMA lock
To: Peter Xu <peterx@redhat.com>
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
Cc: Michel Lespinasse <michel@lespinasse.org>, Joel Fernandes <joelaf@google.com>, Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, dhowells@redhat.com, linux-mm <linux-mm@kvack.org>, Jerome Glisse <jglisse@google.com>, Davidlohr Bueso <dave@stgolabs.net>, Minchan Kim <minchan@google.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Mel Gorman <mgorman@suse.de>, David Rientjes <rientjes@google.com>, Axel Rasmussen <axelrasmussen@google.com>, kernel-team <kernel-team@android.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, Andy Lutomirski <luto@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Kent Overstreet <kent.overstreet@linux.dev>, LK
 ML <linux-kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 6, 2022 at 1:22 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Sep 06, 2022 at 01:08:10PM -0700, Suren Baghdasaryan wrote:
> > On Tue, Sep 6, 2022 at 12:39 PM Peter Xu <peterx@redhat.com> wrote:
> > >
> > > On Thu, Sep 01, 2022 at 10:35:07AM -0700, Suren Baghdasaryan wrote:
> > > > Due to the possibility of do_swap_page dropping mmap_lock, abort fault
> > > > handling under VMA lock and retry holding mmap_lock. This can be handled
> > > > more gracefully in the future.
> > > >
> > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > ---
> > > >  mm/memory.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/mm/memory.c b/mm/memory.c
> > > > index 9ac9944e8c62..29d2f49f922a 100644
> > > > --- a/mm/memory.c
> > > > +++ b/mm/memory.c
> > > > @@ -3738,6 +3738,11 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> > > >       vm_fault_t ret = 0;
> > > >       void *shadow = NULL;
> > > >
> > > > +     if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
> > > > +             ret = VM_FAULT_RETRY;
> > > > +             goto out;
> > > > +     }
> > > > +
> > >
> > > May want to fail early similarly for handle_userfault() too for similar
> > > reason.  Thanks,
> >
> > I wasn't aware of a similar issue there. Will have a closer look. Thanks!
>
> Sure.
>
> Just in case this would be anything helpful - handle_userfault() will both
> assert at the entry (mmap_assert_locked) and will in most cases release
> read lock along the way when waiting for page fault resolutions.
>
> And userfaultfd should work on anonymous memory for either missing mode or
> write protect mode.

Got it. Thanks for the explanation. It definitely helps!

>
> Thanks,
>
> --
> Peter Xu
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
