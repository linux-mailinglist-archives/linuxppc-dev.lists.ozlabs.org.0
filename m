Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B45D1E5065
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 23:21:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XP0N6wt0zDqXl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 07:21:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d43;
 helo=mail-io1-xd43.google.com; envelope-from=alexander.duyck@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iiQHWCci; dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XNx21PKGzDqVv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 07:18:45 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id d7so27766448ioq.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 14:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OQpIJWMudHYzeYVJAX5TAsaN7KlVrc6tTOWAA64PC+4=;
 b=iiQHWCciz2fx1p5e3Ax1s0ebQUYscbu3DHxh5vhMTs51fzQY4eRqWuZwLGrNVO7ljo
 A1gz+WbDPEL/vzgBc+W1Jp+YI86kaMBy6fQ1J8oQGAYP3jx3X/dydph7LHKsjZMcKQ7p
 GoxlqkETGVhWIfEP3XOfTHoDM1dycQWH7SGh2nDHw2hZ4d/WD1wDiygoEzVbo43AYsaX
 R044I8YtHcLpwGMc8PsH7MgGaZPi81X/3EASGPTwdlRu5NleQ+NFU/12tPOiBYFinBga
 kxZ0Ue9uHcBfBJCgvTaMdwt0PpfJIPmKggXfx0aGdbRw7uOtm+vbPyRzlVOr8GeX610E
 2P4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OQpIJWMudHYzeYVJAX5TAsaN7KlVrc6tTOWAA64PC+4=;
 b=UxMJVWC/pV+mCOpujrMlErcS36c611DMmqarUOCEaUaCzkILmcG08BHYPr8x5Xsihk
 ugi77/EDLrHAWz1xlQSo0DG0/DpDJjBbBAc/WxWiVVNBPXj590cIZV9Czyu83ZUNv90r
 YFfvVq5cph2Nb/T0gAD9nhGzWE/xleE1D8kAW9CJXFcY2ZPVY29CKXuPOO13jGYc/ZEE
 E7XgGbFiQgjZVMSxao4OOo9xNbnGDOECiaxcVWGKsy8EXAbTeC8iVk03e03EGMKNQtDJ
 N6gzZWZZbXAeaB8b22Kq4JNI2c0dHZe67TDBBbfwa/t/atR1Ib8nW+KYNpyeei8WEtHH
 vuJw==
X-Gm-Message-State: AOAM533Qx2NP0Hd8dwEkQPvP6iCYf4gLMqSUwIs4T4L0QaYeSeqatu2P
 tvJ8aqqRBqOc2voO/7YEvkG1gtgg6izE2jM7TcU=
X-Google-Smtp-Source: ABdhPJzsosJVaGZxsaHbzCE+qheixFWw0db5wOKUZpRvaNa1fjVHnbvE40NI+t+uWx+U/K/yN8sWBICKzejoGyiO0mY=
X-Received: by 2002:a6b:5f06:: with SMTP id t6mr12961446iob.88.1590614321551; 
 Wed, 27 May 2020 14:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200527173608.2885243-1-daniel.m.jordan@oracle.com>
 <20200527173608.2885243-6-daniel.m.jordan@oracle.com>
In-Reply-To: <20200527173608.2885243-6-daniel.m.jordan@oracle.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Wed, 27 May 2020 14:18:30 -0700
Message-ID: <CAKgT0UcVRMWpaxYu9SQnTuQZm6ePBJkTStWPwekzkfRMnLvf1Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] mm: don't track number of pages during deferred
 initialization
To: Daniel Jordan <daniel.m.jordan@oracle.com>
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm <linux-mm@kvack.org>, Steven Sistare <steven.sistare@oracle.com>,
 Pavel Machek <pavel@ucw.cz>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Steffen Klassert <steffen.klassert@secunet.com>, linux-s390@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>,
 Jason Gunthorpe <jgg@ziepe.ca>, Zi Yan <ziy@nvidia.com>,
 Robert Elliott <elliott@hpe.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Shile Zhang <shile.zhang@linux.alibaba.com>,
 Josh Triplett <josh@joshtriplett.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kirill Tkhai <ktkhai@virtuozzo.com>, Dan Williams <dan.j.williams@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-crypto@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 27, 2020 at 10:37 AM Daniel Jordan
<daniel.m.jordan@oracle.com> wrote:
>
> Deferred page init used to report the number of pages initialized:
>
>   node 0 initialised, 32439114 pages in 97ms
>
> Tracking this makes the code more complicated when using multiple
> threads.  Given that the statistic probably has limited value,
> especially since a zone grows on demand so that the page count can vary,
> just remove it.
>
> The boot message now looks like
>
>   node 0 deferred pages initialised in 97ms
>
> Signed-off-by: Daniel Jordan <daniel.m.jordan@oracle.com>
> Suggested-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>

This looks good to me.

Reviewed-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>

> ---
>  mm/page_alloc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index d0c0d9364aa6d..d64f3027fdfa6 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -1819,7 +1819,7 @@ static int __init deferred_init_memmap(void *data)
>  {
>         pg_data_t *pgdat = data;
>         const struct cpumask *cpumask = cpumask_of_node(pgdat->node_id);
> -       unsigned long spfn = 0, epfn = 0, nr_pages = 0;
> +       unsigned long spfn = 0, epfn = 0;
>         unsigned long first_init_pfn, flags;
>         unsigned long start = jiffies;
>         struct zone *zone;
> @@ -1868,15 +1868,15 @@ static int __init deferred_init_memmap(void *data)
>          * allocator.
>          */
>         while (spfn < epfn) {
> -               nr_pages += deferred_init_maxorder(&i, zone, &spfn, &epfn);
> +               deferred_init_maxorder(&i, zone, &spfn, &epfn);
>                 cond_resched();
>         }
>  zone_empty:
>         /* Sanity check that the next zone really is unpopulated */
>         WARN_ON(++zid < MAX_NR_ZONES && populated_zone(++zone));
>
> -       pr_info("node %d initialised, %lu pages in %ums\n",
> -               pgdat->node_id, nr_pages, jiffies_to_msecs(jiffies - start));
> +       pr_info("node %d deferred pages initialised in %ums\n",
> +               pgdat->node_id, jiffies_to_msecs(jiffies - start));
>
>         pgdat_init_report_one_done();
>         return 0;
> --
> 2.26.2
>
>
