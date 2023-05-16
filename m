Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5277704F73
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 15:37:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLHNK3hqLz3f8d
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 23:37:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W98DLUpw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=vincent.guittot@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W98DLUpw;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLHMR6krDz3bh9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 23:36:33 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6436e004954so14602118b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 06:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684244190; x=1686836190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DvxDOpYiF//cGspBa+1fpizQ2RWLkcOlF3ipks0JxBE=;
        b=W98DLUpwdS5IxGcULjG5nEyDeZv/RGvqltDgQc0RwC6c/at30wBtwyZXUHfYnKgxCH
         VS28lvasgBot1TUiBGyRiCEMiVamDkqHShfrUBb39UyOAZnJrOAgtrItVqLKiHpUH+cc
         cHrNRZNhtc4PW1NYGqI9WarnVq/e2FtcEZ05FNsqZWiB7UbPgvEopasJQWTrDQnIXiHF
         9koMjT05CRrxn4B+Mp0QQSXpPpK11A/Eo3e61trfBI+akB/VfsDsIfVbo1oAot/eVkGh
         nDmPS2ttR3tl2ICFkah15+J2vTXIBlG2sQsPLyC98BMxdttAgHBIFB/G96XH2FA6O8Qh
         3T/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684244190; x=1686836190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DvxDOpYiF//cGspBa+1fpizQ2RWLkcOlF3ipks0JxBE=;
        b=Ck1XKf1i1R24/4WQLy8Kte9ZW5uWZYV7uRnRVg1Mu/rBlc7CGM7LOdnXBeMQ8M7G27
         fPjAsmg0t5zbMYTE5tFbjYrL+GBjHDLhJSRLT7PVTYb3y9S0S29WjzKa6cXSJbSI9KI0
         l+58209uVpcwCd08tiBlngM7/oelBRHuknrjnq42gpsVkJ/MWYbQyjLEIMhRW8SnMO3b
         4COu/+4a0ouKWU0AzhV1Luzyt9voI1ztqQFIfKjIjzVCvBRv9+GuLbgqiYKcbzGNDGE0
         H09YuarI/2Y37EZnFR/pq4N89Ny2drueQuqqeDe5/o3ijteKZgP2Ep9ol4NZKAFfCsKM
         q29Q==
X-Gm-Message-State: AC+VfDwo+M1pLh/BwiZG+4q030K9bX02AFOTyk3K5MuFMftH/Cgf6AxZ
	LIW8cFSgLD4NfEIbON5zqlWiEYy4nc5CUUkuk1myTA==
X-Google-Smtp-Source: ACHHUZ67OYhVQWqvwY/fYSo+nezhJ7nTGNONH6O7pFXRR1/UWQsoJ4KMAfOHHsbMUzKGEBBBaeN9eQty8JBl5SfDJmE=
X-Received: by 2002:a05:6a20:7f9d:b0:105:66a1:5d05 with SMTP id
 d29-20020a056a207f9d00b0010566a15d05mr13248261pzj.55.1684244190493; Tue, 16
 May 2023 06:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230515114601.12737-1-huschle@linux.ibm.com> <20230515114601.12737-2-huschle@linux.ibm.com>
In-Reply-To: <20230515114601.12737-2-huschle@linux.ibm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 16 May 2023 15:36:19 +0200
Message-ID: <CAKfTPtC9050oY2EikUTAXTL8pAui3L+Sr4DBS0T-TccGNaA2hw@mail.gmail.com>
Subject: Re: [RFC 1/1] sched/fair: Consider asymmetric scheduler groups in
 load balancer
To: Tobias Huschle <huschle@linux.ibm.com>
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
Cc: juri.lelli@redhat.com, vschneid@redhat.com, srikar@linux.vnet.ibm.com, peterz@infradead.org, sshegde@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com, mingo@redhat.com, mgorman@suse.de, bristot@redhat.com, dietmar.eggemann@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 15 May 2023 at 13:46, Tobias Huschle <huschle@linux.ibm.com> wrote:
>
> The current load balancer implementation implies that scheduler groups,
> within the same domain, all host the same number of CPUs. This is
> reflected in the condition, that a scheduler group, which is load
> balancing and classified as having spare capacity, should pull work
> from the busiest group, if the local group runs less processes than
> the busiest one. This implies that these two groups should run the
> same number of processes, which is problematic if the groups are not
> of the same size.
>
> The assumption that scheduler groups within the same scheduler domain
> host the same number of CPUs appears to be true for non-s390
> architectures. Nevertheless, s390 can have scheduler groups of unequal
> size.
>
> This introduces a performance degredation in the following scenario:
>
> Consider a system with 8 CPUs, 6 CPUs are located on one CPU socket,
> the remaining 2 are located on another socket:
>
> Socket   -----1-----    -2-
> CPU      1 2 3 4 5 6    7 8
>
> Placing some workload ( x = one task ) yields the following
> scenarios:
>
> The first 5 tasks are distributed evenly across the two groups.
>
> Socket   -----1-----    -2-
> CPU      1 2 3 4 5 6    7 8
>          x x x          x x
>
> Adding a 6th task yields the following distribution:
>
> Socket   -----1-----    -2-
> CPU      1 2 3 4 5 6    7 8
> SMT1     x x x          x x
> SMT2                    x

Your description is a bit confusing for me. What you name CPU above
should be named Core, doesn' it ?

Could you share with us your scheduler topology ?

>
> The task is added to the 2nd scheduler group, as the scheduler has the
> assumption that scheduler groups are of the same size, so they should
> also host the same number of tasks. This makes CPU 7 run into SMT
> thread, which comes with a performance penalty. This means, that in
> the window of 6-8 tasks, load balancing is done suboptimally, because
> SMT is used although there is no reason to do so as fully idle CPUs
> are still available.
>
> Taking the weight of the scheduler groups into account, ensures that
> a load balancing CPU within a smaller group will not try to pull tasks
> from a bigger group while the bigger group still has idle CPUs
> available.
>
> Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
> ---
>  kernel/sched/fair.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 48b6f0ca13ac..b1307d7e4065 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -10426,7 +10426,8 @@ static struct sched_group *find_busiest_group(struct lb_env *env)
>          * group's child domain.
>          */
>         if (sds.prefer_sibling && local->group_type == group_has_spare &&
> -           busiest->sum_nr_running > local->sum_nr_running + 1)
> +           busiest->sum_nr_running * local->group_weight >
> +                       local->sum_nr_running * busiest->group_weight + 1)

This is the prefer_sibling path. Could it be that you should disable
prefer_siling between your sockets for such topology ? the default
path compares the number of idle CPUs when groups has spare capacity


>                 goto force_balance;
>
>         if (busiest->group_type != group_overloaded) {
> --
> 2.34.1
>
