Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D34D35C61F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 14:22:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJntZ1HP4z309W
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 22:22:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uNsHyYk5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uNsHyYk5; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJnt83mZZz2yZ6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 22:22:07 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id j18so21080249lfg.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 05:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7jGUYvG/VpC5dfomQS+f5L/i07bp1VPDdzETKNMiL1s=;
 b=uNsHyYk5XOw/ru9fHS2JRlmrhXQ0+AH9AV4jC/P07+q/ZsjeP37Tys7h6eX17FaC1+
 uH/cXTES6FoGYRsFVqMuAdP/DBfXpCD0Cr18XAmq24G+F+YM2rVFRtxpSL6qmZMMLsV8
 qUYUhkltcPYAYYlIjSRZgMN/MCoVmwrRxmCa9PabGe/iH/3lSd3wcTUDeoccI6DAlEjM
 2CTFkuk/mNxyhEU5E2/XYrtcGbpwtRtBTHweAibeOYRnXkSdfLy1Cq128NB4aViM2bw6
 B9XkKp5ItdmBJxb8he1i/MOxSHXPYNm0CjJ1KXh4fJKALspIqwG1cagCnmyo/11bJjtG
 Qpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7jGUYvG/VpC5dfomQS+f5L/i07bp1VPDdzETKNMiL1s=;
 b=mY4BLHS6jLrFXQH6pkFwDq0GGa8gG2fJJS096tDfPIM9ILkdAxMGBjhcDuPZLX8QOb
 JWGXXqpQRPLAgQulxdLf8PfzfPP/rdbt6WohPyI1EsCETd2TZrYOQjxvuAjTqQPACDra
 B+JbRZWHAy1CKZ3eoSuoXGUCPifzYGlPpJZABPg8Lnwp/nJ2hKrt+t0gbsKhTrNp/tFA
 gIrH0gefRHAwYirYKlWzrp3M0vQT7Pk+imZ44EKZxz2i3zER11fTp9NPY/sXxUGmuSaV
 UJAVlpWX0ovFK/YWVtR9enfJ0xrurlaYFlVyv9iMMnYMz8FTq5HENbLxeV4dWUpp44Jl
 YbLA==
X-Gm-Message-State: AOAM533pdtA/MeoXU+wzABpTq5fC2VOmLVq5ko/4svQGVHB/qUBavC0K
 PF7Np/Tlr9HZVFkZo1eNE1x1jV3FsVCia5IOPHFsRg==
X-Google-Smtp-Source: ABdhPJw2aczAxT3OpeQMNApU63p9MloiCGzJo7fc9SRJVYCTmf+bpXSpLlMv8XcfNWJvJIoL1nWNrMoLVT0Eit/FZ1c=
X-Received: by 2002:a19:4082:: with SMTP id
 n124mr17935716lfa.154.1618230119272; 
 Mon, 12 Apr 2021 05:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <1617341874-1205-1-git-send-email-ego@linux.vnet.ibm.com>
 <20210412062436.GB2633526@linux.vnet.ibm.com>
 <20210412093722.GS3697@techsingularity.net>
In-Reply-To: <20210412093722.GS3697@techsingularity.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 12 Apr 2021 14:21:47 +0200
Message-ID: <CAKfTPtDX-p=gWAVgYzLNCNuQ2e=QP2pTeMs=BmNBo31fpGKxrg@mail.gmail.com>
Subject: Re: [RFC/PATCH] powerpc/smp: Add SD_SHARE_PKG_RESOURCES flag to MC
 sched-domain
To: Mel Gorman <mgorman@techsingularity.net>
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Rik van Riel <riel@surriel.com>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Parth Shah <parth@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 12 Apr 2021 at 11:37, Mel Gorman <mgorman@techsingularity.net> wrote:
>
> On Mon, Apr 12, 2021 at 11:54:36AM +0530, Srikar Dronamraju wrote:
> > * Gautham R. Shenoy <ego@linux.vnet.ibm.com> [2021-04-02 11:07:54]:
> >
> > >
> > > To remedy this, this patch proposes that the LLC be moved to the MC
> > > level which is a group of cores in one half of the chip.
> > >
> > >       SMT (SMT4) --> MC (Hemisphere)[LLC] --> DIE
> > >
> >
> > I think marking Hemisphere as a LLC in a P10 scenario is a good idea.
> >
> > > While there is no cache being shared at this level, this is still the
> > > level where some amount of cache-snooping takes place and it is
> > > relatively faster to access the data from the caches of the cores
> > > within this domain. With this change, we no longer see regressions on
> > > P10 for applications which require single threaded performance.
> >
> > Peter, Valentin, Vincent, Mel, etal
> >
> > On architectures where we have multiple levels of cache access latencies
> > within a DIE, (For example: one within the current LLC or SMT core and the
> > other at MC or Hemisphere, and finally across hemispheres), do you have any
> > suggestions on how we could handle the same in the core scheduler?

I would say that SD_SHARE_PKG_RESOURCES is there for that and doesn't
only rely on cache

> >
>
> Minimally I think it would be worth detecting when there are multiple
> LLCs per node and detecting that in generic code as a static branch. In
> select_idle_cpu, consider taking two passes -- first on the LLC domain
> and if no idle CPU is found then taking a second pass if the search depth

We have done a lot of changes to reduce and optimize the fast path and
I don't think re adding another layer  in the fast path makes sense as
you will end up unrolling the for_each_domain behind some
static_banches.

SD_SHARE_PKG_RESOURCES should be set to the last level where we can
efficiently move task between CPUs at wakeup

> allows within the node with the LLC CPUs masked out. While there would be
> a latency hit because cache is not shared, it would still be a CPU local
> to memory that is idle. That would potentially be beneficial on Zen*
> as well without having to introduce new domains in the topology hierarchy.

What is the current sched_domain topology description for zen ?

>
> --
> Mel Gorman
> SUSE Labs
