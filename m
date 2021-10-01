Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C45A41EAED
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 12:26:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLR9V2wnyz3bW6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 20:26:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=agIeuqAj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b35;
 helo=mail-yb1-xb35.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=agIeuqAj; dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLR8n1pz0z2yWn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 20:25:58 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id r4so19487913ybp.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Oct 2021 03:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZLDHLkyQOINaX1HEVP7CeIcNS3YoDM/EfndecVt6AgM=;
 b=agIeuqAjEiiW27D6tdcrWEu+02GGfq2uOeHe2+ibQHfMOM1EzCoycj6wic1yL0tpnb
 c5jdcsPx9plXXO+GkgQe3z7PFCu0KrQBOizd2Qa6AhtESpEVfI5zLUEMPaOTNQf4JkK3
 e5khwYqP/t3dswfF19ZJrHN9HSC0g8wEdjC91sWAjDcLeCkkq7u0MPNvvi+J/0z/uS4v
 I8mOZM0n333lVPag9IMFOu0K3SnWyY43SHrs2ZFkDgjqc9ZD/1OQgMn2WPLbY/+jiOH+
 tZEp/qoygJUT/v1Tl53UaE5WTRHZquxQZRzAHMDkiM5JadfJXIXT+qrF9A5b6vGDsfim
 YnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZLDHLkyQOINaX1HEVP7CeIcNS3YoDM/EfndecVt6AgM=;
 b=UaMecM2DkFvTrPCeWvZq4kLjMO8YaG+8rwtte7wPIhWgO9cpg2SZpkeXQeVZf8QRgZ
 c32FLJybRBREeAUR7jlmPjefVd4aqMhcfQTL5F2ux1DH8qozq7/8wVNi0I2slTDoDQwd
 cQjEqeEA7GbhgMZK5WJTJ0NiOB4HM9z8Hy6lLEcaDulsMNSGBfTwQ82eaxkGcL2dNWGq
 +G4XS/MM+xuUWOk/FJZHDX64jaQrzDqiE0qDZDRAitvtAcZQiS1SnHKp40uqDoMsSngd
 QrGnd5OUD0GFHMyyOenvbjbddm36DB6QvY45buoUR/HcBCIjPoiDCLzYuiDnt4iysAje
 KPFg==
X-Gm-Message-State: AOAM533oezZL3S1NL9uodoRk6aTptUGdyiaulOhT4lqV0gPJI8x/IN2Z
 qioLVBKtMXgokXdD/mCXM+2fWYmPgEx6NfxYllV+yw==
X-Google-Smtp-Source: ABdhPJyZXWhWJbh8OKIVuLf4sQDJFYhwoWZZqrdQGemXrbojs0kgKuClnjfFqXR60XP9wkl/x0o9tmOKsTJQAWDfAqo=
X-Received: by 2002:a25:ed0d:: with SMTP id k13mr5080095ybh.191.1633083953532; 
 Fri, 01 Oct 2021 03:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210911011819.12184-1-ricardo.neri-calderon@linux.intel.com>
 <20210911011819.12184-7-ricardo.neri-calderon@linux.intel.com>
 <78608a82-93b8-8036-2bf0-65f53f2f5120@collabora.com>
In-Reply-To: <78608a82-93b8-8036-2bf0-65f53f2f5120@collabora.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 1 Oct 2021 12:25:42 +0200
Message-ID: <CAKfTPtD1xE0amjCSkgczBjN=KbdVhVdK=6wiP=P+ynfGojky=Q@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] sched/fair: Consider SMT in ASYM_PACKING load
 balance
To: Guillaume Tucker <guillaume.tucker@collabora.com>
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
Cc: Juri Lelli <juri.lelli@redhat.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Ricardo Neri <ricardo.neri@intel.com>, Ben Segall <bsegall@google.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Ingo Molnar <mingo@kernel.org>, Aubrey Li <aubrey.li@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Len Brown <len.brown@intel.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Nicholas Piggin <npiggin@gmail.com>, Aubrey Li <aubrey.li@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Tim Chen <tim.c.chen@linux.intel.com>,
 "kernelci-results@groups.io" <kernelci-results@groups.io>,
 Quentin Perret <qperret@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Guillaume,

This patch and the patchset which includes this patch only impacts
systems with hyperthreading which is not the case of rk3328-rock64
AFAICT. So there is no reason that this code is used by the board. The
only impact should be an increase of the binary for this platform.
Could it be that it reached a limit ?

Regards,
Vincent

