Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB0E234082
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 09:52:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHzy522xyzDqVT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 17:51:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHzvm58SrzDqVH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 17:49:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Eb4adLDM; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHzvm3NhBz9sRK;
 Fri, 31 Jul 2020 17:49:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596181796;
 bh=vgtrJGuvJCtQtz6V9aSKtpyUkKz3RW8OCC7iYMgVatA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Eb4adLDMncuvoJsfXDgzwZkTlK6c7QJEQpW9tDwGSEUqHy4195obPsJMK9r49D524
 S3lNErNX6QpE0MVLd7JIMgC/3MwQcZWPqQ3zUDYdiwR4MYhISX9ciT4EnQ2gdpNoyC
 vnsymo1WsK/FL7ynJyYVUMf8VZcPOWCrglYL85A5ZJMewCM9b/A44okPvsXEFtFRJw
 TjmZXZiJuK3Jhbcf7+WhX3dQFL2lt9GAOHQtClBp43pCn/E4FfaNY3EfS9KgUiymve
 39z2HJnIACR3a4d06P1QqXNe/kiWigwciGcE+fe9f5dyqcgYuk/oVHEzCk6904zFM/
 eHl5fkSbXS7gg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 07/10] Powerpc/numa: Detect support for coregroup
In-Reply-To: <20200727053230.19753-8-srikar@linux.vnet.ibm.com>
References: <20200727053230.19753-1-srikar@linux.vnet.ibm.com>
 <20200727053230.19753-8-srikar@linux.vnet.ibm.com>
Date: Fri, 31 Jul 2020 17:49:55 +1000
Message-ID: <8736585djw.fsf@mpe.ellerman.id.au>
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
> Add support for grouping cores based on the device-tree classification.
> - The last domain in the associativity domains always refers to the
> core.
> - If primary reference domain happens to be the penultimate domain in
> the associativity domains device-tree property, then there are no
> coregroups. However if its not a penultimate domain, then there are
> coregroups. There can be more than one coregroup. For now we would be
> interested in the last or the smallest coregroups.

This still doesn't tell me what a coregroup actually represents.

I get that it's a grouping of cores, and that the device tree specifies
it for us, but grouping based on what?

I think the answer is we aren't being told by firmware, it's just a
grouping based on some opaque performance characteristic and we just
have to take that as given.

But please explain that clearly in the change log and the code comments.

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
> Changelog v1 -> v2:
> 	Explained Coregroup in commit msg (Michael Ellerman)
>
>  arch/powerpc/include/asm/smp.h |  1 +
>  arch/powerpc/kernel/smp.c      |  1 +
>  arch/powerpc/mm/numa.c         | 34 +++++++++++++++++++++-------------
>  3 files changed, 23 insertions(+), 13 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
> index 49a25e2400f2..5bdc17a7049f 100644
> --- a/arch/powerpc/include/asm/smp.h
> +++ b/arch/powerpc/include/asm/smp.h
> @@ -28,6 +28,7 @@
>  extern int boot_cpuid;
>  extern int spinning_secondaries;
>  extern u32 *cpu_to_phys_id;
> +extern bool coregroup_enabled;
>  
>  extern void cpu_die(void);
>  extern int cpu_to_chip_id(int cpu);
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 3c5ccf6d2b1c..698000c7f76f 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -74,6 +74,7 @@ static DEFINE_PER_CPU(int, cpu_state) = { 0 };
>  
>  struct task_struct *secondary_current;
>  bool has_big_cores;
> +bool coregroup_enabled;
>  
>  DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
>  DEFINE_PER_CPU(cpumask_var_t, cpu_smallcore_map);
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 2298899a0f0a..51cb672f113b 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -886,7 +886,9 @@ static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
>  static void __init find_possible_nodes(void)
>  {
>  	struct device_node *rtas;
> -	u32 numnodes, i;
> +	const __be32 *domains;
> +	int prop_length, max_nodes;
> +	u32 i;
>  
>  	if (!numa_enabled)
>  		return;
> @@ -895,25 +897,31 @@ static void __init find_possible_nodes(void)
>  	if (!rtas)
>  		return;
>  
> -	if (of_property_read_u32_index(rtas, "ibm,current-associativity-domains",
> -				min_common_depth, &numnodes)) {
> -		/*
> -		 * ibm,current-associativity-domains is a fairly recent
> -		 * property. If it doesn't exist, then fallback on
> -		 * ibm,max-associativity-domains. Current denotes what the
> -		 * platform can support compared to max which denotes what the
> -		 * Hypervisor can support.
> -		 */
> -		if (of_property_read_u32_index(rtas, "ibm,max-associativity-domains",
> -				min_common_depth, &numnodes))
> +	/*
> +	 * ibm,current-associativity-domains is a fairly recent property. If
> +	 * it doesn't exist, then fallback on ibm,max-associativity-domains.
> +	 * Current denotes what the platform can support compared to max
> +	 * which denotes what the Hypervisor can support.
> +	 */
> +	domains = of_get_property(rtas, "ibm,current-associativity-domains",
> +					&prop_length);
> +	if (!domains) {
> +		domains = of_get_property(rtas, "ibm,max-associativity-domains",
> +					&prop_length);
> +		if (!domains)
>  			goto out;
>  	}
>  
> -	for (i = 0; i < numnodes; i++) {
> +	max_nodes = of_read_number(&domains[min_common_depth], 1);
> +	for (i = 0; i < max_nodes; i++) {
>  		if (!node_possible(i))
>  			node_set(i, node_possible_map);
>  	}
>  
> +	prop_length /= sizeof(int);
> +	if (prop_length > min_common_depth + 2)
> +		coregroup_enabled = 1;
> +
>  out:
>  	of_node_put(rtas);
>  }
> -- 
> 2.17.1
