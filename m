Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA72A215148
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 05:12:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0VxQ081szDqfj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 13:12:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0VvX50BkzDqcl
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 13:11:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=oKwEqA5k; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B0VvX1WTFz9sR4;
 Mon,  6 Jul 2020 13:11:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594005064;
 bh=STgCd0L83cDa1SyXHZ3L9w0tTRtZ/nJdQqP/XqE5yy0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=oKwEqA5k82xfq7J/389iNr7WJgAjP5dwgwKsdh8EMGem6aKcH283JwkLA2QDc3pSQ
 0OUeGhijq7Mz6BMSW1wjTgUJzfHdJNF0LBvVxEq/zN5KRqZxYvkqLcN00WPTXEj93U
 gGHGd49Jrk1eHe8hmFRTxuhROYkH68dJN23uH3q62QA+5+9JV9xHzPATiw8n5FtBl2
 kg8NpR+qHMKEqwfjLuzyECufs6CLtbN0Ft3TDR5grYMpXsOTWyV1hcScovbWSIq9Id
 kAzAOPZO12zJWKTdyqtaNbc9clTtPbOccY4r2p7KWDxBEHolGFg+oAFhVPTClfVIJ1
 5eBReqh4hluQQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kajol Jain <kjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 1/2] powerpc/perf/hv-24x7: Add cpu hotplug support
In-Reply-To: <20200626102824.270923-2-kjain@linux.ibm.com>
References: <20200626102824.270923-1-kjain@linux.ibm.com>
 <20200626102824.270923-2-kjain@linux.ibm.com>
Date: Mon, 06 Jul 2020 13:13:16 +1000
Message-ID: <87zh8d5oab.fsf@mpe.ellerman.id.au>
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
Cc: nathanl@linux.ibm.com, ego@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com,
 kjain@linux.ibm.com, suka@us.ibm.com, anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kajol Jain <kjain@linux.ibm.com> writes:
> Patch here adds cpu hotplug functions to hv_24x7 pmu.
> A new cpuhp_state "CPUHP_AP_PERF_POWERPC_HV_24x7_ONLINE" enum
> is added.
>
> The online callback function updates the cpumask only if its
> empty. As the primary intention of adding hotplug support
> is to designate a CPU to make HCALL to collect the
> counter data.
>
> The offline function test and clear corresponding cpu in a cpumask
> and update cpumask to any other active cpu.
>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> ---
>  arch/powerpc/perf/hv-24x7.c | 45 +++++++++++++++++++++++++++++++++++++
>  include/linux/cpuhotplug.h  |  1 +
>  2 files changed, 46 insertions(+)
>
> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
> index db213eb7cb02..ce4739e2b407 100644
> --- a/arch/powerpc/perf/hv-24x7.c
> +++ b/arch/powerpc/perf/hv-24x7.c
> @@ -31,6 +31,8 @@ static int interface_version;
>  /* Whether we have to aggregate result data for some domains. */
>  static bool aggregate_result_elements;
>  
> +static cpumask_t hv_24x7_cpumask;
> +
>  static bool domain_is_valid(unsigned domain)
>  {
>  	switch (domain) {
> @@ -1641,6 +1643,44 @@ static struct pmu h_24x7_pmu = {
>  	.capabilities = PERF_PMU_CAP_NO_EXCLUDE,
>  };
>  
> +static int ppc_hv_24x7_cpu_online(unsigned int cpu)
> +{
> +	/* Make this CPU the designated target for counter collection */

The comment implies every newly onlined CPU will become the target, but
actually it's only the first onlined CPU.

So I think the comment needs updating, or you could just drop the
comment, I think the code is fairly clear by itself.

> +	if (cpumask_empty(&hv_24x7_cpumask))
> +		cpumask_set_cpu(cpu, &hv_24x7_cpumask);
> +
> +	return 0;
> +}
> +
> +static int ppc_hv_24x7_cpu_offline(unsigned int cpu)
> +{
> +	int target = -1;

No need to initialise target, you assign to it unconditionally below.

> +	/* Check if exiting cpu is used for collecting 24x7 events */
> +	if (!cpumask_test_and_clear_cpu(cpu, &hv_24x7_cpumask))
> +		return 0;
> +
> +	/* Find a new cpu to collect 24x7 events */
> +	target = cpumask_last(cpu_active_mask);

Any reason to use cpumask_last() vs cpumask_first(), or a randomly
chosen CPU?

> +	if (target < 0 || target >= nr_cpu_ids)
> +		return -1;
> +
> +	/* Migrate 24x7 events to the new target */
> +	cpumask_set_cpu(target, &hv_24x7_cpumask);
> +	perf_pmu_migrate_context(&h_24x7_pmu, cpu, target);
> +
> +	return 0;
> +}
> +
> +static int hv_24x7_cpu_hotplug_init(void)
> +{
> +	return cpuhp_setup_state(CPUHP_AP_PERF_POWERPC_HV_24x7_ONLINE,
> +			  "perf/powerpc/hv_24x7:online",
> +			  ppc_hv_24x7_cpu_online,
> +			  ppc_hv_24x7_cpu_offline);
> +}
> +
>  static int hv_24x7_init(void)
>  {
>  	int r;
> @@ -1685,6 +1725,11 @@ static int hv_24x7_init(void)
>  	if (r)
>  		return r;
>  
> +	/* init cpuhotplug */
> +	r = hv_24x7_cpu_hotplug_init();
> +	if (r)
> +		pr_err("hv_24x7: CPU hotplug init failed\n");
> +

The hotplug initialisation shouldn't fail unless something is badly
wrong. I think you should just fail initialisation of the entire PMU if
that happens, which will make the error handling in the next patch much
simpler.

cheers

>  	r = perf_pmu_register(&h_24x7_pmu, h_24x7_pmu.name, -1);
>  	if (r)
>  		return r;
