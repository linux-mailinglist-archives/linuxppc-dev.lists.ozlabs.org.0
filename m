Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4FB671C43
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 13:39:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nxlh54ZH4z3fDM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 23:39:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rheJ1RUU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com; envelope-from=jannh@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rheJ1RUU;
	dkim-atps=neutral
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxlg73D4vz3c6w
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 23:38:42 +1100 (AEDT)
Received: by mail-io1-xd34.google.com with SMTP id 203so5690368iou.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 04:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ne1ZZ8g0CKjtUM0flXLQwaKYgCBQx784VijV19d+6xc=;
        b=rheJ1RUUcAkj+1owhrmAToGN1JKqVwS5uNfucsbLgdY6jiwLnv20ZvMr/zG5UmC3MR
         r6w4F2M4P+L39RFGiPrp7Pc4YsCSMo2eypVoYy7uAZH0skF0cb9KGqSqKmQtTROWTdZw
         Y4onbS8Bh9xurv/ecxH2l9+6u4n2k+Du7eEvZ+3bilOaoZOJlQlDDMN5a0ev1/1AkMIv
         6hGk1h8D1872yYIqM9YnRK4SbQiqQUWcQ1xmAUvd1tSMlevfjfCKbIpNjzx92FXNNtTK
         eamrPPtqzoYNgbP3fcy329YWOqfU15+ST4GR/7gu/oa+wU+FfArYkk5BOsi4UvDxXYDv
         dylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ne1ZZ8g0CKjtUM0flXLQwaKYgCBQx784VijV19d+6xc=;
        b=WUTcbJqc1sGRF4wzqpDL6WOt+TY4Gw9ESaBxA9Qzi1a9MJc0dvqt0Bwm//wmXTqcju
         5JWGbQqoPGbV8KZkaO6G7ovvpUY90GvhjMT475rR+424AjJYtxLmPSCi8ncdi9MQhkq1
         E/k6esK4y8Fb+aswb0Xoqanjsw2ixWV9EXdEdm01Kc3UtWbpGd1ITzBiSd+O/I4lSCsK
         xeAf4CFhTJ0RFQ/RqckswVK6ZPBsJ6+3UctiGfORjSTRjaKeRjtq3gdFjp3mmlP+GbEZ
         hKMYjPWd1We5RSS3ilhRzQcosLDbwk1JFKgYWCfz3Vx2Y0xphfeOBQ1lq+fm6BPwBuUl
         Jatg==
X-Gm-Message-State: AFqh2krXKfIkofdL24DqBhIIN8Jah0hi7pZVPsvgsRw4HA73ihFmodyz
	vFTMVB7WOroO5dxZ+0dT+/SfK/X5zLO65/bCEV+Z4Q==
X-Google-Smtp-Source: AMrXdXtdPpTPNrN7OiYOv16BmNfqKkmp2Nm/DssJpSsitfPp+gX8QsWWZQOd27RnCdytJ0z4l4VIPkrlODp7fq/3+OE=
X-Received: by 2002:a02:cb45:0:b0:39e:6dd8:6c96 with SMTP id
 k5-20020a02cb45000000b0039e6dd86c96mr543739jap.246.1674045520432; Wed, 18 Jan
 2023 04:38:40 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-19-surenb@google.com>
 <Y8a9+ywh65fmuKvv@dhcp22.suse.cz> <CAG48ez2Adwqs8Vvm3YUKwpx8qzV1wWtnUdWVo1UphjzADjMZQQ@mail.gmail.com>
 <Y8e+efbJ4rw9goF0@dhcp22.suse.cz>
In-Reply-To: <Y8e+efbJ4rw9goF0@dhcp22.suse.cz>
From: Jann Horn <jannh@google.com>
Date: Wed, 18 Jan 2023 13:38:03 +0100
Message-ID: <CAG48ez0Hmr6wF4sSC1oSL1Q8N8mREARU4itwQ0TbRF3y+oMYFg@mail.gmail.com>
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

On Wed, Jan 18, 2023 at 10:40 AM Michal Hocko <mhocko@suse.com> wrote:
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

Oops, yeah. Now that I'm looking closer I also don't see a path from
the #PF path to i_mmap_lock_read. Sorry for sending you on a wild
goose chase.
