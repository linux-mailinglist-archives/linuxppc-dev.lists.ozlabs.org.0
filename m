Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 182C740C89D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 17:44:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8kzr4CHtz3059
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 01:44:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZAZuxJXA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2c;
 helo=mail-yb1-xb2c.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZAZuxJXA; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8kz65fj5z2xrM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Sep 2021 01:43:59 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id i12so6554665ybq.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 08:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+zllIpuVAGmAbeMrve7uuc02zgQdxbgznRWdG0p/Vlc=;
 b=ZAZuxJXAJ5cxf0F6FtP+ssvdc57gIx3msQdKGnZxbKQVp+fGb6Vxmn6VNL5duc328U
 lvw218Itxy1sxNz8aw/HB2zQFgdiuYO3OiIpMPanpMnCAtD56yCXtDo6VMRy+XGmvHP2
 bOtiSnjsHqFEGb2npS8n4dj6OGOYRRu/YghzJBN5R0XOrcxgueBWQvCT3tWxm+pR+yYo
 FkITQ5t4fC5/PLuPi2Bifi0gJ8t9PyfhLdOXHCD/KpFJP8/IX/KJSpBq78J+iBLv0L7I
 GmWvU1T/Ow5mu0LQYezOKVQ+3uWzv++Z3EdXg50LSNsWRSmQJI9mmV82AagxsmjXsXEG
 dlgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+zllIpuVAGmAbeMrve7uuc02zgQdxbgznRWdG0p/Vlc=;
 b=oony4ytgwrdQq+NXoCJLP4gsUy9F0LQCb7Q1/tQthLDDzidurVHf1prptwVRmw7gOb
 Zp9qpobPsiVovFADm51j0BzVbIZXdUfi+KzKfDx5r9BjQIgmazdxJ85xh//DcEsYm6uc
 jKoiyVts40MwnRZjkyYFruv9kUWoFQZajMF1cTR5tX9Wj0Gd1EHQ/NTEcZCloEP/ic2n
 C5seKPXnzG4FlXQ30cazW6wpK6R5CvOx2Tsu4MZr/FSdTB3Ia6wQZ/nO3fYKDreVTaOb
 RliDF2sN+qhyecz11E8LgV9ybQd428e1y9bEpnWKRL1VJxAqU8l1ck3BGIITqlPyzs5m
 7sUQ==
X-Gm-Message-State: AOAM531edtuhExRl/0bFabfAXDeOm8SwCD+bGbmotLxtmpUYW1K6WHUu
 VLV4xC143VO7UAIDJ/YvOplXuuhAHOHkEGf+R0IRsA==
X-Google-Smtp-Source: ABdhPJw6olnnrMatZGUndrCITNb7Ep0SMFLTn9Dkk5hzjfUx45EVmn4Kb1uVMc6th3nRplyLaaLnFVPw3vD6sXH+zA8=
X-Received: by 2002:a25:2d4c:: with SMTP id s12mr775510ybe.350.1631720635396; 
 Wed, 15 Sep 2021 08:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210911011819.12184-1-ricardo.neri-calderon@linux.intel.com>
 <20210911011819.12184-7-ricardo.neri-calderon@linux.intel.com>
In-Reply-To: <20210911011819.12184-7-ricardo.neri-calderon@linux.intel.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 15 Sep 2021 17:43:44 +0200
Message-ID: <CAKfTPtBcDP3Yp54sd4+1kP=o=4e_1HEmOf=eMXydag_J38CEng@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] sched/fair: Consider SMT in ASYM_PACKING load
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
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Len Brown <len.brown@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Aubrey Li <aubrey.li@intel.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Tim Chen <tim.c.chen@linux.intel.com>, Quentin Perret <qperret@google.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 11 Sept 2021 at 03:19, Ricardo Neri
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
> Changes since v4:
>   * Use sg_lb_stats::sum_nr_running the idle state of a scheduling group.
>     (Vincent, Peter)
>   * Do not even idle CPUs in asym_smt_can_pull_tasks(). (Vincent)
>   * Updated function documentation and corrected a typo.
>
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
>  kernel/sched/fair.c | 94 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 26db017c14a3..8d763dd0174b 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8597,10 +8597,98 @@ group_type group_classify(unsigned int imbalance_pct,
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
> +               if (sg_is_smt && sg_busy_cpus >= 2)

Do you really need to test sg_is_smt ? if sg_busy_cpus >= 2 then
sd_is_smt must be true ?

Also, This is the default behavior where we want to even the number of
busy cpu. Shouldn't you return false and fall back to the default
behavior ?

That being said, the default behavior tries to even the number of idle
cpus which is easier to compute and is equal to even the number of
busy cpus in "normal" system with the same number of cpus in groups
but this is not the case here. It could be good to change the default
behavior to even the number of busy cpus and that you use the default
behavior here. Additional condition will be used to select the busiest
group like more busy cpu or more number of running tasks

> +                       return true;
> +
> +               /*
> +                * @dst_cpu does not have SMT siblings. @sg may have SMT
> +                * siblings and only one is busy. In such case, @dst_cpu
> +                * can help if it has higher priority and is idle (i.e.,
> +                * it has no running tasks).

The previous comment above assume that "@dst_cpu is idle" but now you
need to check that sds->local_stat.sum_nr_running == 0

> +                */
> +               return !sds->local_stat.sum_nr_running &&
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
> @@ -9606,6 +9694,12 @@ static struct rq *find_busiest_queue(struct lb_env *env,
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
> --
> 2.17.1
>
