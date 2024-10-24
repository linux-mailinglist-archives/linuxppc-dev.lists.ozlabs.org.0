Return-Path: <linuxppc-dev+bounces-2542-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 364269ADF69
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 10:45:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYzy60MbGz2yNs;
	Thu, 24 Oct 2024 19:45:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729759518;
	cv=none; b=BoDUdusnTqXNF1xcTLxftV44sQiSi+YP5owLOnX0GkaOMIlGdLPJdX3so5lVeJkVpipknPSXdIaJGrPlJlxClJDBcZnsKSj9FoXEgGmtsb1hVBxBY3rYKkoZM1rHhVrwuiyTzqhsrSckDGhb8IHw8QSnZd9LagSe1JNc5CNEOB7M0Rqyo6sfbFcBs1HSBSf2CFMzlDtK3HgetW280RMUUi51alvoj4FOLYWPChnRSYrvg4Vm8i51jDdAO5zjIdAqi9fz4AXewMuYAAdyJklfaz1AnbLpLfYjnUqjNxNb/WORiLM0O+5dzaRJXwGBd0b2v0uRlhmbONI2Xg4H8joH7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729759518; c=relaxed/relaxed;
	bh=llIrCpy9kZA8ascscozR0aeMQ3DANNAwnhLPnoJOAug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MAm5U48J+qf5y/jVWigXG895pwmTLeXDjai15Aafbi74cRD/kw/xtta9/LN05KXGRs9YWPCfvUlgoueMEyCjE9OmUOgu8+hhMpWlPanGoCw4RIK71yZoqApkKcyGSDKUgOsckUYiKfzZ7+Mp/xNKwfom4rzoovCq8gk7GfUaQq+dMB/p4MDAtUncBSnhOlOPEKXIDClkbsRCl27DaiNLPsbtp7iofJt1cT1PX87WMmnEsM1fTYWsC07HiIsEUa9n2r5h5tCHhhkPHLPrp6w+shUHo4B+uT5EgaWLkFdf1ixquHLiTldNfA7ny2FuhK6qwTnDhT5jsjitdZaYEoWh2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=pierre.gondois@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=pierre.gondois@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYzy40V61z2xtK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 19:45:14 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83312339;
	Thu, 24 Oct 2024 01:45:11 -0700 (PDT)
