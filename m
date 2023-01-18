Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE43A67253B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 18:42:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxtPr4zq2z3fCj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 04:42:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Ea4CJI0T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Ea4CJI0T;
	dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxtNy2FfXz3bXP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 04:41:54 +1100 (AEDT)
Received: by mail-yb1-xb36.google.com with SMTP id o75so39073136yba.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 09:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ggn1Gn4xsGfWkGoz3fdeEx12ls41kiX+Bcgea51Xy0=;
        b=Ea4CJI0TSp0VpR3KYCvzeCipTBJjBVuqbyf4rfd+Jv1neOPo9p/t/BduqEOInn0y3C
         ofgrWDbDQgEP2g8l1MvXXGn/QX4fbJhNvQffDX/t+trziL1O5MKSR5kfDMjyLWGQG3EA
         vJQ1epz0AZ7pySAVPAR4XXXKslbRKDY9rkCVemC3yTtudRIBFHB5aYgnxkMTfX+a315y
         +MCEhYZQkWH78CcxuVrSGlmVx3JBTtYjrsCR/65yYqhEc8iYg6n/Mrymr9pNuAmPcW8Y
         0VNTZ6B+ZwgCycamWGYsxLS5X/qCdfxOOX3rFQTg4BAZq6XeZYwYYTJPt8RKmXpMgxru
         ZHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ggn1Gn4xsGfWkGoz3fdeEx12ls41kiX+Bcgea51Xy0=;
        b=tSuINnt1KfJtQwsn8ASh1WDSqZ1PkwyT+2vYIrtBLc4JEBlWR5EcyMhQARXTE69O/c
         V0jOhMGPYKRgFm2aUEkpySLw+lU/bK20lLggujkKK01zwevvkjMEfRX1U0h+ZWRCbqkI
         brUlWKzVVsV0RzvZKp3Mt/WrYntA7K6Bi7jF+BVoDCiDw+W7v/moICAsiQXbdH7rzM3O
         gKnJxnJr4H4iH7ue9+jraGZ8WE6KEsL0LIOl21BXwjckg+FK/QajgE/y71x5SttvqskH
         dEfLg/yaRpHLUZjf20J4e3+4vZX/L2QpKbsSY+f+7Ra7NlIWYIZyTIsqVEAfnlCXIwes
         a9lw==
X-Gm-Message-State: AFqh2kq4u7DBpqFUylUrAJ6MGAtn8jhGUmxw1ZrhW/XvyGcSvvzw5WBa
	152Cju3grz3juCrKaNhFmbuoyGIvGKmDPkLZOKg0hw==
X-Google-Smtp-Source: AMrXdXumY8p2sU8BkGgo7Lctu1jBI5wsBXEgb6BSMszQ1CFMqwRFSLoQ/TGhweY0s84T2kXVvFhuWQ3VSTGzwjugGTw=
X-Received: by 2002:a25:9801:0:b0:7d5:b884:3617 with SMTP id
 a1-20020a259801000000b007d5b8843617mr745969ybo.380.1674063711547; Wed, 18 Jan
 2023 09:41:51 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-19-surenb@google.com>
 <Y8a9+ywh65fmuKvv@dhcp22.suse.cz> <CAG48ez2Adwqs8Vvm3YUKwpx8qzV1wWtnUdWVo1UphjzADjMZQQ@mail.gmail.com>
 <Y8e+efbJ4rw9goF0@dhcp22.suse.cz>
In-Reply-To: <Y8e+efbJ4rw9goF0@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Jan 2023 09:41:38 -0800
Message-ID: <CAJuCfpHbMJV3Mo3tkFU4zbDWSTOBoMpBVJZ4-NePGF_Yv+VUGg@mail.gmail.com>
Subject: Re: [PATCH 18/41] mm/khugepaged: write-lock VMA while collapsing a
 huge page
To: Michal Hocko <mhocko@suse.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, Jann Horn <jannh@google.com>, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsi
 ngularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 18, 2023 at 1:40 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Tue 17-01-23 21:28:06, Jann Horn wrote:
> > On Tue, Jan 17, 2023 at 4:25 PM Michal Hocko <mhocko@suse.com> wrote:
> > > On Mon 09-01-23 12:53:13, Suren Baghdasaryan wrote:
> > > > Protect VMA from concurrent page fault handler while collapsing a huge
> > > > page. Page fault handler needs a stable PMD to use PTL and relies on
> > > > per-VMA lock to prevent concurrent PMD changes. pmdp_collapse_flush(),
> > > > set_huge_pmd() and collapse_and_free_pmd() can modify a PMD, which will
> > > > not be detected by a page fault handler without proper locking.
> > >
> > > I am struggling with this changelog. Maybe because my recollection of
> > > the THP collapsing subtleties is weak. But aren't you just trying to say
> > > that the current #PF handling and THP collapsing need to be mutually
> > > exclusive currently so in order to keep that assumption you have mark
> > > the vma write locked?
> > >
> > > Also it is not really clear to me how that handles other vmas which can
> > > share the same thp?
> >
> > It's not about the hugepage itself, it's about how the THP collapse
> > operation frees page tables.
> >
> > Before this series, page tables can be walked under any one of the
> > mmap lock, the mapping lock, and the anon_vma lock; so when khugepaged
> > unlinks and frees page tables, it must ensure that all of those either
> > are locked or don't exist. This series adds a fourth lock under which
> > page tables can be traversed, and so khugepaged must also lock out that one.
> >
> > There is a codepath in khugepaged that iterates through all mappings
> > of a file to zap page tables (retract_page_tables()), which locks each
> > visited mm with mmap_write_trylock() and now also does
> > vma_write_lock().
>
> OK, I see. This would be a great addendum to the changelog.

I'll add Jann's description in the changelog. Thanks Jann!

>
> > I think one aspect of this patch that might cause trouble later on, if
> > support for non-anonymous VMAs is added, is that retract_page_tables()
> > now does vma_write_lock() while holding the mapping lock; the page
> > fault handling path would probably take the locks the other way
> > around, leading to a deadlock? So the vma_write_lock() in
> > retract_page_tables() might have to become a trylock later on.
>
> This, right?
> #PF                     retract_page_tables
> vma_read_lock
>                         i_mmap_lock_write
> i_mmap_lock_read
>                         vma_write_lock
>
>
> I might be missing something but I have only found huge_pmd_share to be
> called from the #PF path. That one should be safe as it cannot be a
> target for THP. Not that it would matter much because such a dependency
> chain would be really subtle.
> --
> Michal Hocko
> SUSE Labs
