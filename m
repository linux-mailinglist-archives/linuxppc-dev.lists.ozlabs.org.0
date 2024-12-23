Return-Path: <linuxppc-dev+bounces-4456-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B2A9FB307
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 17:40:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YH3fZ3pJPz2xxw;
	Tue, 24 Dec 2024 03:40:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734972022;
	cv=none; b=d1tjzDTbuf2akdi/HHXRD67E2o7Pg9KgMJBiFnbS0jU+xrUjmkCcdnZZDbRew//AVUvF4n/k7JdDVo7JWSFlntcqzbnxO45/zCicqK69VJbwSjUQoSBljq7lUZTUgCuViixHV8CP0v6bb5mwuhv8va/twXBbX+KO7cpJMhAHksZ5ixxc/ivBgPsbiqhpI9ERUY5m2vHTWmTKy/r8VxMXYgXhadwzSBq3dbQxlzx6T8wx5Gvxdju+12ZMRK6gtDKbXlvBqzPGFoywyBvymxkyab94L5iw8Ux+Z5hy9ZFpHZlTnIJnL5x81Q089Cjnd59JGrjd+7lpsedAbpVqfStugg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734972022; c=relaxed/relaxed;
	bh=io057bIA1RUjGfxGquNULf6S18LI4Q4i5+vh/VQlANg=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PEGXXg6NcMtjUWP9+JTqPWuTH8G5bJAcyrdNVJFq8nrjLAZvtLgBK40yL6iWSYIkRX4wIR/cvT1GfMV8ocZhtx8UWyaLs+p4F0hJKLgFkKsTOQnuu6X4f7WXNyR//SCB/g7okuDtAdOYew928xtCCosmz8bQPZlBMn2oJm30k4vNQIvFkLwSulzJ2zEh3/g6G+H6gtrL8Xt3JLVKCw5oIyqrQJhvhfbPExcJc0At76lZiiZ4bL1PGntEQ3qocVbQevOdu4Hguh+DYLhtu09MStOy6TLl5iTqieoWT5sLuVXgtm+igtKgQ342nC1DDtOUjzEnGJvLwNf8u7FyQP9I5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YH3fY0MsXz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2024 03:40:20 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YH3Z33SpPz6K5pZ;
	Tue, 24 Dec 2024 00:36:27 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id F2DD3140B2F;
	Tue, 24 Dec 2024 00:40:17 +0800 (CST)
Received: from localhost (10.47.75.118) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Dec
 2024 17:40:16 +0100
Date: Mon, 23 Dec 2024 16:40:14 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yicong Yang <yangyicong@huawei.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>
Subject: Re: [PATCH v10 3/4] arm64: topology: Support SMT control on ACPI
 based system
Message-ID: <20241223164014.000032cc@huawei.com>
In-Reply-To: <20241220075313.51502-4-yangyicong@huawei.com>
References: <20241220075313.51502-1-yangyicong@huawei.com>
	<20241220075313.51502-4-yangyicong@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
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
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.75.118]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 20 Dec 2024 15:53:12 +0800
Yicong Yang <yangyicong@huawei.com> wrote:

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
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

A few trivial things inline.  Either way it's fine as really just my style
preferences

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  arch/arm64/kernel/topology.c | 66 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 1a2c72f3e7f8..85cb18d72a29 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -15,8 +15,10 @@
>  #include <linux/arch_topology.h>
>  #include <linux/cacheinfo.h>
>  #include <linux/cpufreq.h>
> +#include <linux/cpu_smt.h>
>  #include <linux/init.h>
>  #include <linux/percpu.h>
> +#include <linux/xarray.h>
>  
>  #include <asm/cpu.h>
>  #include <asm/cputype.h>
> @@ -37,17 +39,28 @@ static bool __init acpi_cpu_is_threaded(int cpu)
>  	return !!is_threaded;
>  }
>  
> +struct cpu_smt_info {
> +	int thread_num;
> +	int core_id;
> +};
> +
>  /*
>   * Propagate the topology information of the processor_topology_node tree to the
>   * cpu_topology array.
>   */
>  int __init parse_acpi_topology(void)
>  {
> +	int max_smt_thread_num = 0;
> +	struct cpu_smt_info *entry;
> +	struct xarray hetero_cpu;
> +	unsigned long hetero_id;
>  	int cpu, topology_id;
>  
>  	if (acpi_disabled)
>  		return 0;
>  
> +	xa_init(&hetero_cpu);
> +
>  	for_each_possible_cpu(cpu) {
>  		topology_id = find_acpi_cpu_topology(cpu, 0);
>  		if (topology_id < 0)
> @@ -57,6 +70,32 @@ int __init parse_acpi_topology(void)
>  			cpu_topology[cpu].thread_id = topology_id;
>  			topology_id = find_acpi_cpu_topology(cpu, 1);
>  			cpu_topology[cpu].core_id   = topology_id;
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
> +			entry = (struct cpu_smt_info *)xa_load(&hetero_cpu, hetero_id);

Given xa_load returns a void *,

			entry = xa_load(&hetero_cpu, hetero_id);

should be fine (I haven't checked local style, so feel free to ignore if
local style is to cast anyway).  Maybe drag the definition of entry into
a more local scope as well.


> +			if (!entry) {
> +				entry = kzalloc(sizeof(*entry), GFP_KERNEL);
> +				WARN_ON(!entry);
> +
> +				entry->core_id = topology_id;
> +				entry->thread_num = 1;
> +				xa_store(&hetero_cpu, hetero_id,
> +					 entry, GFP_KERNEL);
> +			} else if (entry->core_id == topology_id) {
> +				entry->thread_num++;
> +			}
>  		} else {
>  			cpu_topology[cpu].thread_id  = -1;
>  			cpu_topology[cpu].core_id    = topology_id;
> @@ -67,6 +106,33 @@ int __init parse_acpi_topology(void)
>  		cpu_topology[cpu].package_id = topology_id;
>  	}
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
> +		if (entry->thread_num > max_smt_thread_num)
> +			max_smt_thread_num = entry->thread_num;

As with DT, maybe min is more informative?

		max_smt_thread_num = min(max_smt_thread_num, entry->thread_num);

I don't care strongly about it though.
> +
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
>  	return 0;
>  }
>  #endif


