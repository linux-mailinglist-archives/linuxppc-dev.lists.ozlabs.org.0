Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BBA40F372
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 09:42:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9mBL65mCz2ym7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 17:42:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CzY4E6++;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::731;
 helo=mail-qk1-x731.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CzY4E6++; dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9m9b695Mz2yJ1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 17:41:37 +1000 (AEST)
Received: by mail-qk1-x731.google.com with SMTP id bk29so14741164qkb.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 00:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WDHbJMHvL8PSSywXAAEh+umv2zvyTBL7yAcdXZD+ZVQ=;
 b=CzY4E6++7Kvh04JKDpxl+FVBr2iEJDlv6gr5AB8Ee6th0Z49grwFh4QbHWKLHvDTV1
 izd3qpLhUgyIb5kYaL8dKzgGMyAhqB0o4rjzc5IfWkUwYbJ4/3CXxLoJSz3fWlcRMMHH
 ZTvnIoSDakrOONfPkikBxSZ+I+J90rSzVWjE4HiavVQE/Tq6TmvWO6AFsFxVFQvWS3wS
 3Tl8d1Zd2gr9N6Yu2sWmiH8yDMX3e1uEI1weDeXAiu29PrLenf1u6JnVqrNNN4Kla6F1
 uf5miDJhlie/UfYRX/bJzwmmIpxmxNyaQtYL+rMuPIWY3Rt0sdG+H+ZQqhBOuCZ85lqW
 eB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WDHbJMHvL8PSSywXAAEh+umv2zvyTBL7yAcdXZD+ZVQ=;
 b=GQdny3+Wrl+Mx8/tuVTsm0pbPK1s3NNi6Vo0M2DYp7yybKe/m5wl6vZf0ZzFwKoPOF
 tI+9GHeJuaMFDsWmzZgh/36fnQIkkaWdMIrz23JXIjKsZ0wJ8slCbBaa9YrGo60h4UbV
 Y4H2feFQCZzlm8nQFfF/S9+8kJlXvrKCxE+uJthD9pKLXQE2TQx9je/79QELzZBHR9fP
 qoPkMsFMfS1FM1ilEYW8t7qf00/1OkLB5zRbS9plKLQE63C1wEDYEFo0q7rWNHWhJJNn
 DRQes2oQykeN1rj5tqOF3pv5ujgyqsI7L7LCTr9auDXR/3REaCNyeOKjjHlLhG+i65XR
 QLZQ==
X-Gm-Message-State: AOAM533iEjJlHFRhyvvFr6bRVdIhNhAmcxhbM1w6/zIZZAyKmWga+X3B
 RUuagJN5rgG2fxdSwWNPGRoIT+7rU9WqXAKpCqbP8w==
X-Google-Smtp-Source: ABdhPJyraTs7xXGqouvcJy9p3UYWsm8yHT3JoCN6EfHeIL7IDya5tF4Vi7H2w8LhrYYMnSbkWRKttFFkOufXwHvrHwU=
X-Received: by 2002:a5b:142:: with SMTP id c2mr12177105ybp.425.1631864493697; 
 Fri, 17 Sep 2021 00:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210911011819.12184-1-ricardo.neri-calderon@linux.intel.com>
 <20210911011819.12184-7-ricardo.neri-calderon@linux.intel.com>
 <CAKfTPtBcDP3Yp54sd4+1kP=o=4e_1HEmOf=eMXydag_J38CEng@mail.gmail.com>
 <20210917010044.GA23727@ranerica-svr.sc.intel.com>
In-Reply-To: <20210917010044.GA23727@ranerica-svr.sc.intel.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 17 Sep 2021 09:41:22 +0200
Message-ID: <CAKfTPtD5_Rxt65+6bRNjq94wLDRrsUh+6MM1iCC36i5HQZZ-jQ@mail.gmail.com>
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

