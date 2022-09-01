Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAF65AA3A1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 01:19:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJcS22brzz3bk4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 09:18:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=miInjSJE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=miInjSJE;
	dkim-atps=neutral
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJcRG6g59z3bWm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 09:18:18 +1000 (AEST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-324ec5a9e97so1947867b3.7
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 16:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=rjiF9dcJ/mORZlmNTO18kEduhbATdpbM6SHMK6U+ruY=;
        b=miInjSJE+fzo5gS/eKt5cfKejZWjk/URgt0UsOF5yFYhBi4SW0mjlLLL/BxcWNS7q1
         ZbX9dW3k1PQz07RhMq4TY0IKX8uDz5gqWib15fn/ENu8F4BQEoeMpBqRR4aXJyehSLYL
         rlX+s6DOoRRQDDNJOyrdh0XgYf16gCuBQ8/5nYMEbXay2V4G5ElxQsF4iKh7ls3v0nku
         D6GH4AzNn0lGwU6+bKnN6gfpnyUHAp3BKdNloRCyIKDJYsKSeK4d/tInEIryGNWiC42i
         SC0dR4U7pJvq0mNT8d7KhoSD0pTCfW3Ka8zPz/CWyWvVkBglY+I9aRF6ESuk5tijxW2i
         1vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=rjiF9dcJ/mORZlmNTO18kEduhbATdpbM6SHMK6U+ruY=;
        b=5aPgDd4YuXntUI6hyI9AHm5yQ9ZklLGkvJ+Nfk3+ji1109uiTbgMFKiRBWPMlQm3IP
         2uYeEVAR1xZbG7BJpRBotug5Lir2pBknI6or5jfMMLZx0PpfVOM+4P5eJxOkiuc2B6Bw
         +UdBkz2SNBiDn7FtQ0FKsU0CCVUh6kgWOlzZlX8RrNgNIm+yNScfQtGNSz93pcbVT2zB
         pKXa3NRyc4CEWOlvfVPx0bWgQN3iP1MOzoZtD7FD3ebjuObgawqw8RI/JYsZ4bUCDFWj
         SlLM33srfmeJBMDtksVy5tBCFBcwza9ZAPI8WEb4Pmj6nfwoGmbYgo4ZrFKddvoCVhCS
         LTww==
X-Gm-Message-State: ACgBeo1z37lHru3HOaaSOzq4BXoCn6pPCH6aAuu8llQPOfXKqSxDHBTU
	aC00gkG8dvxh+2qDk3B2dUSLPAWJesWHo42Z3UZP/A==
X-Google-Smtp-Source: AA6agR6m7scNwFemz6Af1WoGTDIcSPP5pnTPi8sC0t6BGCdPYrcUbrHz9JxtFN2qOLjSTkeI4M1Lodd/jngX9vslX64=
X-Received: by 2002:a0d:c981:0:b0:330:dc03:7387 with SMTP id
 l123-20020a0dc981000000b00330dc037387mr25164956ywd.380.1662074295806; Thu, 01
 Sep 2022 16:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901173516.702122-4-surenb@google.com>
 <20220901202239.tnnzlbermiyvkmih@moria.home.lan>
In-Reply-To: <20220901202239.tnnzlbermiyvkmih@moria.home.lan>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 1 Sep 2022 16:18:04 -0700
Message-ID: <CAJuCfpFqK+Gfd100C8s8jnJci+UCt9y6dqsn=eqYin6g-VVx6Q@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 03/28] mm: introduce __find_vma to be used
 without mmap_lock protection
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
Cc: Michel Lespinasse <michel@lespinasse.org>, Joel Fernandes <joelaf@google.com>, Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, bigeasy@linutronix.de, Peter Xu <peterx@redhat.com>, dhowells@redhat.com, linux-mm <linux-mm@kvack.org>, Jerome Glisse <jglisse@google.com>, Davidlohr Bueso <dave@stgolabs.net>, Minchan Kim <minchan@google.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Mel Gorman <mgorman@suse.de>, David Rientjes <rientjes@google.com>, Axel Rasmussen <axelrasmussen@google.com>, kernel-team <kernel-team@android.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, Andy Lutomirski <luto@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, Johannes
  Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 1, 2022 at 1:22 PM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Thu, Sep 01, 2022 at 10:34:51AM -0700, Suren Baghdasaryan wrote:
> > Add __find_vma function to be used for VMA lookup under rcu protection.
>
> So it was news to me that the rb tree code can be used for lockless lookups -
> not having looked at lib/rbtree.c in over 10 years :) - I still think it should
> be mentioned in the commit message that that's what you're doing and why it's
> safe, because it's not exactly common knowledge and lockless stuff deserves
> extra scrutiny.
>
> Probably worth a comment, too.

Ack.

>
> Reviewed-by: Kent Overstreet <kent.overstreet@linux.dev>

Thanks!

>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
