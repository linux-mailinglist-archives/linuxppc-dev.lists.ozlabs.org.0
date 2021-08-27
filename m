Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CC23FA019
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 21:45:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx9Cp4t1Bz3bmc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 05:44:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx9CJ3j0Mz2yYl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 05:44:27 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10089"; a="205152054"
X-IronPort-AV: E=Sophos;i="5.84,357,1620716400"; d="scan'208";a="205152054"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2021 12:43:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,357,1620716400"; d="scan'208";a="528418837"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Aug 2021 12:43:22 -0700
Date: Fri, 27 Aug 2021 12:43:14 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH v4 6/6] sched/fair: Consider SMT in ASYM_PACKING load
 balance
Message-ID: <20210827194314.GA14720@ranerica-svr.sc.intel.com>
References: <20210810144145.18776-1-ricardo.neri-calderon@linux.intel.com>
 <20210810144145.18776-7-ricardo.neri-calderon@linux.intel.com>
 <CAKfTPtArtmhLG5QYR6TzKevDrEuiQu2HJxm_C3pe549XdGU-1g@mail.gmail.com>
 <YSj7PrVGVpcKf/vz@hirez.programming.kicks-ass.net>
 <CAKfTPtBvhHBA-BLkh-fd2eJk_JOm2chgMy6AKpR=WV_hc3sQKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtBvhHBA-BLkh-fd2eJk_JOm2chgMy6AKpR=WV_hc3sQKA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Aubrey Li <aubrey.li@linux.intel.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ricardo Neri <ricardo.neri@intel.com>,
 Ben Segall <bsegall@google.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Ingo Molnar <mingo@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Len Brown <len.brown@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Aubrey Li <aubrey.li@intel.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Tim Chen <tim.c.chen@linux.intel.com>, Quentin Perret <qperret@google.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 27, 2021 at 05:17:22PM +0200, Vincent Guittot wrote:
> On Fri, 27 Aug 2021 at 16:50, Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Fri, Aug 27, 2021 at 12:13:42PM +0200, Vincent Guittot wrote:
> > > > +/**
> > > > + * asym_smt_can_pull_tasks - Check whether the load balancing CPU can pull tasks
> > > > + * @dst_cpu:   Destination CPU of the load balancing
> > > > + * @sds:       Load-balancing data with statistics of the local group
> > > > + * @sgs:       Load-balancing statistics of the candidate busiest group
> > > > + * @sg:                The candidate busiet group
> > > > + *
> > > > + * Check the state of the SMT siblings of both @sds::local and @sg and decide
> > > > + * if @dst_cpu can pull tasks. If @dst_cpu does not have SMT siblings, it can
> > > > + * pull tasks if two or more of the SMT siblings of @sg are busy. If only one
> > > > + * CPU in @sg is busy, pull tasks only if @dst_cpu has higher priority.
> > > > + *
> > > > + * If both @dst_cpu and @sg have SMT siblings, even the number of idle CPUs
> > > > + * between @sds::local and @sg. Thus, pull tasks from @sg if the difference
> > > > + * between the number of busy CPUs is 2 or more. If the difference is of 1,
> > > > + * only pull if @dst_cpu has higher priority. If @sg does not have SMT siblings
> > > > + * only pull tasks if all of the SMT siblings of @dst_cpu are idle and @sg
> > > > + * has lower priority.
> > > > + */
> > > > +static bool asym_smt_can_pull_tasks(int dst_cpu, struct sd_lb_stats *sds,
> > > > +                                   struct sg_lb_stats *sgs,
> > > > +                                   struct sched_group *sg)
> > > > +{
> > > > +#ifdef CONFIG_SCHED_SMT
> > > > +       bool local_is_smt, sg_is_smt;
> > > > +       int sg_busy_cpus;
> > > > +
> > > > +       local_is_smt = sds->local->flags & SD_SHARE_CPUCAPACITY;
> > > > +       sg_is_smt = sg->flags & SD_SHARE_CPUCAPACITY;
> > > > +
> > > > +       sg_busy_cpus = sgs->group_weight - sgs->idle_cpus;
> > > > +
> > > > +       if (!local_is_smt) {
> > > > +               /*
> > > > +                * If we are here, @dst_cpu is idle and does not have SMT
> > > > +                * siblings. Pull tasks if candidate group has two or more
> > > > +                * busy CPUs.
> > > > +                */
> > > > +               if (sg_is_smt && sg_busy_cpus >= 2)
> > > > +                       return true;
> > > > +
> > > > +               /*
> > > > +                * @dst_cpu does not have SMT siblings. @sg may have SMT
> > > > +                * siblings and only one is busy. In such case, @dst_cpu
> > > > +                * can help if it has higher priority and is idle.
> > > > +                */
> > > > +               return !sds->local_stat.group_util &&
> > >
> > > sds->local_stat.group_util can't be used to decide if a CPU or group
> > > of CPUs is idle. util_avg is usually not null when a CPU becomes idle
> > > and you can have to wait  more than 300ms before it becomes Null
> > > At the opposite, the utilization of a CPU can be null but a task with
> > > null utilization has just woken up on it.
> > > Utilization is used to reflect the average work of the CPU or group of
> > > CPUs but not the current state
> >
> > If you want immediate idle, sgs->nr_running == 0 or sgs->idle_cpus ==
> > sgs->group_weight come to mind.
> 
> yes, I have the same in mind

Thank you very much Vincent and Peter for the feedback! I'll look at
using these stats to determine immediate idle.

> 
> >
> > > > +                      sched_asym_prefer(dst_cpu, sg->asym_prefer_cpu);
> > > > +       }
> > > > +
> > > > +       /* @dst_cpu has SMT siblings. */
> > > > +
> > > > +       if (sg_is_smt) {
> > > > +               int local_busy_cpus = sds->local->group_weight -
> > > > +                                     sds->local_stat.idle_cpus;
> > > > +               int busy_cpus_delta = sg_busy_cpus - local_busy_cpus;
> > > > +
> > > > +               /* Local can always help to even the number busy CPUs. */
> > >
> > > default behavior of the load balance already tries to even the number
>  a> > of idle CPUs.
> >
> > Right, but I suppose this is because we're trapped here and have to deal
> > with the SMT-SMT case too. Ricardo, can you clarify?
> 
> IIUC, this function is used in sg_lb_stats to set
> sgs->group_asym_packing which is then used to set the group state to
> group_asym_packing and force asym migration.
> But if we only want to even the number of busy CPUs between the group,
> we should not need to set the group state to  group_asym_packing

Yes, what Vincent describe is the intent. Then, I think it is probably
true that it is not necessary to even the number of idle CPUs here.
> 
> >
> > > > +               if (busy_cpus_delta >= 2)
> > > > +                       return true;
> > > > +
> > > > +               if (busy_cpus_delta == 1)
> > > > +                       return sched_asym_prefer(dst_cpu,
> > > > +                                                sg->asym_prefer_cpu);

I think we should keep this check in order to move tasks to higher
priority CPUs.

> > > > +
> > > > +               return false;
> > > > +       }
> > > > +
> > > > +       /*
> > > > +        * @sg does not have SMT siblings. Ensure that @sds::local does not end
> > > > +        * up with more than one busy SMT sibling and only pull tasks if there
> > > > +        * are not busy CPUs. As CPUs move in and out of idle state frequently,
> > > > +        * also check the group utilization to smoother the decision.
> > > > +        */
> > > > +       if (!sds->local_stat.group_util)
> > >
> > > same comment as above about the meaning of group_util == 0

I will look into using the suggested statistics.

Thanks and BR,
Ricardo
