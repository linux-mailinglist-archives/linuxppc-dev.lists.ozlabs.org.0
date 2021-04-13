Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2519435D887
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 09:11:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKGx10jFJz3byn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 17:11:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=c1l8+6FE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12b;
 helo=mail-lf1-x12b.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=c1l8+6FE; dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKGwX1YXzz3049
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 17:10:49 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id b4so25650522lfi.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 00:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v9FRv+BSyLXBPF4PpQQH/o+ADSo7dCk0iAUv3EspJDU=;
 b=c1l8+6FEclvJWP67sekGDY0rEeEbcWi8oSJaEhTsC+KGoNmwQGHFmVTUcm90Z7uVx+
 6wErS/35D0yDPJrH8sXsvtrKkuUKQwklo3zIpmlaBUN0DmH2UusXfQkDiZoZmoRtQeEX
 9vqBKViYKGupGnblthu+5O8RDWGDQO+C2SP7l93y6dZnccov7siOtI599iYhscrDjDwu
 7N/2H0R5kZIpisFhHH1zwDnyJewRcSd3NfnQETzI98EKuHdeibjMuQO36Zh1WklSnG3N
 bRFS+bXQjXab+DkFgHZFevIDKNy/p7k/HKF2Ty3ssnWpH6ifZPoRGuqSGzrnBdhD6Z6V
 SyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v9FRv+BSyLXBPF4PpQQH/o+ADSo7dCk0iAUv3EspJDU=;
 b=a7nHapwVpl7ZWetLXutdt1dfx2+lhKox1JFVJayIiZEE9+59sRV+JRXYLHI9txOZfZ
 /L8ttLnjbSKEojyAhOryicA0h0JoMMM35ds6inPikvFBBFcrtwhjMmjg93cNVvJrh9tN
 Vsp5uw+XIzAVw+AetFGEmNbKnAfK0LYx/mONvSj2F/Oz9rLYXIaURWMozTvMUIv5aC4M
 gX++wKm/kneOkTikTt1DoXgQGksVVjo2TfQAwhB50qC3CH8gGtdch30Mg7nJP6RgWriy
 Cq1mC5nE5KiQhkE57wzPZnXNP1wdafZpVlU0+4MzVnIvvcoeV9oS62ELlGg9zTpbRSDy
 G2lQ==
X-Gm-Message-State: AOAM533HE/dzgwooIfKdz3/g1DzKORUh3drXvqBaqJd0ZAcg4LwxZ/3v
 Xjce16+KDBg/jghsiQlQYDafSKn6Qi3Nw/qE2e1Llw==
X-Google-Smtp-Source: ABdhPJwb5xuCcOasc2Mz2bGUZr1Qtm/1SPcB5Y+duFeKCwYx+TagcRsU8lMSRelzE1z7969v2v8KGKtE2QW8oKxKSWA=
X-Received: by 2002:ac2:5986:: with SMTP id w6mr6945656lfn.470.1618297842711; 
 Tue, 13 Apr 2021 00:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <1617341874-1205-1-git-send-email-ego@linux.vnet.ibm.com>
 <20210412062436.GB2633526@linux.vnet.ibm.com>
 <20210412093722.GS3697@techsingularity.net>
 <CAKfTPtDX-p=gWAVgYzLNCNuQ2e=QP2pTeMs=BmNBo31fpGKxrg@mail.gmail.com>
 <20210412152444.GA3697@techsingularity.net>
In-Reply-To: <20210412152444.GA3697@techsingularity.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 13 Apr 2021 09:10:31 +0200
Message-ID: <CAKfTPtDTyyrqBymQx16P+uhQKZkCyCNvDtEebG7FX5Emh=kkCg@mail.gmail.com>
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

