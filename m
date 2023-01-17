Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD3866E7B2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 21:29:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxL8x71rdz3fBQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 07:29:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=aJ1tuCqC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com; envelope-from=jannh@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=aJ1tuCqC;
	dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxL7z3FJcz3cGd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 07:28:46 +1100 (AEDT)
Received: by mail-io1-xd35.google.com with SMTP id 203so4801256iou.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 12:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w6lBLtQcwXXW0D4MwnkLaJbFSlKXy17eV5mc4KZgrNg=;
        b=aJ1tuCqCEyVYlKQ3YOYO3zSRB48viA6UM19LIAhgZpv4eGDtYMK/hPPo5lfXgu+gTS
         M+n1QCd/7KOhkd/YvSx5PKyIGahYeRaRSV3luKpLj+YUzBh1z1C4rdBug3i5gt6VJHD1
         39PJ1/Yodm39kmb9guNck1iq5XvL2xrPhssLwKDLzrKFQnQ1xeFi+kC4I4GZpNT/eBpb
         abGCyD4BAVT7vVVXEJdAV9lOIkQSg8qUbJc6A1EUb6vTmPXnnOMDcovrH9fQo2UpnH0l
         cKSBU2d7t0U9wiJWBcBPmqXGrs0e92f8O5N9QZo7wxujcaSt0nmgoUC4wJTaq7OBQpsv
         F8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6lBLtQcwXXW0D4MwnkLaJbFSlKXy17eV5mc4KZgrNg=;
        b=RYqVQsoBihPJN8WbsAITi3ZKiWedozhSv4e8bZ3bXopkRZsdncY1VFqDAnd4peuBpp
         MEVvL2KlGp1nDkIFr1xiYhl3+AL4i1T2hQh0+nm8SOxYV06Ms7NerSIwCLG9hS+5sdiU
         Ed7p2Bdw3RayUDajQny8I9ddCLgk/6wlHOHfP/qv2uwQ1kVlRQ5k29wEjEY/Y2rEdOU8
         eAq0UedWyi2ci7ueBt5aMI7oHkUx8tf5rp898gOMCJoPkNpNKUZs0LW1VesxW3rvvO2P
         ODcJPglFsCN9YB5fJBq4PlEZJ8Zm3mllQ2EGIk10Wmd/Z+lYbCpn/aFxQ2aYIxsUcc+c
         Kocw==
X-Gm-Message-State: AFqh2kr0HkHsKnNvb4eqamYftcK6dkPaQ6iTnY5ZwCp1jWY8rmU2k0ZP
	GqtzF/31+E6hKYnVpHYf1HcDu+4LWds1mtG94cvPSA==
X-Google-Smtp-Source: AMrXdXsdfz3ZSkVOQq7xodxuPXlHOjr2OrBoiOuZE3Eq2JZpQR9esxUP0A6G43/Zbr959H9oSQiEOLhkS8jLPG4mH0c=
X-Received: by 2002:a02:c884:0:b0:39e:9d33:a47 with SMTP id
 m4-20020a02c884000000b0039e9d330a47mr309615jao.58.1673987322674; Tue, 17 Jan
 2023 12:28:42 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-19-surenb@google.com>
 <Y8a9+ywh65fmuKvv@dhcp22.suse.cz>
In-Reply-To: <Y8a9+ywh65fmuKvv@dhcp22.suse.cz>
From: Jann Horn <jannh@google.com>
Date: Tue, 17 Jan 2023 21:28:06 +0100
Message-ID: <CAG48ez2Adwqs8Vvm3YUKwpx8qzV1wWtnUdWVo1UphjzADjMZQQ@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgor
 man@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 4:25 PM Michal Hocko <mhocko@suse.com> wrote:
> On Mon 09-01-23 12:53:13, Suren Baghdasaryan wrote:
> > Protect VMA from concurrent page fault handler while collapsing a huge
> > page. Page fault handler needs a stable PMD to use PTL and relies on
> > per-VMA lock to prevent concurrent PMD changes. pmdp_collapse_flush(),
> > set_huge_pmd() and collapse_and_free_pmd() can modify a PMD, which will
> > not be detected by a page fault handler without proper locking.
>
> I am struggling with this changelog. Maybe because my recollection of
> the THP collapsing subtleties is weak. But aren't you just trying to say
> that the current #PF handling and THP collapsing need to be mutually
> exclusive currently so in order to keep that assumption you have mark
> the vma write locked?
>
> Also it is not really clear to me how that handles other vmas which can
> share the same thp?

It's not about the hugepage itself, it's about how the THP collapse
operation frees page tables.

Before this series, page tables can be walked under any one of the
mmap lock, the mapping lock, and the anon_vma lock; so when khugepaged
unlinks and frees page tables, it must ensure that all of those either
are locked or don't exist. This series adds a fourth lock under which
page tables can be traversed, and so khugepaged must also lock out that one.

There is a codepath in khugepaged that iterates through all mappings
of a file to zap page tables (retract_page_tables()), which locks each
visited mm with mmap_write_trylock() and now also does
vma_write_lock().


I think one aspect of this patch that might cause trouble later on, if
support for non-anonymous VMAs is added, is that retract_page_tables()
now does vma_write_lock() while holding the mapping lock; the page
fault handling path would probably take the locks the other way
around, leading to a deadlock? So the vma_write_lock() in
retract_page_tables() might have to become a trylock later on.

Related: Please add the new VMA lock to the big lock ordering comments
at the top of mm/rmap.c. (And maybe later mm/filemap.c, if/when you
add file VMA support.)
