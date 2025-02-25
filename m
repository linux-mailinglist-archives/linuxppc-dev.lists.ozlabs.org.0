Return-Path: <linuxppc-dev+bounces-6448-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51589A4352D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 07:25:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z26zp6WLmz30Sw;
	Tue, 25 Feb 2025 17:25:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740464742;
	cv=none; b=inpLrgvr/jC9vP44UI+EQe+cVR5lOXWAqw8pbpidMXw0lHgSuMZx9q4rSvvR3W00qQejkFNmVvoZOfHB9KR8DJDIO4G3bMaKhmr3BeZSKh5R1Mtd66GQEXmcGnzzV8CCrxe4/41on++H6dLIjnS4jGRufIPR/mHvxOZZ0wfhOpD0lQEuknt0oYUVW2s3CKX5r34ovDScFQNpE6tNal0jC36dHJEh7bbtCyAx9c4oyBQS+OCY6kWhAHcgZhjLuGGpyzFaNNlDD6c3gO5hat3DVF7/m8zLYJYdnTl8z6b1IeK/UtHmid9zgV8P+0acATkz61GB6RRmCgueBJIFDMq+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740464742; c=relaxed/relaxed;
	bh=s3508VUXvao7RjemhYDAO/CTcFT7kcPYoLQummb5BwQ=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Lm1jjZBwTpJ4quAaPj+2KxrlxWm3bYhj58I8uo/q3ptFLoWwx9opORuUmVf0Fw5+z2rmJrBCR8ILrd0u7hp8gWKJFLx8MOunLxLmMHK0jOWHiRM/MuXqv6jwkRUa6tDfxwEFaSvn1ym4WbCQ5d3cTXxkQrVrsGWW9r04NJkvhP+21i9cFJrfiprCr5OcY2/VoV8X1FiGr0mGUl5odqlV5KPGdG4KrDc/2w3calX7SCqkv8vYm4Zlg6TOPZzjWd1mT+KlH7UvcJgXdGHRGJbqDfVkIBZwwHRNCqLVTPgb68NwLHTZaZQ4KuMTvkPJubAoBl6ViOL4CdoNUkklF9poSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=guohanjun@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=guohanjun@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1004 seconds by postgrey-1.37 at boromir; Tue, 25 Feb 2025 17:25:41 AEDT
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z26zn114Dz2ysX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 17:25:37 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Z26Xl21DTz21nvV;
	Tue, 25 Feb 2025 14:05:43 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 5F8381402CA;
	Tue, 25 Feb 2025 14:08:47 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 25 Feb 2025 14:08:46 +0800
Subject: Re: [PATCH v11 3/4] arm64: topology: Support SMT control on ACPI
 based system
To: Yicong Yang <yangyicong@huawei.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <sudeep.holla@arm.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>
CC: <linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <yangyicong@hisilicon.com>, <xuwei5@huawei.com>,
	<sshegde@linux.ibm.com>
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <20250218141018.18082-4-yangyicong@huawei.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <92193a09-271e-895e-f77f-d3952bdfdf49@huawei.com>
Date: Tue, 25 Feb 2025 14:08:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
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
In-Reply-To: <20250218141018.18082-4-yangyicong@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-Spam-Status: No, score=-2.4 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025/2/18 22:10, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> For ACPI we'll build the topology from PPTT and we cannot directly
> get the SMT number of each core. Instead using a temporary xarray
> to record the heterogeneous information (from ACPI_PPTT_ACPI_IDENTICAL)
> and SMT information of the first core in its heterogeneous CPU cluster
> when building the topology. Then we can know the largest SMT number
> in the system. If a homogeneous system's using ACPI 6.2 or later,
> all the CPUs should be under the root node of PPTT. There'll be
> only one entry in the xarray and all the CPUs in the system will
> be assumed identical.
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
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   arch/arm64/kernel/topology.c | 66 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 1a2c72f3e7f8..6eba1ac091ee 100644
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
> @@ -37,17 +39,28 @@ static bool __init acpi_cpu_is_threaded(int cpu)
>   	return !!is_threaded;
>   }
>   
> +struct cpu_smt_info {
> +	unsigned int thread_num;
> +	int core_id;
> +};
> +
>   /*
>    * Propagate the topology information of the processor_topology_node tree to the
>    * cpu_topology array.
>    */
>   int __init parse_acpi_topology(void)
>   {
> +	unsigned int max_smt_thread_num = 0;
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
> @@ -57,6 +70,34 @@ int __init parse_acpi_topology(void)
>   			cpu_topology[cpu].thread_id = topology_id;
>   			topology_id = find_acpi_cpu_topology(cpu, 1);
>   			cpu_topology[cpu].core_id   = topology_id;
> +
> +			/*
> +			 * In the PPTT, CPUs below a node with the 'identical
> +			 * implementation' flag have the same number of threads.
> +			 * Count the number of threads for only one CPU (i.e.
> +			 * one core_id) among those with the same hetero_id.
> +			 * See the comment of find_acpi_cpu_topology_hetero_id()
> +			 * for more details.
> +			 *
> +			 * One entry is created for each node having:
> +			 * - the 'identical implementation' flag
> +			 * - its parent not having the flag
> +			 */
> +			hetero_id = find_acpi_cpu_topology_hetero_id(cpu);
> +			entry = xa_load(&hetero_cpu, hetero_id);
> +			if (!entry) {
> +				entry = kzalloc(sizeof(*entry), GFP_KERNEL);
> +				WARN_ON_ONCE(!entry);
> +
> +				if (entry) {
> +					entry->core_id = topology_id;
> +					entry->thread_num = 1;
> +					xa_store(&hetero_cpu, hetero_id,
> +						 entry, GFP_KERNEL);
> +				}
> +			} else if (entry->core_id == topology_id) {
> +				entry->thread_num++;
> +			}
>   		} else {
>   			cpu_topology[cpu].thread_id  = -1;
>   			cpu_topology[cpu].core_id    = topology_id;
> @@ -67,6 +108,31 @@ int __init parse_acpi_topology(void)
>   		cpu_topology[cpu].package_id = topology_id;
>   	}
>   
> +	/*
> +	 * This should be a short loop depending on the number of heterogeneous
> +	 * CPU clusters. Typically on a homogeneous system there's only one
> +	 * entry in the XArray.
> +	 */
> +	xa_for_each(&hetero_cpu, hetero_id, entry) {
> +		if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)
> +			pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
> +
> +		max_smt_thread_num = max(max_smt_thread_num, entry->thread_num);
> +		xa_erase(&hetero_cpu, hetero_id);
> +		kfree(entry);
> +	}
> +
> +	/*
> +	 * Notify the CPU framework of the SMT support. Initialize the
> +	 * max_smt_thread_num to 1 if no SMT support detected. A thread
> +	 * number of 1 can be handled by the framework so we don't need
> +	 * to check max_smt_thread_num to see we support SMT or not.
> +	 */
> +	if (!max_smt_thread_num)
> +		max_smt_thread_num = 1;
> +
> +	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
> +	xa_destroy(&hetero_cpu);
>   	return 0;
>   }
>   #endif

Looks good to me,

Reviewed-by: Hanjun Guo <guohanjun@huawei.com>

Thanks
Hanjun

