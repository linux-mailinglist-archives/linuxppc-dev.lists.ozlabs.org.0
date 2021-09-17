Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 016BD40FC43
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 17:28:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9yWp6fqSz3bnJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Sep 2021 01:28:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ma9ysC6d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ma9ysC6d; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9yVn5h91z3c5w
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Sep 2021 01:27:13 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id m21so18502686qkm.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 08:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b3XLvp+C7BZKXW25qtQnmeavwVREq13mF2t8TnFg7h8=;
 b=ma9ysC6dZG9BsfBsHogzoGydNfFrVUn1as1xUYntDMccIRrlY99NeyBPhwHd/PxK8J
 W69EHqcxgp3u7OemM6zJuAPYq5W+lwHJLdmVR0GemDUBsm01UzXg9R1/2Bl8IOjL2IWl
 vzfe89aY5HuipfX4n9ZSRCUol7TEreaMJP2kBHfRhgMDfzZSDnXEIo958Wvt/zeknR6/
 9+4vWnBOKIjYmXJLd/CV282S1I8LTMVYoBl1fKyT+YiKUB2sivgvB7Wu9/5nx2KbCS0/
 1HXoDsygGoSUYBALVwdn48h6o7ecIf4Gts3LN+RChZySPk3xzrEJfG+nJT2kEH7JDWKm
 hGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b3XLvp+C7BZKXW25qtQnmeavwVREq13mF2t8TnFg7h8=;
 b=mofC1fhQVXDBWK58cHwx1OfmRv9hhVdVkqkaJVS1g4y1nBXklV5Saonbjs4nN1Z6yv
 AryWe6+71ut+lCxq1xLQPXXZX50o7WvbAkWjjLqR6xXtFAEcRNW1wt/RSwfPqFtolIF5
 fwa74+8MLK9OpMsKqAMiSIo6UXjwPSUeSw2s3lONbSEA3Bn4tsfuMBlXSfARL5rRs16Y
 UmEb2v3/d+VABeLaDge3bg/q8sVUFEFHoVW95oJZHcn5FU0O5buflD63rVLTu1SJyfd/
 1eyUA6LI0e6yIvzNsNMcwE6/wyIGvqywbRK1Au2VrM347qY6gaVqHTcZKrNkZvJH9tKH
 DrmQ==
X-Gm-Message-State: AOAM531+lG40LnOaqt19Ofdkcb/pRCQoEexpbx/hlHY9gcjVzF9Yy1Qa
 Z07wSBNSN2HfhCcjJAb7KGrhe6oaRyByWSB4Ff+0Ig==
X-Google-Smtp-Source: ABdhPJynu1fj/apO6ALW2WO1rvp19yZafCLVj5aI2S/7fbxCB+Cgviatp/AVipcP4rN8wUwU5dAIgkebf0THkNd6sZs=
X-Received: by 2002:a5b:142:: with SMTP id c2mr14709743ybp.425.1631892430927; 
 Fri, 17 Sep 2021 08:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210911011819.12184-1-ricardo.neri-calderon@linux.intel.com>
 <20210911011819.12184-5-ricardo.neri-calderon@linux.intel.com>
In-Reply-To: <20210911011819.12184-5-ricardo.neri-calderon@linux.intel.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 17 Sep 2021 17:27:00 +0200
Message-ID: <CAKfTPtDWKkCJwimuU9DRUUyStn+ZVkUX23mNMCoqpLzXrn+jfQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] sched/fair: Provide update_sg_lb_stats() with
 sched domain statistics
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
> Before deciding to pull tasks when using asymmetric packing of tasks,
> on some architectures (e.g., x86) it is necessary to know not only the
> state of dst_cpu but also of its SMT siblings. The decision to classify
> a candidate busiest group as group_asym_packing is done in
> update_sg_lb_stats(). Give this function access to the scheduling domain
> statistics, which contains the statistics of the local group.
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
>   * None
>
> Changes since v2:
>   * Introduced this patch.
>
> Changes since v1:
>   * N/A
> ---
>  kernel/sched/fair.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 7a054f528bcc..c5851260b4d8 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8605,6 +8605,7 @@ group_type group_classify(unsigned int imbalance_pct,
>   * @sg_status: Holds flag indicating the status of the sched_group
>   */
>  static inline void update_sg_lb_stats(struct lb_env *env,
> +                                     struct sd_lb_stats *sds,
>                                       struct sched_group *group,
>                                       struct sg_lb_stats *sgs,
>                                       int *sg_status)
> @@ -8613,7 +8614,7 @@ static inline void update_sg_lb_stats(struct lb_env *env,
>
>         memset(sgs, 0, sizeof(*sgs));
>
> -       local_group = cpumask_test_cpu(env->dst_cpu, sched_group_span(group));
> +       local_group = group == sds->local;
>
>         for_each_cpu_and(i, sched_group_span(group), env->cpus) {
>                 struct rq *rq = cpu_rq(i);
> @@ -9176,7 +9177,7 @@ static inline void update_sd_lb_stats(struct lb_env *env, struct sd_lb_stats *sd
>                                 update_group_capacity(env->sd, env->dst_cpu);
>                 }
>
> -               update_sg_lb_stats(env, sg, sgs, &sg_status);
> +               update_sg_lb_stats(env, sds, sg, sgs, &sg_status);
>
>                 if (local_group)
>                         goto next_group;
> --
> 2.17.1
>
