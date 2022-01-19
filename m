Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8452493908
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 11:56:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jf2db5LMxz3bTX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 21:56:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XT6fF+tS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jf2cy0KjYz303n
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jan 2022 21:56:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XT6fF+tS; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Jf2cv62JSz4y3t;
 Wed, 19 Jan 2022 21:56:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1642589775;
 bh=a5TOJdaabKUWxNFLL45lVPFKNntGzhxVI0mhJR6Fs98=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=XT6fF+tSPx8JvwOsMd3QvNYyjpIXekEDTqZSt6K/UfZ7X8BGreoNaIZdtywfgFy5L
 qaK96Z41G9kPWE4bBUFcASgFwWfz081lNcujFk1941E68Q30F+1DTHxK8d2mtA8S4b
 6eUT34++HwqjRZR8n2+dCenDlRe+wcavI8zrRYZn/HO9KHnOvpLUerPX7wttAX2+9T
 bqsWi/nWm49DIEQ6CiYqQcPId9AiKAZgnStF+SA4LXWzoEHpwHtMgPFVy2BzxGDF6m
 OVvOd1HE8KdU0GlV97QWUYYzJ2ae/BvBuQOC3mwLXuWxIuzOZ0L7REwTTKoO5be2J+
 ZrjJcxf33vECA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/perf: Fix task context setting for trace imc
In-Reply-To: <20211124024600.18509-1-atrajeev@linux.vnet.ibm.com>
References: <20211124024600.18509-1-atrajeev@linux.vnet.ibm.com>
Date: Wed, 19 Jan 2022 21:56:12 +1100
Message-ID: <87fspkt2nn.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: kjain@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Athira Rajeev <atrajeev@linux.vnet.ibm.com> writes:
> Trace IMC (In-Memory collection counters) in powerpc is
> useful for application level profiling. For trace_imc,
> presently task context (task_ctx_nr) is set to
> perf_hw_context. But perf_hw_context is to be used for
> cpu PMU. So for trace_imc, even though it is per thread
> PMU, it is preferred to use sw_context inorder to be able
> to do application level monitoring. Hence change the
> task_ctx_nr to use perf_sw_context.

It's not a software event though, so this is not obviously correct.

Can you explain more why this is OK, I guess perf_sw_context is misnamed
these days? And can you add a comment in the code explaining why this
hardware PMU is using perf_sw_context.

cheers

> Fixes: 012ae244845f ("powerpc/perf: Trace imc PMU functions")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
> ---
>  arch/powerpc/perf/imc-pmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
> index e106909ff9c3..f3b3262bdf02 100644
> --- a/arch/powerpc/perf/imc-pmu.c
> +++ b/arch/powerpc/perf/imc-pmu.c
> @@ -1457,7 +1457,7 @@ static int trace_imc_event_init(struct perf_event *event)
>  
>  	event->hw.idx = -1;
>  
> -	event->pmu->task_ctx_nr = perf_hw_context;
> +	event->pmu->task_ctx_nr = perf_sw_context;
>  	event->destroy = reset_global_refc;
>  	return 0;
>  }
> -- 
> 2.33.0
