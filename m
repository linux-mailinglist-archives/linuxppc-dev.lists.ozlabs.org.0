Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B665E3F9B25
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 16:51:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx2jJ4kS6z304j
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 00:51:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=tUg5s6Jw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=tUg5s6Jw; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx2hc4FR5z2xfN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 00:50:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fgRwnxGGF057xGl87vsL6kCRqNe7wcNfUYeSw4x56tc=; b=tUg5s6JwGQth/zsyy+aMx5nMrP
 +lAZJIySGhrCe0H7CM2kWBKnuk6FIHf6r/WjCeqziDWuedqlaDAdsN7hxoSU8UcN422PZpOosugZ8
 J00lTUeG67ZQYl7rf76uNjTtnwFqJaOGxmB/Xw4kc9xyEnGHgOzxSqvaXLE8FLZ599ZvhcRDC+97M
 AvfakezHJEL2qT9ShlZiFjA9Ycv1nH2B6C1bs1EQqbaWqhm1xL5Tu81YDp9VyT+3hBrWjWYO4uKSH
 HdZU/ay53Y1q+VtjNe1E0+3iZeLhHrozpyie1c0udGm/8pxK+Q5iZ1ovK5u9PJKlSWGt7WBvC9vei
 2DUHF8MQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJd9k-00EfE0-Bn; Fri, 27 Aug 2021 14:48:49 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id EBDE63005AD;
 Fri, 27 Aug 2021 16:48:30 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id C009629A12A4D; Fri, 27 Aug 2021 16:48:30 +0200 (CEST)
Date: Fri, 27 Aug 2021 16:48:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH v4 6/6] sched/fair: Consider SMT in ASYM_PACKING load
 balance
Message-ID: <YSj7PrVGVpcKf/vz@hirez.programming.kicks-ass.net>
References: <20210810144145.18776-1-ricardo.neri-calderon@linux.intel.com>
 <20210810144145.18776-7-ricardo.neri-calderon@linux.intel.com>
 <CAKfTPtArtmhLG5QYR6TzKevDrEuiQu2HJxm_C3pe549XdGU-1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtArtmhLG5QYR6TzKevDrEuiQu2HJxm_C3pe549XdGU-1g@mail.gmail.com>
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
 Ricardo Neri <ricardo.neri@intel.com>, Ben Segall <bsegall@google.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Ingo Molnar <mingo@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Len Brown <len.brown@intel.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Nicholas Piggin <npiggin@gmail.com>, Aubrey Li <aubrey.li@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Tim Chen <tim.c.chen@linux.intel.com>, Quentin Perret <qperret@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 27, 2021 at 12:13:42PM +0200, Vincent Guittot wrote:
