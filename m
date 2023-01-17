Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C067F66E823
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 22:06:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxLzG4Gh8z3fBt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 08:06:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Dz70IjXM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Dz70IjXM;
	dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxLyL507Vz3bTM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 08:05:30 +1100 (AEDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 66so507326yba.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 13:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dwj8xbw0bnEL25Qq4gmjxS00IOeAjG6GNQxAdbnWO2A=;
        b=Dz70IjXMbGEDAEUfGYkAjARcQ1aaCB4C/yV4J6ap8RocWxiLCyWOuVOLCBBQakbozM
         9ThYUJ2KetdMGb1OtZwAPbQdTeKDKGOTXmZPv7NRZfHpQ/EtRgE8Ld6EbmyV5wGLlFfD
         AmFXyZvQdUOwQq4pgbxz9auvXTWcfQa87IMGGXpePOrO4iwYcAZ75BGEQVE7OIxHdtIF
         iD+cVHzpbMidwELSER4I/Iw3wY397BVq3STlFx+qXjWhSLJBTofB3gwY/gj9toQTJM4R
         jBMlUAVfbUhJueWyXvCfLluIrDwiqZ2eF2H8pnWKIRVh1BJHTVXCcWs41PWRMqbf3FUo
         viIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dwj8xbw0bnEL25Qq4gmjxS00IOeAjG6GNQxAdbnWO2A=;
        b=4Jj/YAO4UR1GIkbOVQz0GSu0lW8seym4ULbX0T4Q8oaPPH4txzGcLyIfr8+VSKlVz3
         irYHv9P/r3U0pBd4zJXom5Y9NchsdLY0YXL6a4m19kvXG4XvIjArPHOfLrhRxrGfXfDa
         LPpdJbc8XG6gARGcxom1nbc6wl/2WNU59dNeXWUoWKoHe5WyJ1xu8z5CzdwoAE4asjVw
         Cc7t5wxAlw/PUFGUw8/OXhMPc696AUl6bJdysskltTZm4TnMvlo8T/qC1OnsWZrqTDfc
         KKZjJdklIdFnmZe5dvchqXZlaY06OKN5REPKfYxriaXBSPhOApkoiBipgx/c22S088fb
         8evw==
X-Gm-Message-State: AFqh2kqND40EngR9WxA444swxUtmPhLSKeKCZMJPjLxTTpfHVVmLsFUz
	Cn34C6ZbO3jZESGeOiaPhliMqBuOIGZA/RGcSl6yeQ==
X-Google-Smtp-Source: AMrXdXv6CeeFzN1+4R4tdHg/IKJ5C4l7PaOinzVK4PGVJM9c7GIhFphMdEPkr6ezjD9k28ifY1AtMqJwzv7bPIGABGE=
X-Received: by 2002:a25:9801:0:b0:7d5:b884:3617 with SMTP id
 a1-20020a259801000000b007d5b8843617mr457605ybo.380.1673989527114; Tue, 17 Jan
 2023 13:05:27 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-19-surenb@google.com>
 <Y8a9+ywh65fmuKvv@dhcp22.suse.cz> <CAG48ez2Adwqs8Vvm3YUKwpx8qzV1wWtnUdWVo1UphjzADjMZQQ@mail.gmail.com>
In-Reply-To: <CAG48ez2Adwqs8Vvm3YUKwpx8qzV1wWtnUdWVo1UphjzADjMZQQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Jan 2023 13:05:15 -0800
Message-ID: <CAJuCfpHrRAQBPD68PFr0wcbV4fYTEYgxFj0AeeOn6W1sszw9xw@mail.gmail.com>
Subject: Re: [PATCH 18/41] mm/khugepaged: write-lock VMA while collapsing a
 huge page
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, Michal Hocko <mhocko@suse.com>, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@tech
 singularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 12:28 PM Jann Horn <jannh@google.com> wrote:
>
> On Tue, Jan 17, 2023 at 4:25 PM Michal Hocko <mhocko@suse.com> wrote:
> > On Mon 09-01-23 12:53:13, Suren Baghdasaryan wrote:
> > > Protect VMA from concurrent page fault handler while collapsing a huge
> > > page. Page fault handler needs a stable PMD to use PTL and relies on
> > > per-VMA lock to prevent concurrent PMD changes. pmdp_collapse_flush(),
> > > set_huge_pmd() and collapse_and_free_pmd() can modify a PMD, which will
> > > not be detected by a page fault handler without proper locking.
> >
> > I am struggling with this changelog. Maybe because my recollection of
> > the THP collapsing subtleties is weak. But aren't you just trying to say
> > that the current #PF handling and THP collapsing need to be mutually
> > exclusive currently so in order to keep that assumption you have mark
> > the vma write locked?
> >
> > Also it is not really clear to me how that handles other vmas which can
> > share the same thp?
>
> It's not about the hugepage itself, it's about how the THP collapse
> operation frees page tables.
>
> Before this series, page tables can be walked under any one of the
> mmap lock, the mapping lock, and the anon_vma lock; so when khugepaged
> unlinks and frees page tables, it must ensure that all of those either
> are locked or don't exist. This series adds a fourth lock under which
> page tables can be traversed, and so khugepaged must also lock out that one.
>
> There is a codepath in khugepaged that iterates through all mappings
> of a file to zap page tables (retract_page_tables()), which locks each
> visited mm with mmap_write_trylock() and now also does
> vma_write_lock().
>
>
> I think one aspect of this patch that might cause trouble later on, if
> support for non-anonymous VMAs is added, is that retract_page_tables()
> now does vma_write_lock() while holding the mapping lock; the page
> fault handling path would probably take the locks the other way
> around, leading to a deadlock? So the vma_write_lock() in
> retract_page_tables() might have to become a trylock later on.
>
> Related: Please add the new VMA lock to the big lock ordering comments
> at the top of mm/rmap.c. (And maybe later mm/filemap.c, if/when you
> add file VMA support.)

Thanks for the clarifications and the warning. I'll add appropriate
comments and will take this deadlocking scenario into account when
later implementing support for file-backed page faults.
