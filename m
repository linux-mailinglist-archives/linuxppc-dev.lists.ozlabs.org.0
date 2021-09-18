Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4C8410581
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Sep 2021 11:34:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HBQdL06tFz2ynj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Sep 2021 19:34:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=R1+rfQT5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=R1+rfQT5; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HBQcg0Tk4z2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Sep 2021 19:33:52 +1000 (AEST)
Received: by mail-qk1-x734.google.com with SMTP id 73so20333818qki.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Sep 2021 02:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LriAj22OV80pzVv/mnvzrKjxggP7MKMvTt9ZA2KFDVk=;
 b=R1+rfQT5YmmHQBkzuppyCmqAGnFFlD1KYGye76Esp5u1EXeNz6KSetDOfiE6t0vZUM
 7hRk8qg9MW2cDEEc+gvIcH3CGvVlE4rzMSZbl5QU1yP0sLHuz9IkBgrBfJJqMM1T5Nlv
 4GlVzQJJHuAmysU2R0+rmsI+Lw5O44HqX1p/mYZOb8POnfI4dCNzVviWa3cBn38M7oUt
 AUMc8AvJXLrjZq5kXRr2FRUUqcvDAmq4mqemgkgDRjC/rUShQsDxb8YQhoyTZ9SpxeRM
 /76X4EmfrC7xyND8rnawFDbmHIx3m4tmf7Uau5to0/EGdt0PaQgnMM3v2zddUGeNVYso
 aanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LriAj22OV80pzVv/mnvzrKjxggP7MKMvTt9ZA2KFDVk=;
 b=iQv400AqRtMLcexDwBE0OgftzgHBHyDmgTb7xuV5+IEF17iMuyrYqiUNz5cbcanYM1
 KWxS86XmXLIVXeh8b9XSDSMNLu+0ngfIK6NdzNFpzg1sypS0nFLs4k0w+RkkOCTa4WKU
 WTxMJUSiEWKzvN43L6kAZVp33vpr+jbtQkuBim+duieiepxU12xYJUSKGaTcektIBPDW
 ksjPRY9iAZpE8sfYXw5rQzyaWCMVMgNhGbB6wBcDLNe790Mlc5n7vlesqnrTxbwZ0vUx
 31DL6LayDQgbTLxN7tUWObsbrlnl2D7Mjc6sVt5vpOcRZU6fuT5Io57u1nCm4+NPweYS
 CFlw==
X-Gm-Message-State: AOAM530sTlRvBkYSe+1GUw5lrWUq4QixDFCNzVq7XsGBcHwmpa456oqV
 ywT62NJTZZKgIp/tV9t5sK5ICfYF8qnx42CxWEOWWg==
X-Google-Smtp-Source: ABdhPJw05MikhXwjtWHor5wBzvwiNlzbFPN2ZU1Dqbb0kQtkWV9vpnBWXWgwslkfXi5IIS3Y0wKOtxHX6Gyv1iczIdk=
X-Received: by 2002:a25:ac13:: with SMTP id w19mr18743555ybi.402.1631957628695; 
 Sat, 18 Sep 2021 02:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210911011819.12184-1-ricardo.neri-calderon@linux.intel.com>
 <20210911011819.12184-7-ricardo.neri-calderon@linux.intel.com>
 <CAKfTPtBcDP3Yp54sd4+1kP=o=4e_1HEmOf=eMXydag_J38CEng@mail.gmail.com>
 <20210917010044.GA23727@ranerica-svr.sc.intel.com>
 <CAKfTPtCh72m86pbT5vY_rWzU79Q9NP9t6mcrO8ewbZkBJdN03Q@mail.gmail.com>
 <20210917184659.GI4323@worktop.programming.kicks-ass.net>
In-Reply-To: <20210917184659.GI4323@worktop.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Sat, 18 Sep 2021 11:33:37 +0200
Message-ID: <CAKfTPtCJJ4v0nXE=CnpMhqPb-FuWQdhkgp63khEibmrMc8EN-w@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] sched/fair: Consider SMT in ASYM_PACKING load
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
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
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

On Fri, 17 Sept 2021 at 20:47, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Sep 17, 2021 at 05:25:02PM +0200, Vincent Guittot wrote:
>
> > With the removal of the condition !sds->local_stat.sum_nr_running
> > which seems useless because dst_cpu is idle and not SMT, this patch
> > looks good to me
>
> I've made it look like this. Thanks!

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

Thanks