> > +/**
> > + * asym_smt_can_pull_tasks - Check whether the load balancing CPU can pull tasks
> > + * @dst_cpu:   Destination CPU of the load balancing
> > + * @sds:       Load-balancing data with statistics of the local group
> > + * @sgs:       Load-balancing statistics of the candidate busiest group
> > + * @sg:                The candidate busiet group
> > + *
> > + * Check the state of the SMT siblings of both @sds::local and @sg and decide
> > + * if @dst_cpu can pull tasks. If @dst_cpu does not have SMT siblings, it can
> > + * pull tasks if two or more of the SMT siblings of @sg are busy. If only one
> > + * CPU in @sg is busy, pull tasks only if @dst_cpu has higher priority.
> > + *
> > + * If both @dst_cpu and @sg have SMT siblings, even the number of idle CPUs
> > + * between @sds::local and @sg. Thus, pull tasks from @sg if the difference
> > + * between the number of busy CPUs is 2 or more. If the difference is of 1,
> > + * only pull if @dst_cpu has higher priority. If @sg does not have SMT siblings
> > + * only pull tasks if all of the SMT siblings of @dst_cpu are idle and @sg
> > + * has lower priority.
> > + */
> > +static bool asym_smt_can_pull_tasks(int dst_cpu, struct sd_lb_stats *sds,
> > +                                   struct sg_lb_stats *sgs,
> > +                                   struct sched_group *sg)
> > +{
> > +#ifdef CONFIG_SCHED_SMT
> > +       bool local_is_smt, sg_is_smt;
> > +       int sg_busy_cpus;
> > +
> > +       local_is_smt = sds->local->flags & SD_SHARE_CPUCAPACITY;
> > +       sg_is_smt = sg->flags & SD_SHARE_CPUCAPACITY;
> > +
> > +       sg_busy_cpus = sgs->group_weight - sgs->idle_cpus;
> > +
> > +       if (!local_is_smt) {
> > +               /*
> > +                * If we are here, @dst_cpu is idle and does not have SMT
> > +                * siblings. Pull tasks if candidate group has two or more
> > +                * busy CPUs.
> > +                */
> > +               if (sg_is_smt && sg_busy_cpus >= 2)
> > +                       return true;
> > +
> > +               /*
> > +                * @dst_cpu does not have SMT siblings. @sg may have SMT
> > +                * siblings and only one is busy. In such case, @dst_cpu
> > +                * can help if it has higher priority and is idle.
> > +                */
> > +               return !sds->local_stat.group_util &&
> 
> sds->local_stat.group_util can't be used to decide if a CPU or group
> of CPUs is idle. util_avg is usually not null when a CPU becomes idle
> and you can have to wait  more than 300ms before it becomes Null
> At the opposite, the utilization of a CPU can be null but a task with
> null utilization has just woken up on it.
> Utilization is used to reflect the average work of the CPU or group of
> CPUs but not the current state

If you want immediate idle, sgs->nr_running == 0 or sgs->idle_cpus ==
sgs->group_weight come to mind.

> > +                      sched_asym_prefer(dst_cpu, sg->asym_prefer_cpu);
> > +       }
> > +
> > +       /* @dst_cpu has SMT siblings. */
> > +
> > +       if (sg_is_smt) {
> > +               int local_busy_cpus = sds->local->group_weight -
> > +                                     sds->local_stat.idle_cpus;
> > +               int busy_cpus_delta = sg_busy_cpus - local_busy_cpus;
> > +
> > +               /* Local can always help to even the number busy CPUs. */
> 
> default behavior of the load balance already tries to even the number
> of idle CPUs.

Right, but I suppose this is because we're trapped here and have to deal
with the SMT-SMT case too. Ricardo, can you clarify?

> > +               if (busy_cpus_delta >= 2)
> > +                       return true;
> > +
> > +               if (busy_cpus_delta == 1)
> > +                       return sched_asym_prefer(dst_cpu,
> > +                                                sg->asym_prefer_cpu);
> > +
> > +               return false;
> > +       }
> > +
> > +       /*
> > +        * @sg does not have SMT siblings. Ensure that @sds::local does not end
> > +        * up with more than one busy SMT sibling and only pull tasks if there
> > +        * are not busy CPUs. As CPUs move in and out of idle state frequently,
> > +        * also check the group utilization to smoother the decision.
> > +        */
> > +       if (!sds->local_stat.group_util)
> 
> same comment as above about the meaning of group_util == 0
> 
> > +               return sched_asym_prefer(dst_cpu, sg->asym_prefer_cpu);
> > +
> > +       return false;
> > +#else
> > +       /* Always return false so that callers deal with non-SMT cases. */
> > +       return false;
> > +#endif
> > +}
> > +
> >  static inline bool
> >  sched_asym(struct lb_env *env, struct sd_lb_stats *sds,  struct sg_lb_stats *sgs,
> >            struct sched_group *group)
> >  {
> > +       /* Only do SMT checks if either local or candidate have SMT siblings */
> > +       if ((sds->local->flags & SD_SHARE_CPUCAPACITY) ||
> > +           (group->flags & SD_SHARE_CPUCAPACITY))
> > +               return asym_smt_can_pull_tasks(env->dst_cpu, sds, sgs, group);
> > +
> >         return sched_asym_prefer(env->dst_cpu, group->asym_prefer_cpu);
> >  }