On Mon, 12 Apr 2021 at 17:24, Mel Gorman <mgorman@techsingularity.net> wrote:
>
> On Mon, Apr 12, 2021 at 02:21:47PM +0200, Vincent Guittot wrote:
> > > > Peter, Valentin, Vincent, Mel, etal
> > > >
> > > > On architectures where we have multiple levels of cache access latencies
> > > > within a DIE, (For example: one within the current LLC or SMT core and the
> > > > other at MC or Hemisphere, and finally across hemispheres), do you have any
> > > > suggestions on how we could handle the same in the core scheduler?
> >
> > I would say that SD_SHARE_PKG_RESOURCES is there for that and doesn't
> > only rely on cache
> >
>
> From topology.c
>
>         SD_SHARE_PKG_RESOURCES - describes shared caches
>
> I'm guessing here because I am not familiar with power10 but the central
> problem appears to be when to prefer selecting a CPU sharing L2 or L3
> cache and the core assumes the last-level-cache is the only relevant one.
>
> For this patch, I wondered if setting SD_SHARE_PKG_RESOURCES would have
> unintended consequences for load balancing because load within a die may
> not be spread between SMT4 domains if SD_SHARE_PKG_RESOURCES was set at
> the MC level.

But the SMT4 level is still present  here with select_idle_core taking
of the spreading

>
> > >
> > > Minimally I think it would be worth detecting when there are multiple
> > > LLCs per node and detecting that in generic code as a static branch. In
> > > select_idle_cpu, consider taking two passes -- first on the LLC domain
> > > and if no idle CPU is found then taking a second pass if the search depth
> >
> > We have done a lot of changes to reduce and optimize the fast path and
> > I don't think re adding another layer  in the fast path makes sense as
> > you will end up unrolling the for_each_domain behind some
> > static_banches.
> >
>
> Searching the node would only happen if a) there was enough search depth
> left and b) there were no idle CPUs at the LLC level. As no new domain
> is added, it's not clear to me why for_each_domain would change.

What I mean is that you should directly do for_each_sched_domain in
the fast path because that what you are proposing at the end. It's no
more looks like a fast path but a traditional LB

>
> But still, your comment reminded me that different architectures have
> different requirements
>
> Power 10 appears to prefer CPU selection sharing L2 cache but desires
>         spillover to L3 when selecting and idle CPU.
>
> X86 varies, it might want the Power10 approach for some families and prefer
>         L3 spilling over to a CPU on the same node in others.
>
> S390 cares about something called books and drawers although I've no
>         what it means as such and whether it has any preferences on
>         search order.
>
> ARM has similar requirements again according to "scheduler: expose the
>         topology of clusters and add cluster scheduler" and that one *does*
>         add another domain.
>
> I had forgotten about the ARM patches but remembered that they were
> interesting because they potentially help the Zen situation but I didn't
> get the chance to review them before they fell off my radar again. About
> all I recall is that I thought the "cluster" terminology was vague.
>
> The only commonality I thought might exist is that architectures may
> like to define what the first domain to search for an idle CPU and a
> second domain. Alternatively, architectures could specify a domain to
> search primarily but also search the next domain in the hierarchy if
> search depth permits. The default would be the existing behaviour --
> search CPUs sharing a last-level-cache.
>
> > SD_SHARE_PKG_RESOURCES should be set to the last level where we can
> > efficiently move task between CPUs at wakeup
> >
>
> The definition of "efficiently" varies. Moving tasks between CPUs sharing
> a cache is most efficient but moving the task to a CPU that at least has
> local memory channels is a reasonable option if there are no idle CPUs
> sharing cache and preferable to stacking.

That's why setting SD_SHARE_PKG_RESOURCES for P10 looks fine to me.
This last level of SD_SHARE_PKG_RESOURCES should define the cpumask to
be considered  in fast path

>
> > > allows within the node with the LLC CPUs masked out. While there would be
> > > a latency hit because cache is not shared, it would still be a CPU local
> > > to memory that is idle. That would potentially be beneficial on Zen*
> > > as well without having to introduce new domains in the topology hierarchy.
> >
> > What is the current sched_domain topology description for zen ?
> >
>
> The cache and NUMA topologies differ slightly between each generation
> of Zen. The common pattern is that a single NUMA node can have multiple
> L3 caches and at one point I thought it might be reasonable to allow
> spillover to select a local idle CPU instead of stacking multiple tasks
> on a CPU sharing cache. I never got as far as thinking how it could be
> done in a way that multiple architectures would be happy with.
>
> --
> Mel Gorman
> SUSE Labs
