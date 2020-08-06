Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D5823D670
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 07:34:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMccD5MZWzDqkq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 15:34:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMcZQ652vzDqC7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 15:32:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nuKhZKT7; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BMcZN6xgVz9sPC;
 Thu,  6 Aug 2020 15:32:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596691950;
 bh=2HovLx+4ZKXsUcbswQosVHxHyh/z8bC5HwmMP+O52ws=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=nuKhZKT7SdhVCfPRS29PlgF8KGqa8Jl5TUpGzWocoNBFJg2UI7i3+c6p+Nt/lvFcg
 55NcaIMYrcOne+FfmfkWlOOl++uWtoClywpdNvGd6mIkWmV8XKK7f8ahUY7xTgZ0wB
 8EukT+ma+XCNS62QmD3n2dGispTyt7sJNWk7tfzAU6GSkhzmFSGcDtbyUs8fmz+huR
 m5roCMIzEvT2W7yNsNZeOoRDXCNvnre8Xr24kcAkJug4oD6h7/32HBz+L/KEvc07Bc
 xpH9jt1ErYAdmm+4xQ/gUW/Pw6v2txQIeZrFooGwZN5ky30xfGKwzSzb5qBhQK6flU
 Ph03wS4M5s1bQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: peterz@infradead.org, Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] sched/topology: Allow archs to override cpu_smt_mask
In-Reply-To: <20200804124755.GJ2674@hirez.programming.kicks-ass.net>
References: <20200804033307.76111-1-srikar@linux.vnet.ibm.com>
 <20200804104520.GB2657@hirez.programming.kicks-ass.net>
 <20200804121007.GJ24375@linux.vnet.ibm.com>
 <20200804124755.GJ2674@hirez.programming.kicks-ass.net>
Date: Thu, 06 Aug 2020 15:32:25 +1000
Message-ID: <87ft90z6dy.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, Rik van Riel <riel@surriel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mel Gorman <mgorman@techsingularity.net>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

peterz@infradead.org writes:
> On Tue, Aug 04, 2020 at 05:40:07PM +0530, Srikar Dronamraju wrote:
>> * peterz@infradead.org <peterz@infradead.org> [2020-08-04 12:45:20]:
>> 
>> > On Tue, Aug 04, 2020 at 09:03:06AM +0530, Srikar Dronamraju wrote:
>> > > cpu_smt_mask tracks topology_sibling_cpumask. This would be good for
>> > > most architectures. One of the users of cpu_smt_mask(), would be to
>> > > identify idle-cores. On Power9, a pair of cores can be presented by the
>> > > firmware as a big-core for backward compatibility reasons.
>> > > 
>> > > In order to maintain userspace backward compatibility with previous
>> > > versions of processor, (since Power8 had SMT8 cores), Power9 onwards there
>> > > is option to the firmware to advertise a pair of SMT4 cores as a fused
>> > > cores (referred to as the big_core mode in the Linux Kernel). On Power9
>> > > this pair shares the L2 cache as well. However, from the scheduler's point
>> > > of view, a core should be determined by SMT4. The load-balancer already
>> > > does this. Hence allow PowerPc architecture to override the default
>> > > cpu_smt_mask() to point to the SMT4 cores in a big_core mode.
>> > 
>> > I'm utterly confused.
>> > 
>> > Why can't you set your regular siblings mask to the smt4 thing? Who
>> > cares about the compat stuff, I thought that was an LPAR/AIX thing.

To be clear this stuff is all for when we're running on the PowerVM machines,
ie. as LPARs.

That brings with it a bunch of problems, such as existing software that
has been developed/configured for Power8 and expects to see SMT8.

We also allow LPARs to be live migrated from Power8 to Power9 (and back), so
maintaining the illusion of SMT8 is considered a requirement to make that work.

>> There are no technical challenges to set the sibling mask to SMT4.
>> This is for Linux running on PowerVM. When these Power9 boxes are sold /
>> marketed as X core boxes (where X stand for SMT8 cores).  Since on PowerVM
>> world, everything is in SMT8 mode, the device tree properties still mark
>> the system to be running on 8 thread core. There are a number of utilities
>> like ppc64_cpu that directly read from device-tree. They would get core
>> count and thread count which is SMT8 based.
>> 
>> If the sibling_mask is set to small core, then same user when looking at
>
> FWIW, I find the small/big core naming utterly confusing vs the
> big/little naming from ARM. When you say small, I'm thinking of
> asymmetric cores, not SMT4/SMT8.

Yeah I agree the naming is confusing.

Let's call them "SMT4 cores" and "SMT8 cores"?

>> output from lscpu and other utilities that look at sysfs will start seeing
>> 2x number of cores to what he had provisioned and what the utilities from
>> the device-tree show. This can gets users confused.
>
> One will report SMT8 and the other SMT4, right? So only users that
> cannot read will be confused, but if you can't read, confusion is
> guaranteed anyway.

It's partly users, but also software that would see different values depending
on where it looks.

> Also, by exposing the true (SMT4) topology to userspace, userspace
> applications could behave better -- for those few that actually parse
> the topology information.

Agreed, though as you say there aren't that many that actually use the low-level
topology information.

>> So to keep the device-tree properties, utilities depending on device-tree,
>> sysfs and utilities depending on sysfs on the same page, userspace are only
>> exposed as SMT8.
>
> I'm not convinced it makes sense to lie to userspace just to accomodate
> a few users that cannot read.

The problem is we are already lying to userspace, because firmware lies to us.

ie. the firmware on these systems shows us an SMT8 core, and so current kernels
show SMT8 to userspace. I don't think we can realistically change that fact now,
as these systems are already out in the field.

What this patch tries to do is undo some of the mess, and at least give the
scheduler the right information.

cheers