Received: from [10.57.79.135] (unknown [10.57.79.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0B9D3F73B;
	Thu, 24 Oct 2024 01:44:36 -0700 (PDT)
Message-ID: <896f9bb7-7053-4835-8db4-1ff063c268c1@arm.com>
Date: Thu, 24 Oct 2024 10:44:31 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] arm64: topology: Support SMT control on ACPI based
 system
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, sudeep.holla@arm.com, tglx@linutronix.de,
 peterz@infradead.org, mpe@ellerman.id.au,
 linux-arm-kernel@lists.infradead.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, dietmar.eggemann@arm.com
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, morten.rasmussen@arm.com, msuchanek@suse.de,
 gregkh@linuxfoundation.org, rafael@kernel.org, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, linuxarm@huawei.com, yangyicong@hisilicon.com,
 xuwei5@huawei.com, guohanjun@huawei.com
References: <20241015021841.35713-1-yangyicong@huawei.com>
 <20241015021841.35713-4-yangyicong@huawei.com>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <20241015021841.35713-4-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Yicong,

On 10/15/24 04:18, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> For ACPI we'll build the topology from PPTT and we cannot directly
> get the SMT number of each core. Instead using a temporary xarray
> to record the heterogeneous information (from ACPI_PPTT_ACPI_IDENTICAL)
> and SMT information of the first core in its heterogeneous CPU cluster
> when building the topology. Then we can know the largest SMT number
> in the system.

Is it possible to also state that the logic only work for PPTT versions
prior to 6.2. Otherwise find_acpi_cpu_topology_hetero_id() will return
the id of the root node of the PPTT, and all the CPUs of the platform
will be assumed to be identical.

> 
> The core's SMT control provides two interface to the users [1]:
> 1) enable/disable SMT by writing on/off
> 2) enable/disable SMT by writing thread number 1/max_thread_number
> 
> If a system have more than one SMT thread number the 2) may
> not handle it well, since there're multiple thread numbers in the
> system and 2) only accept 1/max_thread_number. So issue a warning
> to notify the users if such system detected.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu#n542
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   arch/arm64/kernel/topology.c | 61 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 61 insertions(+)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 1a2c72f3e7f8..2fa584b932ee 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -15,8 +15,10 @@
>   #include <linux/arch_topology.h>
>   #include <linux/cacheinfo.h>
>   #include <linux/cpufreq.h>
> +#include <linux/cpu_smt.h>
>   #include <linux/init.h>
>   #include <linux/percpu.h>
> +#include <linux/xarray.h>
>   
>   #include <asm/cpu.h>
>   #include <asm/cputype.h>
> @@ -37,17 +39,29 @@ static bool __init acpi_cpu_is_threaded(int cpu)
>   	return !!is_threaded;
>   }
>   
> +struct cpu_smt_info {
> +	int thread_num;
> +	int core_id;
> +	int cpu;

It doesn't seem that the 'cpu' is used. Maybe this should be removed,
or used in the error message (I think this could be removed).

> +};
> +
>   /*
>    * Propagate the topology information of the processor_topology_node tree to the
>    * cpu_topology array.
>    */
>   int __init parse_acpi_topology(void)
>   {
> +	int max_smt_thread_num = 0;
> +	struct cpu_smt_info *entry;
> +	struct xarray hetero_cpu;
> +	unsigned long hetero_id;
>   	int cpu, topology_id;
>   
>   	if (acpi_disabled)
>   		return 0;
>   
> +	xa_init(&hetero_cpu);
> +
>   	for_each_possible_cpu(cpu) {
>   		topology_id = find_acpi_cpu_topology(cpu, 0);
>   		if (topology_id < 0)
> @@ -57,6 +71,30 @@ int __init parse_acpi_topology(void)
>   			cpu_topology[cpu].thread_id = topology_id;
>   			topology_id = find_acpi_cpu_topology(cpu, 1);
>   			cpu_topology[cpu].core_id   = topology_id;
> +
> +			/*
> +			 * Build up the XArray using the heterogeneous ID of
> +			 * the CPU cluster. Store the CPU and SMT information
> +			 * of the first appeared CPU in the CPU cluster of this
> +			 * heterogeneous ID since the SMT information should be
> +			 * the same in this CPU cluster. Then we can know the
> +			 * SMT information of each heterogeneous CPUs in the
> +			 * system.
> +			 */

A suggestion just in case:
/*
  * In the PPTT, CPUs below a node with the 'identical
  * implementation' flag have the same number of threads.
  * Count the number of threads for only one CPU (i.e.
  * one core_id) among those with the same hetero_id.
  *
  * One entry is created for each node having:
  * - the 'identical implementation' flag
  * - its parent not having the flag
  */


> +			hetero_id = find_acpi_cpu_topology_hetero_id(cpu);
> +			entry = (struct cpu_smt_info *)xa_load(&hetero_cpu, hetero_id);
> +			if (!entry) {
> +				entry = kzalloc(sizeof(*entry), GFP_KERNEL);
> +				WARN_ON(!entry);
> +
> +				entry->cpu = cpu;
> +				entry->core_id = topology_id;
> +				entry->thread_num = 1;
> +				xa_store(&hetero_cpu, hetero_id,
> +					 entry, GFP_KERNEL);
> +			} else if (entry->core_id == topology_id) {
> +				entry->thread_num++;
> +			}
>   		} else {
>   			cpu_topology[cpu].thread_id  = -1;
>   			cpu_topology[cpu].core_id    = topology_id;
> @@ -67,6 +105,29 @@ int __init parse_acpi_topology(void)
>   		cpu_topology[cpu].package_id = topology_id;
>   	}
>   
> +	/*
> +	 * This should be a short loop depending on the number of heterogeneous
> +	 * CPU clusters. Typically on a homogeneous system there's only one
> +	 * entry in the XArray.
> +	 */

I think it should be ok to remove the above/below comments

> +	xa_for_each(&hetero_cpu, hetero_id, entry) {
> +		/*
> +		 * If max_smt_thread_num has been initialized and doesn't match
> +		 * the thread number of this entry, then the system has
> +		 * heterogeneous SMT topology.
> +		 */
> +		if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)
> +			pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
> +
> +		if (entry->thread_num > max_smt_thread_num)
> +			max_smt_thread_num = entry->thread_num;
> +
> +		xa_erase(&hetero_cpu, hetero_id);
> +		kfree(entry);
> +	}
> +
> +	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
> +	xa_destroy(&hetero_cpu);
>   	return 0;
>   }
>   #endif

Otherwise I tested the SMT detection and it worked well