On Fri, 1 Oct 2021 at 11:33, Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> Hi Ricardo,
>
> Please see the bisection report below about a boot failure on
> rk3288-rock64.
>
> Reports aren't automatically sent to the public while we're
> trialing new bisection features on kernelci.org but this one
> looks valid.
>
> Some more details can be found here:
>
>   https://linux.kernelci.org/test/case/id/6155a4b0836c79a98f99a31d/
>
> It looks like some i.MX arm64 platforms also regressed with
> next-20210920 although it hasn't been verified yet whether that's
> due to the same commit:
>
>   https://linux.kernelci.org/test/job/next/branch/master/kernel/next-20210930/plan/baseline/
>
> The x86 platforms don't seem to be impacted though.
>
> Please let us know if you need help debugging the issue or if you
> have a fix to try.
>
> Best wishes,
> Guillaume
>
>
> GitHub: https://github.com/kernelci/kernelci-project/issues/65
>
> -------------------------------------------------------------------------------
>
>
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>
> next/master bisection: baseline.login on rk3328-rock64
>
> Summary:
>   Start:      2d02a18f75fc Add linux-next specific files for 20210929
>   Plain log:  https://storage.kernelci.org/next/master/next-20210929/arm64/defconfig+CONFIG_RANDOMIZE_BASE=y/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
>   HTML log:   https://storage.kernelci.org/next/master/next-20210929/arm64/defconfig+CONFIG_RANDOMIZE_BASE=y/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
>   Result:     eac6f3841f1d sched/fair: Consider SMT in ASYM_PACKING load balance
>
> Checks:
>   revert:     PASS
>   verify:     PASS
>
> Parameters:
>   Tree:       next
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   Branch:     master
>   Target:     rk3328-rock64
>   CPU arch:   arm64
>   Lab:        lab-baylibre
>   Compiler:   gcc-8
>   Config:     defconfig+CONFIG_RANDOMIZE_BASE=y
>   Test case:  baseline.login
>
> Breaking commit found:
>
> -------------------------------------------------------------------------------
> commit eac6f3841f1dac7b6f43002056b63f44cc1f1543
> Author: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> Date:   Fri Sep 10 18:18:19 2021 -0700
>
>     sched/fair: Consider SMT in ASYM_PACKING load balance
>
>
> On 11/09/2021 03:18, Ricardo Neri wrote:
> > When deciding to pull tasks in ASYM_PACKING, it is necessary not only to
> > check for the idle state of the destination CPU, dst_cpu, but also of
> > its SMT siblings.
> >
> > If dst_cpu is idle but its SMT siblings are busy, performance suffers
> > if it pulls tasks from a medium priority CPU that does not have SMT
> > siblings.
> >
> > Implement asym_smt_can_pull_tasks() to inspect the state of the SMT
> > siblings of both dst_cpu and the CPUs in the candidate busiest group.
> >
> > Cc: Aubrey Li <aubrey.li@intel.com>
> > Cc: Ben Segall <bsegall@google.com>
> > Cc: Daniel Bristot de Oliveira <bristot@redhat.com>
> > Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> > Cc: Mel Gorman <mgorman@suse.de>
> > Cc: Quentin Perret <qperret@google.com>
> > Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: Tim Chen <tim.c.chen@linux.intel.com>
> > Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > Reviewed-by: Len Brown <len.brown@intel.com>
> > Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> > ---
> > Changes since v4:
> >   * Use sg_lb_stats::sum_nr_running the idle state of a scheduling group.
> >     (Vincent, Peter)
> >   * Do not even idle CPUs in asym_smt_can_pull_tasks(). (Vincent)
> >   * Updated function documentation and corrected a typo.
> >
> > Changes since v3:
> >   * Removed the arch_asym_check_smt_siblings() hook. Discussions with the
> >     powerpc folks showed that this patch should not impact them. Also, more
> >     recent powerpc processor no longer use asym_packing. (PeterZ)
> >   * Removed unnecessary local variable in asym_can_pull_tasks(). (Dietmar)
> >   * Removed unnecessary check for local CPUs when the local group has zero
> >     utilization. (Joel)
> >   * Renamed asym_can_pull_tasks() as asym_smt_can_pull_tasks() to reflect
> >     the fact that it deals with SMT cases.
> >   * Made asym_smt_can_pull_tasks() return false for !CONFIG_SCHED_SMT so
> >     that callers can deal with non-SMT cases.
> >
> > Changes since v2:
> >   * Reworded the commit message to reflect updates in code.
> >   * Corrected misrepresentation of dst_cpu as the CPU doing the load
> >     balancing. (PeterZ)
> >   * Removed call to arch_asym_check_smt_siblings() as it is now called in
> >     sched_asym().
> >
> > Changes since v1:
> >   * Don't bailout in update_sd_pick_busiest() if dst_cpu cannot pull
> >     tasks. Instead, reclassify the candidate busiest group, as it
> >     may still be selected. (PeterZ)
> >   * Avoid an expensive and unnecessary call to cpumask_weight() when
> >     determining if a sched_group is comprised of SMT siblings.
> >     (PeterZ).
> > ---
> >  kernel/sched/fair.c | 94 +++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 94 insertions(+)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 26db017c14a3..8d763dd0174b 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -8597,10 +8597,98 @@ group_type group_classify(unsigned int imbalance_pct,
> >       return group_has_spare;
> >  }
> >
> > +/**
> > + * asym_smt_can_pull_tasks - Check whether the load balancing CPU can pull tasks
> > + * @dst_cpu: Destination CPU of the load balancing
> > + * @sds:     Load-balancing data with statistics of the local group
> > + * @sgs:     Load-balancing statistics of the candidate busiest group
> > + * @sg:              The candidate busiest group
> > + *
> > + * Check the state of the SMT siblings of both @sds::local and @sg and decide
> > + * if @dst_cpu can pull tasks.
> > + *
> > + * If @dst_cpu does not have SMT siblings, it can pull tasks if two or more of
> > + * the SMT siblings of @sg are busy. If only one CPU in @sg is busy, pull tasks
> > + * only if @dst_cpu has higher priority.
> > + *
> > + * If both @dst_cpu and @sg have SMT siblings, and @sg has exactly one more
> > + * busy CPU than @sds::local, let @dst_cpu pull tasks if it has higher priority.
> > + * Bigger imbalances in the number of busy CPUs will be dealt with in
> > + * update_sd_pick_busiest().
> > + *
> > + * If @sg does not have SMT siblings, only pull tasks if all of the SMT siblings
> > + * of @dst_cpu are idle and @sg has lower priority.
> > + */
> > +static bool asym_smt_can_pull_tasks(int dst_cpu, struct sd_lb_stats *sds,
> > +                                 struct sg_lb_stats *sgs,
> > +                                 struct sched_group *sg)
> > +{
> > +#ifdef CONFIG_SCHED_SMT
> > +     bool local_is_smt, sg_is_smt;
> > +     int sg_busy_cpus;
> > +
> > +     local_is_smt = sds->local->flags & SD_SHARE_CPUCAPACITY;
> > +     sg_is_smt = sg->flags & SD_SHARE_CPUCAPACITY;
> > +
> > +     sg_busy_cpus = sgs->group_weight - sgs->idle_cpus;
> > +
> > +     if (!local_is_smt) {
> > +             /*
> > +              * If we are here, @dst_cpu is idle and does not have SMT
> > +              * siblings. Pull tasks if candidate group has two or more
> > +              * busy CPUs.
> > +              */
> > +             if (sg_is_smt && sg_busy_cpus >= 2)
> > +                     return true;
> > +
> > +             /*
> > +              * @dst_cpu does not have SMT siblings. @sg may have SMT
> > +              * siblings and only one is busy. In such case, @dst_cpu
> > +              * can help if it has higher priority and is idle (i.e.,
> > +              * it has no running tasks).
> > +              */
> > +             return !sds->local_stat.sum_nr_running &&
> > +                    sched_asym_prefer(dst_cpu, sg->asym_prefer_cpu);
> > +     }
> > +
> > +     /* @dst_cpu has SMT siblings. */
> > +
> > +     if (sg_is_smt) {
> > +             int local_busy_cpus = sds->local->group_weight -
> > +                                   sds->local_stat.idle_cpus;
> > +             int busy_cpus_delta = sg_busy_cpus - local_busy_cpus;
> > +
> > +             if (busy_cpus_delta == 1)
> > +                     return sched_asym_prefer(dst_cpu,
> > +                                              sg->asym_prefer_cpu);
> > +
> > +             return false;
> > +     }
> > +
> > +     /*
> > +      * @sg does not have SMT siblings. Ensure that @sds::local does not end
> > +      * up with more than one busy SMT sibling and only pull tasks if there
> > +      * are not busy CPUs (i.e., no CPU has running tasks).
> > +      */
> > +     if (!sds->local_stat.sum_nr_running)
> > +             return sched_asym_prefer(dst_cpu, sg->asym_prefer_cpu);
> > +
> > +     return false;
> > +#else
> > +     /* Always return false so that callers deal with non-SMT cases. */
> > +     return false;
> > +#endif
> > +}
> > +
> >  static inline bool
> >  sched_asym(struct lb_env *env, struct sd_lb_stats *sds,  struct sg_lb_stats *sgs,
> >          struct sched_group *group)
> >  {
> > +     /* Only do SMT checks if either local or candidate have SMT siblings */
> > +     if ((sds->local->flags & SD_SHARE_CPUCAPACITY) ||
> > +         (group->flags & SD_SHARE_CPUCAPACITY))
> > +             return asym_smt_can_pull_tasks(env->dst_cpu, sds, sgs, group);
> > +
> >       return sched_asym_prefer(env->dst_cpu, group->asym_prefer_cpu);
> >  }
> >
> > @@ -9606,6 +9694,12 @@ static struct rq *find_busiest_queue(struct lb_env *env,
> >                   nr_running == 1)
> >                       continue;
> >
> > +             /* Make sure we only pull tasks from a CPU of lower priority */
> > +             if ((env->sd->flags & SD_ASYM_PACKING) &&
> > +                 sched_asym_prefer(i, env->dst_cpu) &&
> > +                 nr_running == 1)
> > +                     continue;
> > +
> >               switch (env->migration_type) {
> >               case migrate_load:
> >                       /*
> >
>
