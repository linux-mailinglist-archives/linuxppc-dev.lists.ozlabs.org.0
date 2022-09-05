Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 066615AD90B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 20:33:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLxx0126mz30F7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 04:33:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=i5KCDSUH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=i5KCDSUH;
	dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLxwK4ZX9z2ywN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 04:33:04 +1000 (AEST)
Received: by mail-io1-xd36.google.com with SMTP id b142so7297768iof.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Sep 2022 11:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=FNv/KEMtf5XOtkND3AyjhcP/3pLjOBMwZm4O4kjr360=;
        b=i5KCDSUH/dFt94fpjc7Fphku0Tn3reBabaBpFtdU+oRbFh+e8Cx/DMlqQivEg1MZjm
         7FbOvlY6Y9f+9LZ9N+zgTB71z3cagQ2sGfp1oudx0Kv1xpUW6Up8K51vig+01CsmnL3L
         C3xCWMqLQrpYBGvHC0UNi+yNQ6XvxIjh2dsHMNd34BBtJz1xyaPEvWMxsK55kusb2lJe
         FYhU7ADU9KYt1l8KwJpBXu48E1hUBJcr2CIqnesgVXkiai+CuNr/V0a+QqiqySxoUimH
         yIvsq78rMCW0kTv83Fiph1I394+CJ8Hgoqi6ZFAZmMb3pGsqLwLA4vfAoG5DeUW7LJqa
         cUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=FNv/KEMtf5XOtkND3AyjhcP/3pLjOBMwZm4O4kjr360=;
        b=IE546GDDBCrEWvxDXvz5bSX0C+Tc3RmJGJW+fXsMUgprSul3Yki+DJHpkt9X7Lhkqq
         JNnEXPrzlib+SrGxEWEnYZphWUjgwrSh6wRDHvhoXPqDnlbz1mjufHcSe3lSlrnsOtG+
         d5ntmtyVfQYvI3pY5fMsMCdqyIid05xkvS1ND3RZfIGChFKjZ0YBbnE11/jQKUMKioyR
         eFO1tPz/QyjKuLgKHN9fv3Mp5RpKFvP/AHci3k6yOb5gkREEbNOM59cU5QkFQj7aLqXy
         ak8MZNAZJNTFnx7sGPX3vlOFUOj9DJkbfslUHB0NFEvGrebTOFz7wAEX4jCbKk3b0rTX
         kqhg==
X-Gm-Message-State: ACgBeo2mL1F86i8GWYWjQvuMjTxwtpBZ+H7+O6TTnMVEFpjJn8QPhlL/
	86GJBlB9WKDqY7IGccPNbOGwGAMjyIUVXgRRGWT3fA==
X-Google-Smtp-Source: AA6agR7tgjJDEPLfwwS1LRrijFcmlJFxoiqhAebJjxrWU7CYsmX7SoR6nKTNAJ7nNJVYWRRFlsmMoE7vtwAV8983goQ=
X-Received: by 2002:a02:740b:0:b0:349:bcdd:ca20 with SMTP id
 o11-20020a02740b000000b00349bcddca20mr28183219jac.110.1662402779688; Mon, 05
 Sep 2022 11:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <YxXsQKoQ0URIRuKi@dhcp22.suse.cz>
In-Reply-To: <YxXsQKoQ0URIRuKi@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 5 Sep 2022 11:32:48 -0700
Message-ID: <CAJuCfpG3bMLzNhP5wt8my8j7_9wW=darLegd6WPV6tddtCKGAA@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 00/28] per-VMA locks proposal
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
Cc: Michel Lespinasse <michel@lespinasse.org>, Joel Fernandes <joelaf@google.com>, Song Liu <songliubraving@fb.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Xu <peterx@redhat.com>, dhowells@redhat.com, linux-mm <linux-mm@kvack.org>, Jerome Glisse <jglisse@google.com>, Davidlohr Bueso <dave@stgolabs.net>, Minchan Kim <minchan@google.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Mel Gorman <mgorman@suse.de>, David Rientjes <rientjes@google.com>, Axel Rasmussen <axelrasmussen@google.com>, kernel-team <kernel-team@android.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, Andy Lutomirski <luto@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Kent Overstreet <kent.overstreet@linux.dev>, LKML
  <linux-kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 5, 2022 at 5:32 AM 'Michal Hocko' via kernel-team
<kernel-team@android.com> wrote:
>
> Unless I am missing something, this is not based on the Maple tree
> rewrite, right? Does the change in the data structure makes any
> difference to the approach? I remember discussions at LSFMM where it has
> been pointed out that some issues with the vma tree are considerably
> simpler to handle with the maple tree.

Correct, this does not use the Maple tree yet but once Maple tree
transition happens and it supports RCU-safe lookups, my code in
find_vma_under_rcu() becomes really simple.

>
> On Thu 01-09-22 10:34:48, Suren Baghdasaryan wrote:
> [...]
> > One notable way the implementation deviates from the proposal is the way
> > VMAs are marked as locked. Because during some of mm updates multiple
> > VMAs need to be locked until the end of the update (e.g. vma_merge,
> > split_vma, etc).
>
> I think it would be really helpful to spell out those issues in a greater
> detail. Not everybody is aware of those vma related subtleties.

Ack. I'll expand the description of the cases when multiple VMAs need
to be locked in the same update. The main difficulties are:
1. Multiple VMAs might need to be locked within one
mmap_write_lock/mmap_write_unlock session (will call it an update
transaction).
2. Figuring out when it's safe to unlock a previously locked VMA is
tricky because that might be happening in different functions and at
different call levels.

So, instead of the usual lock/unlock pattern, the proposed solution
marks a VMA as locked and provides an efficient way to:
1. Identify locked VMAs.
2. Unlock all locked VMAs in bulk.

We also postpone unlocking the locked VMAs until the end of the update
transaction, when we do mmap_write_unlock. Potentially this keeps a
VMA locked for longer than is absolutely necessary but it results in a
big reduction of code complexity.

>
> Thanks for working on this Suren!

Thanks for reviewing!
Suren.

> --
> Michal Hocko
> SUSE Labs
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
