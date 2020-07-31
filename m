Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D70523408A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 09:54:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJ00g5HM0zDqVJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 17:54:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHzyV12MvzDqbf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 17:52:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qf8BNDne; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHzyS4rpHz9sRK;
 Fri, 31 Jul 2020 17:52:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596181937;
 bh=h+eYGxpy9k7opgsvEXnuKKimR5rpSrpAfLVKgl4J9F8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qf8BNDneKlDM/j4MWdPsD8rtZEHU/G7s9fPBCUqI9zG4jAY9dTYMqMrYVhL87VQmF
 iW2AROq6sfwNoxB0Ps+qLwKclmCmrw/axhXQu1w49bmSsVhXwxDSu0yTbqVAD95o7o
 LsV5pv9XzVeaM6qFIOtIzzDNIu/DeFTyREuwhgXCch5Vfq26UbjbCM4mW3tcYiyg/M
 /pSwqEunBj2dAWeZNtvJJvD1D2AmQsWPImgCNcqQjdv4tjM1qeWkCAprGN4/GhNRTw
 g8TIew0NKoxlAlwn1P+CbHieoB4bS4Y7JJiv9HY7xiddoR/wY/Ts7Gm2/f9FCRcCW3
 mG6+JDYAhH5Cw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 08/10] powerpc/smp: Allocate cpumask only after
 searching thread group
In-Reply-To: <20200727053230.19753-9-srikar@linux.vnet.ibm.com>
References: <20200727053230.19753-1-srikar@linux.vnet.ibm.com>
 <20200727053230.19753-9-srikar@linux.vnet.ibm.com>
Date: Fri, 31 Jul 2020 17:52:15 +1000
Message-ID: <87zh7g3yvk.fsf@mpe.ellerman.id.au>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> If allocated earlier and the search fails, then cpumask need to be
> freed. However cpu_l1_cache_map can be allocated after we search thread
> group.

It's not freed anywhere AFAICS?

And even after this change there's still an error path that doesn't free
it, isn't there?

cheers

> Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
> Cc: LKML <linux-kernel@vger.kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Anton Blanchard <anton@ozlabs.org>
> Cc: Oliver O'Halloran <oohall@gmail.com>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Michael Neuling <mikey@neuling.org>
> Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: Jordan Niethe <jniethe5@gmail.com>
> Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/smp.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 698000c7f76f..dab96a1203ec 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -797,10 +797,6 @@ static int init_cpu_l1_cache_map(int cpu)
>  	if (err)
>  		goto out;
>  
> -	zalloc_cpumask_var_node(&per_cpu(cpu_l1_cache_map, cpu),
> -				GFP_KERNEL,
> -				cpu_to_node(cpu));
> -
>  	cpu_group_start = get_cpu_thread_group_start(cpu, &tg);
>  
>  	if (unlikely(cpu_group_start == -1)) {
> @@ -809,6 +805,9 @@ static int init_cpu_l1_cache_map(int cpu)
>  		goto out;
>  	}
>  
> +	zalloc_cpumask_var_node(&per_cpu(cpu_l1_cache_map, cpu),
> +				GFP_KERNEL, cpu_to_node(cpu));
> +
>  	for (i = first_thread; i < first_thread + threads_per_core; i++) {
>  		int i_group_start = get_cpu_thread_group_start(i, &tg);
>  
> -- 
> 2.17.1
