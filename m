Return-Path: <linuxppc-dev+bounces-6575-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC49A49B1D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2025 14:57:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z48sN2bSbz3btT;
	Sat,  1 Mar 2025 00:57:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740751032;
	cv=none; b=jAy8u9zulILWZaDC5zXpIHk4ZH6a5IxO9PHVUCpLHhNhZE9grH1LluE8XxXnGUB4Kx8BxGFs4iEPHdkCLeMr1Y7B1h/a4oh5EIxKca6BitbnOG3Phqo3zmYUSQaAIyACO2GRlC6nciXLFmN2JFe07TN3paql2TvtRLp7hzG1css2B0R/koGpnw2KjNwtJAIezGKWTVXORfkCQc6BX+yEO/H/S9k96v4gfuTA5R/dDVyerPYkWOw1wpWN5N69rLBrewyaZ8Dnn6rSUNNq9GHibQeAd8faoEcyvOzAIlauZB0ha5kpw52ndWhYf3awsh7uPMKd5EAEshUL63ksG2knlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740751032; c=relaxed/relaxed;
	bh=yVKwDlZpB6hcS9df1zK09UqoUE7biCrNhZnv8CtESBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cG6lzv3zEvXq7k+P0ALsqmo27V7Yflu9ITcKfczW4OEB42JBa9YcA0ckeHPkx9BATU7siu/uYkTKJxJ6xBt80l6EqVZh7Bg0V96fRSOY8WMIQb99emu/3MNckdAmYpd3QctbMHCp8MXxfqXBUoeAkMXFoJ3tv8byDrYys26sk9CbaZ9VJxktTJhiqNhIKHM1oU2AjLDJPU4T1y1TFAz/L0uOkyQXBYshKBLL8yjWryHvfS1YjUpp4qbduzrZlfg7njMH/eAEEpT8dYfWAbI+6Y+lHSTZMCb6kf4M+AxHNdywIRe/VQeh1nVGUffIqZpJKwXo21JRdenTk43tgizd1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z48sM3h6Cz3bsQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Mar 2025 00:57:11 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D7221515;
	Fri, 28 Feb 2025 05:56:55 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A3B73F6A8;
	Fri, 28 Feb 2025 05:56:35 -0800 (PST)
Date: Fri, 28 Feb 2025 13:56:33 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <mpe@ellerman.id.au>,
	Sudeep Holla <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<pierre.gondois@arm.com>, <dietmar.eggemann@arm.com>,
	<linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>,
	<rafael@kernel.org>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <xuwei5@huawei.com>,
	<guohanjun@huawei.com>, <sshegde@linux.ibm.com>
Subject: Re: [PATCH v11 3/4] arm64: topology: Support SMT control on ACPI
 based system
Message-ID: <Z8HAkZiHYRjj97M7@bogus>
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <20250218141018.18082-4-yangyicong@huawei.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218141018.18082-4-yangyicong@huawei.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Feb 18, 2025 at 10:10:17PM +0800, Yicong Yang wrote:
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
>  arch/arm64/kernel/topology.c | 66 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 1a2c72f3e7f8..6eba1ac091ee 100644
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
> +	unsigned int thread_num;
> +	int core_id;
> +};
> +
>  /*
>   * Propagate the topology information of the processor_topology_node tree to the
>   * cpu_topology array.
>   */
>  int __init parse_acpi_topology(void)
>  {
> +	unsigned int max_smt_thread_num = 0;
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
> @@ -57,6 +70,34 @@ int __init parse_acpi_topology(void)
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
>  		} else {
>  			cpu_topology[cpu].thread_id  = -1;
>  			cpu_topology[cpu].core_id    = topology_id;
> @@ -67,6 +108,31 @@ int __init parse_acpi_topology(void)
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

Ditto as previous patch about handling no threaded cores with threaded cores
in the system. I am not sure if that is required but just raising it here.

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

Ditto as previous patch, can get rid if it is default 1.

-- 
Regards,
Sudeep

