Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C957D35C474
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 12:54:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJlx45r2Hz3c1J
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 20:54:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=techsingularity.net (client-ip=46.22.136.237;
 helo=outbound-smtp53.blacknight.com; envelope-from=mgorman@techsingularity.net;
 receiver=<UNKNOWN>)
X-Greylist: delayed 347 seconds by postgrey-1.36 at boromir;
 Mon, 12 Apr 2021 20:54:15 AEST
Received: from outbound-smtp53.blacknight.com (outbound-smtp53.blacknight.com
 [46.22.136.237])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJlwl50Tlz2yhm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 20:54:15 +1000 (AEST)
Received: from mail.blacknight.com (pemlinmail05.blacknight.ie [81.17.254.26])
 by outbound-smtp53.blacknight.com (Postfix) with ESMTPS id 00062FB833
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 11:48:20 +0100 (IST)
Received: (qmail 29985 invoked from network); 12 Apr 2021 10:48:20 -0000
Received: from unknown (HELO techsingularity.net)
 (mgorman@techsingularity.net@[84.203.22.4])
 by 81.17.254.9 with ESMTPSA (AES256-SHA encrypted, authenticated);
 12 Apr 2021 10:48:20 -0000
Date: Mon, 12 Apr 2021 11:48:19 +0100
From: Mel Gorman <mgorman@techsingularity.net>
To: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [RFC/PATCH] powerpc/smp: Add SD_SHARE_PKG_RESOURCES flag to MC
 sched-domain
Message-ID: <20210412104819.GT3697@techsingularity.net>
References: <1617341874-1205-1-git-send-email-ego@linux.vnet.ibm.com>
 <20210412062436.GB2633526@linux.vnet.ibm.com>
 <20210412093722.GS3697@techsingularity.net>
 <871rbfom04.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <871rbfom04.mognet@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Vincent Guittot <vincent.guittot@linaro.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Rik van Riel <riel@surriel.com>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Parth Shah <parth@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Dietmar Eggemann <dietmar.eggemann@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 12, 2021 at 11:06:19AM +0100, Valentin Schneider wrote:
> On 12/04/21 10:37, Mel Gorman wrote:
> > On Mon, Apr 12, 2021 at 11:54:36AM +0530, Srikar Dronamraju wrote:
> >> * Gautham R. Shenoy <ego@linux.vnet.ibm.com> [2021-04-02 11:07:54]:
> >>
> >> >
> >> > To remedy this, this patch proposes that the LLC be moved to the MC
> >> > level which is a group of cores in one half of the chip.
> >> >
> >> >       SMT (SMT4) --> MC (Hemisphere)[LLC] --> DIE
> >> >
> >>
> >> I think marking Hemisphere as a LLC in a P10 scenario is a good idea.
> >>
> >> > While there is no cache being shared at this level, this is still the
> >> > level where some amount of cache-snooping takes place and it is
> >> > relatively faster to access the data from the caches of the cores
> >> > within this domain. With this change, we no longer see regressions on
> >> > P10 for applications which require single threaded performance.
> >>
> >> Peter, Valentin, Vincent, Mel, etal
> >>
> >> On architectures where we have multiple levels of cache access latencies
> >> within a DIE, (For example: one within the current LLC or SMT core and the
> >> other at MC or Hemisphere, and finally across hemispheres), do you have any
> >> suggestions on how we could handle the same in the core scheduler?
> >>
> >
> > Minimally I think it would be worth detecting when there are multiple
> > LLCs per node and detecting that in generic code as a static branch. In
> > select_idle_cpu, consider taking two passes -- first on the LLC domain
> > and if no idle CPU is found then taking a second pass if the search depth
> > allows within the node with the LLC CPUs masked out.
> 
> I think that's actually a decent approach. Tying SD_SHARE_PKG_RESOURCES to
> something other than pure cache topology in a generic manner is tough (as
> it relies on murky, ill-defined hardware fabric properties).
> 

Agreed. The LLC->node scan idea has been on my TODO list to try for
a while.

> Last I tried thinking about that, I stopped at having a core-to-core
> latency matrix, building domains off of that, and having some knob
> specifying the highest distance value below which we'd set
> SD_SHARE_PKG_RESOURCES. There's a few things I 'hate' about that; for one
> it makes cpus_share_cache() somewhat questionable.
> 

And I thought about something like this too but worried it might get
complex, particularly on chiplets where we do not necessarily have
hardware info on latency depending on how it's wired up. It also might
lead to excessive cpumask manipulation in a fast path if we have to
traverse multiple distances with search cost exceeding gains from latency
reduction. Hence -- keeping it simple with two level only, LLC then node
within the allowed search depth and see what that gets us. It might be
"good enough" in most cases and would be a basis for comparison against
complex approaches.

At minimum, I expect IBM can evaluate the POWER10 aspect and I can run
an evaluation on Zen generations.

-- 
Mel Gorman
SUSE Labs
