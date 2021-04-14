Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6A835EDFB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 09:01:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKtfr0mqzz3bsc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 17:01:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m4Lsr95G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m4Lsr95G; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKtfJ0Vxwz2yxW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 17:00:39 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13E6YMN3042295; Wed, 14 Apr 2021 03:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=raJqcwTVs+41fHbXXjoTOYf9SOr/MbUEGXOnMOG5nGA=;
 b=m4Lsr95G6jIns8C2NUTF7Fv7mqHvFv5vtvRHL4qNpXztntJ2XIB/rGgTecOWWdq4VcOa
 WONv3mGxvorkCx0qR0MCZVux3DaC8dn55EI9fiUMDz99mMER8X2MQNyAB/ywUW4JDdku
 sHq4lTTxlL9uLGCDAjXjgucFhctgxcg7Hs39NtkcoxCT3B2mUv2eXfjtdcrsY5WjrNOY
 r7SrLUy3ayxen3jAWij06A8Kn8Stb69GC23p+jOjRLQ4se8x7yliTclJaxYWU6udzTN/
 hdDMtNyBxdhUNw3umiiUKIr0ZFcrpgVoD1fP6ihqdtQFempJ9VyV0cOoZ3QtLQIZfXJX Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37wckqneb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 03:00:27 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13E6YMho042275;
 Wed, 14 Apr 2021 03:00:26 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37wckqne9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 03:00:26 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13E6lbTF021971;
 Wed, 14 Apr 2021 07:00:24 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 37u3n9f3uw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 07:00:24 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13E70NSx11862464
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 07:00:23 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97194BE04F;
 Wed, 14 Apr 2021 07:00:22 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABE83BE05B;
 Wed, 14 Apr 2021 07:00:21 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.87.221])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 14 Apr 2021 07:00:21 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id A46412E2EE0; Wed, 14 Apr 2021 12:30:15 +0530 (IST)
Date: Wed, 14 Apr 2021 12:30:15 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Mel Gorman <mgorman@techsingularity.net>
Subject: Re: [RFC/PATCH] powerpc/smp: Add SD_SHARE_PKG_RESOURCES flag to MC
 sched-domain
Message-ID: <20210414070015.GA13782@in.ibm.com>
References: <1617341874-1205-1-git-send-email-ego@linux.vnet.ibm.com>
 <20210412062436.GB2633526@linux.vnet.ibm.com>
 <20210412093722.GS3697@techsingularity.net>
 <CAKfTPtDX-p=gWAVgYzLNCNuQ2e=QP2pTeMs=BmNBo31fpGKxrg@mail.gmail.com>
 <20210412152444.GA3697@techsingularity.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412152444.GA3697@techsingularity.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kFynrLuJ4r2sOXKzW73-gUCS3BBZsJnV
X-Proofpoint-GUID: CS3P5BlLRj7PzTPC7Av8-Lo1vvaSKa3s
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-14_03:2021-04-14,
 2021-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140043
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
Reply-To: ego@linux.vnet.ibm.com
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Rik van Riel <riel@surriel.com>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Parth Shah <parth@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Mel,

On Mon, Apr 12, 2021 at 04:24:44PM +0100, Mel Gorman wrote:
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
> >From topology.c
> 
> 	SD_SHARE_PKG_RESOURCES - describes shared caches
>

Yes, I was aware of this shared caches, but this current patch was the
simplest way to achieve the effect, though the cores in the MC domain
on POWER10 do not share a cache. However, it is relatively faster to
transfer data across the cores within the MC domain compared to the
cores outside the MC domain in the Die.


> I'm guessing here because I am not familiar with power10 but the central
> problem appears to be when to prefer selecting a CPU sharing L2 or L3
> cache and the core assumes the last-level-cache is the only relevant one.
>

On POWER we have traditionally preferred to keep the LLC at the
sched-domain comprising of groups of CPUs that share the L2 (since L3
is a victim cache on POWER).

On POWER9, the L2 was shared by the threads of a pair of SMT4 cores,
while on POWER10, L2 is shared by threads of a single SMT4 core.

Thus, the current task wake-up logic would have a lower probability of
finding an idle core inside an LLC since it has only one core to
search in the LLC. This is why moving the LLC to the parent domain
(MC) consisting of a group of SMT4 cores among which snooping the
cache-data is faster is helpful for workloads that require the single
threaded performance.


> For this patch, I wondered if setting SD_SHARE_PKG_RESOURCES would have
> unintended consequences for load balancing because load within a die may
> not be spread between SMT4 domains if SD_SHARE_PKG_RESOURCES was set at
> the MC level.


Since we are adding the SD_SHARE_PKG_RESOURCES to the parent of the
the only sched-domain (which is a SMT4 domain) which currently has
this flag set, would it cause issues in spreading the load between the
SMT4 domains ?

Are there any tests/benchmarks that can help bring this out? It could
be good to understand this.

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
> 
> But still, your comment reminded me that different architectures have
> different requirements
> 
> Power 10 appears to prefer CPU selection sharing L2 cache but desires
> 	spillover to L3 when selecting and idle CPU.
>

Indeed, so on POWER10, the preference would be
1) idle core in the L2 domain.
2) idle core in the MC domain.
3) idle CPU  in the L2 domain
4) idle CPU  in the MC domain.

This patch is able to achieve this *implicitly* because of the way the
select_idle_cpu() and the select_idle_core() is currently coded, where
in the presence of idle cores in the MC level, the select_idle_core()
searches for the idle core starting with the core of the target-CPU.

If I understand your proposal correctly it would be to make this
explicit into a two level search where we first search in the LLC
domain, failing which, we carry on the search in the rest of the die
(assuming that the LLC is not in the die).


> X86 varies, it might want the Power10 approach for some families and prefer
> 	L3 spilling over to a CPU on the same node in others.
> 
> S390 cares about something called books and drawers although I've no
> 	what it means as such and whether it has any preferences on
> 	search order.
> 
> ARM has similar requirements again according to "scheduler: expose the
> 	topology of clusters and add cluster scheduler" and that one *does*
> 	add another domain.
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

In case of Zen, do we have multiple cores sharing the L3 cache ? Are
these modelled as a separate sched-domain ? 




> 
> -- 
> Mel Gorman
> SUSE Labs
