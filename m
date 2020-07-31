Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A849234072
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 09:48:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHzsX682bzDqc8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 17:48:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHzpv5s8HzDqTW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 17:45:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=jJvACsDT; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHzpt30HJz9sTC;
 Fri, 31 Jul 2020 17:45:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596181543;
 bh=VEuy/KiA5hGn+AVseo5tlQxiC2CSqodE1h2fmmQal3M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=jJvACsDTmDI9lVdq3hJFB2iU9IFVxWVFgw7BvuU8CKcAl1HiqJY6XSB2q2N4KwkX3
 BmQ7CR+Wuo3qFlwQWdKoxvzZkaeEm1C6V4+nf7G0UQH3087jEoxn2FZr7aAvch6PfX
 Q4OWRPk8cm0Bc2JNsybKxjRngWB8cqymCEhk+ZOhSnq2arAhxgAAZmmDIaFcyvJXXn
 oKk7qJ3LyrZLM0gFTWhQU3urH8lAgorABFxQ0v0XlVGpXmzyp9mWoHKEoMsGm3iBq5
 qtOUXpEKj6TIQacq174O4O+EGAsnk0/SYTc4BHO3SDEXKoyo6vNPJXyzLn4WNhiF5Z
 FYuF2MkMJPdvA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 06/10] powerpc/smp: Generalize 2nd sched domain
In-Reply-To: <20200727053230.19753-7-srikar@linux.vnet.ibm.com>
References: <20200727053230.19753-1-srikar@linux.vnet.ibm.com>
 <20200727053230.19753-7-srikar@linux.vnet.ibm.com>
Date: Fri, 31 Jul 2020 17:45:37 +1000
Message-ID: <875za45dr2.fsf@mpe.ellerman.id.au>
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
> Currently "CACHE" domain happens to be the 2nd sched domain as per
> powerpc_topology. This domain will collapse if cpumask of l2-cache is
> same as SMT domain. However we could generalize this domain such that it
> could mean either be a "CACHE" domain or a "BIGCORE" domain.
>
> While setting up the "CACHE" domain, check if shared_cache is already
> set.

PeterZ asked for some overview of what you're doing and why, you
responded to his mail, but I was expecting to see that text incorporated
here somewhere.

He also asked for some comments, which I would also like to see.


I'm also not clear why we want to rename it to "bigcore", that's not a
commonly understood term, I don't think it's clear to new readers what
it means.

Leaving it as the shared cache domain, and having a comment mentioning
that "bigcores" share a cache, would be clearer I think.

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
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
> Changelog v1 -> v2:
> 	Moved shared_cache topology fixup to fixup_topology (Gautham)
>
>  arch/powerpc/kernel/smp.c | 48 +++++++++++++++++++++++++++------------
>  1 file changed, 34 insertions(+), 14 deletions(-)
>
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index d997c7411664..3c5ccf6d2b1c 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -85,6 +85,14 @@ EXPORT_PER_CPU_SYMBOL(cpu_l2_cache_map);
>  EXPORT_PER_CPU_SYMBOL(cpu_core_map);
>  EXPORT_SYMBOL_GPL(has_big_cores);
>  
> +enum {
> +#ifdef CONFIG_SCHED_SMT
> +	smt_idx,
> +#endif
> +	bigcore_idx,
> +	die_idx,
> +};
> +
>  #define MAX_THREAD_LIST_SIZE	8
>  #define THREAD_GROUP_SHARE_L1   1
>  struct thread_groups {
> @@ -851,13 +859,7 @@ static int powerpc_shared_cache_flags(void)
>   */
>  static const struct cpumask *shared_cache_mask(int cpu)
>  {
> -	if (shared_caches)
> -		return cpu_l2_cache_mask(cpu);
> -
> -	if (has_big_cores)
> -		return cpu_smallcore_mask(cpu);
> -
> -	return per_cpu(cpu_sibling_map, cpu);
> +	return per_cpu(cpu_l2_cache_map, cpu);
>  }
>  
>  #ifdef CONFIG_SCHED_SMT
> @@ -867,11 +869,16 @@ static const struct cpumask *smallcore_smt_mask(int cpu)
>  }
>  #endif
>  
> +static const struct cpumask *cpu_bigcore_mask(int cpu)
> +{
> +	return per_cpu(cpu_sibling_map, cpu);
> +}
> +
>  static struct sched_domain_topology_level powerpc_topology[] = {
>  #ifdef CONFIG_SCHED_SMT
>  	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
>  #endif
> -	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
> +	{ cpu_bigcore_mask, SD_INIT_NAME(BIGCORE) },
>  	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
>  	{ NULL, },
>  };
> @@ -1311,7 +1318,6 @@ static void add_cpu_to_masks(int cpu)
>  void start_secondary(void *unused)
>  {
>  	unsigned int cpu = smp_processor_id();
> -	struct cpumask *(*sibling_mask)(int) = cpu_sibling_mask;
>  
>  	mmgrab(&init_mm);
>  	current->active_mm = &init_mm;
> @@ -1337,14 +1343,20 @@ void start_secondary(void *unused)
>  	/* Update topology CPU masks */
>  	add_cpu_to_masks(cpu);
>  
> -	if (has_big_cores)
> -		sibling_mask = cpu_smallcore_mask;
>  	/*
>  	 * Check for any shared caches. Note that this must be done on a
>  	 * per-core basis because one core in the pair might be disabled.
>  	 */
> -	if (!cpumask_equal(cpu_l2_cache_mask(cpu), sibling_mask(cpu)))
> -		shared_caches = true;
> +	if (!shared_caches) {
> +		struct cpumask *(*sibling_mask)(int) = cpu_sibling_mask;
> +		struct cpumask *mask = cpu_l2_cache_mask(cpu);
> +
> +		if (has_big_cores)
> +			sibling_mask = cpu_smallcore_mask;
> +
> +		if (cpumask_weight(mask) > cpumask_weight(sibling_mask(cpu)))
> +			shared_caches = true;
> +	}
>  
>  	set_numa_node(numa_cpu_lookup_table[cpu]);
>  	set_numa_mem(local_memory_node(numa_cpu_lookup_table[cpu]));
> @@ -1375,9 +1387,17 @@ static void fixup_topology(void)
>  #ifdef CONFIG_SCHED_SMT
>  	if (has_big_cores) {
>  		pr_info("Big cores detected but using small core scheduling\n");
> -		powerpc_topology[0].mask = smallcore_smt_mask;
> +		powerpc_topology[smt_idx].mask = smallcore_smt_mask;
>  	}
>  #endif
> +	if (shared_caches) {
> +		pr_info("Using shared cache scheduler topology\n");
> +		powerpc_topology[bigcore_idx].mask = shared_cache_mask;
> +		powerpc_topology[bigcore_idx].sd_flags = powerpc_shared_cache_flags;
> +#ifdef CONFIG_SCHED_DEBUG
> +		powerpc_topology[bigcore_idx].name = "CACHE";
> +#endif
> +	}
>  }
>  
>  void __init smp_cpus_done(unsigned int max_cpus)
> -- 
> 2.17.1
