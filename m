Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9756540FC3F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 17:27:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9yW53z7yz3c7P
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Sep 2021 01:27:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AwWr8OFE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AwWr8OFE; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9yV85ys6z30KC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Sep 2021 01:26:40 +1000 (AEST)
Received: by mail-qk1-x732.google.com with SMTP id c10so18532182qko.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 08:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OkLjxJhItoHaIYoOhvnxYFt8zLgNaAeBdV6KcTjLYo4=;
 b=AwWr8OFEIKyWg7y6uBsmAyUxp9xN+wU3egAnMtw5fIkFwTnqoZwnFz+PcctOq9PwMh
 ObXr2b9H8tEqYYj/AABbV4Lk8Ihg05gZRc3VeqFAUSXOGJcy+2ioi//icUkZovHc4QLM
 OfIso7ExhrDKTdW9+ekt67y734hHN5qNeE0gcOaomu1+UKVahkpswWD+6ZoXjTZV6p99
 PMQs9cIUCpAgJSveenfvQhSEj8RYAO9AX7jC6tJ0t2KtD7kQnfrnma0W7wskP07POu2w
 tJA9uKkj1OpPnWJ9QzwLXHUZq9dE2wYL1FgsF7WppSDariEtHI3f+qUde6jNmiFbnzDJ
 hduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OkLjxJhItoHaIYoOhvnxYFt8zLgNaAeBdV6KcTjLYo4=;
 b=YhX8HkCLqWdmekBmR7zD4OldQUo7o3qXyKIBjDxAaAOT5AIpuP0jpw7tWMeFj0/Oz0
 pkicwKJbQxaH+a5MG+g8oO82y4Ea5K0/Q98AKQCv4Rfl15AM62Q76AmN1SrEMAkh8MYb
 O/e+xwaKRqR6gLnkXhwwsHSBybjffb3/B6gTTxPr24kiEiKJiN4BQfmeX7zA4TdzOYL7
 svpXxahN3i6jZbqlaOE5LZdPep2JQQQ7kkFig+PY0Iri07AibgL0P2LPV/tOInV8ZyjF
 V6EhRye98d7XlxkSrQLO40pl1eXZJ3BiXNReRvsuMVIl23+Wk6yxZRsO6fsOWWQf8F/P
 guyg==
X-Gm-Message-State: AOAM530G8WxN2KKRa1iYuoUNQsEEME6odCLLq/sUujpgIZG7716+eeYA
 aDmRppBm7ux/GhBXpQf6bCfLi+KC8jv+FwW08rMRHQ==
X-Google-Smtp-Source: ABdhPJySCDrecUuxQqs+LaFuiOoTAxgl0MMZVhJ9pHxOJEU/z8m6WJf075iL3pZcPj3q785nIddKc6ubc/8WROvPGI0=
X-Received: by 2002:a25:9001:: with SMTP id s1mr13892523ybl.191.1631892397154; 
 Fri, 17 Sep 2021 08:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210911011819.12184-1-ricardo.neri-calderon@linux.intel.com>
 <20210911011819.12184-4-ricardo.neri-calderon@linux.intel.com>
In-Reply-To: <20210911011819.12184-4-ricardo.neri-calderon@linux.intel.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 17 Sep 2021 17:26:26 +0200
Message-ID: <CAKfTPtCHFgaWWdxSuRKPrp4cSLA+pTzXAmsGn9N3LrFn0x4B1w@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] sched/fair: Optimize checking for
 group_asym_packing
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
> sched_asmy_prefer() always returns false when called on the local group. By
> checking local_group, we can avoid additional checks and invoking
> sched_asmy_prefer() when it is not needed. No functional changes are
> introduced.
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

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
> Changes since v4:
>   * None
>
> Changes since v3:
>   * Further rewording of the commit message. (Len)
>
> Changes since v2:
>   * Reworded the commit message for clarity. (Peter Z)
>
> Changes since v1:
>   * None
> ---
>  kernel/sched/fair.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index ff69f245b939..7a054f528bcc 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8657,7 +8657,7 @@ static inline void update_sg_lb_stats(struct lb_env *env,
>         }
>
>         /* Check if dst CPU is idle and preferred to this group */
> -       if (env->sd->flags & SD_ASYM_PACKING &&
> +       if (!local_group && env->sd->flags & SD_ASYM_PACKING &&
>             env->idle != CPU_NOT_IDLE &&
>             sgs->sum_h_nr_running &&
>             sched_asym_prefer(env->dst_cpu, group->asym_prefer_cpu)) {
> --
> 2.17.1
>
