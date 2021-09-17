Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 284D040FC3C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 17:26:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9yVN0t7Fz2ynj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Sep 2021 01:26:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pcT+euw9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::736;
 helo=mail-qk1-x736.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pcT+euw9; dkim-atps=neutral
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9yTj6HDmz2xX6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Sep 2021 01:26:17 +1000 (AEST)
Received: by mail-qk1-x736.google.com with SMTP id b64so18646240qkg.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 08:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TM+ZvTPf59AjLNF10A7BeoUcO09QDb2XjgFhcgEDZCg=;
 b=pcT+euw9MpfxQpJL8z5inrpc9UbXVQZQ2nVgy3O0RT7nq5c/czEiRM05cSO6EWRAuU
 gE3sH5RezrEgqj9lPVJEAu1Uzrg63Jak+ajw250s5JXTUVdhdSWTpDiwqoZNqO6W2BTl
 iNiiM8l0WCOGD/sAV79DF7a1IHO3945+rAGe8zfPj+wOUu4ATHL6jo3lqNChqMEEN412
 cJ0vLnhz7SNKPo0tENlJC/VFRAMZ9oFiGUgIcgYmTaG8TThWqqImE82NqnednT5wz7/Y
 LyRhnDQUB7rs2oy5bGl5O3HzHYdQHhgq2TJI78EruFDheVBMN8yXNEsxozl98C+G0V4B
 mm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TM+ZvTPf59AjLNF10A7BeoUcO09QDb2XjgFhcgEDZCg=;
 b=uCGDfFRiagoo5ptQ3Db4EZ8xidLRD5cNXZMBMWohkNmcTMammDfVyg8OUiTzu7Ptfp
 FI+L2WqhxcCsGT+83HNv3q+Z+rob9cIjvt6/31+alYaPobTdqiriLjQ/YfCH7Yr8v0N8
 MeFDn26GTHzmCdHy7c6151zKkrVyt5Uz0IUg7MTJk1IwkS0HIBtnlHNAY7xCcmt/q36N
 RJ/+CqqI5jee9QMezhBRaGV0uzqb29/kCcmQlVxMmnzYbresxNg9roUO3JfgzEVZNBp7
 ItNp28mFtfCU4uhthdj1mBh9zwA54/8yWnoUTnlV4vvsMq8IiC6qpHL1Jyo12+JnJYQq
 NV6Q==
X-Gm-Message-State: AOAM531DKtHp2J4UMWuz4jRenEJbrBZ5fAJcVOcROLBFOmCYR0ZsKKIk
 MZIM6LXEBSJFC3Crs7GRgDggPxORraOSOq9AWbPcBQ==
X-Google-Smtp-Source: ABdhPJxYtMwzo8aY4gkreJvqG8Rt6IjAobZ8kHMhtN1A5QYsNekX9RpcATkzUqrXx8D61aktoQcUcLetCjDmy3mwdzs=
X-Received: by 2002:a25:5645:: with SMTP id k66mr14018619ybb.259.1631892372580; 
 Fri, 17 Sep 2021 08:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210911011819.12184-1-ricardo.neri-calderon@linux.intel.com>
 <20210911011819.12184-3-ricardo.neri-calderon@linux.intel.com>
In-Reply-To: <20210911011819.12184-3-ricardo.neri-calderon@linux.intel.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 17 Sep 2021 17:26:01 +0200
Message-ID: <CAKfTPtDHJxtczRCATGJfuHHuQy9NbpXZAsPL1R9Qf=Jd46TU-A@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] sched/topology: Introduce sched_group::flags
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
> There exist situations in which the load balance needs to know the
> properties of the CPUs in a scheduling group. When using asymmetric
> packing, for instance, the load balancer needs to know not only the
> state of dst_cpu but also of its SMT siblings, if any.
>
> Use the flags of the child scheduling domains to initialize scheduling
> group flags. This will reflect the properties of the CPUs in the
> group.
>
> A subsequent changeset will make use of these new flags. No functional
> changes are introduced.
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
> Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
> Changes since v4:
>   * None
>
> Changes since v3:
>   * Clear the flags of the scheduling groups of a domain if its child is
>     destroyed.
>   * Minor rewording of the commit message.
>
> Changes since v2:
>   * Introduced this patch.
>
> Changes since v1:
>   * N/A
> ---
>  kernel/sched/sched.h    |  1 +
>  kernel/sched/topology.c | 21 ++++++++++++++++++---
>  2 files changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 3d3e5793e117..86ab33ce529d 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1809,6 +1809,7 @@ struct sched_group {
>         unsigned int            group_weight;
>         struct sched_group_capacity *sgc;
>         int                     asym_prefer_cpu;        /* CPU of highest priority in group */
> +       int                     flags;
>
>         /*
>          * The CPUs this group covers.
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 4e8698e62f07..c56faae461d9 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -716,8 +716,20 @@ cpu_attach_domain(struct sched_domain *sd, struct root_domain *rd, int cpu)
>                 tmp = sd;
>                 sd = sd->parent;
>                 destroy_sched_domain(tmp);
> -               if (sd)
> +               if (sd) {
> +                       struct sched_group *sg = sd->groups;
> +
> +                       /*
> +                        * sched groups hold the flags of the child sched
> +                        * domain for convenience. Clear such flags since
> +                        * the child is being destroyed.
> +                        */
> +                       do {
> +                               sg->flags = 0;
> +                       } while (sg != sd->groups);
> +
>                         sd->child = NULL;
> +               }
>         }
>
>         for (tmp = sd; tmp; tmp = tmp->parent)
> @@ -916,10 +928,12 @@ build_group_from_child_sched_domain(struct sched_domain *sd, int cpu)
>                 return NULL;
>
>         sg_span = sched_group_span(sg);
> -       if (sd->child)
> +       if (sd->child) {
>                 cpumask_copy(sg_span, sched_domain_span(sd->child));
> -       else
> +               sg->flags = sd->child->flags;
> +       } else {
>                 cpumask_copy(sg_span, sched_domain_span(sd));
> +       }
>
>         atomic_inc(&sg->ref);
>         return sg;
> @@ -1169,6 +1183,7 @@ static struct sched_group *get_group(int cpu, struct sd_data *sdd)
>         if (child) {
>                 cpumask_copy(sched_group_span(sg), sched_domain_span(child));
>                 cpumask_copy(group_balance_mask(sg), sched_group_span(sg));
> +               sg->flags = child->flags;
>         } else {
>                 cpumask_set_cpu(cpu, sched_group_span(sg));
>                 cpumask_set_cpu(cpu, group_balance_mask(sg));
> --
> 2.17.1
>