On Fri, 17 Sept 2021 at 03:01, Ricardo Neri
<ricardo.neri-calderon@linux.intel.com> wrote:
>
> On Wed, Sep 15, 2021 at 05:43:44PM +0200, Vincent Guittot wrote:
> > On Sat, 11 Sept 2021 at 03:19, Ricardo Neri
> > <ricardo.neri-calderon@linux.intel.com> wrote:
> > >
> > > When deciding to pull tasks in ASYM_PACKING, it is necessary not only to
> > > check for the idle state of the destination CPU, dst_cpu, but also of
> > > its SMT siblings.
> > >
> > > If dst_cpu is idle but its SMT siblings are busy, performance suffers
> > > if it pulls tasks from a medium priority CPU that does not have SMT
> > > siblings.
> > >
> > > Implement asym_smt_can_pull_tasks() to inspect the state of the SMT
> > > siblings of both dst_cpu and the CPUs in the candidate busiest group.
> > >
> > > Cc: Aubrey Li <aubrey.li@intel.com>
> > > Cc: Ben Segall <bsegall@google.com>
> > > Cc: Daniel Bristot de Oliveira <bristot@redhat.com>
> > > Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> > > Cc: Mel Gorman <mgorman@suse.de>
> > > Cc: Quentin Perret <qperret@google.com>
> > > Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > > Cc: Steven Rostedt <rostedt@goodmis.org>
> > > Cc: Tim Chen <tim.c.chen@linux.intel.com>
> > > Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > Reviewed-by: Len Brown <len.brown@intel.com>
> > > Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> > > ---
> > > Changes since v4:
> > >   * Use sg_lb_stats::sum_nr_running the idle state of a scheduling group.
> > >     (Vincent, Peter)
> > >   * Do not even idle CPUs in asym_smt_can_pull_tasks(). (Vincent)
> > >   * Updated function documentation and corrected a typo.
> > >
> > > Changes since v3:
> > >   * Removed the arch_asym_check_smt_siblings() hook. Discussions with the
> > >     powerpc folks showed that this patch should not impact them. Also, more
> > >     recent powerpc processor no longer use asym_packing. (PeterZ)
> > >   * Removed unnecessary local variable in asym_can_pull_tasks(). (Dietmar)
> > >   * Removed unnecessary check for local CPUs when the local group has zero
> > >     utilization. (Joel)
> > >   * Renamed asym_can_pull_tasks() as asym_smt_can_pull_tasks() to reflect
> > >     the fact that it deals with SMT cases.
> > >   * Made asym_smt_can_pull_tasks() return false for !CONFIG_SCHED_SMT so
> > >     that callers can deal with non-SMT cases.
> > >
> > > Changes since v2:
> > >   * Reworded the commit message to reflect updates in code.
> > >   * Corrected misrepresentation of dst_cpu as the CPU doing the load
> > >     balancing. (PeterZ)
> > >   * Removed call to arch_asym_check_smt_siblings() as it is now called in
> > >     sched_asym().
> > >
> > > Changes since v1:
> > >   * Don't bailout in update_sd_pick_busiest() if dst_cpu cannot pull
> > >     tasks. Instead, reclassify the candidate busiest group, as it
> > >     may still be selected. (PeterZ)
> > >   * Avoid an expensive and unnecessary call to cpumask_weight() when
> > >     determining if a sched_group is comprised of SMT siblings.
> > >     (PeterZ).
> > > ---
> > >  kernel/sched/fair.c | 94 +++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 94 insertions(+)
> > >
> > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > index 26db017c14a3..8d763dd0174b 100644
> > > --- a/kernel/sched/fair.c
> > > +++ b/kernel/sched/fair.c
> > > @@ -8597,10 +8597,98 @@ group_type group_classify(unsigned int imbalance_pct,
> > >         return group_has_spare;
> > >  }
> > >
> > > +/**
> > > + * asym_smt_can_pull_tasks - Check whether the load balancing CPU can pull tasks
> > > + * @dst_cpu:   Destination CPU of the load balancing
> > > + * @sds:       Load-balancing data with statistics of the local group
> > > + * @sgs:       Load-balancing statistics of the candidate busiest group
> > > + * @sg:                The candidate busiest group
> > > + *
> > > + * Check the state of the SMT siblings of both @sds::local and @sg and decide
> > > + * if @dst_cpu can pull tasks.
> > > + *
> > > + * If @dst_cpu does not have SMT siblings, it can pull tasks if two or more of
> > > + * the SMT siblings of @sg are busy. If only one CPU in @sg is busy, pull tasks
> > > + * only if @dst_cpu has higher priority.
> > > + *
> > > + * If both @dst_cpu and @sg have SMT siblings, and @sg has exactly one more
> > > + * busy CPU than @sds::local, let @dst_cpu pull tasks if it has higher priority.
> > > + * Bigger imbalances in the number of busy CPUs will be dealt with in
> > > + * update_sd_pick_busiest().
> > > + *
> > > + * If @sg does not have SMT siblings, only pull tasks if all of the SMT siblings
> > > + * of @dst_cpu are idle and @sg has lower priority.
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
> >
> > Do you really need to test sg_is_smt ? if sg_busy_cpus >= 2 then
> > sd_is_smt must be true ?
>
> Thank you very much for your feedback Vincent!
>
> Yes, it is true that sg_busy_cpus >=2 is only true if @sg is SMT. I will
> remove this check.
>
> >
> > Also, This is the default behavior where we want to even the number of
> > busy cpu. Shouldn't you return false and fall back to the default
> > behavior ?
>
> This is also true.
>
> >
> > That being said, the default behavior tries to even the number of idle
> > cpus which is easier to compute and is equal to even the number of
> > busy cpus in "normal" system with the same number of cpus in groups
> > but this is not the case here. It could be good to change the default
> > behavior to even the number of busy cpus and that you use the default
> > behavior here. Additional condition will be used to select the busiest
> > group like more busy cpu or more number of running tasks
>
> That is a very good observation. Checking the number of idle CPUs
> assumes that both groups have the same number of CPUs. I'll look into
> modifying the default behavior.
>
> >
> > > +                       return true;
> > > +
> > > +               /*
> > > +                * @dst_cpu does not have SMT siblings. @sg may have SMT
> > > +                * siblings and only one is busy. In such case, @dst_cpu
> > > +                * can help if it has higher priority and is idle (i.e.,
> > > +                * it has no running tasks).
> >
> > The previous comment above assume that "@dst_cpu is idle" but now you
> > need to check that sds->local_stat.sum_nr_running == 0
>
> But we already know that, right? We are here because in
> update_sg_lb_stats() we determine that dst CPU is idle (env->idle !=
> CPU_NOT_IDLE).

That's my point:
Why do you add the condition !sds->local_stat.sum_nr_running below ? I
assume that it's to check that the cpu is idle, isn't it ?

> > > +                */
> > > +               return !sds->local_stat.sum_nr_running &&
> > > +                      sched_asym_prefer(dst_cpu, sg->asym_prefer_cpu);
> > > +       }

>
> Thanks and BR,
> Ricardo
