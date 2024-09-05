Return-Path: <linuxppc-dev+bounces-1036-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 814B796D242
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 10:35:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzt3f1pCPz2ydW;
	Thu,  5 Sep 2024 18:35:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725525342;
	cv=none; b=NbsXg+VEkVjlHhDrWDXfqtgKJJEFant51fZjvWk+QCTgeGv2b/HLd/JJZv5wOvwIl7XOK5GxFxSA+rxv4KQNuw66pSIBz1IpTEj4DH10M5nmrbR0I74dBAX8RQvq4WxogitXcxz32fcv2Nbax3/duQ0qK3DAshSuoDOnJJcwMyYGkWmC25riBiHZlNwPC/UM9ht/qJPrYPmrvMAqA5jzQHbAltVRKm3jpBgnMVLisX8f6gnZ1czhI3si+a08MEamBNNB1O5558LtzqHmz1wPMIXNJpe1vd35kxqaWw6tfBa/Ppyn980PlVRnIBPPYiHl2KdL03exsMP8xmQ1HDwAWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725525342; c=relaxed/relaxed;
	bh=4mLOPe6wLZxX8VFMq/OsoqlCL3JsgYKPWY0cK1Uw4Vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZ/9Tn0an+rXsEYLgxa4ciKzvI0+8WC4r1glDXHQG81xGQjSyQleqHfGTrQWTFJWup6iiHxpLs8EaJm3dlzvC9kay5GZF2Dr2kZcafirIfDarnoP1rUQRoM2iXefizEzYvMv8X0kYV67eb5rRcO3XgVfA6l5JbsfNOs+FWkuILeC45xjnmj0Owm1NElqI2YmQalWeNt4idj6SWA+zlfsM3Kd3bh1cn/GbghQRqbjrs/1VmAKnkRWrp014uTJSeMJILC1/cnq3UBkGWNwPMIut+EK8p186aGePgpqJZe+9HFNRYGJXq/MBXd2+3EM3UmoZTGd8i0JKH2WbxIHqren9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=pierre.gondois@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=pierre.gondois@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzt3d2l1Dz2yT0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 18:35:39 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3AD9FEC;
	Thu,  5 Sep 2024 01:35:33 -0700 (PDT)
Received: from [10.57.71.124] (unknown [10.57.71.124])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8F703F66E;
	Thu,  5 Sep 2024 01:35:02 -0700 (PDT)
Message-ID: <277bd093-422b-4301-92a3-d0a58eb41af5@arm.com>
Date: Thu, 5 Sep 2024 10:34:57 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] arm64: topology: Support SMT control on ACPI based
 system
To: Yicong Yang <yangyicong@huawei.com>
Cc: yangyicong@hisilicon.com, linuxppc-dev@lists.ozlabs.org, bp@alien8.de,
 dave.hansen@linux.intel.com, mingo@redhat.com,
 linux-arm-kernel@lists.infradead.org, mpe@ellerman.id.au,
 peterz@infradead.org, tglx@linutronix.de, sudeep.holla@arm.com,
 will@kernel.org, catalin.marinas@arm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
 gregkh@linuxfoundation.org, rafael@kernel.org, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, linuxarm@huawei.com, xuwei5@huawei.com,
 guohanjun@huawei.com
References: <20240806085320.63514-1-yangyicong@huawei.com>
 <20240806085320.63514-4-yangyicong@huawei.com>
 <a998c723-7451-439a-9c88-7c8b5c1b890b@arm.com>
 <00e6110a-462a-c117-0292-e88b57d27a05@huawei.com>
 <3947cb79-3199-4cd6-b784-51a245084581@arm.com>
 <1a7b5ac7-f040-672f-07a0-d7f3dc170c88@huawei.com>
 <6c05e39c-41f3-451c-b119-7b8662c1ceee@arm.com>
 <7f722af2-2969-aae5-1fb5-68d353eb95b9@huawei.com>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <7f722af2-2969-aae5-1fb5-68d353eb95b9@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Yicong,

>>> Wondering if we can avoid this 2nd loop. Greg express the worries of looping twice on large scale
>>> system in v1. Maybe we could use the hetero_id and get the necessary information in one loop, I need
>>> further think.
>>
>> I found this comments (not sure this is what you are refering to):
>> - https://lore.kernel.org/linux-arm-kernel/20231011103303.00002d8f@Huawei.com/
>> - https://lore.kernel.org/all/20230921150333.c2zqigs3xxwcg4ln@bogus/T/#m406c4c16871ca7ae431beb20feccfb5e14498452
>>
>> I don't see another way to do it right now. Also, I thing the complexity is in
>> O(2n), which should be better than the original O(n**2),
>>
> 
> yes it's less complex. I'm wondering build up the xarray in another way then we can avoid the
> long loops. What about below:

I tried the patch on a ThunderX2 with 4 threads per CPU. PPTT topology describes
2 clusters of 128 cores each. Each cluster is described as independent (i.e. there
is no root node in the PPTT). The PPTT is of revision 1, so the IDENTICAL
flag is not available on the platform.

I also tried it on a faked SMT asymmetric platform and there might be a small
correction required.

> 
>  From 5ff5d0100435982764cd85566a6fe006e60ee98e Mon Sep 17 00:00:00 2001
> From: Yicong Yang <yangyicong@hisilicon.com>
> Date: Fri, 20 Oct 2023 15:38:38 +0800
> Subject: [PATCH] arm64: topology: Support SMT control on ACPI based system
> 
> For ACPI we'll build the topology from PPTT and we cannot directly
> get the SMT number of each core. Instead using a temporary xarray
> to record the heterogeneous information (from ACPI_PPTT_ACPI_IDENTICAL)
> and SMT information of the first core in its heterogeneous CPU cluster
> when building the topology. Then we can know the largest SMT number
> in the system. Warn if heterogeneous SMT topology exists (multiple
> heterogeneous CPU clusters with different SMT thread number) since the
> SMT control cannot handle this well. Then enable the support of SMT
> control.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   arch/arm64/kernel/topology.c | 60 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 1a2c72f3e7f8..f6ec30fae70e 100644
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
> +};
> +
>   /*
>    * Propagate the topology information of the processor_topology_node tree to the
>    * cpu_topology array.
>    */
>   int __init parse_acpi_topology(void)
>   {
> +	int max_smt_thread_num = 1;
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
> @@ -67,6 +105,28 @@ int __init parse_acpi_topology(void)
>   		cpu_topology[cpu].package_id = topology_id;
>   	}
> 
> +	/*
> +	 * This should be a short loop depending on the number of heterogeneous
> +	 * CPU clusters. Typically on a homogeneous system there's only one
> +	 * entry in the XArray.
> +	 */
> +	xa_for_each(&hetero_cpu, hetero_id, entry) {
> +		if (entry->thread_num == 1)
> +			continue;

If a platform has CPUs with:
- 1 thread
- X (!= 1) threads
Then I think that the asymmetry is not detected

> +
> +		if (entry->thread_num != max_smt_thread_num &&
> +		    max_smt_thread_num != 1)
> +			pr_warn("Heterogeneous SMT topology not handled");
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

