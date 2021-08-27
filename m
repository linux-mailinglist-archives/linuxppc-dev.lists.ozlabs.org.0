Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (unknown [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3326B3F9B92
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 17:18:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx3JD1Bnyz305p
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 01:18:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rZKo/xkS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::234;
 helo=mail-lj1-x234.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rZKo/xkS; dkim-atps=neutral
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx3HV5kfvz2ynd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 01:17:40 +1000 (AEST)
Received: by mail-lj1-x234.google.com with SMTP id q21so12019652ljj.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 08:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tM/CxF5Vtipf0rVSZWIFjaITExCiSF5UaWeEAnIcTEw=;
 b=rZKo/xkSxOYtcba9J7/+0V5cMzi3YhrAvsucSGb0EXR+9KpR4clAG48MGZOkB7XsKM
 gC6jd+RSf50EAxZ2G1ZebjRkY4haNkQFvcHIjI3aY3k1GGYk0LqCM71a14hZynxrmnd3
 UAF5+mYGFRRerrl3fMLWFAjI8RfKhskVU2Rrg5XEyYBuCMk4k1BbP2oa7wo2qL61dPa7
 dPtPO7DUW7tvUjpw0V/mRvT6b+7eTdlI9ITo8qaYwoktp9Y2DWQ3ckOKGGsTEEmx2wOh
 oKTpoqXokPPV1rENax4p60VN3uKF14PbAAixwpTbfSGVTuAtWjWxncuFWkwuhIi/JBRr
 vIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tM/CxF5Vtipf0rVSZWIFjaITExCiSF5UaWeEAnIcTEw=;
 b=Qk7CuDpWD1tg9JKPNYg9qr+FfnsJYm5wcE9oGA/k6PgJJmLSXOi6c5uB/vGZhujEiH
 N5EmgeZPZW9zFl/2WZIQZl6smYugsprAgLDkdsa6qF4FwrNUIlDnvbpMeiRjaOFGC9Ge
 3+DmbswFn9FyePVGwQqlJPrPY9PDiGT5j7YgOx8UH/RzzflE42l+6/FjCKsEfdyBI+CY
 HqhumUb/Gc6QM9oTQE7zGP5K0Ul1uodh87hQZ9Q1BZxsX1bCT7YSweb+Mu1cgtCqvYgV
 l40ixJlaoLXzydSvX6QEJ74cD891ADi6VivYdo2R2bwjSRsAXBX54y1Hz7AGPsprUvkd
 PB9A==
X-Gm-Message-State: AOAM533LgiGWin30TnbWuNzn7tIVSGpW+ck+nTcNzTvonXkb9X8zqfKU
 kfa3fN/SPrreYkDSuhTBx3Mdsv+8w7J0ShbJz90V+g==
X-Google-Smtp-Source: ABdhPJwxg6+G/p9Zxy/iB6dw7aQN+kTMb4qEz7bs96RHQ7YVNxY5eUU9KARqLpKu2fk7gD+0uGYfd5O5I+kxGo5dAeE=
X-Received: by 2002:a05:651c:382:: with SMTP id
 e2mr7884424ljp.401.1630077453333; 
 Fri, 27 Aug 2021 08:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210810144145.18776-1-ricardo.neri-calderon@linux.intel.com>
 <20210810144145.18776-7-ricardo.neri-calderon@linux.intel.com>
 <CAKfTPtArtmhLG5QYR6TzKevDrEuiQu2HJxm_C3pe549XdGU-1g@mail.gmail.com>
 <YSj7PrVGVpcKf/vz@hirez.programming.kicks-ass.net>
In-Reply-To: <YSj7PrVGVpcKf/vz@hirez.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 27 Aug 2021 17:17:22 +0200
Message-ID: <CAKfTPtBvhHBA-BLkh-fd2eJk_JOm2chgMy6AKpR=WV_hc3sQKA@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] sched/fair: Consider SMT in ASYM_PACKING load
 balance
To: Peter Zijlstra <peterz@infradead.org>
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

On Fri, 27 Aug 2021 at 16:50, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Aug 27, 2021 at 12:13:42PM +0200, Vincent Guittot wrote:
> > > +/**
> > > + * asym_smt_can_pull_tasks - Check whether the load balancing CPU can pull tasks
> > > + * @dst_cpu:   Destination CPU of the load balancing
> > > + * @sds:       Load-balancing data with statistics of the local group
> > > + * @sgs:       Load-balancing statistics of the candidate busiest group
> > > + * @sg:                The candidate busiet group
> > > + *
> > > + * Check the state of the SMT siblings of both @sds::local and @sg and decide
> > > + * if @dst_cpu can pull tasks. If @dst_cpu does not have SMT siblings, it can
> > > + * pull tasks if two or more of the SMT siblings of @sg are busy. If only one
> > > + * CPU in @sg is busy, pull tasks only if @dst_cpu has higher priority.
> > > + *
> > > + * If both @dst_cpu and @sg have SMT siblings, even the number of idle CPUs
> > > + * between @sds::local and @sg. Thus, pull tasks from @sg if the difference
> > > + * between the number of busy CPUs is 2 or more. If the difference is of 1,
> > > + * only pull if @dst_cpu has higher priority. If @sg does not have SMT siblings
> > > + * only pull tasks if all of the SMT siblings of @dst_cpu are idle and @sg
> > > + * has lower priority.
> > > + */
> > > +static bool asym_smt_can_pull_tasks(int dst_cpu, struct sd_lb_stats *sds,
> > > +                                   struct sg_lb_stats *sgs,
> > > +                                   struct sched_group *sg)
> > > +{
> > > +#ifdef CONFIG_SCHED_SMT
> > > +       bool local_is_smt, sg_is_smt;
> > > +       int sg_busy_cpus;
> > > +
> > > +       local_is_smt = sds->local->flags & SD_SHARE_CPUCAPACITY;
> > > +       sg_is_smt = sg->flags & SD_SHARE_CPUCAPACITY;
> > > +
> > > +       sg_busy_cpus = sgs->group_weight - sgs->idle_cpus;
> > > +
> > > +       if (!local_is_smt) {
> > > +               /*
> > > +                * If we are here, @dst_cpu is idle and does not have SMT
> > > +                * siblings. Pull tasks if candidate group has two or more
> > > +                * busy CPUs.
> > > +                */
> > > +               if (sg_is_smt && sg_busy_cpus >= 2)
> > > +                       return true;
> > > +
> > > +               /*
> > > +                * @dst_cpu does not have SMT siblings. @sg may have SMT
> > > +                * siblings and only one is busy. In such case, @dst_cpu
> > > +                * can help if it has higher priority and is idle.
> > > +                */
> > > +               return !sds->local_stat.group_util &&
> >
> > sds->local_stat.group_util can't be used to decide if a CPU or group
> > of CPUs is idle. util_avg is usually not null when a CPU becomes idle
> > and you can have to wait  more than 300ms before it becomes Null
> > At the opposite, the utilization of a CPU can be null but a task with
> > null utilization has just woken up on it.
> > Utilization is used to reflect the average work of the CPU or group of
> > CPUs but not the current state
>
> If you want immediate idle, sgs->nr_running == 0 or sgs->idle_cpus ==
> sgs->group_weight come to mind.

yes, I have the same in mind

>
> > > +                      sched_asym_prefer(dst_cpu, sg->asym_prefer_cpu);
> > > +       }
> > > +
> > > +       /* @dst_cpu has SMT siblings. */
> > > +
> > > +       if (sg_is_smt) {
> > > +               int local_busy_cpus = sds->local->group_weight -
> > > +                                     sds->local_stat.idle_cpus;
> > > +               int busy_cpus_delta = sg_busy_cpus - local_busy_cpus;
> > > +
> > > +               /* Local can always help to even the number busy CPUs. */
> >
> > default behavior of the load balance already tries to even the number
 a> > of idle CPUs.
>
> Right, but I suppose this is because we're trapped here and have to deal
> with the SMT-SMT case too. Ricardo, can you clarify?

IIUC, this function is used in sg_lb_stats to set
sgs->group_asym_packing which is then used to set the group state to
group_asym_packing and force asym migration.
But if we only want to even the number of busy CPUs between the group,
we should not need to set the group state to  group_asym_packing

>
> > > +               if (busy_cpus_delta >= 2)
> > > +                       return true;
> > > +
> > > +               if (busy_cpus_delta == 1)
> > > +                       return sched_asym_prefer(dst_cpu,
> > > +                                                sg->asym_prefer_cpu);
> > > +
> > > +               return false;
> > > +       }
> > > +
> > > +       /*
> > > +        * @sg does not have SMT siblings. Ensure that @sds::local does not end
> > > +        * up with more than one busy SMT sibling and only pull tasks if there
> > > +        * are not busy CPUs. As CPUs move in and out of idle state frequently,
> > > +        * also check the group utilization to smoother the decision.
> > > +        */
> > > +       if (!sds->local_stat.group_util)
> >
> > same comment as above about the meaning of group_util == 0
> >
> > > +               return sched_asym_prefer(dst_cpu, sg->asym_prefer_cpu);
> > > +
> > > +       return false;
> > > +#else
> > > +       /* Always return false so that callers deal with non-SMT cases. */
> > > +       return false;
> > > +#endif
> > > +}
> > > +
> > >  static inline bool
> > >  sched_asym(struct lb_env *env, struct sd_lb_stats *sds,  struct sg_lb_stats *sgs,
> > >            struct sched_group *group)
> > >  {
> > > +       /* Only do SMT checks if either local or candidate have SMT siblings */
> > > +       if ((sds->local->flags & SD_SHARE_CPUCAPACITY) ||
> > > +           (group->flags & SD_SHARE_CPUCAPACITY))
> > > +               return asym_smt_can_pull_tasks(env->dst_cpu, sds, sgs, group);
> > > +
> > >         return sched_asym_prefer(env->dst_cpu, group->asym_prefer_cpu);
> > >  }
