Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8749D5EEB37
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 03:49:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdGVw4HGHz3c9K
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 11:49:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l29wlCP/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l29wlCP/;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdGVK6vplz2xB5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 11:48:40 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so3146371pjh.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 18:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=/OCOFJ8yv8vLyEipobOYLNhRBPMRQlwFwa2A4JKCMIw=;
        b=l29wlCP/wt3ggiGMnqSwW33X979kGAbDJ14z7ZLpEYdQhusOJ6foHm3gsVG2w5KWSX
         deeKGiHkwjR7xNdSnc7Y0hcn6NCgAj5qoqvioaiNcjsVfskqDdOTZPUcaBgQBrriRRGa
         SlWLGTZNqQTHA3+1PTFg4zv/VdjUOh9bNwFVQ3fDU7hFF1nwXXy7NbzwYK0L9M3kIzO/
         YRtlJho4GEKPjBJlav4+XWAk1W7krE0NNPB5BS4JuZNlJnkOYsk5QQc7+yqr/lySA/GQ
         +HbZUTXq6E4LMCCf+RDXrlzTpfVDE/OMYaPV640DDuRkKLsgo6Og6HB4qMxX9ALTggfq
         hBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=/OCOFJ8yv8vLyEipobOYLNhRBPMRQlwFwa2A4JKCMIw=;
        b=mRlVfeTumGxyofgK8dOgqM9r24HvP8BpAiblqSjfHA1myD5BHA27lRNkdRZgn6jcCE
         /QNjaQoa2qPK2RtKcl0ItTUeuUZvv7AcAptSGN3zIIABIgVcHjbB9hyVQ57fKpjd3yfu
         rwYjN6xMXOUM/gsBloxrE0KeaPvW2X0sbuhZRrbhwMrupuO6GeLE8+LhopTQhRVBNEQ/
         ivET36UlBITazt1JW9UGgTMoj1SLs1QcbUhxx10XmqUJ71tXrkTi1NEG8unjCWZM1las
         BdMJP8xAN58B5lQjcoFccWVbG0TZZES6dOgnXXB1FE7EpGWZ4BSdQt2LUNrgb5+cGLnj
         HBPg==
X-Gm-Message-State: ACrzQf3G8GMDqeYhIWuIg61lsSHBzDvVBv/i49rE0HzkLqVB82/+pD0C
	hAO0OJ1MMBDc7lMHURydv8Wl/WS3fPsSoGY+pa4=
X-Google-Smtp-Source: AMsMyM5eSe8qr+SOZYpqgNu5YozB6o1FE/ZaJbYMxTVONq7cvElElHohBasaenz9QOFMfVGK/ysLqRHd6/63N8OsfW8=
X-Received: by 2002:a17:90b:33c9:b0:200:9ec2:f2eb with SMTP id
 lk9-20020a17090b33c900b002009ec2f2ebmr1013554pjb.29.1664416117307; Wed, 28
 Sep 2022 18:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220927014823.11439-1-zhouzhouyi@gmail.com> <CN6WCMKCWHOG.LT2QV3910UJ2@bobo>
 <CAABZP2wYcNXkTo=tgX-ARziwgD2rng+-wCZ-qfQ6M30+vmLEug@mail.gmail.com> <CN7OZ6TMLLFS.2HER50Q3SO480@bobo>
In-Reply-To: <CN7OZ6TMLLFS.2HER50Q3SO480@bobo>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Thu, 29 Sep 2022 09:48:26 +0800
Message-ID: <CAABZP2xu5w9Ec8LmTUrF31KhY3HCcBjQYSk4xo14bdB9mxOz+A@mail.gmail.com>
Subject: Re: [PATCH linux-next][RFC] powerpc: avoid lockdep when we are offline
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: atrajeev@linux.vnet.ibm.com, paulmck@kernel.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org, lance@osuosl.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 28, 2022 at 10:51 AM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> On Wed Sep 28, 2022 at 11:48 AM AEST, Zhouyi Zhou wrote:
> > Thank Nick for reviewing my patch
> >
> > On Tue, Sep 27, 2022 at 12:25 PM Nicholas Piggin <npiggin@gmail.com> wrote:
> > >
> > > On Tue Sep 27, 2022 at 11:48 AM AEST, Zhouyi Zhou wrote:
> > > > This is second version of my fix to PPC's  "WARNING: suspicious RCU usage",
> > > > I improved my fix under Paul E. McKenney's guidance:
> > > > Link: https://lore.kernel.org/lkml/20220914021528.15946-1-zhouzhouyi@gmail.com/T/
> > > >
> > > > During the cpu offlining, the sub functions of xive_teardown_cpu will
> > > > call __lock_acquire when CONFIG_LOCKDEP=y. The latter function will
> > > > travel RCU protected list, so "WARNING: suspicious RCU usage" will be
> > > > triggered.
> > > >
> > > > Avoid lockdep when we are offline.
> > >
> > > I don't see how this is safe. If RCU is no longer watching the CPU then
> > > the memory it is accessing here could be concurrently freed. I think the
> > > warning is valid.
> > Agree
> > >
> > > powerpc's problem is that cpuhp_report_idle_dead() is called before
> > > arch_cpu_idle_dead(), so it must not rely on any RCU protection there.
> > > I would say xive cleanup just needs to be done earlier. I wonder why it
> > > is not done in __cpu_disable or thereabouts, that's where the interrupt
> > > controller is supposed to be stopped.
> > Yes, I learn flowing events sequence from kgdb debugging
> > __cpu_disable -> pseries_cpu_disable -> set_cpu_online(cpu, false)  =
> > leads to =>  do_idle: if (cpu_is_offline(cpu) -> arch_cpu_idle_dead
> > so xive cleanup should be done in pseries_cpu_disable.
>
> It's a good catch and a reasonable approach to the problem.
Thank Nick for your encouragement ;-)
>
> > But as a beginner, I afraid that I am incompetent to do above
> > sophisticated work without error although I am very like to,
> > Could any expert do this for us?
>
> This will be difficult for anybody, it's tricky code. I'm not an
> expert at it.
>
> It looks like the interrupt controller disable split has been there
> since long before xive. I would try just move them together than see
> if that works.
Yes, I use "git blame" (I learned "git blame" from Paul E. McKenny ;-)
) to see the same.
and anticipate your great works!
>
> Documentation/core-api/cpu_hotplug.rst says that __cpu_disable should
> shut down the interrupt handler. So if there is a complication it
> would probably be from powerpc-specific CPU hotplug  or interrupt
> code.
Thank Nick for your guidance! I studied
Documentation/core-api/cpu_hotplug.rst this morning.
I also found X86 shut down the interrupt handler in __cpu_disable
according to above document.

Many Thanks
Zhouyi
>
> Thanks,
> Nick
>
