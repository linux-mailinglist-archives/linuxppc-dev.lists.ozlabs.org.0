Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (unknown [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFAB3F97E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 12:15:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwwYs5bN8z309K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 20:14:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yFOF6XHA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22f;
 helo=mail-lj1-x22f.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yFOF6XHA; dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwwY81LZ0z2yJQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 20:14:01 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id c12so10515857ljr.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 03:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mHIT1nZBEvxshxtBwUUrFhnW96v2k2CZ+QGQ0YwUldk=;
 b=yFOF6XHA571B06bcH9G3taX5rwZqIoQMf2lbOZtMDmyZYyYiED5buac08kCFErih7c
 vGkwO0HHvinnE56CttFcc56NnqHyPeHutuUVzX454XbzJLJ+e71XgbzihlmMxwidQ2g+
 SiSGY4yeZvyovwe9QWw1DYia1vmwjOMXLwN/E5olTwRhjJSMv1Li3y7GND8b6aCIbnQX
 GB+lVlujJBOxJLZhA6Ho6IXTQc5PndNjKui4VzE85O0Pz3C2oDYM7I1EMuxX5TIsIaIY
 qTwPu6olC8j13AiJscGvOdZTQX79iqPkfUkM6rxY8Uviqckhjxk4GVgPGHQV0T34xRtI
 mekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mHIT1nZBEvxshxtBwUUrFhnW96v2k2CZ+QGQ0YwUldk=;
 b=BANzgImlamd9Cl0WrQtA4DL9HXPoOgVHLIy3HcGlKXCURwbQLQeaQeCrct7ZPDlSwo
 bE7RWZRWqezi9Vpxeg3DCH2sCTokNOLqU7TXW+th+2caIeC+oiMMcxwPIEpJKuTlf+Hd
 nevwNStk/VCNnU8acwn+WwahfvFeLj3iYEtKxfN1+holQaXWnTCpRTlJ30nDUsBwSSJd
 ThD+isHCCk8LklDkKEd53em4AoF3fr16Qsr9jyTY1nqOAL/p0pvHO1hPzch7py7W49pQ
 SJlJgyHtlqTK5EEAeYC/kpOaWEyfNCWyHL+SyONaTO6iK7DppXwD4qSFzPWfUjL+qrzD
 2kOw==
X-Gm-Message-State: AOAM531gH0+shNv2vYIpvYbXOqDMMNajdS1rryYB7c6Db3vqo57oYF/k
 gGPQc/jXPX/fHsqoTwlZ7cikqkhG3eu7GSNsSnmBuA==
X-Google-Smtp-Source: ABdhPJyGpfggSV94R7NcCFT4yPgXMAQATn296Q2SrAl8RuDrmsntkMwRTpzDYGw7xg2YOX6GmAHz9LkjSwpfTUZ0z2I=
X-Received: by 2002:a05:651c:382:: with SMTP id
 e2mr6737571ljp.401.1630059233195; 
 Fri, 27 Aug 2021 03:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210810144145.18776-1-ricardo.neri-calderon@linux.intel.com>
 <20210810144145.18776-7-ricardo.neri-calderon@linux.intel.com>
In-Reply-To: <20210810144145.18776-7-ricardo.neri-calderon@linux.intel.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 27 Aug 2021 12:13:42 +0200
Message-ID: <CAKfTPtArtmhLG5QYR6TzKevDrEuiQu2HJxm_C3pe549XdGU-1g@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] sched/fair: Consider SMT in ASYM_PACKING load
 balance
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
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
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Ricardo Neri <ricardo.neri@intel.com>, Ben Segall <bsegall@google.com>,
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

On Tue, 10 Aug 2021 at 16:41, Ricardo Neri
<ricardo.neri-calderon@linux.intel.com> wrote:
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
> Cc: Aubrey Li <aubrey.li@intel.com>
> Cc: Ben Segall <bsegall@google.com>
> Cc: Daniel Bristot de Oliveira <bristot@redhat.com>
> Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Quentin Perret <qperret@google.com>
> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Tim Chen <tim.c.chen@linux.intel.com>
> Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> Reviewed-by: Len Brown <len.brown@intel.com>
> Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> ---
> Changes since v3:
>   * Removed the arch_asym_check_smt_siblings() hook. Discussions with the
>     powerpc folks showed that this patch should not impact them. Also, more
>     recent powerpc processor no longer use asym_packing. (PeterZ)
>   * Removed unnecessary local variable in asym_can_pull_tasks(). (Dietmar)
>   * Removed unnecessary check for local CPUs when the local group has zero
>     utilization. (Joel)
>   * Renamed asym_can_pull_tasks() as asym_smt_can_pull_tasks() to reflect
>     the fact that it deals with SMT cases.
>   * Made asym_smt_can_pull_tasks() return false for !CONFIG_SCHED_SMT so
>     that callers can deal with non-SMT cases.
>
> Changes since v2:
>   * Reworded the commit message to reflect updates in code.
>   * Corrected misrepresentation of dst_cpu as the CPU doing the load
>     balancing. (PeterZ)
>   * Removed call to arch_asym_check_smt_siblings() as it is now called in
>     sched_asym().
>
> Changes since v1:
>   * Don't bailout in update_sd_pick_busiest() if dst_cpu cannot pull
>     tasks. Instead, reclassify the candidate busiest group, as it
>     may still be selected. (PeterZ)
>   * Avoid an expensive and unnecessary call to cpumask_weight() when
>     determining if a sched_group is comprised of SMT siblings.
>     (PeterZ).
> ---
>  kernel/sched/fair.c | 95 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index dd411cefb63f..8a1a2a43732c 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8531,10 +8531,99 @@ group_type group_classify(unsigned int imbalance_pct,
>         return group_has_spare;
>  }
>
> +/**
> + * asym_smt_can_pull_tasks - Check whether the load balancing CPU can pull tasks
> + * @dst_cpu:   Destination CPU of the load balancing
> + * @sds:       Load-balancing data with statistics of the local group
> + * @sgs:       Load-balancing statistics of the candidate busiest group
> + * @sg:                The candidate busiet group
> + *
> + * Check the state of the SMT siblings of both @sds::local and @sg and decide
> + * if @dst_cpu can pull tasks. If @dst_cpu does not have SMT siblings, it can
> + * pull tasks if two or more of the SMT siblings of @sg are busy. If only one
> + * CPU in @sg is busy, pull tasks only if @dst_cpu has higher priority.
> + *
> + * If both @dst_cpu and @sg have SMT siblings, even the number of idle CPUs
> + * between @sds::local and @sg. Thus, pull tasks from @sg if the difference
> + * between the number of busy CPUs is 2 or more. If the difference is of 1,
> + * only pull if @dst_cpu has higher priority. If @sg does not have SMT siblings
> + * only pull tasks if all of the SMT siblings of @dst_cpu are idle and @sg
> + * has lower priority.
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
> +               if (sg_is_smt && sg_busy_cpus >= 2)
> +                       return true;
> +
> +               /*
> +                * @dst_cpu does not have SMT siblings. @sg may have SMT
> +                * siblings and only one is busy. In such case, @dst_cpu
> +                * can help if it has higher priority and is idle.
> +                */
> +               return !sds->local_stat.group_util &&

sds->local_stat.group_util can't be used to decide if a CPU or group
of CPUs is idle. util_avg is usually not null when a CPU becomes idle
and you can have to wait  more than 300ms before it becomes Null
At the opposite, the utilization of a CPU can be null but a task with
null utilization has just woken up on it.
Utilization is used to reflect the average work of the CPU or group of
CPUs but not the current state

> +                      sched_asym_prefer(dst_cpu, sg->asym_prefer_cpu);
> +       }
> +
> +       /* @dst_cpu has SMT siblings. */
> +
> +       if (sg_is_smt) {
> +               int local_busy_cpus = sds->local->group_weight -
> +                                     sds->local_stat.idle_cpus;
> +               int busy_cpus_delta = sg_busy_cpus - local_busy_cpus;
> +
> +               /* Local can always help to even the number busy CPUs. */

default behavior of the load balance already tries to even the number
of idle CPUs.

> +               if (busy_cpus_delta >= 2)
> +                       return true;
> +
> +               if (busy_cpus_delta == 1)
> +                       return sched_asym_prefer(dst_cpu,
> +                                                sg->asym_prefer_cpu);
> +
> +               return false;
> +       }
> +
> +       /*
> +        * @sg does not have SMT siblings. Ensure that @sds::local does not end
> +        * up with more than one busy SMT sibling and only pull tasks if there
> +        * are not busy CPUs. As CPUs move in and out of idle state frequently,
> +        * also check the group utilization to smoother the decision.
> +        */
> +       if (!sds->local_stat.group_util)

same comment as above about the meaning of group_util == 0

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
> @@ -9540,6 +9629,12 @@ static struct rq *find_busiest_queue(struct lb_env *env,
>                     nr_running == 1)
>                         continue;
>
> +               /* Make sure we only pull tasks from a CPU of lower priority */
> +               if ((env->sd->flags & SD_ASYM_PACKING) &&
> +                   sched_asym_prefer(i, env->dst_cpu) &&
> +                   nr_running == 1)
> +                       continue;

This really looks similar to the test above for SD_ASYM_CPUCAPACITY.
More generally speaking SD_ASYM_PACKING and SD_ASYM_CPUCAPACITY share
a lot of common policy and I wonder if at some point we could not
merge their behavior in LB

> +
>                 switch (env->migration_type) {
>                 case migrate_load:
>                         /*
> --
> 2.17.1
>