>
> ---
> Subject: sched/fair: Consider SMT in ASYM_PACKING load balance
> From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> Date: Fri, 10 Sep 2021 18:18:19 -0700
>
> From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
>
> When deciding to pull tasks in ASYM_PACKING, it is necessary not only to
> check for the idle state of the destination CPU, dst_cpu, but also of
> its SMT siblings.
>
> If dst_cpu is idle but its SMT siblings are busy, performance suffers
> if it pulls tasks from a medium priority CPU that does not have SMT
> siblings.
>
> Implement asym_smt_can_pull_tasks() to inspect the state of the SMT
> siblings of both dst_cpu and the CPUs in the candidate busiest group.
>
> Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> Reviewed-by: Len Brown <len.brown@intel.com>
> Link: https://lkml.kernel.org/r/20210911011819.12184-7-ricardo.neri-calderon@linux.intel.com
> ---
>  kernel/sched/fair.c |   92 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
>
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8538,10 +8538,96 @@ group_type group_classify(unsigned int i
>         return group_has_spare;
>  }
>
> +/**
> + * asym_smt_can_pull_tasks - Check whether the load balancing CPU can pull tasks
> + * @dst_cpu:   Destination CPU of the load balancing
> + * @sds:       Load-balancing data with statistics of the local group
> + * @sgs:       Load-balancing statistics of the candidate busiest group
> + * @sg:                The candidate busiest group
> + *
> + * Check the state of the SMT siblings of both @sds::local and @sg and decide
> + * if @dst_cpu can pull tasks.
> + *
> + * If @dst_cpu does not have SMT siblings, it can pull tasks if two or more of
> + * the SMT siblings of @sg are busy. If only one CPU in @sg is busy, pull tasks
> + * only if @dst_cpu has higher priority.
> + *
> + * If both @dst_cpu and @sg have SMT siblings, and @sg has exactly one more
> + * busy CPU than @sds::local, let @dst_cpu pull tasks if it has higher priority.
> + * Bigger imbalances in the number of busy CPUs will be dealt with in
> + * update_sd_pick_busiest().
> + *
> + * If @sg does not have SMT siblings, only pull tasks if all of the SMT siblings
> + * of @dst_cpu are idle and @sg has lower priority.
> + */
> +static bool asym_smt_can_pull_tasks(int dst_cpu, struct sd_lb_stats *sds,
> +                                   struct sg_lb_stats *sgs,
> +                                   struct sched_group *sg)
> +{
> +#ifdef CONFIG_SCHED_SMT
> +       bool local_is_smt, sg_is_smt;
> +       int sg_busy_cpus;
> +
> +       local_is_smt = sds->local->flags & SD_SHARE_CPUCAPACITY;
> +       sg_is_smt = sg->flags & SD_SHARE_CPUCAPACITY;
> +
> +       sg_busy_cpus = sgs->group_weight - sgs->idle_cpus;
> +
> +       if (!local_is_smt) {
> +               /*
> +                * If we are here, @dst_cpu is idle and does not have SMT
> +                * siblings. Pull tasks if candidate group has two or more
> +                * busy CPUs.
> +                */
> +               if (sg_busy_cpus >= 2) /* implies sg_is_smt */
> +                       return true;
> +
> +               /*
> +                * @dst_cpu does not have SMT siblings. @sg may have SMT
> +                * siblings and only one is busy. In such case, @dst_cpu
> +                * can help if it has higher priority and is idle (i.e.,
> +                * it has no running tasks).
> +                */
> +               return sched_asym_prefer(dst_cpu, sg->asym_prefer_cpu);
> +       }
> +
> +       /* @dst_cpu has SMT siblings. */
> +
> +       if (sg_is_smt) {
> +               int local_busy_cpus = sds->local->group_weight -
> +                                     sds->local_stat.idle_cpus;
> +               int busy_cpus_delta = sg_busy_cpus - local_busy_cpus;
> +
> +               if (busy_cpus_delta == 1)
> +                       return sched_asym_prefer(dst_cpu, sg->asym_prefer_cpu);
> +
> +               return false;
> +       }
> +
> +       /*
> +        * @sg does not have SMT siblings. Ensure that @sds::local does not end
> +        * up with more than one busy SMT sibling and only pull tasks if there
> +        * are not busy CPUs (i.e., no CPU has running tasks).
> +        */
> +       if (!sds->local_stat.sum_nr_running)
> +               return sched_asym_prefer(dst_cpu, sg->asym_prefer_cpu);
> +
> +       return false;
> +#else
> +       /* Always return false so that callers deal with non-SMT cases. */
> +       return false;
> +#endif
> +}
> +
>  static inline bool
>  sched_asym(struct lb_env *env, struct sd_lb_stats *sds,  struct sg_lb_stats *sgs,
>            struct sched_group *group)
>  {
> +       /* Only do SMT checks if either local or candidate have SMT siblings */
> +       if ((sds->local->flags & SD_SHARE_CPUCAPACITY) ||
> +           (group->flags & SD_SHARE_CPUCAPACITY))
> +               return asym_smt_can_pull_tasks(env->dst_cpu, sds, sgs, group);
> +
>         return sched_asym_prefer(env->dst_cpu, group->asym_prefer_cpu);
>  }
>
> @@ -9547,6 +9633,12 @@ static struct rq *find_busiest_queue(str
>                     nr_running == 1)
>                         continue;
>
> +               /* Make sure we only pull tasks from a CPU of lower priority */
> +               if ((env->sd->flags & SD_ASYM_PACKING) &&
> +                   sched_asym_prefer(i, env->dst_cpu) &&
> +                   nr_running == 1)
> +                       continue;
> +
>                 switch (env->migration_type) {
>                 case migrate_load:
>                         /*
