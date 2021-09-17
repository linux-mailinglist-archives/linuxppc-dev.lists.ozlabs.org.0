Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8578140FC4E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 17:28:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9yXh3MlQz2ymS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Sep 2021 01:28:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wZvzXvDF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wZvzXvDF; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9yW52Tkcz3c6N
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Sep 2021 01:27:29 +1000 (AEST)
Received: by mail-qk1-x72f.google.com with SMTP id p4so18590138qki.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 08:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w+tQ/PU9p2iYa5juxC+5TIx7gu+WxD4o31x+e5MbNAc=;
 b=wZvzXvDFoJxniSSZ1sP1OHE+iQIl14sDSSGD9RuI3YPPIvxu68inmiOiFQy/hbH2rc
 ByJxsWbm0dS5/qUBy5yvIn4xCBq7APq+I69B12S+nG+ozBstaNrLdlWhcYS485dyQRXH
 XD2oO0iNEWppR796Rx3BSQyHK3s/tC7qXkNy80RPUptucgzHKOLQsplduEITsgfxGpY5
 A1TgLXvcwwteseOe6s8PgD2KDm3er4KluD0U4NDIVhwu4C4gY8b2v8bUbO2p8ZYJZwEz
 VQwHBTBmPiYebOPnGdT7dVN55Pl7fkz/RW/xHL9Mhp8Iblg1F+pjIH8BSaDFt7AQeqAN
 +VxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w+tQ/PU9p2iYa5juxC+5TIx7gu+WxD4o31x+e5MbNAc=;
 b=OL2AlYjY9zzIn+BxOZUpeqZ7vVBVbu7GYhnqgIZ3FgC+JJzvYqetNqQ8aH6k1tjTNz
 IuLrfxLH6dfaQlzxpApJMILSP+KON2zpJrTdTRalRn+KxjN0tCXePcTeeKYLsTeqGNAI
 qudp096OlsiYWdtVihn+t8O05Id+2N9bibIKL5lcWLsOsoGCV4YV/whDvV81yvGVEICW
 acQcRjy7n1AwEKuPCaflST0LhmxRGRK11yim9vwMh1RU87Br1TkjhxLmDdak9MFIlyyt
 SFth2yQ7qBQqpDs+81LfDq0HwTUGaWcaCSiEKMQx2tAFInTpzm1sFuN+JkxTSgvUSBKp
 BiGw==
X-Gm-Message-State: AOAM532vShgIMStHnkFINBycTOCD4VoOLR6iWlrje0084dT1jHHL28FX
 DkJEnkS+EvEsIybEZdTAAZtOYDsJ0FAr/KnOLJjwIw==
X-Google-Smtp-Source: ABdhPJy5SUJ2zmS5uUPpvJeW3954agmyO5nBK74RNUzXvygOt2JqjOZVpqg5FpwmPJeTHdeAv+FMZUt5XVZrnFOxp30=
X-Received: by 2002:a25:ac13:: with SMTP id w19mr13980398ybi.402.1631892446211; 
 Fri, 17 Sep 2021 08:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210911011819.12184-1-ricardo.neri-calderon@linux.intel.com>
 <20210911011819.12184-6-ricardo.neri-calderon@linux.intel.com>
In-Reply-To: <20210911011819.12184-6-ricardo.neri-calderon@linux.intel.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 17 Sep 2021 17:27:15 +0200
Message-ID: <CAKfTPtC6Yg2gPHETZ2qUgFJvyrdiNCx2sFBYAtidX0za4tnpQw@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] sched/fair: Carve out logic to mark a group for
 asymmetric packing
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
> Create a separate function, sched_asym(). A subsequent changeset will
> introduce logic to deal with SMT in conjunction with asmymmetric
> packing. Such logic will need the statistics of the scheduling
> group provided as argument. Update them before calling sched_asym().
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
> Co-developed-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
> Changes since v4:
>   * None
>
> Changes since v3:
>   * Remove a redundant check for the local group in sched_asym().
>     (Dietmar)
>   * Reworded commit message for clarity. (Len)
>
> Changes since v2:
>   * Introduced this patch.
>
> Changes since v1:
>   * N/A
> ---
>  kernel/sched/fair.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index c5851260b4d8..26db017c14a3 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8597,6 +8597,13 @@ group_type group_classify(unsigned int imbalance_pct,
>         return group_has_spare;
>  }
>
> +static inline bool
> +sched_asym(struct lb_env *env, struct sd_lb_stats *sds,  struct sg_lb_stats *sgs,
> +          struct sched_group *group)
> +{
> +       return sched_asym_prefer(env->dst_cpu, group->asym_prefer_cpu);
> +}
> +
>  /**
>   * update_sg_lb_stats - Update sched_group's statistics for load balancing.
>   * @env: The load balancing environment.
> @@ -8657,18 +8664,17 @@ static inline void update_sg_lb_stats(struct lb_env *env,
>                 }
>         }
>
> +       sgs->group_capacity = group->sgc->capacity;
> +
> +       sgs->group_weight = group->group_weight;
> +
>         /* Check if dst CPU is idle and preferred to this group */
>         if (!local_group && env->sd->flags & SD_ASYM_PACKING &&
> -           env->idle != CPU_NOT_IDLE &&
> -           sgs->sum_h_nr_running &&
> -           sched_asym_prefer(env->dst_cpu, group->asym_prefer_cpu)) {
> +           env->idle != CPU_NOT_IDLE && sgs->sum_h_nr_running &&
> +           sched_asym(env, sds, sgs, group)) {
>                 sgs->group_asym_packing = 1;
>         }
>
> -       sgs->group_capacity = group->sgc->capacity;
> -
> -       sgs->group_weight = group->group_weight;
> -
>         sgs->group_type = group_classify(env->sd->imbalance_pct, group, sgs);
>
>         /* Computing avg_load makes sense only when group is overloaded */
> --
> 2.17.1
>
